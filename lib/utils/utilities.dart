
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:laundry_app/state/authState.dart';
import 'package:laundry_app/screens/usersHome.dart';
import 'package:laundry_app/screens/login.dart';



void gotoHomeScreen(BuildContext context) {
    
  //  print(user['kUID']);
  Future.microtask((){
    // var user = Provider.of<AuthenticationState>(context, listen: false).exposeUser();
    if (Provider.of<AuthenticationState>(context, listen: false).authStatus ==
      kAuthSuccess){
        // var user = Provider.of<AuthenticationState>(context, listen: false).exposeUser();
        Navigator.push(context, 
              MaterialPageRoute(builder: (context) => UserHome()));
      }
  });
}


void gotoLoginScreen(BuildContext context) {
  Future.microtask((){
    if (Provider.of<AuthenticationState>(context, listen: false).authStatus ==
      null){
        Navigator.push(context, 
              MaterialPageRoute(builder: (context) => Login()));
      }
  });
}


// gotoProfileScreen(BuildContext context) async {
//   await Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
// }