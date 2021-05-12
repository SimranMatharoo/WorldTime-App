import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  // Use the late keyword to initialize a variable when it is first read,
  // rather than when it's created. ... By declaring a non-nullable late variable,
  // we promise that it will be non-null at runtime, and Dart helps us with some compile-time guarantees.

  late String location; //location name on the UI
  late String time; //the time in that location
  late String flag; //the url to an asset flag
  late String url; //location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  //**** Asynchronous functions******
  Future<void> getTime() async {
    try {

      //make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      print(data);

      //getting properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);


      time = now.toString();


    } catch (e) {

      print('caught error: $e');
      time = 'could not get time';
    }

    //   //Fake json data for testing
    //   //jsonPlaceholder website
    // Response response =   await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    //
    // print(response.body);
    //
    // Map data = jsonDecode(response.body);
    //print(data['title']);

    // // Simulate network request for
    // username
    // // Future. delayed() function will delay the function block to run after the defined seconds in the argument
    // // await is used to assign to some variable
    // String a =  await Future.delayed(Duration(seconds: 3),(){
    //
    //   return 'statement which runs after delay of 3 seconds';
    //
    // });
    //
    // String b = await Future.delayed(Duration(seconds: 2),(){
    //
    //   return 'statement which runs after delay of 2 seconds';
    //
    // });
    //
    // print('$a - $b');
  }
}
