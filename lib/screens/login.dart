import 'package:flutter/material.dart';
import 'package:laundry_app/screens/forgotPassword.dart';
import '../screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/usersHome.dart';
import 'package:laundry_app/services/snackbarService.dart';
import 'package:provider/provider.dart';
import 'package:laundry_app/state/authState.dart';
import 'package:laundry_app/utils/utilities.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeUsername = FocusNode();
  final FocusNode myFocusNodePhone = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _obscureTextSignup = true;
  // bool _obscureTextSignupConfirm = true;

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();

    super.dispose();
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    SnackBarService.instance.buildContext = context;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.yellow,
            width: width,
            height: height,
            child: CustomPaint(
              painter: CurvePainter3(),
            ),
          ),
          Container(
            color: Color(0xff00cc00),
            width: width,
            height: height,
            child: CustomPaint(
              painter: CurvePainter3(),
            ),
          ),
          Container(
            // color: Colors.white,
            width: width,
            height: height,
            child: CustomPaint(
              painter: CurvePainter4(),
            ),
          ),
          _text(width, height),
          _form(width, height),
          _button(width, height),
          Positioned(
            top: height * 0.22,
            left: width * 0.35,
            child: Icon(
              Icons.local_laundry_service,
              size: 130,
              color: Color(0xff00cc00),
            ),
          ),
          Positioned(
              top: height * 0.8,
              left: width * 0.6,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => ForgotPassword()));
                },
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 16),
                ),
              )),
          Positioned(
              top: height * 0.89,
              left: width * 0.3,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Register()));
                },
                child: Text(
                  'No account? Register',
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 16),
                ),
              ))
        ],
      ),
    );
  }

  Widget _button(double width, double height) {
    return Builder(builder: (BuildContext _context) {
      SnackBarService.instance.buildContext = _context;
      return Positioned(
        top: height * 0.72,
        left: width * 0.3,
        child: Container(
          width: width * 0.4,
          child: FloatingActionButton.extended(
              backgroundColor: Colors.white,
              onPressed: () {
                final form = _formKey.currentState;
                form.save();
                if (form.validate()) {
                  try {
                    Provider.of<AuthenticationState>(context, listen: false)
                        .login(_emailController.text, _passwordController.text)
                        .then((signInUser) => gotoHomeScreen(context));
                  } catch (e) {
                    print(e);
                  }
                }
              },
              label: Text(
                'Sign In',
                style: GoogleFonts.aBeeZee(color: Colors.green),
              )),
        ),
      );
    });
  }

  Widget _text(double width, double height) {
    return Positioned(
      top: height * 0.3,
      left: width * 0.1,
      child: Text(
        'Welcome back!',
        style: GoogleFonts.aBeeZee(
            color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _form(double width, double height) {
    return Positioned(
      top: height * 0.46,
      left: width * 0.068,
      child: Builder(
        builder: (BuildContext context) {
          return Container(
            width: width * 0.89,
            height: height * 0.3,
            // color: Colors.green,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        focusNode: myFocusNodeEmail,
                        validator: EmailValidator.validate,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.greenAccent,
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black38),
                            focusColor: Colors.green,
                            hoverColor: Colors.green),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: TextStyle(color: Colors.black),
                        focusNode: myFocusNodePassword,
                        validator: PasswordValidator.validate,
                        obscureText: _obscureTextSignup,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: _toggleSignup,
                              child: Icon(
                                _obscureTextSignup
                                    ? Icons.remove_red_eye
                                    : Icons.enhanced_encryption,
                                // size: 15.0,
                                color: Colors.green,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.black38),
                            focusColor: Colors.green,
                            hoverColor: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
