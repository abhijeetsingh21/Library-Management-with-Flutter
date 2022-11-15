import 'package:flutter/material.dart';
import 'package:hridey/course_screen/bba.dart';
import 'package:hridey/course_screen/bca.dart';
import 'package:hridey/course_screen/civil.dart';
import 'package:hridey/course_screen/cse_screen.dart';
import 'package:hridey/course_screen/ece.dart';
import 'package:hridey/course_screen/mechanical.dart';

class SelectCourse extends StatelessWidget {
  static const String id = 'selectCourse';
  const SelectCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFCADCED),
        appBar: AppBar(
          title: const Text('Select Course'),
          backgroundColor: Colors.black38,
        ),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child:
                            Image(image: AssetImage('assets/images/h2r.jpg'))),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, CseScreen.id),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.purple,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'CSE',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, MechanicalScreen.id),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.purple,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'Mechanical',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, EceScreen.id),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.purple,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'ECE',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, CivilScreen.id),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.purple,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'Civil',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, BbaScreen.id),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.purple,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'BBA',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, BcaScreen.id),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.purple,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'BCA',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
