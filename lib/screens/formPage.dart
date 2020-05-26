import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/screens/payment.dart';
import 'package:laundry_app/state/themeNotifier.dart';
import 'package:laundry_app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  bool _visible = true;
  String _currentSelectedValue;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _addressController = TextEditingController();

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
                      FloatingActionButton.extended(
                          backgroundColor: Colors.green[800],
                          icon: Icon(Icons.payment),
                          onPressed: () {
                            if(_darkTheme == true){
                              setState(() {
                                _darkTheme == false;
                                onThemeChanged(false, themeNotifier);
                              });
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CheckoutMethodCard()));
                          },
                          label: Text('Checkout'))
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
  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }
}
