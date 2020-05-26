import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/screens/formPage.dart';

class SelectRegular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Services', style: GoogleFonts.aBeeZee(),),
      ),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 2,
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormPage()));
              },
              title: Text(
                'Wash and Fold',
                style: GoogleFonts.aBeeZee(
                    fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => SelectRegular()));
              // },
              title: Text(
                'Wash and Iron',
                style: GoogleFonts.aBeeZee(
                    fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => SelectRegular()));
              // },
              title: Text(
                'Dry Cleaning',
                style: GoogleFonts.aBeeZee(
                    fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}