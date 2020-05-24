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
            icon: Icon(Icons.help, color: Colors.black,), 
            onPressed: (){})
        ],
        title: Text('Your Orders', style: GoogleFonts.aBeeZee(
          color: Colors.black
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,), 
          onPressed: (){
            Navigator.pop(context);
          }),
        backgroundColor: Colors.white,
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

  Widget _completedOrders(double width, double height){
    return Positioned(
      top: height * 0.48,
      child: Container(
        color: Colors.red,
        width: width,
        height: height * 0.3,
      ),
    );
  }

  Widget _pendingOrders(double width, double height){
    return Positioned(
      top: height * 0.08,
      child: Container(
        color: Colors.red,
        width: width,
        height: height * 0.3,
      ),
    );
  }

  Widget _text(String message, double width, double height){
    return Positioned(
      top: message == 'Completed Orders' ? height * 0.42: height * 0.03,
      left: width * 0.01,
      child: Text(message, style: GoogleFonts.aBeeZee(
        fontSize: 20,
        fontWeight: FontWeight.w700
      ),));
  }
}