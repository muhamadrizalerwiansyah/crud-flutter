import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'configs/theme.dart';

void main() {
  runApp(const MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeStyle themeStyle = ThemeStyle();

    return ScreenUtilInit(
      designSize: const Size(375, 812), // Iphone 13 Mini
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          showSemanticsDebugger: false,
          theme: ThemeData(
            elevatedButtonTheme: themeStyle.elevatedButtonThemeStyle(),
            outlinedButtonTheme: themeStyle.outlinedButtonThemeData(),
            textTheme: themeStyle.textThemeStyle(),
            chipTheme: themeStyle.chipThemedData(),
          ),
          title: "CRUD",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
