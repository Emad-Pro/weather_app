import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/shared/Colors/colors.dart';
import 'package:weather_app/shared/cubit/cubit.dart';
import 'package:weather_app/shared/cubit/state.dart';

import '../../shared/remote/combonts.dart';

// ignore: must_be_immutable
class Dtpage extends StatelessWidget {
  int index = 1;
  Dtpage({
    this.index = 1,
  }) {}
  colorWeatherapp colorsap = colorWeatherapp();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: ((context, state) {}),
      builder: ((context, state) {
        WeatherCubit varWeatherCubit = WeatherCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: colorWeatherapp().BackgroundRounded,
            title: Text('Next 9 Day'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      color: colorWeatherapp().BackgroundRounded,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${varWeatherCubit.WetherforecastDayDate[index]['day']['condition']['text']}",
                                style:
                                    TextStyle(color: colorsap.ColorFontWhite),
                              ),
                              Text(
                                "${DateFormat('MMM,d').format(DateFormat("yyyy-MM-DD").parse('${varWeatherCubit.WetherforecastDayDate[index]['date']}'))}",
                                style:
                                    TextStyle(color: colorsap.ColorFontWhite),
                              ),
                              Text(
                                "${DateFormat('EEEE').format(DateFormat("yyyy-MM-DD").parse('${varWeatherCubit.WetherforecastDayDate[index]['date']}'))}",
                                style:
                                    TextStyle(color: colorsap.ColorFontWhite),
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                    'http:${varWeatherCubit.WetherforecastDayDate[index]['day']['condition']['icon']}'),
                                Text(
                                  style: TextStyle(
                                    color: colorWeather.ColorFontWhite,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ' ${varWeatherCubit.WetherforecastDayDate[index]['day']['maxtemp_c'].round()} /',
                                ),
                                Text(
                                    style: TextStyle(
                                      color: colorWeather.ColorFontWhite,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    '  ${varWeatherCubit.WetherforecastDayDate[index]['day']['mintemp_c'].round()} '),
                                Text(
                                  ' °C',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 25,
                                      color:
                                          Color.fromARGB(255, 197, 193, 193)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: WeatherPropeties(
                                wind:
                                    "  ${varWeatherCubit.WetherforecastDayDate[index]['day']['maxwind_kph']}km/h  ",
                                humidity:
                                    "${varWeatherCubit.WetherforecastDayDate[index]['day']['avghumidity'].round()}%",
                                chanceRain:
                                    "${varWeatherCubit.WetherforecastDayDate[index]['day']['daily_chance_of_rain']}%"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListView.separated(
                      itemBuilder: ((BuildContext context, index) {
                        index += 1;
                        return builDayTem(context, index);
                      }),
                      separatorBuilder: ((BuildContext context, index) {
                        return SizedBox(
                          height: 5,
                        );
                      }),
                      itemCount: 8),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
