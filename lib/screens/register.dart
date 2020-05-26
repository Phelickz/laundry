import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:laundry_app/services/snackbarService.dart';
import 'package:provider/provider.dart';
import 'package:laundry_app/state/authState.dart';
import 'package:laundry_app/utils/utilities.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          // overflow: Overflow.clip,
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
                top: height * 0.89,
                left: width * 0.23,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    'Have an account? Login',
                    style:
                        GoogleFonts.aBeeZee(color: Colors.white, fontSize: 16),
                  ),
                ))
          ],
        ));
  }

  Widget _button(double width, double height) {
    return Builder(builder: (BuildContext _context) {
      SnackBarService.instance.buildContext = _context;
      return Positioned(
        top: height * 0.76,
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
                    Provider.of<AuthenticationState>(_context, listen: false)
                        .signup(_emailController.text, _passwordController.text,
                            _usernameController.text, _phoneController.text)
                        .then((signInUser) => gotoHomeScreen(_context));
                    // gotoHomeScreen(context);
                    // print('signed up');
                    // Navigator.push(context,
                    //   MaterialPageRoute(builder: (context) => Feedss()));
                  } catch (e) {
                    print(e);
                  }
                }
              },
              label: Text(
                'Register',
                style: GoogleFonts.aBeeZee(color: Colors.green),
              )),
        ),
      );
    });
  }

  Widget _text(double width, double height) {
    return Positioned(
      top: height * 0.2,
      left: width * 0.03,
      child: Text(
        'Sign up for a Laundry free Life',
        style: GoogleFonts.aBeeZee(
            fontSize: 26, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }

  Widget _form(double width, double height) {
    return Builder(builder: (BuildContext _context) {
      return Positioned(
        top: height * 0.36,
        left: width * 0.068,
        child: Builder(
          builder: (BuildContext context) {
            return Container(
              width: width * 0.89,
              height: height * 0.45,
              // color: Colors.green,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 25),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: _usernameController,
                          keyboardType: TextInputType.text,
                          focusNode: myFocusNodeUsername,
                          validator: UsernameValidator.validate,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.green)),
                              suffixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.greenAccent,
                              ),
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.black45),
                              focusColor: Colors.green,
                              hoverColor: Colors.green),
                        ),
                        SizedBox(height: 10),
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
                              hintStyle: TextStyle(color: Colors.black45),
                              focusColor: Colors.green,
                              hoverColor: Colors.green),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          focusNode: myFocusNodePhone,
                          validator: PhoneValidator.validate,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.green)),
                              suffixIcon: Icon(
                                Icons.phone,
                                color: Colors.greenAccent,
                              ),
                              hintText: "Phone",
                              hintStyle: TextStyle(color: Colors.black45),
                              focusColor: Colors.green,
                              hoverColor: Colors.green),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: _passwordController,
                          focusNode: myFocusNodePassword,
                          obscureText: _obscureTextSignup,
                          validator: PasswordValidator.validate,
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
                              hintStyle: TextStyle(color: Colors.black45),
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
    });
  }
}

class CurvePainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.yellow;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
        size.width / 1.1, size.height / 1.4, size.width, size.height * 0.4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurvePainter4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.69);
    path.quadraticBezierTo(
        size.width / 1.4, size.height / 1.51, size.width, size.height * 0.38);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Email cannot be empty";
    }
    return null;
  }
}

class UsernameValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Username cannot be empty";
    }
    if (value.length < 2) {
      return "Username is too short";
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password cannot be empty";
    }
    return null;
  }
}

class PhoneValidator {
  static String validate(String value) {
    if (value.length < 10) {
      return "Please enter a valid number";
    }
    return null;
  }
}
