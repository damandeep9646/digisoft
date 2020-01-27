import 'dart:async';

import 'package:flutter/material.dart';

const colorRed = Color(0xFFFFFFF);

class clipcurve extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    // TODO: implement getClip

    Path path = new Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.quadraticBezierTo(size.width/2, size.height, 0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return null;
  }

}


class DashBoard  extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  Widget icon(Image icon,String txt){
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: Colors.orange,width: 0.5,style: BorderStyle.solid)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            icon,
            SizedBox(height: 10,),
            Text(txt)
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomPaint(
        painter: CurvePainter(),
        child: Column(

          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Image.asset('images/mainlogo.png',width: 200,height: 200,),
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(child: icon(Image.asset("images/dash.png"),"Dashboard")),Expanded(child: icon(Image.asset("images/location.png"),"Location")),Expanded(child: icon(Image.asset("images/customer.png"),"Customer")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(child: icon(Image.asset("images/travel.png"),"Travelling")),
                            Expanded(
                              child: icon(Image.asset("images/bill.png"),"Bill"),
                            ),
                            Expanded(child: icon(Image.asset("images/vehicle.png"),"Vehicle"))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(child: icon(Image.asset("images/clock.png"),"Attendance")),Expanded(child: icon(Image.asset("images/tour.png"),"Tour")),Expanded(child: icon(Image.asset("images/task.png"),"Task"))
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CurvePainter extends CustomPainter{


  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();


path.lineTo(0, size.height *0.95);
    path.quadraticBezierTo(size.width* 0.10, size.height*0.70,   size.width*0.17, size.height*0.90);
    path.quadraticBezierTo(size.width*0.20, size.height, size.width*0.25, size.height*0.90);
    path.quadraticBezierTo(size.width*0.40, size.height*0.40, size.width*0.50, size.height*0.70);
    path.quadraticBezierTo(size.width*0.60, size.height*0.85, size.width*0.65, size.height*0.65);
    path.quadraticBezierTo(size.width*0.70, size.height*0.90, size.width, 0);
    path.close();

    paint.color = colorRed;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height*0.50);
    path.quadraticBezierTo(size.width*0.10, size.height*0.80, size.width*0.15, size.height*0.60);
    path.quadraticBezierTo(size.width*0.20, size.height*0.45, size.width*0.27, size.height*0.60);
    path.quadraticBezierTo(size.width*0.45, size.height, size.width*0.50, size.height*0.80);
    path.quadraticBezierTo(size.width*0.55, size.height*0.45, size.width*0.75, size.height*0.75);
    path.quadraticBezierTo(size.width*0.85, size.height*0.93, size.width, size.height*0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = colorRed;
    canvas.drawPath(path, paint);

    path =Path();
    path.lineTo(0, size.height*0.75);
    path.quadraticBezierTo(size.width*0.10, size.height*0.55, size.width*0.22, size.height*0.70);
    path.quadraticBezierTo(size.width*0.30, size.height*0.90, size.width*0.40, size.height*0.75);
    path.quadraticBezierTo(size.width*0.52, size.height*0.50, size.width*0.65, size.height*0.70);
    path.quadraticBezierTo(size.width*0.75, size.height*0.85, size.width, size.height*0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = colorRed.withOpacity(0.6);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}