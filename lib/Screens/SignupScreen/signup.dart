import 'package:alecado/Screens/HomeScreen/home_screen.dart';
import 'package:alecado/Screens/LoginScreen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
              "SignUp",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 30),
            )),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
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
                child: const Text('SignUp'),
                onPressed: () async {
                  //signup screen
                  var email = emailController.text.trim();
                  var pwd = passwordController.text.trim();
                  print(emailController.text);
                  print(passwordController.text);
                  //_processing();
                  await _signUp(email, pwd);
                },
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            const Text('Already have an account?'),
            TextButton(
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                //signup screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const LoginScreen()));
              },
            )
          ])
        ],
      )),
    );
  }

  _signUp(email, pwd) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pwd);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (ctx) => const HomeScreen()),
          (route) => false);
      //await _login(email, pwd);
    } catch (e) {
      var prob = "$e".split("] ")[1];
      Fluttertoast.showToast(msg: "$prob");
      //Fluttertoast.showToast(msg: "$e");
      print(e);
    }
  }

  _processing() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
