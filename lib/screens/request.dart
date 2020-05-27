import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/screens/priceList.dart';
import 'package:laundry_app/screens/priceListExpress.dart';
import 'package:laundry_app/screens/priceServiceType.dart';
import 'package:laundry_app/screens/selectExpress.dart';
import 'package:laundry_app/screens/selectService.dart';
import 'package:laundry_app/state/themeNotifier.dart';
import 'package:laundry_app/utils/theme.dart';
import 'package:provider/provider.dart';

enum PageOption { Price, Request }

class Request extends StatefulWidget {
  final PageOption pageOption;

  const Request({Key key, @required this.pageOption}) : super(key: key);
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
        title: Text(
            this.widget.pageOption == PageOption.Request
                ? 'Request a Pick Up'
                : "Select a service type",
            style: GoogleFonts.aBeeZee()),
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
                if (this.widget.pageOption == PageOption.Request) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectRegular(
                                serviceType: ServiceType.Regular,
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PriceServices(
                                serviceType: PriceServiceType.Regular,
                              )));
                }
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
                if (this.widget.pageOption == PageOption.Request) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectRegular(
                                serviceType: ServiceType.Express,
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PriceServices(
                                serviceType: PriceServiceType.Express,
                              )));
                }
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
