abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class NewBottomNavState extends WeatherState {}

class WeatherGetTempLoadingState extends WeatherState {}

class WeatherGetTempSuccessState extends WeatherState {}

class WeatherGetTempErorrState extends WeatherState {
  final String erorr;
  WeatherGetTempErorrState(this.erorr);
}
