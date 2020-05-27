import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/screens/formPage.dart';
import 'package:laundry_app/screens/priceList.dart';
import 'package:laundry_app/screens/priceListExpress.dart';

import 'expressFormPage.dart';

enum PriceServiceType { Regular, Express }

class PriceServices extends StatelessWidget {
  final PriceServiceType serviceType;

  const PriceServices({Key key, @required this.serviceType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Available Services',
          style: GoogleFonts.aBeeZee(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 2,
            child: ListTile(
              onTap: () {
                if (this.serviceType == PriceServiceType.Regular) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PriceListRegular(
                                regularState: RegularState.WashandFold,
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PriceListExpress(
                              expressState: ExpressState.WashandFold)));
                }
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
              onTap: () {
                if (this.serviceType == PriceServiceType.Regular) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PriceListRegular(
                                regularState: RegularState.WashandIron,
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PriceListExpress(
                              expressState: ExpressState.WashandIron)));
                }
              },
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
              onTap: () {
                if (this.serviceType == PriceServiceType.Regular) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PriceListRegular(
                                regularState: RegularState.DryCleaning,
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PriceListExpress(
                              expressState: ExpressState.DryCleaning)));
                }
              },
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
