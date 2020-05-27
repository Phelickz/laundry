import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:http/http.dart' as http;
import 'package:laundry_app/screens/orderList.dart';
import 'package:laundry_app/state/themeNotifier.dart';
import 'package:laundry_app/utils/button.dart';
import 'package:laundry_app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}



class CheckoutMethodCard extends StatefulWidget {
  @override
  _CheckoutMethodCardState createState() => _CheckoutMethodCardState();
}

// Pay public key
class _CheckoutMethodCardState extends State<CheckoutMethodCard> {
  bool _stateChanged;
  @override
  void initState() {
    PaystackPlugin.initialize(publicKey: publicKey);
    super.initState();
  }

  Future<void> _checkPreferences() async {
    var _prefs = await SharedPreferences.getInstance();
    bool stateChanged = _prefs.getBool('changed') ?? false;
    setState(() {
      this._stateChanged = stateChanged;
    });
  }

  Dialog successDialog(context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 350.0,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_box,
                color: hexToColor("#41aa5e"),
                size: 90,
              ),
              SizedBox(height: 15),
              Text(
                'Payment has successfully',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'been made',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Your payment has been successfully",
                style: TextStyle(fontSize: 13),
              ),
              Text("processed.", style: TextStyle(fontSize: 13)),
              SizedBox(height: 15),
              FloatingActionButton.extended(
                icon: Icon(Icons.close),
                heroTag: "btn2",
                onPressed: () async {
                 await _checkPreferences();
                  if (_stateChanged == true) {
                    setState(() {
                      _darkTheme = true;
                      onThemeChanged(true, themeNotifier, false);
                    });
                  }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Orders()));
                },
                label: Text('Close'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: successDialog(context));
      },
    );
  }

  Dialog errorDialog(context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)), //this right here
      child: Container(
        height: 350.0,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.cancel,
                color: Colors.red,
                size: 90,
              ),
              SizedBox(height: 15),
              Text(
                'Failed to process payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Error in processing payment, please try again",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(height: 15),
              FloatingActionButton.extended(
                heroTag: "btn1",
                icon: Icon(Icons.close),
                onPressed: () async {
                  await _checkPreferences();
                  if (_stateChanged == true) {
                    setState(() {
                      _darkTheme = true;
                      onThemeChanged(true, themeNotifier, false);
                    });
                  }
                  Navigator.pop(context);
                },
                label: Text('Close'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog() {
    // flutter defined function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: errorDialog(context));
      },
    );
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }
    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  chargeCard() async {
    Charge charge = Charge()
      ..amount = 10000
      // ..reference = _getReference()

      ..email = 'customer@email.com';
    String accesscode =
        await _fetchAccessCodeFromServer(secretKey, _getReference());
    charge.accessCode = accesscode;
    CheckoutResponse response = await PaystackPlugin.checkout(
      context,
      method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
      charge: charge,
    );
    if (response.status == true) {
      _verifyOnServer(response.reference);
    } else {
      _showErrorDialog();
    }
  }

  Future<String> _fetchAccessCodeFromServer(
      String skTest, String _getReference) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $skTest'
    };
    Map data = {
      "amount": 100,
      "email": "felixhope30@gmail.com",
      "reference": _getReference
    };
    String payload = json.encode(data);
    http.Response response = await http.post(
        'https://api.paystack.co/transaction/initialize',
        headers: headers,
        body: payload);
    final Map dataa = json.decode(response.body);
    String accessCode = dataa['data']['access_code'];
    return accessCode;
  }

  void _verifyOnServer(String reference) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $secretKey'
      };
      http.Response response = await http.get(
          'https://api.paystack.co/transaction/verify/' + reference,
          headers: headers);
      final Map body = json.decode(response.body);

      if (body['data']['status'] == 'success') {
        _showDialog();
      } else {
        _showErrorDialog();
      }
    } catch (e) {
      print(e);
    }
  }

  var _darkTheme;
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pop up method",
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Button(
              child: Text(
                "Charge",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onClick: () {
                if (_darkTheme == true) {
                  setState(() {
                    _darkTheme = false;
                    onThemeChanged(false, themeNotifier, true);
                  });
                }
                chargeCard();
              },
            ),
          )),
    );
  }

  void onThemeChanged(bool value, ThemeNotifier themeNotifier, bool val) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
    prefs.setBool('changed', val);
  }
}
