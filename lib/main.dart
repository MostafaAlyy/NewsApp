import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/screens/Home_Screen.dart';
import '/Network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            color: Colors.white,
            elevation: 0,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark)),
        accentColor: Colors.amber,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.black),
      ),
      debugShowMaterialGrid: false,
      title: 'EG News',
      home: MyHomePage(),
    );
  }
}
