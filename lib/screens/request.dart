import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request a Pick Up', style: GoogleFonts.aBeeZee(
          color: Colors.black
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,), 
          onPressed: (){
            Navigator.pop(context);
          }),
        backgroundColor: Colors.white,
      ),
    );
  }
}