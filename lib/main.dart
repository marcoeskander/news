// ignore_for_file: prefer_const_constructors

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/layout/news_screen.dart';
import 'package:news/shared/cuibt/cuibt.dart';
import 'package:news/shared/cuibt/states.dart';
import 'package:news/shared/local/shared_prefrences.dart';
import 'package:news/shared/network/dio.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await shared_Prefrences.Init();
  var isDark = shared_Prefrences.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp(
    this.isDark,
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => news_cubit()
        ..changemod(isdrkfromshared: isDark)
        ..get_bussiness()
        ..getEntertainment()
        ..getHealth()
        ..getSports()
        ..getTechnologys()
        ..getScience(),
      child: BlocConsumer<news_cubit, news_state>(
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(650.0, 1000.0),
              splitScreenMode: true,
              minTextAdapt: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    cardTheme: CardTheme(
                      color: Colors.white,
                      elevation: 0.0,
                    ),
                    appBarTheme: AppBarTheme(
                      backgroundColor: Colors.white70,
                      elevation: 0.0,
                      // ignore: deprecated_member_use
                      // backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarBrightness: Brightness.dark,
                        statusBarIconBrightness: Brightness.dark,
                      ),
                      titleTextStyle: TextStyle(
                          fontSize: 40.0.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      iconTheme: IconThemeData(color: Colors.black),
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.blue,
                      backgroundColor: Colors.lightBlue,
                      unselectedItemColor: Colors.blueGrey,
                    ),
                    textTheme: TextTheme(
                      bodyText1: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0.sp,
                      ),
                    ),
                  ),
                  darkTheme: ThemeData(
                    scaffoldBackgroundColor: HexColor("333739"),
                    cardTheme: CardTheme(
                      color: HexColor("333739"),
                      elevation: 0.0,
                    ),
                    appBarTheme: AppBarTheme(
                      backgroundColor: HexColor("333739"),
                      elevation: 0.0,
                      // ignore: deprecated_member_use
                      // backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor("333739"),
                        statusBarBrightness: Brightness.light,
                        statusBarIconBrightness: Brightness.light,
                      ),
                      titleTextStyle: TextStyle(
                        fontSize: 40.0.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      iconTheme: IconThemeData(color: Colors.white),
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.blue,
                      backgroundColor: Colors.lightBlue,
                      unselectedItemColor: Colors.white70,
                    ),
                    textTheme: TextTheme(
                      bodyText1: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0.sp,
                      ),
                    ),
                  ),
                  themeMode: news_cubit.get(context).isDark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  home: child,
                );
              },
              child: news_screen(),
            );
          },
          listener: (context, state) {}),
    );
  }
}
