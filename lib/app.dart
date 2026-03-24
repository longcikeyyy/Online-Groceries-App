import 'package:chottu_link/chottu_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_groceries_app/core/assets_gen/assets.gen.dart';
import 'package:online_groceries_app/l10n/app_localizations.dart';
import 'package:online_groceries_app/presentation/routes/app_router.dart';
import 'package:online_groceries_app/presentation/routes/route_name.dart';
import 'package:online_groceries_app/presentation/screens/locale/locale_bloc.dart';
import 'package:online_groceries_app/presentation/screens/locale/locale_state.dart';

/// Your Power = Your Knowledge * AI Power * Prompting Skills

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleBloc(),
      child: const MyAppView(),
    );
  }
}

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  @override
  void initState() {
    //// handle deep link when app is opened from a terminated state
    /// /// 🔗 Listen for incoming dynamic links
    ChottuLink.onLinkReceived.listen((String link) {
      debugPrint(" ✅ Link Received: $link");

      final uri = Uri.tryParse(link);
      if (uri == null) return;

      final productId = int.tryParse(uri.pathSegments.last);
      if (productId == null) return;

      // Navigate to BottomTab first so back button can return to it
      AppRouter.router.goNamed(RouteName.bottomTabName);
      AppRouter.router.pushNamed(
        RouteName.productDetailName,
        pathParameters: {'id': productId.toString()},
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, state) {
            return MaterialApp.router(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              ),
              routerConfig: AppRouter.router,
              locale: Locale(state.languageCode ?? 'en'),
              supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
              localizationsDelegates: AppLocalizations.localizationsDelegates,
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text('Hello, World!')),
          Image.asset(Assets.images.imgApecoin.path),
        ],
      ),
    );
  }
}
