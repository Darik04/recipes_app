import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/main_config_app.dart';
import 'package:recipes_app/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/main/main_bloc.dart';
import 'locator.dart';

void main() {
  setupInjections();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<MainBloc>()),
        ], 
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: MainConfigApp.appName,
          theme: ThemeData(
            primaryColor: ColorStyles.primary,
            primarySwatch: ColorStyles.primarySwath,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: ColorStyles.white
            ),
            bottomAppBarColor: Colors.green,
            appBarTheme: const AppBarTheme(
              backgroundColor: ColorStyles.white,
              centerTitle: true,
              elevation: 2.0,
              toolbarHeight: 56,
              iconTheme: IconThemeData(
                color: ColorStyles.black,
              ),
              
            )
          ),
          home: MainView(),
        ),
      ),
    );
  }
}

