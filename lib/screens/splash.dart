import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:laundry_app/state/authState.dart';
import '../screens/home.dart';
import '../screens/usersHome.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Provider.of<AuthenticationState>(context, listen: false)
          .currentUser()
          .then((currentUser) => {
                if (currentUser == null)
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()))
                  }
                else
                  {
                    Navigator.push(context,
                            MaterialPageRoute(builder: (context) => UserHome()))
                        .catchError((e) => print(e))
                  }
              })
          .catchError((e) => print(e));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/3243087700_74cdbf94ee_k.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Opacity(
            opacity: 0.8,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.green[900]
                // color: Color(0xff00cc00),
                ),
          ),
          Opacity(
            opacity: 0.3,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // color: Colors.green[900]
              color: Color(0xff00cc00),
            ),
          ),
          Positioned(
              top: height * 0.45,
              left: width * 0.3,
              child: Text('SIVRAM WASH',
                  style: GoogleFonts.dosis(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))),
          Positioned(
              top: height * 0.5,
              left: width * 0.15,
              child: Text('Laundry services at your doorstep',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54))),
          Positioned(
            top: height * 0.8,
            left: width * 0.47,
            child: SpinKitThreeBounce(size: 18, color: Colors.white60),
          )
        ],
      ),
    );
  }
}
