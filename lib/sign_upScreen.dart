import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hridey/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String id = 'SignupScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String _name;
  late String _email;
  late String _password;

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Sign Up to ACEM'),
            ),
          ),
          body: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Image(
                      image: AssetImage('assets/images/h2r.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all((15.0)),
                    child: TextField(
                      onChanged: (value) {
                        _name = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                        hintText: 'Enter Your Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all((15.0)),
                    child: TextField(
                      onChanged: (value) {
                        _email = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'College Email Id',
                        hintText: 'Email Id',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all((15.0)),
                    child: TextField(
                      obscureText: true,
                      onChanged: (value) {
                        _password = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Your Password',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: const Text('Sign Up'),
                    onPressed: () async {
                      final _user = await _auth.createUserWithEmailAndPassword(
                          email: _email, password: _password);
                      if (_user != null) {
                        await _firestore.collection('user').add({
                          'name': _name,
                          'email': _email,
                          'password': _password
                        });
                        Navigator.pushNamed(context, 'selectCourse');
                        
                      } else {
                        final snackBar = SnackBar(
                          content: const Text('Yay! A SnackBar!'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
