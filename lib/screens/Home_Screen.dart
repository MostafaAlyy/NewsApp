import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cupit/States.dart';
import 'package:newsapp/cupit/cupit.dart';
//import 'package:newsapp/cupit/remote/dio_helper.dart';
import 'package:newsapp/Network/remote/dio_helper.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cupit = NewsCubit.get(context)..getBusniss();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'EG News',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
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
        },
      ),
    );
  }
}
