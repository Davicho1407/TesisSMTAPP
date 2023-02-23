class Weather {
  String? cityName;
  String? country;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;

  Weather(
      {this.cityName,
      this.country,
      this.temp,
      this.wind,
      this.humidity,
      this.feels_like,
      this.pressure});

  ///construimos una funcion to parse the JSON file  dentro del modelo
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    country = json['sys']['country'];
    temp = json['main']['temp'];
    wind = json['wind']['speed'];
    pressure = json['main']['pressure'];
    humidity = json['main']['humidity'];
    feels_like = json['main']['feels_like'];
  }
}
