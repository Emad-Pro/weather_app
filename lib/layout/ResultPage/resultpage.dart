// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/shared/Colors/colors.dart';
import 'package:weather_app/shared/cubit/cubit.dart';
import 'package:weather_app/shared/cubit/state.dart';
import 'package:weather_app/shared/remote/combonts.dart';
import '../detilsPage/dtpage.dart';

class ResualtPage extends StatelessWidget {
  colorWeatherapp colorsap = colorWeatherapp();
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        var varWeatherCubit = WeatherCubit.get(context);
        var ResultCurrentCondition = varWeatherCubit.WetherCurrent['condition'];
        ScrollController controller = new ScrollController();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: colorWeatherapp().BackgroundRounded,
            elevation: 0,
            title: Text(
              'Weather App',
              style: TextStyle(color: colorsap.ColorFontWhite),
            ),
          ),
          body: varWeatherCubit.countryList.isEmpty ||
                  varWeatherCubit.WetherLocation.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: colorWeatherapp().BackgroundRounded,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 2,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        size: 5,
                                        color: colorWeather.Colorgrayedit,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${varWeatherCubit.selectedValue}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: varWeatherCubit.countryList
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    colorWeather.Colorgrayedit,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  value: varWeatherCubit.selectedValue,
                                  onChanged: (value) {
                                    varWeatherCubit.selectedValue =
                                        value.toString();
                                    varWeatherCubit.getBussinusData(
                                        valueaa: value.toString());
                                  },
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                  ),
                                  selectedItemHighlightColor:
                                      colorWeatherapp().BackgroundRounded,
                                  buttonDecoration: BoxDecoration(
                                    color: colorsap.ColorFontWhite,
                                  ),
                                  focusColor:
                                      colorWeatherapp().BackgroundRounded,
                                  buttonElevation: 0,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(0, 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: colorWeatherapp().BackgroundRounded,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'City: ${varWeatherCubit.WetherLocation['region'].toString().toUpperCase()}, ${varWeatherCubit.WetherLocation['country'].toString()}',
                                            maxLines: 1,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: colorsap.ColorFontWhite,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            'Date: ${DateFormat.MMMEd().format(DateTime.now())}',
                                            style: TextStyle(
                                                color: colorsap.ColorFontWhite,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Text(
                                        "Today",
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 25,
                                          color: colorsap.ColorFontWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        '${ResultCurrentCondition['icon']}'
                                                    .toString() ==
                                                'http:null'
                                            ? CircularProgressIndicator()
                                            : ClipRect(
                                                child: Image.network(
                                                  excludeFromSemantics: true,
                                                  filterQuality:
                                                      FilterQuality.high,
                                                  'http:${ResultCurrentCondition['icon']}',
                                                  scale: 0.01,
                                                ),
                                              ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${varWeatherCubit.WetherCurrent['temp_c'].toString() == 'null' ? "Loading...." : varWeatherCubit.WetherCurrent['temp_c'].round()}",
                                                style: TextStyle(
                                                    fontSize: 55,
                                                    color:
                                                        colorsap.ColorFontWhite,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text("°",
                                                  style: TextStyle(
                                                      fontSize: 45,
                                                      color: colorsap
                                                          .ColorFontWhite,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: WeatherPropeties(
                                        wind:
                                            "  ${varWeatherCubit.WetherCurrent['wind_kph']}km/h  ",
                                        humidity:
                                            "${varWeatherCubit.WetherCurrent['humidity']}%",
                                        chanceRain:
                                            "  ${varWeatherCubit.WetherforecastDayDate[0]['day']['daily_chance_of_rain']}%"),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today",
                            style: TextStyle(fontSize: 20),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Dtpage(),
                                  ));
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Next 9 Day  ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 12,
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                      Expanded(
                        flex: 2,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 24,
                          shrinkWrap: true,
                          reverse: false,
                          controller: controller,
                          itemBuilder: (BuildContext context, int index) {
                            return BuildCard(context,
                                time: index.toString(), index: index);
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            width: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
