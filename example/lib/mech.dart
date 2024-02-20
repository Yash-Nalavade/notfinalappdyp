
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class mech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanical Engineering'),
      ),
      body: Container(
        color: Colors.lightBlue[900], // Change background color here
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Display the image
                Positioned(
                  top: 50,
                  left: 30,
                  right: 20,
                  child: Image.asset(
                    'images/dyppb.png',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                // Display the buttons
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 500,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // Button color
                        onPrimary: Colors.blue, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(20.0), // Rounded edges
                        ),
                        fixedSize: Size(200, 20),
                      ),
                      onPressed: () {
                        launch('https://www.youtube.com/');
                      },
                      child: Text('   First Year   '),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fixedSize: Size(200, 20),
                      ),
                      onPressed: () {
                        launch('https://www.youtube.com/');
                      },
                      child: Text('Second Year'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fixedSize: Size(200, 20),
                      ),
                      onPressed: () {
                        launch('https://www.youtube.com/');
                      },
                      child: Text('  Third Year  '),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class mech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanical Engineering'),
      ),
      body: Center(
        child: Container(
          clipBehavior: Clip.none,
          color: const Color.fromRGBO(44, 64, 114, 15),
          width: 300,
          height: 500,
          alignment: Alignment.center,
          child: Stack(
            children: [
              // Display the image
              Positioned(
                top: 55,
                left: 0,
                right: 0,
                child: Image.asset('images/dypp-removebg-preview.png',
                    fit: BoxFit.fill),
              ),
              // Display the buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      launch('https://www.youtube.com/');
                    },
                    child: Text('   First Year   '),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      launch('https://www.youtube.com/');
                    },
                    child: Text('Second Year'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      launch('https://www.youtube.com/');
                    },
                    child: Text('  Third Year  '),
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

 */


