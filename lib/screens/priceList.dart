import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Price extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Price List', style: GoogleFonts.aBeeZee(
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