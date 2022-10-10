import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Colors/colors.dart';
import '../../layout/detilsPage/dtpage.dart';
import '../cubit/cubit.dart';

colorWeatherapp colorWeather = colorWeatherapp();
Color white = Colors.white;

Widget BuildCard(
  context, {
  required String time,
  required int index,
}) {
  var TemprImageTime =
      WeatherCubit.get(context).WetherforecastDayDate[0]['hour'][index];
  var imageurl = TemprImageTime['condition']['icon'];
  String FormatTimetoHOur =
      DateFormat.jm().format(DateTime.parse('${TemprImageTime['time']}'));

  return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 140,
        color: colorWeather.ColorFontWhite,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              textBaseline: TextBaseline.ideographic,
              children: [
                Expanded(
                    child: Text(
                  '${FormatTimetoHOur}',
                  style: TextStyle(
                      color: colorWeather.Colorgrayedit,
                      fontWeight: FontWeight.bold),
                )),
                Expanded(
                  flex: 2,
                  child: Container(
                      width: 400, child: Image.network('http:${imageurl}')),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${TemprImageTime['temp_c']}",
                        style: TextStyle(
                            color: colorWeather.Colorgrayedit,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Text("°",
                        style: TextStyle(
                            fontSize: 25,
                            color: colorWeather.Colorgrayedit,
                            fontWeight: FontWeight.bold))
                  ],
                )),
              ]),
        ),
      ));
}

Widget dayitemes({context, index}) {
  return Container(
    child: MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dtpage(
                index: index,
              ),
            ));
      },
      child: Text(
        WeatherCubit.get(context)
            .WetherforecastDayDate[index + 1]['date']
            .toString(),
        style: TextStyle(fontSize: 15),
      ),
    ),
  );
}

Widget WeatherPropeties({
  required String wind,
  required String humidity,
  required String chanceRain,
}) =>
    Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Icon(
                    Icons.wind_power_outlined,
                    color: Colors.green[600],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "${wind}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.water_drop_outlined,
                    color: Colors.red[400],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "  ${humidity}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.water_drop,
                    color: Colors.blue[600],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "${chanceRain}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );

Widget builDayTem(context, index) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 75,
          child: Text(
              "${DateFormat('EEEE').format(DateFormat("yyyy-MM-DD").parse('${WeatherCubit.get(context).WetherforecastDayDate[index + 1]['date']}'))}"),
        ),
        Container(
            child: Text(
                "${WeatherCubit.get(context).WetherforecastDayDate[index + 1]['day']['maxtemp_c'].round()}/${WeatherCubit.get(context).WetherforecastDayDate[index + 1]['day']['mintemp_c'].round()}°")),
        Row(
          children: [
            Image.network(
                scale: 2,
                'http:${WeatherCubit.get(context).WetherforecastDayDate[index + 1]['day']['condition']['icon']}'),
            Container(
              width: 50,
              child: Text(
                "${WeatherCubit.get(context).WetherforecastDayDate[index + 1]['day']['condition']['text']}",
                maxLines: 2,
                softWrap: true,
              ),
            )
          ],
        )
      ],
    ),
  );
}
