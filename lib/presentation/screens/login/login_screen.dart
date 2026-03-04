import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_groceries_app/di/injector.dart';
import 'package:online_groceries_app/domain/repositories/local_storage_repository.dart';
import 'package:online_groceries_app/domain/usecase/login_user_usecase.dart';
import 'package:online_groceries_app/presentation/bloc/login/login_bloc.dart';
import 'package:online_groceries_app/presentation/bloc/login/login_event.dart';
import 'package:online_groceries_app/presentation/bloc/login/login_state.dart';
import 'package:online_groceries_app/presentation/error/failure_mapper.dart';
import 'package:online_groceries_app/presentation/routes/route_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        getIt<LoginUserUsecase>(),
        getIt<ILocalStorage>(),
        FailureMapper(context),
      ),
      child: const _LoginScreenView(),
    );
  }
}

class _LoginScreenView extends StatefulWidget {
  const _LoginScreenView();

  @override
  State<_LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<_LoginScreenView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset('assets/icons/ic_carrot.png')),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          print(
            'LoginScreen listener - isSuccess: ${state.isSuccess}, isLoading: ${state.isLoading}, error: ${state.apiErrorMessage}',
          );

          if (state.apiErrorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.apiErrorMessage),
                backgroundColor: Colors.red,
              ),
            );
            context.read<LoginBloc>().add(OnClearLoginErrorMessage());
          }
          if (state.isSuccess) {
            print('LoginScreen - Navigating to account screen');
            context.goNamed(RouteName.accountName);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Login\n',
                        style: Theme.of(context).textTheme.headlineMedium,
                        children: [
                          TextSpan(
                            text: 'Enter your emails and password',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// TextField for username
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(labelText: 'Username'),
                    ),
                    const SizedBox(height: 12),

                    /// TextField for password
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                    const SizedBox(height: 24),

                    /// Button for login
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.isLoading
                            ? null
                            : () {
                                context.read<LoginBloc>().add(
                                  OnLoginEvent(
                                    _usernameController.text,
                                    _passwordController.text,
                                  ),
                                );
                              },
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
              if (state.isLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
