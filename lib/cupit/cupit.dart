import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cupit/States.dart';
import 'package:newsapp/screens/ScienseScr.dart';
import 'package:newsapp/screens/SportScr.dart';
import 'package:newsapp/screens/busnissScr.dart';

import '../Network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewInitialState());

  bool appMode = true;

  void changeThemeMode() {
    (appMode == true) ? appMode = false : appMode = true;
    emit(NewChangeThemeModeState());
  }

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;

  List<BottomNavigationBarItem> bottomitems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Busniss"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "sciense"),
  ];
  List<Widget> screens = [
    BusnisScr(),
    SportSCr(),
    ScienseScr(),
  ];

  void changebottomnav(index) {
    currentindex = index;
    // if (index == 1)
    //   getSports();
    // else if (index == 2)
    //   getScience();
    // else if (index == 0) getBusniss();
    emit(NewBottomState());
  }

  List<dynamic> busniss = [];

  void getBusniss() {
    emit(NewBusnissGetlodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'e499554988914e4bacb4996da18621cf',
    }).then((value) {
      busniss = value.data['articles'];
      print(busniss[0]['urlToImage']);
      emit(NewBusnissGetSucsessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewBusnissGetErorrState());
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewBusnissGetlodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'e499554988914e4bacb4996da18621cf',
    }).then((value) {
      sports = value.data['articles'];
      print(busniss[0]['urlToImage']);
      emit(NewBusnissGetSucsessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewBusnissGetErorrState());
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewBusnissGetlodingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'e499554988914e4bacb4996da18621cf',
    }).then((value) {
      science = value.data['articles'];
      print(busniss[0]['urlToImage']);
      emit(NewBusnissGetSucsessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewBusnissGetErorrState());
    });
  }

  List<dynamic> search = [];

  void getSearch(value) {
    emit(NewSearchGetlodingState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'a4541c1afd704576b448a8c695f87db0',
    }).then((value) {
      search = value.data['articles'];
      print(busniss[0]['urlToImage']);
      emit(NewSearchGetSucsessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewSearchGetErorrState());
    });
  }
}
