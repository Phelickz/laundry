import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/screens/selectExpress.dart';
import 'package:laundry_app/screens/selectService.dart';
import 'package:laundry_app/state/themeNotifier.dart';
import 'package:laundry_app/utils/theme.dart';
import 'package:provider/provider.dart';

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  var _darkTheme;
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      backgroundColor: _darkTheme ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text('Request a Pick Up', style: GoogleFonts.aBeeZee()),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              // color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        // backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 2,
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectRegular()));
              },
              subtitle: Text(
                'Delivery within 2 days',
                style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400),
              ),
              title: Text(
                'Regular',
                style: GoogleFonts.aBeeZee(
                    fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectExpress()));
              },
              subtitle: Text(
                'Delivery within 24 hours',
                style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400),
              ),
              title: Text(
                'Express',
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
