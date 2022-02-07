import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: FlutterLogo(
              size: 120,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
                child: Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 30),
            )),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: ElevatedButton(
                child: const Text('SignUP'),
                onPressed: () async {
                  //signup screen
                  var email = emailController.text.trim();
                  var pwd = passwordController.text.trim();
                  print(emailController.text);
                  print(passwordController.text);
                  await _signUp(email, pwd);
                },
              )),
        ],
      )),
    );
  }

  _signUp(email, pwd) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pwd);
    } catch (e) {
      print(e);
    }
  }
}
