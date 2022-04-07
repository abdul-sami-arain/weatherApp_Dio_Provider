import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/dio_service.dart';
import 'package:weatherapp/features/weatherFeature/weatherFeature.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return ScreenUtilInit(
        builder: (() => 
       ChangeNotifierProvider(
      create: (context) => DioState(),
      child:MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Container(
              
              child:WeatherFeature()
              ),
          ),
        ),
      
    )
    ),
    designSize: Size(360, 800)
    );
  }
}

