import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/services.dart';
import '../screens/request.dart';
import '../screens/priceList.dart';
import '../screens/account.dart';
import '../screens/orderList.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
          child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            _text(width, height),
            _cards(width, height),
            _button(width, height)
          ],
        ),
      ),
    );
  }

  Widget _button(double width, double height) {
    return Positioned(
        top: height * 0.06,
        left: width * 0.83,
        child: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 40,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => Orders()));
            }));
  }

  Widget _cards(double width, double height) {
    return Positioned(
      top: height * 0.3,
      child: Container(
        // color: Colors.white,
        width: width,
        color: Color(0xffffffff),
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
                    width: width * 0.4,
                    child: Card(
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Icons.local_laundry_service,
                            size: 120,
                            color: Colors.green,
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
                    width: width * 0.4,
                    child: Card(
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Icons.add_shopping_cart,
                            size: 120,
                            color: Colors.green,
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
                    width: width * 0.4,
                    child: Card(
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Icons.attach_money,
                            size: 120,
                            color: Colors.green,
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
                    width: width * 0.4,
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
                              color: Colors.green,
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
      top: height * 0.17,
      left: width * 0.1,
      child: Text(
        'Hello, Phelickz',
        style: GoogleFonts.aBeeZee(fontSize: 25),
      ),
    );
  }
}
