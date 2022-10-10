// ignore_for_file: non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/shared/cubit/state.dart';

import '../remote/dio_helper.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());
  static WeatherCubit get(context) => BlocProvider.of(context);

  List countryList = [];
  String? selectedValue;

  void gettestData() {
    emit(WeatherGetTempLoadingState());
    DioHelperCoutry.getData(url: '/api/v0.1/countries').then((value) {
      countryList = value!.data['data'][61]['cities'];
      selectedValue = countryList[0].toString();
      emit(WeatherGetTempSuccessState());
    }).catchError((onError) {
      emit(WeatherGetTempErorrState(onError.toString()));
      print(onError.toString());
    });
  }

  int CurrentIndex = 0;
  Map<String, dynamic> WetherLocation = {};
  Map<dynamic, dynamic> WetherCurrent = {};
  List WetherforecastDayDate = [];

  String? Regonplusname;
  void getBussinusData({String? valueaa}) async {
    emit(WeatherGetTempLoadingState());
    DioHelper.getData(url: '/forecast.json?', qurey: {
      'Key': '0a451492f5bc40fea40220901220110',
      'q': '${valueaa}',
      'days': 10
    }).then((value) {
      WetherLocation = value!.data['location'];
      WetherCurrent = value.data['current'];
      WetherforecastDayDate = value.data['forecast']['forecastday'];
      emit(WeatherGetTempSuccessState());
    }).catchError((onError) {
      emit(WeatherGetTempErorrState(onError.toString()));
      print(onError.toString());
    });
  }

  /*List<dynamic> Search = [];
  void getSearcheData({String? value}) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: '/v2/top-headlines', qurey: {
      'q': '${value}',
      'country': 'eg',
      'apiKey': '6fa87faea3534c5d991d4f676bb7fbc4'
    }).then((value) {
      Search = value!.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((onError) {
      emit(NewsGetSearchErorrState(onError.toString()));
      print(onError.toString());
    });
  }*/

}
