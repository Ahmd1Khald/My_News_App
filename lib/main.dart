import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mynewsapp/bloc/app_cubits.dart';
import 'package:mynewsapp/bloc/app_states.dart';
import 'package:mynewsapp/network/non_local/dio_helper.dart';

import 'bloc/bloc_observer.dart';
import 'layout_screen.dart';

void main() {

  DioHelper.init();

  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context )=>AppCubit()..getBusinessData(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const LayoutScreen(),
            theme: ThemeData(
              appBarTheme:const AppBarTheme(
                systemOverlayStyle:SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.white

                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                actionsIconTheme:IconThemeData(
                  color: Colors.black,

                ),
                color: Colors.white,

                elevation: 0,
              ),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.deepOrange,
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w800,

                ),
              )
            ),
            darkTheme: ThemeData(
              backgroundColor: HexColor('#212F3D'),
              scaffoldBackgroundColor: HexColor('#212F3D'),
              appBarTheme: AppBarTheme(
                backgroundColor:  HexColor('#212F3D'),
                titleTextStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('#212F3D'),
                  statusBarIconBrightness: Brightness.light,
                ),

              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('#212F3D'),
                selectedItemColor: Colors.white,
                unselectedItemColor: HexColor('#7F8C8D'),
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w800
                )
              ),
              textTheme: TextTheme(
                headline6:TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18
                )
              )
            ),
            themeMode:AppCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
            );
        },
      ),
    );
  }
}


