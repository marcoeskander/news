import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/moduls/business.dart';
import 'package:news/moduls/entertainment.dart';
import 'package:news/moduls/health.dart';
import 'package:news/moduls/science.dart';
import 'package:news/moduls/sports.dart';
import 'package:news/moduls/technology.dart';
import 'package:news/shared/cuibt/states.dart';
import 'package:news/shared/local/shared_prefrences.dart';
import 'package:news/shared/network/dio.dart';

class news_cubit extends Cubit<news_state> {
  news_cubit() : super(newsInitialState());
  static news_cubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> appscreens = [
    businesss(),
    entertainment(),
    health(),
    science(),
    Sports(),
    technology()
  ];

  void change_screen(index) {
    currentIndex = index;
    emit(changescreenSucess());
  }

  String apikey = '977fbdaa13844e2fb43a8110cbc91e02';

  List<dynamic> business = [];
  void get_bussiness() {
    emit(businessInitialState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'apiKey': '$apikey',
      'country': 'eg',
      'category': 'business'
    }).then((value) {
      business = value.data["articles"];
      emit(businessscreenSucess());
    }).catchError((Error) {
      emit(businessscreenErorr(Error));
    });
  }

  List<dynamic> entertainments = [];
  void getEntertainment() {
    emit(emtertainmentInitialState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'apiKey': '$apikey',
      'country': 'eg',
      'category': 'entertainment'
    }).then((value) {
      entertainments = value.data['articles'];
      emit(entertainmentscreenSucess());
    }).catchError((error) {
      emit(entertanmentscreenErorr(error));
    });
  }

  List<dynamic> healths = [];
  void getHealth() {
    emit(healthInitialState());
    DioHelper.getData(
            url: 'v2/top-headlines',
            query: {'apiKey': '$apikey', 'country': 'eg', 'category': 'health'})
        .then((value) {
      healths = value.data['articles'];
      emit(healthscreenSucess());
    }).catchError((error) {
      emit(healthscreenErorr(error));
    });
  }

  List<dynamic> sciences = [];
  void getScience() {
    emit(scienceInitialState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'apiKey': '$apikey',
      'country': 'eg',
      'category': 'science'
    }).then((value) {
      sciences = value.data['articles'];
      emit(sciencescreenSucess());
    }).catchError((error) {
      emit(sciencescreenErorr(error));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(sportssInitialState());
    DioHelper.getData(
            url: 'v2/top-headlines',
            query: {'apiKey': '$apikey', 'country': 'eg', 'category': 'sports'})
        .then((value) {
      sports = value.data['articles'];
      emit(sportsscreenSucess());
    }).catchError((error) {
      emit(sportsscreenErorr(error));
    });
  }

  List<dynamic> technologys = [];
  void getTechnologys() {
    emit(technologyInitialState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'apiKey': '$apikey',
      'country': 'eg',
      'category': 'technology'
    }).then((value) {
      technologys = value.data['articles'];
      emit(technologyscreenSucess());
    }).catchError((error) {
      emit(technologyscreenErorr(error));
    });
  }

  List<dynamic> search = [];
  void getsearch({required word}) {
    emit(searchInitialState());
    if (word == '') {
      search = [];
    } else {
      DioHelper.getData(
              url: 'v2/top-headlines',
              query: {'apiKey': '$apikey', 'country': 'eg', 'e': '$word'})
          .then((value) {
        search = value.data['articles'];
        emit(searchscreenSucess());
      }).catchError((error) {
        emit(searchscreenErorr(error));
      });
    }
  }

  var searchcontroler = TextEditingController();

  bool isDark = false;
  void changemod({bool? isdrkfromshared}) {
    if (isdrkfromshared != null) {
      isDark = isdrkfromshared;
      emit(changemodescreenSucess());
    } else {
      isDark = !isDark;
      shared_Prefrences.setdata(key: 'isDark', value: isDark).then((value) {
        emit(changemodescreenSucess());
      });
    }
  }
}
