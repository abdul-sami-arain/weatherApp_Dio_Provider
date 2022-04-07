import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/dio_service.dart';
import 'package:weatherapp/features/weatherFeature/presentation/weatherShow.dart';
import 'package:weatherapp/model/weather_model.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioState>((context), listen: true);
    return FutureBuilder<WeatherModel>(
      future: state.getData(),
      builder: (context, snapshot) {
        final double tempCelcius = snapshot.data!.main!.temp! - 273.4;
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(
                  '${snapshot.data!.name.toString()}'+'\t'+'  ${snapshot.data!.sys!.country.toString()}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    color:  Colors.amber
                  ),
                  ),
              Text(snapshot.data!.weather!.first.main.toString(),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.normal,
                color:Colors.amber
              ),
              )    
            ],
          );
        } else {
          return Container(
            child: Text("wait"),
          );
        }
      },
    );
  }
}
