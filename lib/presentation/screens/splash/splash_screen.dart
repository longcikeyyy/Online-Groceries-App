import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_groceries_app/di/injector.dart';
import 'package:online_groceries_app/domain/repositories/local_storage_repository.dart';
import 'package:online_groceries_app/presentation/routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    /// check if user has acesss token and valid, if yes navigate to home screen, if not navigate to login screen
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final localStorage = getIt<ILocalStorage>();
      final accessToken = await localStorage.getAccessToken();
      accessToken.fold(
        (failure) {
          context.go(RouteName.loginPath);
        },
        (token) {
          if (token != null && token.isNotEmpty) {
            // Navigate to the home screen if the access token is valid
            context.go(RouteName.bottomTabPath);
          } else {
            // Navigate to the login screen if the access token is not valid
            context.go(RouteName.loginPath);
          }
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Splash Screen')));
  }
}
