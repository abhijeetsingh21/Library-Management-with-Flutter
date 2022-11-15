// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late String _name;
  late String _password;

  FirebaseAuth _auth = FirebaseAuth.instance;

  void SignInDetails(value) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 209, 230, 251),
          appBar: AppBar(
            title: const Center(
              child: Text('Sign In to ACEM'),
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
                        labelText: 'User Name/Email id',
                        hintText: 'Enter Your Name',
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
                    child: const Text('Sign In'),
                    onPressed: () async {
                      try {
                        final _user = await _auth.signInWithEmailAndPassword(
                            email: _name, password: _password);
                        if (_user != null) {
                          Navigator.pushNamed(context, 'selectCourse');
                        }
                      } catch (error) {
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('AlertDialog Title'),
                              content: SingleChildScrollView(
                                child: Text(error.toString()),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Approve'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text('or'),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: const Text('Sign Up'),
                    onPressed: () =>
                        Navigator.pushNamed(context, 'SignupScreen'),
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
