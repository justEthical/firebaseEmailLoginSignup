import 'package:alecado/Screens/SignupScreen/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                child: const Text('Login'),
                onPressed: () async {
                  //signup screen
                  print(emailController.text);
                  print(passwordController.text);
                  await _login();
                },
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            const Text('Does not have account?'),
            TextButton(
              child: const Text(
                'SignUp',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                //signup screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const SignUp()));
              },
            )
          ])
        ],
      )),
    );
  }

  _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } catch (e) {
      print(e);
    }
  }
}
