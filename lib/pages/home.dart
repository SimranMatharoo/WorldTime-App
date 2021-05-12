import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data: ModalRoute.of(context)!.settings.arguments as Map;
    print('My data is $data');


    //set background
    String bgImage = data['isDayTime'] ? 'day2.jpg' : 'night.png' ;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.fill
          )
        ),

        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120,0,0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed:  () async {
                  dynamic result =  await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                    };
                  });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300] ),
                  label: Text(
                      'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300]
                    ),
                   ),

              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 60.0,
                  color: Colors.white,
                ),
              )

            ],
          ),
        )),
    );
  }
}
