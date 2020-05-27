import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/screens/formPage.dart';

import 'expressFormPage.dart';


enum ServiceType{
  Regular,
  Express
}

class SelectRegular extends StatelessWidget {
  final ServiceType serviceType;

  const SelectRegular({Key key, @required this.serviceType}) : super(key: key);

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
                if(this.serviceType == ServiceType.Regular){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormPage(FormRegularMode.WashandFold)));
                }else {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormExpressPage(formMode: FormExpressMode.WashandFold)));
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
              onTap:() {
                if(this.serviceType == ServiceType.Regular){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormPage(FormRegularMode.WashandIron)));
                }else {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormExpressPage(formMode: FormExpressMode.WashandIron)));
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
              onTap: (){
                if(this.serviceType == ServiceType.Regular){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormPage(FormRegularMode.DryCleaning)));
                }else {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormExpressPage(formMode: FormExpressMode.DryCleaning)));
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