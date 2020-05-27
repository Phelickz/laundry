import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:laundry_app/services/snackbarService.dart';
import 'package:laundry_app/state/authState.dart';
import 'package:laundry_app/screens/register.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _error;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SnackBarService.instance.buildContext = context;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 5,
          backgroundColor: Colors.black,
          title: Text(
            'Forgot Password',
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
        ),
        body: Stack(
          children: <Widget>[
            _backgoundImage(width, height),
            _backgoundColor(width, height),
            _form(width, height),
            showAlert(),
            // _backButton(width, height),
          ],
        ));
  }

  Widget _backgoundImage(double width, double height) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/3243087700_74cdbf94ee_k.jpg'),
                fit: BoxFit.cover)));
  }

  Widget _backgoundColor(double width, double height) {
    return Opacity(
      opacity: 0.7,
      child: Container(
        width: width,
        height: height,
        color: Colors.teal,
      ),
    );
  }

  Widget _backButton(double width, double height) {
    return Positioned(
        top: height * 0.09,
        width: width * 0.02,
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
            )));
  }

  Widget _form(double width, double height) {
    return Positioned(
        top: height * 0.3,
        child: Container(
          // color: Colors.red,
          width: width,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Text(
                      'Enter the email address associated with your account',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                )),
                SizedBox(height: 50),
                // Padding(
                //   padding: const EdgeInsets.only(left: 30),
                //   child: Text('Email',
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold
                //     ),),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 10),
                  child: TextFormField(
                    validator: EmailValidator.validate,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter Email Address',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 270),
                  child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.transparent,
                    child: RaisedButton(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        color: Colors.green,
                        onPressed: () {
                          final form = formKey.currentState;
                          form.save();
                          if (form.validate()) {
                            try {
                              _error =
                                  'A reset password link has been sent to ${emailController.text}';
                              setState(() {
                                _error = _error;
                              });
                              Provider.of<AuthenticationState>(context,
                                      listen: false)
                                  .forgotPassword(emailController.text);
                              // Navigator.push(context,
                              // MaterialPageRoute(builder: (context) => ForgotPassword()));
                            } catch (e) {
                              print(e);
                            }
                          }
                          emailController.clear();
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget showAlert() {
    if (_error != null) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.green,
          width: double.infinity,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.error_outline),
              ),
              Expanded(
                  child: Text(
                _error,
                maxLines: 3,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _error = null;
                      });
                    }),
              )
            ],
          ),
        ),
      );
    }
    return Container(
        height: 0,
        width: double.infinity,
        color: Colors.red,
        child: SizedBox(height: 20));
  }
}

// SingleChildScrollView(
//         child: Column(children: <Widget>[
//           showAlert(),
//           SizedBox(height: 10),
//           Container(
//             decoration: BoxDecoration(
//                 // image: DecorationImage(
//                 //     fit: BoxFit.contain,
//                 //     image: AssetImage(
//                 //         "assets/images/shutterstock_remember_password.jpg")),
//                 color: Colors.white),
//             height: 210,
//             width: double.infinity,
//           ),
//           SizedBox(
//             height: 20,
//           ),

//         ]),
//       ),
