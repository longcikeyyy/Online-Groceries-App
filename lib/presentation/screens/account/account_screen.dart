import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/core/assets_gen/assets.gen.dart';
import 'package:online_groceries_app/di/injector.dart';
import 'package:online_groceries_app/domain/usecase/get_user_info_usecase.dart';
import 'package:online_groceries_app/l10n/app_localizations.dart';
import 'package:online_groceries_app/presentation/bloc/account/account_bloc.dart';
import 'package:online_groceries_app/presentation/bloc/account/account_event.dart';
import 'package:online_groceries_app/presentation/bloc/account/account_state.dart';
import 'package:online_groceries_app/presentation/error/failure_mapper.dart';
import 'package:online_groceries_app/presentation/screens/locale/locale_bloc.dart';
import 'package:online_groceries_app/presentation/screens/locale/locale_event.dart';
import 'package:online_groceries_app/presentation/screens/locale/locale_state.dart';

class AccountItem {
  final String title;
  final String iconPath;

  AccountItem({required this.title, required this.iconPath});
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AccountBloc(getIt<GetUserInfoUsecase>(), FailureMapper(context))
            ..add(OnGetUserInfo()),
      child: const AccountScreenView(),
    );
  }
}

class AccountScreenView extends StatelessWidget {
  const AccountScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final listItems = [
      AccountItem(
        title: AppLocalizations.of(context)!.orders,
        iconPath: Assets.icons.icBox.path,
      ),
      AccountItem(
        title: AppLocalizations.of(context)!.myDetails,
        iconPath: Assets.icons.icBox.path,
      ),
      AccountItem(
        title: AppLocalizations.of(context)!.deliveryAddress,
        iconPath: Assets.icons.icBox.path,
      ),
      AccountItem(
        title: AppLocalizations.of(context)!.paymentMethods,
        iconPath: Assets.icons.icBox.path,
      ),
      AccountItem(
        title: AppLocalizations.of(context)!.promoCard,
        iconPath: Assets.icons.icBox.path,
      ),
      AccountItem(
        title: AppLocalizations.of(context)!.notifications,
        iconPath: Assets.icons.icBox.path,
      ),
      AccountItem(
        title: AppLocalizations.of(context)!.help,
        iconPath: Assets.icons.icBox.path,
      ),
      AccountItem(
        title: AppLocalizations.of(context)!.about,
        iconPath: Assets.icons.icBox.path,
      ),
    ];
    return Scaffold(
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.apiErrorMessage.isNotEmpty) {
            return Center(child: Text(state.apiErrorMessage));
          } else if (state.userInfo != null) {
            final userInfo = state.userInfo!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 70.h),
                  Row(
                    children: [
                      SizedBox(width: 25.w),
                      CircleAvatar(
                        radius: 32.w,
                        backgroundImage: NetworkImage(userInfo.avatarUrl),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(userInfo.fullName),
                              SizedBox(width: 10),
                              Icon(Icons.edit, color: Colors.blue, size: 16),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(userInfo.email),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final item = listItems[index];
                      return Padding(
                        padding: EdgeInsetsGeometry.fromLTRB(26, 20, 25, 22),
                        child: Row(
                          children: [
                            Image.asset(
                              item.iconPath,
                              width: 20.w,
                              height: 20.w,
                            ),
                            SizedBox(width: 20.w),
                            Text(item.title),
                            const Spacer(),
                            Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: listItems.length,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 26.w),
                      Text('Language'),
                      const Spacer(),
                      BlocBuilder<LocaleBloc, LocaleState>(
                        builder: (context, state) {
                          return Switch(
                            value: state.languageCode == 'en',
                            onChanged: (value) {
                              context.read<LocaleBloc>().add(
                                OnChangeLocale(value ? 'en' : 'vi'),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(width: 20.w),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No user information available.'));
          }
        },
      ),
    );
  }
}
