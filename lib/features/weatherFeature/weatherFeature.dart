import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/dio_service.dart';
import 'package:weatherapp/features/weatherFeature/presentation/BasicInfo.dart';
import 'package:weatherapp/features/weatherFeature/presentation/searchbar.dart';
import 'package:weatherapp/features/weatherFeature/presentation/weatherDetails.dart';
import 'package:weatherapp/features/weatherFeature/presentation/weatherIcon.dart';
import 'package:weatherapp/features/weatherFeature/presentation/weatherShow.dart';
import 'package:weatherapp/model/weather_model.dart';

class WeatherFeature extends StatelessWidget {
  const WeatherFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioState>((context), listen: true);
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Weather App"),
          ),
          body:  Container(  
              child: FutureBuilder<WeatherModel>(
              future: state.getData(),
              builder: (context, snapshot) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      WeatherShow(),
                      SizedBox(height: 5.h,),
                      BasicInfo(),
                      SizedBox(height: 5.h,),
                      SearchBar(),
                      SizedBox(height: 5.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10.h),
                        child: Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            
                            
                            ),
                          
                          child: Center(child: 
                          Text("Description",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w400
                          ),
                          ))),
                      ),
                        Details(),
                        SizedBox(height: 5.h,),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(  
                            color: Colors.lightBlue
                          ),
                          child: Center(child:
                           Text("Powered By Abdul Sami",
                           style: TextStyle(
                             fontSize: 20.sp,
                             fontWeight: FontWeight.w500
                           ),)),
                        )
                    ],
                  )
                );
              }
              ),
            
          )
              ),
    );
  }
}
