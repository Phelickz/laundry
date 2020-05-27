import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.help,
              ),
              onPressed: () {})
        ],
        title: Text('Your Orders',
            style: GoogleFonts.aBeeZee(
                // color: Colors.black
                )),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        // backgroundColor: Colors.white,
      ),
      body: Stack(
        children: <Widget>[
          _text('Pending Orders', width, height),
          _pendingOrders(width, height),
          _text('Completed Orders', width, height),
          _completedOrders(width, height)
        ],
      ),
    );
  }

  Widget _completedOrders(double width, double height) {
    return Positioned(
      top: height * 0.48,
      child: Container(
        // color: Colors.red,
        width: width,
        height: height * 0.3,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: width / 2,
                child: Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 86.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'ID: #272729',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            'Tap to view details',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: width / 2,
                child: Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 86.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'ID: #272729',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            'Tap to view details',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: width / 2,
                child: Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 86.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'ID: #272729',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            'Tap to view details',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _pendingOrders(double width, double height) {
    return Positioned(
      top: height * 0.08,
      child: Container(
        // color: Colors.red,
        width: width,
        height: height * 0.3,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: width / 2,
                child: Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 86.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'ID: #272729',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            'Tap to view details',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: width / 2,
                child: Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 86.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'ID: #272729',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            'Tap to view details',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: width / 2,
                child: Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 86.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'ID: #272729',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            'Tap to view details',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String message, double width, double height) {
    return Positioned(
        top: message == 'Completed Orders' ? height * 0.42 : height * 0.03,
        left: width * 0.01,
        child: Text(
          message,
          style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.w700),
        ));
  }
}
