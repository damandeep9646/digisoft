import 'package:flutter/material.dart';
import 'package:login_app/dashboard/DashBoardScreen.dart';
import 'package:login_app/login/loginScreen.dart';
import 'package:login_app/utils/SharedPref.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var routes = <String, WidgetBuilder>{
    Routes.DASH: (BuildContext context) => DashBoard(),
    Routes.LOGIN: (BuildContext context) => new LoginScreen(),
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: Splash(),
    );
  }
}

class Routes {
  static const String DASH = "/dash";
  static const String LOGIN = "/login";
}
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  getdata() async{
    var s = await SharedPref.getInstance().getBoolean(SharedPref.ISFIRSTTIME);
    print(s.toString());
    if(!s){
      Navigator.pushNamedAndRemoveUntil(context, Routes.LOGIN, (Route<dynamic> route) => false);
    }else{
      Navigator.pushNamedAndRemoveUntil(context, Routes.DASH, (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
