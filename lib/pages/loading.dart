import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {


  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  String time = 'loading';

void setUpWorldTime() async
{

  WorldTime instance = WorldTime(location: 'PATIALA', flag:'india.png' , url: 'Asia/Kolkata', );
  await instance.getTime();

  //1. pushNamed is used to open one screen from another. It works like INTENT in Android
  //2. pushReplacementNamed is same like pushNamed but will overwrite the first screen with another.
  //   Thus previous screen will be closed.
  //3. arguments in pushReplacementNamed are used to send data from one screen to another.


  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDayTime': instance.isDayTime,
  });


  // print(instance.time);
  //
  // setState(() {
  //   time = instance.time;
  // });
  //

}




  @override
  void initState() {
    super.initState();
    setUpWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
