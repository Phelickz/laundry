import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/services.dart';
import '../screens/request.dart';
import '../screens/priceList.dart';
import '../screens/account.dart';
import '../screens/orderList.dart';
import 'package:provider/provider.dart';
import 'package:laundry_app/state/themeNotifier.dart';
import 'package:laundry_app/utils/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  var _darkTheme;
  String username;

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    await FirebaseAuth.instance.currentUser().then((user) {
      setState(() {
        this.username = user.displayName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: _darkTheme ? Colors.black : Color(0xfffdfcfa),
          // backgroundColor: Colors.green[100],
          body: Stack(
            children: <Widget>[
              _text(width, height),
              _cards(width, height),
              _button(width, height),
              _text1(width, height)
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(double width, double height) {
    return Positioned(
        top: height * 0.019,
        left: width * 0.86,
        child: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Color(0xff00cc00),
            ),
            onPressed: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => Orders()));
            }));
  }

  Widget _cards(double width, double height) {
    return Positioned(
      top: height * 0.25,
      child: Container(
        // color: Colors.white,
        width: width,
        // color: Color(0xfff5f5f5),
        height: height * 0.65,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Services()));
                  },
                  child: Container(
                    height: height * 0.3,
                    width: width * 0.47,
                    child: Card(
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Icons.local_laundry_service,
                            size: 120,
                            color: Color(0xff00cc00),
                          ),
                          Text(
                            'Services',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Request()));
                  },
                  child: Container(
                    height: height * 0.3,
                    width: width * 0.47,
                    child: Card(
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Icons.add_shopping_cart,
                            size: 120,
                            color: Color(0xff00cc00),
                          ),
                          Text(
                            'Request Pickup',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Price()));
                  },
                  child: Container(
                    height: height * 0.3,
                    width: width * 0.47,
                    child: Card(
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Icons.attach_money,
                            size: 120,
                            color: Color(0xff00cc00),
                          ),
                          Text(
                            'Price List',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Profile()));
                  },
                  child: Container(
                    height: height * 0.3,
                    width: width * 0.47,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.account_circle,
                              size: 120,
                              color: Color(0xff00cc00),
                            ),
                            Text(
                              'Account',
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(double width, double height) {
    return Positioned(
        top: height * 0.14,
        left: width * 0.03,
        child: Column(
          children: <Widget>[
            Text(
              'Hello, ${this.username ?? " "}',
              style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  color: _darkTheme ? Colors.white54 : Colors.black54),
            ),
            Text(
              'Lagos, Nigeria',
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: _darkTheme ? Colors.white : Colors.black),
            ),
          ],
        ));
  }

  Widget _text1(double width, double height) {
    return Positioned(
      top: height * 0.03,
      left: width * 0.03,
      child: Text(
        'Sivram Wash',
        style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: _darkTheme ? Colors.white : Colors.black),
      ),
    );
  }
}
