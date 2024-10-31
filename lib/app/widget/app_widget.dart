import 'package:corelab_app_challenge/core/ui/app_theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppGlobalKeys {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final globalKey = GlobalKey();
  static final navigatorKey = GlobalKey<NavigatorState>();
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(AppGlobalKeys.navigatorKey);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.backgroundColor,
      ),
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          scaffoldMessengerKey: AppGlobalKeys.scaffoldMessengerKey,
          key: AppGlobalKeys.globalKey,
      ),
    );
  }
}