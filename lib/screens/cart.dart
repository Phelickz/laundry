import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/screens/payment.dart';
import 'package:laundry_app/state/themeNotifier.dart';
import 'package:laundry_app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var _darkTheme;
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: GoogleFonts.aBeeZee(),
        ),
      ),
      body: Stack(
        children: <Widget>[_button()],
      ),
    );
  }

  Widget _button() {
    return Builder(
      builder: (BuildContext _context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FloatingActionButton.extended(
                backgroundColor: Colors.green[800],
                icon: Icon(Icons.payment),
                onPressed: () {
                  // if(this.widget._formMode == FormMode.WashandFold){

                  // }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckoutMethodCard()));
                },
                label: Text('Proceed to Pay')),
          ),
        );
      },
    );
  }
}
