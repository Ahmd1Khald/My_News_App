import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/bloc/app_states.dart';
import 'package:mynewsapp/network/non_local/dio_helper.dart';
import 'package:mynewsapp/screens/business_screen.dart';
import 'package:mynewsapp/screens/science_screen.dart';
import 'package:mynewsapp/screens/sports_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int bottomIndex = 0;

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    SciencesScreen(),
  ];

  void changeBottomIndex({required index}) {
    bottomIndex = index;
    emit(AppChangeBottomIndexState());
    if (index == 1) getSportsData();
    if (index == 2) getScienceData();
  }

  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    emit(AppChangeModeState());
  }

  List business = [];

  void getBusinessData() {
    if (business.isEmpty) {
      DioHelper.getDate(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': 'e98a441f44d24169b5a1d7896134f062',
        },
      ).then((value) {
        business = value.data['articles'];
        emit(AppGetBusinessSucccesState());
      }).catchError((error) {
        print('${error.toString()} when get business data');
        emit(AppGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(AppGetBusinessSucccesState());
    }
  }

  List sports = [];

  void getSportsData() {
    if (sports.isEmpty) {
      DioHelper.getDate(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'e98a441f44d24169b5a1d7896134f062',
        },
      ).then((value) {
        sports = value.data['articles'];
        emit(AppGetSportsSucccesState());
      }).catchError((error) {
        print('${error.toString()} when get sports data');
        emit(AppGetSportsErrorState(error.toString()));
      });
    } else {
      emit(AppGetSportsSucccesState());
    }
  }

  List science = [];

  void getScienceData() {
    if (science.isEmpty) {
      DioHelper.getDate(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'e98a441f44d24169b5a1d7896134f062',
        },
      ).then((value) {
        science = value.data['articles'];
        emit(AppGetSciencesSucccesState());
      }).catchError((error) {
        print('${error.toString()} when get science data');
        emit(AppGetSciencesErrorState(error.toString()));
      });
    } else {
      emit(AppGetSciencesSucccesState());
    }
  }

  List search = [];

  void getSearchData(String value) {
    DioHelper.getDate(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': 'e98a441f44d24169b5a1d7896134f062',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(AppGetSearchSucccesState());
    }).catchError((error) {
      print('${error.toString()} when get search data');
      emit(AppGetSearchErrorState(error.toString()));
    });
  }
}
