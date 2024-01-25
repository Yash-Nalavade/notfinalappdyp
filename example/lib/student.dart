import 'package:flutter/material.dart';
import 'cse.dart';
import 'mech.dart';
import 'civil.dart';
import 'home.dart';

class student extends StatelessWidget {
  static const routeName = '/student';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Notes',
      home: StudentPage(),
    );
  }
}
class StudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Notes', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.lightBlue[900],
            width: 650,
            height: 1000,
          ),
          Center(
            child: Container(
              color: Colors.lightBlue[900],
              width: 300,
              height: 500,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 40,
                    child: Image.asset('images/dypp-removebg-preview.png'),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          child: SizedBox(
                            height: 40,
                            width: 750,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => cse()),
                                );
                              },
                              child: Text('COMPUTER SCIENCE & ENGINEERING'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          child: SizedBox(
                            height: 40,
                            width: 750,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => mech()),
                                );
                              },
                              child: Text('MECHANICAL ENGINEERING'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          child: SizedBox(
                            height: 40,
                            width: 750,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => civil()),
                                );
                              },
                              child: Text('CIVIL ENGINEERING'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
