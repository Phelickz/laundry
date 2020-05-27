import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum RegularState { WashandFold, WashandIron, DryCleaning }

class PriceListRegular extends StatefulWidget {
  final RegularState regularState;

  const PriceListRegular({Key key, @required this.regularState})
      : super(key: key);
  @override
  _PriceListRegularState createState() => _PriceListRegularState();
}

class _PriceListRegularState extends State<PriceListRegular> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.regularState == RegularState.DryCleaning
              ? 'Dry Cleaning'
              : this.widget.regularState == RegularState.WashandFold
                  ? "Wash and Fold"
                  : "Wash and Iron",
          style: GoogleFonts.aBeeZee(),
        ),
      ),
    );
  }
}
