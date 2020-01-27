import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:login_app/appTheme.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/dashboard/DashBoardScreen.dart';
import 'package:login_app/login/LoginResponse.dart';
import 'package:login_app/utils/SharedPref.dart';

import '../main.dart';

const colorRed = Color(0xffD8212E);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  AnimationController _controller;
  var anim;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    anim = Tween<double>(begin: 0.0, end: 1.0).animate(
        new CurvedAnimation(parent: _controller, curve: Interval(0.0, 1, curve: Curves.bounceIn)));
    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool validate() {
    if (emailTextController.text.isEmpty) {
      return false;
    }

    if (passwordTextController.text.isEmpty) {
      return false;
    }

    return true;
  }

  hitApiLogin() async {
    if (validate()) {
      try {
        print("gate 1");
        Map<String,String> map = new Map();
        map["username"] = emailTextController.text.toString();
        map["password"] = passwordTextController.text.toString();
        var response = await http.post(
            "https://paymentprocessor-script.com/demos/downloads/digisoft/php/login.php",body: map);
        String receivedJson = response.body;
        print("gate 2 $receivedJson");
        List<dynamic> list = json.decode(receivedJson);
        if(list == null || list.isEmpty) {
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Incorrect login")));
        } else {
          LoginResponse fact = LoginResponse.fromJson(list[0]);
          await SharedPref.getInstance()
              .setString(SharedPref.PREFERENCE_USER_NAME, fact.real_name);
          await SharedPref.getInstance().setBoolean(SharedPref.ISFIRSTTIME, true);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.DASH, (Route<dynamic> route) => false);
        }
      } catch (e) {
        print("gate err $e");
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Incorrect Login")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        // backgroundColor: AppTheme.getTheme().backgroundColor,
        body: Stack(
          children: <Widget>[
            Transform.scale(
              scale: anim.value,
              origin: Offset(0,0),
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "images/web_soln_crop.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY: 3,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      child: appBar(),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.all(16.0),
//                        child: Text(
//                          "or log in with email",
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                            fontSize: 14,
//                            fontWeight: FontWeight.w500,
//                            color: AppTheme.getTheme().disabledColor,
//                          ),
//                        ),
//                      ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 32),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.getTheme().backgroundColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(38)),
                                  // border: Border.all(
                                  //   color: HexColor("#757575").withOpacity(0.6),
                                  // ),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppTheme.getTheme().dividerColor,
                                      blurRadius: 8,
                                      offset: Offset(4, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Container(
                                    height: 48,
                                    child: Center(
                                      child: TextField(
                                        controller: emailTextController,
                                        maxLines: 1,
//                                  onChanged: (String txt) {
//                                    email = txt;
//                                  },
                                        style: TextStyle(
                                          fontSize: 16,
                                          // color: AppTheme.dark_grey,
                                        ),
                                        cursorColor:
                                            AppTheme.getTheme().primaryColor,
                                        decoration: new InputDecoration(
                                          errorText: null,
                                          border: InputBorder.none,
                                          hintText: "Username",
                                          hintStyle: TextStyle(
                                              color: AppTheme.getTheme()
                                                  .disabledColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 16),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.getTheme().backgroundColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(38)),
                                  // border: Border.all(
                                  //   color: HexColor("#757575").withOpacity(0.6),
                                  // ),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppTheme.getTheme().dividerColor,
                                      blurRadius: 8,
                                      offset: Offset(4, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Container(
                                    height: 48,
                                    child: Center(
                                      child: TextField(
                                        controller: passwordTextController,
                                        maxLines: 1,
//                                  onChanged: (String txt) {
//                                    password = txt;
//                                  },
                                        style: TextStyle(
                                          fontSize: 16,
                                          // color: AppTheme.dark_grey,
                                        ),
                                        cursorColor:
                                            AppTheme.getTheme().primaryColor,
                                        decoration: new InputDecoration(
                                          errorText: null,
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: AppTheme.getTheme()
                                                  .disabledColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, right: 16, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Forgot your password?",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: colorRed,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, bottom: 8, top: 8),
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: colorRed,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppTheme.getTheme().dividerColor,
                                      blurRadius: 8,
                                      offset: Offset(4, 4),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24.0)),
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      hitApiLogin();
                                    },
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: AppBar().preferredSize.height,
          child: Padding(
            padding: EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 24),
          child: Text(
            "Log in",
            style: new TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/mainlogo.png",
              height: 150,
            ),
          ],
        ),
      ],
    );
  }

//  bool validation() {
//    if (Validations.getInstance().isFieldEmpty(emailTextController.text)) {
//      FrequentUtils.getInstance()
//          .showInSnackBar("Enter Email id", _scaffoldKey);
//      return false;
//    }
//
//    if (Validations.getInstance().isFieldEmpty(passwordTextController.text)) {
//      FrequentUtils.getInstance()
//          .showInSnackBar("Enter Password", _scaffoldKey);
//      return false;
//    }
//    return true;
//  }
//
//  void loginApi() {
//    if (validation()) {
//      var request = LoginRequest(email: emailTextController.text, password: passwordTextController.text);
//      WebService.getInstance().signIn(request, onSignInSuccess, error, context);
//    }
//  }
//
//  void error(String msg) {
//    FrequentUtils.getInstance().showInSnackBar(msg, _scaffoldKey);
//  }
//
//  void onSignInSuccess(Map<String, dynamic> response) async {
//    await SharedPref.getInstance()
//        .setString(SharedPref.PREFERENCE_TOKEN_ID, response["token"]);
//    await SharedPref.getInstance()
//        .setBoolean(SharedPref.PREFERENCE_IS_LOGIN, true);
//    await SharedPref.getInstance()
//        .setString(SharedPref.PREFERENCE_USER_NAME, response['name']);
//
//    Navigator.pushNamedAndRemoveUntil(
//        context, Routes.TabScreen, (Route<dynamic> route) => false);
//  }

}
