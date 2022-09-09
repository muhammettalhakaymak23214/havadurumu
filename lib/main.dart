import 'package:flutter/material.dart';
import 'package:havadurumu/screens/loading_screen.dart';
import 'package:havadurumu/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
Future<void> getCurrentTemperature() async{
  Response response = await get("http://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric");

  if(response.statusCode == 200){
    String data = response.body;
    var currentWeather = jsonDecode(data);

    try{
      currentTemperature = currentWeather['main']['temp'];
      currentCondition = currentWeather['weather'][0]['id'];
      city = currentWeather['name'];
    }catch(e){
      print(e);
    }

  }
  else{
    print("API den değer gelmiyor!");
  }
