import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:laundry_app/screens/login.dart';
import 'package:laundry_app/screens/register.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
          child: Scaffold(
            body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                painter: CurvePainter2(),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                painter: CurvePainter(),
              ),
            ),
            Positioned(
              top: height * 0.43,
              left: width * 0.2,
              child: Text(
                "'Having an empty laundry is the",
                style: GoogleFonts.aBeeZee(
                    color: Colors.white70,
                    fontSize: 15,
                    decoration: TextDecoration.none),
              ),
            ),
            Positioned(
              top: height * 0.46,
              left: width * 0.2,
              child: Text(
                "best 5 seconds of the week'",
                style: GoogleFonts.aBeeZee(
                    color: Colors.white70,
                    fontSize: 15,
                    decoration: TextDecoration.none),
              ),
            ),
            _button("btn1", "Login", true, height, width),
            _button("btn2", "Register", false, height, width),
            Positioned(
              top: height * 0.22,
              left: width * 0.35,
              child: Icon(
                Icons.local_laundry_service,
                size: 130,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _button(
      String tag, String label, bool isLogin, double height, double width) {
    return Positioned(
      top: isLogin ? height * 0.8 : height * 0.9,
      left: width * 0.32,
      child: Container(
        width: width * 0.4,
        child: FloatingActionButton.extended(
            backgroundColor: isLogin ? Color(0xff00cc00) : Colors.white,
            heroTag: tag,
            onPressed: () {
              isLogin
                  ? Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Login()))
                  : Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Register()));
            },
            label: Text(
              label,
              style: GoogleFonts.aBeeZee(
                  color: isLogin ? Colors.white : Color(0xff00cc00)),
            )),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xff00cc00);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.65);
    path.quadraticBezierTo(
        size.width / 1.5, size.height / 1.5, size.width, size.height * 0.32);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurvePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xffffff00);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.76);
    path.quadraticBezierTo(
        size.width / 1.1, size.height / 1.5, size.width, size.height * 0.33);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
