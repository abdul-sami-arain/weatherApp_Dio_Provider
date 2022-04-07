import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/dio_service.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioState>((context), listen: true);
    return FutureBuilder<WeatherModel>(
      future: state.getData(),
      builder: ((context, snapshot) {
        final DateTime riseTime = new DateTime.fromMillisecondsSinceEpoch(
            (snapshot.data!.sys!.sunrise!.toInt()) * 1000,
            isUtc: false);


        final DateTime setTime = new DateTime.fromMillisecondsSinceEpoch(
            (snapshot.data!.sys!.sunset!.toInt()) * 1000,
            isUtc: false);
        final double MintempCelcius = snapshot.data!.main!.tempMin! - 273.4;
        final double MaxtempCelcius = snapshot.data!.main!.tempMax! - 273.4;    

        if (snapshot.hasData) {
          return Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularPercentIndicator(
                    radius: 50,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Humdidity"),
                        Text(snapshot.data!.main!.humidity!.toString() + "%")
                      ],
                    ),
                    progressColor: Colors.amber,
                    percent: snapshot.data!.main!.humidity!.toDouble() / 100,
                  ),
                  CircularPercentIndicator(
                    radius: 50,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Clouds"),
                        Text(snapshot.data!.clouds!.all!.toDouble().toString() +
                            "%")
                      ],
                    ),
                    progressColor: Colors.amber,
                    percent: snapshot.data!.clouds!.all!.toDouble() / 100,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Wind Speed"),
                      SizedBox(height: 2.h,),
                      Image.asset(
                        "assets/anemometer.png",
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(height: 2.h,),
                      Text(snapshot.data!.wind!.speed.toString() + "km/h")
                    ],
                  ),
                  Column(
                    children: [
                      Text("Pressure"),
                      SizedBox(height: 2.h,),
                      Image.asset(
                        "assets/pressuregauge.png",
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(height: 4.h,),
                      Text(snapshot.data!.wind!.speed.toString() + "hpa")
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Minimum Temp"),
                      SizedBox(height: 2.h,),
                      Image.asset(
                        "assets/low.png",
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(height: 2.h,),
                      Text(MintempCelcius.toStringAsFixed(0)+"C",
                                    style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w100,
                                    color:  Colors.amber
                          ),  
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("Maximum Temp"),
                      SizedBox(height: 2.h,),
                      Image.asset(
                        "assets/high.png",
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(height: 2.h,),
                      Text(MaxtempCelcius.toStringAsFixed(0)+"C",
                                    style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w100,
                                    color:  Colors.amber
                          ),  
                      )
                    ],
                  )
                ],
              )
              
            ],
          );
        } else {
          return Container(
            child: Text("wait"),
          );
        }
      }),
    );
  }
}
