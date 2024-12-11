import 'package:coffee_shop_app/core/routing/app_router.dart';
import 'package:coffee_shop_app/core/routing/routes.dart';
import 'package:coffee_shop_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CoffeeApp extends StatelessWidget {
  final AppRouter appRouter;
  const CoffeeApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(scaffoldBackgroundColor: ColorsManager.backgroundColor),
        initialRoute: Routes.startedScreen,
        onGenerateRoute: appRouter.generateRouter,
      ),
    );
  }
}
