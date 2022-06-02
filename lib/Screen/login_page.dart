import 'package:code_d/Screen/frogetpassword.dart';
import 'package:code_d/Screen/home_screen.dart';
import 'package:code_d/Screen/signup_page.dart';
import 'package:code_d/Screen/widget/curve_clipper.dart';
import 'package:code_d/Screen/widget/error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          // ignore: sized_box_for_whitespace
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                ClipPath(
                  clipper: CurveClipper(),
                  child: Image(
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.infinity,
                    // ignore: prefer_const_constructors
                    image: AssetImage("assets/login.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 49.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.account_box,
                        size: 30.0,
                      ),
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 30.0,
                      ),
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      // ignore: unnecessary_null_comparison
                      if (user != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                // ignore: prefer_const_constructors
                                builder: (context) => HomeScreen()));
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      String error = e.toString();
                      String error1 = ExceptionManagement.loginExceptions(
                          context: context, error: error);
                      FlutterToastr.show(error1, context,
                          duration: FlutterToastr.lengthShort,
                          position: FlutterToastr.bottom);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60.0),
                    alignment: Alignment.center,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 5.0),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (context) => ForgetPassword(),
                      ),
                    ),
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.deepOrange,

                        // color: Theme.of(context).primaryColor,
                        height: 50.0,
                        child: const Text(
                          'Don\'t have account? Sign up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
