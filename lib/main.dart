import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/shared/cubit/cubit.dart';
import 'package:weather_app/shared/cubit/state.dart';

import 'layout/ResultPage/resultpage.dart';
import 'shared/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  DioHelperCoutry.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => WeatherCubit()
          ..gettestData()
          ..getBussinusData(),
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: ((context, state) {}),
          builder: ((context, state) {
            return MaterialApp(
              title: 'Weather APP',
              home: ResualtPage(),
              theme: ThemeData(fontFamily: 'Lato'),
            );
          }),
        ));
  }
}
