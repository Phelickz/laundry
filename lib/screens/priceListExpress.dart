import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ExpressState {
  WashandFold,
  WashandIron,
  DryCleaning
}
class PriceListExpress extends StatefulWidget {
  final ExpressState expressState;

  const PriceListExpress({Key key, @required this.expressState}) : super(key: key);
  @override
  _PriceListExpressState createState() => _PriceListExpressState();
}

class _PriceListExpressState extends State<PriceListExpress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.expressState == ExpressState.DryCleaning
              ? 'Dry Cleaning'
              : this.widget.expressState == ExpressState.WashandFold
                  ? "Wash and Fold"
                  : "Wash and Iron",
          style: GoogleFonts.aBeeZee(),
        ),
      ),
    );
  }
}