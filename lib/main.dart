import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cupit/States.dart';
import 'package:newsapp/cupit/cupit.dart';
import '/screens/Home_Screen.dart';
import '/Network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.black),
                  color: Colors.white,
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark)),
              accentColor: Colors.deepOrange,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.black),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.black87,
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.white),
                  color: Color.fromARGB(255, 0, 14, 26),
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Color.fromARGB(255, 0, 21, 39),
                      statusBarIconBrightness: Brightness.dark)),
              accentColor: Colors.deepOrange,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Color.fromARGB(255, 0, 9, 23),
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.white),
            ),
            debugShowMaterialGrid: false,
            title: 'EG News',
            themeMode: NewsCubit.get(context).appMode == true
                ? ThemeMode.dark
                : ThemeMode.light,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}
