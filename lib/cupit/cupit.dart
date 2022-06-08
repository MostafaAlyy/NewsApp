import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cupit/States.dart';
import 'package:newsapp/screens/ScienseScr.dart';
import 'package:newsapp/screens/SportScr.dart';
import 'package:newsapp/screens/busnissScr.dart';
import 'package:newsapp/screens/settingSct.dart';

import '../Network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;

  List<BottomNavigationBarItem> bottomitems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Busniss"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "sciense"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
  ];
  List<Widget> screens = [
    BusnisScr(),
    SportSCr(),
    ScienseScr(),
    SettingScr(),
  ];

  void changebottomnav(index) {
    currentindex = index;
    emit(NewBottomState());
  }

  List<dynamic> busniss = [];

  void getBusniss() {

    emit(NewBusnissGetlodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }
    
    ).then((value) {
      busniss = value.data['articles'];
      print(busniss[0]['title']);
      emit(NewBusnissGetSucsessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewBusnissGetErorrState());
    });
  }
}
