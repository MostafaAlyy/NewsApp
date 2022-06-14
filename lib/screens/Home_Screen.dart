import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cupit/States.dart';
import 'package:newsapp/cupit/cupit.dart';
//import 'package:newsapp/cupit/remote/dio_helper.dart';
import 'package:newsapp/Network/remote/dio_helper.dart';
import 'SerchScreen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cupit = NewsCubit.get(context)
      ..getBusniss()
      ..getScience()
      ..getSports();
    // return BlocProvider(
    //   create: (context) => NewsCubit(),
    //   child: BlocConsumer<NewsCubit, NewsStates>(
    //     listener: (context, state) {},
    //     builder: (context, state) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EG News',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScerchScr(),
                  ),
                );
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                cupit.changeThemeMode();
              },
              icon: Icon(Icons.dark_mode)),
        ],
      ),
      body: cupit.screens[cupit.currentindex],
      bottomNavigationBar: BottomNavigationBar(
        items: cupit.bottomitems,
        currentIndex: cupit.currentindex,
        onTap: (index) {
          cupit.changebottomnav(index);
        },
      ),
    );
  }
}
