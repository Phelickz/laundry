import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/screens/payment.dart';
import 'package:laundry_app/services/firestore.dart';
import 'package:laundry_app/services/model.dart';
import 'package:laundry_app/state/authState.dart';
import 'package:laundry_app/state/themeNotifier.dart';
import 'package:laundry_app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart.dart';

enum FormExpressMode { WashandFold, WashandIron, DryCleaning }

class FormExpressPage extends StatefulWidget {
  final FormExpressMode formMode;

  const FormExpressPage({Key key, @required this.formMode}) : super(key: key);

  @override
  _FormExpressPageState createState() => _FormExpressPageState();
}

class _FormExpressPageState extends State<FormExpressPage> {
  int bedsheets;
  int duvet;
  int shirt;
  int trousers;
  int natives;
  String phone;

  TextEditingController _addressController = TextEditingController();
  TextEditingController _shirtController = TextEditingController();
  TextEditingController _bedsheetController = TextEditingController();
  TextEditingController _duvetController = TextEditingController();
  TextEditingController _trouserController = TextEditingController();
  TextEditingController _nativeController = TextEditingController();
  @override
  void initState() {
    docSnapshot();
    doccSnapshot();
    super.initState();
  }

  Future<void> doccSnapshot() async {
    final uid = await Provider.of<AuthenticationState>(context, listen: false)
        .currentUserId();
    var something =
        await Firestore.instance.collection('userData').document(uid).get();
    DocumentSnapshot doc = something;
    setState(() {
      this.phone = doc['phone'];
    });
  }

  Future<void> docSnapshot() async {
    var something = await Firestore.instance
        .collection('prices')
        .document('RbOPMcojfut9poVnUDlB')
        .collection('express')
        .document('Plg2H2JuJ2jV5ToVMr0V')
        .collection(this.widget.formMode == FormExpressMode.DryCleaning
            ? "dryCleaning"
            : this.widget.formMode == FormExpressMode.WashandFold
                ? "washAndFold"
                : "washAndIron")
        .document(this.widget.formMode == FormExpressMode.DryCleaning
            ? "gJxuDPglOlNth4Axk3J5"
            : this.widget.formMode == FormExpressMode.WashandFold
                ? "lmeu3jmcEXKWR36RlFBW"
                : "YWrxqvfv5ULyYzTm0seb")
        .get();
    DocumentSnapshot doc = something;
    setState(() {
      this.natives = doc['native'];
      this.shirt = doc['shirts'];
      this.trousers = doc['trousers'];
      this.bedsheets = doc['bedsheets'];
      this.duvet = doc['duvet'];
      print(this.natives.toString());
      print(this.shirt.toString());
      print(this.trousers.toString());
      print(this.bedsheets.toString());
      print(this.duvet.toString());
    });
  }

  double calculatePrice() {
    int _natives = int.parse(_nativeController.text) ?? 0;
    int _shirts = int.parse(_shirtController.text) ?? 0;
    int _trousers = int.parse(_trouserController.text) ?? 0;
    int _bedsheets = int.parse(_bedsheetController.text) ?? 0;
    int _duvet = int.parse(_bedsheetController.text) ?? 0;

    int price = (this.natives * _natives) +
        (this.shirt * _shirts) +
        (this.trousers * _trousers) +
        (this.bedsheets * _bedsheets) +
        (this.duvet * _duvet);
    double _totalprice = price.toDouble();
    print(_totalprice);
    return _totalprice;
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }
    return 'OrderFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  bool _visible = true;
  String _currentSelectedValue;
  final _formKey = GlobalKey<FormState>();

  var _currencies = [
    "Morning: 7am - 10am",
    "Evening: 3pm - 6pm",
  ];

  var _darkTheme;
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Order Description',
              style: GoogleFonts.aBeeZee(),
            ),
          ),
          body: Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _dropDown(),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(hintText: "PickUp Address"),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _visible = !_visible;
                            if (_visible) {
                              setState(() {
                                _visible = true;
                              });
                            } else {
                              setState(() {
                                _visible = false;
                              });
                            }
                          });
                        },
                        child: Card(
                          child: ListTile(
                            trailing: Icon(Icons.arrow_drop_down),
                            title: Text(
                              'Details',
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      _fields(),
                      SizedBox(height: 25),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FloatingActionButton.extended(
                                heroTag: "btn3",
                                backgroundColor: Colors.green[800],
                                icon: Icon(Icons.add_shopping_cart),
                                onPressed: () {
                                  // if(this.widget._formMode == FormMode.WashandFold){
                                  //calculate price
                                  // }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Cart()));
                                },
                                label: Text('Add to cart')),
                            FloatingActionButton.extended(
                                heroTag: "btn5",
                                backgroundColor: Colors.green[800],
                                icon: Icon(Icons.add_shopping_cart),
                                onPressed: () async {
                                  String documentID = _getReference();
                                  double totalPrice = calculatePrice();
                                  await FirebaseAuth.instance
                                      .currentUser()
                                      .then((user) {
                                    createOrder(
                                        user.uid,
                                        Order(
                                          price: totalPrice,
                                          deliveryType: 'Express',
                                          pickupTime: _currentSelectedValue ??
                                              'Morning',
                                          address: _addressController.text,
                                          serviceType: this.widget.formMode ==
                                                  FormExpressMode.DryCleaning
                                              ? "Dry Cleaning"
                                              : this.widget.formMode ==
                                                      FormExpressMode
                                                          .WashandFold
                                                  ? "Wash and Fold"
                                                  : "Wash and Iron",
                                          bedsheets:
                                              _bedsheetController.text ?? "0",
                                          shirts: _shirtController.text ?? "0",
                                          duvets: _duvetController.text ?? "0",
                                          trousers:
                                              _trouserController.text ?? "0",
                                          natives:
                                              _nativeController.text ?? "0",
                                          phone: this.phone,
                                          username: user.displayName,
                                        ),
                                        'not paid',
                                        documentID);
                                  }).catchError((e) {
                                    print(e);
                                  });

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CheckoutMethodCard()));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Cart()));
                                },
                                label: Text('Add to cart')),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Widget _fields() {
    return Visibility(
      visible: _visible,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Shirts:',
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: _darkTheme ? Colors.black : Colors.grey[300],
                          borderRadius: BorderRadius.circular(5)),
                      width: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: _shirtController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "0", border: InputBorder.none),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Trousers:',
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: _darkTheme ? Colors.black : Colors.grey[300],

                          // color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5)),
                      width: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: _trouserController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "0", border: InputBorder.none),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      'BedSheets:',
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          // color: Colors.grey[300],
                          color: _darkTheme ? Colors.black : Colors.grey[300],
                          borderRadius: BorderRadius.circular(5)),
                      width: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: _bedsheetController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "0", border: InputBorder.none),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Duvet:',
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          // color: Colors.grey[300],
                          color: _darkTheme ? Colors.black : Colors.grey[300],
                          borderRadius: BorderRadius.circular(5)),
                      width: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: _duvetController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "0", border: InputBorder.none),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Native wears:',
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          // color: Colors.grey[300],
                          color: _darkTheme ? Colors.black : Colors.grey[300],
                          borderRadius: BorderRadius.circular(5)),
                      width: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: _nativeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "0", border: InputBorder.none),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropDown() {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
              // labelStyle: textStyle,
              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
              hintText: 'Please select expense',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          isEmpty: _currentSelectedValue == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text('Select Pick Up time'),
              value: _currentSelectedValue,
              isDense: true,
              onChanged: (String newValue) {
                setState(() {
                  _currentSelectedValue = newValue;
                  state.didChange(newValue);
                });
              },
              items: _currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
