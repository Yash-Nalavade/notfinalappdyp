//import 'dart:js';



import 'package:example/impdates.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'contactpage.dart';
import 'student.dart';
import 'cse.dart';
import 'mech.dart';
import 'civil.dart';
import 'college.dart';
import 'placement.dart';
import 'impdates.dart';
import 'documents.dart';
import 'verifyotp.dart';
import 'phone_sign_in.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
      routes: Dashboard.routes,
    );
  }
}

class Dashboard extends StatelessWidget {
  var height, width;
  static final routes = {
    '/contact': (context) => contactpage(),
    '/student': (context) => student(),
    '/cse': (context) => cse(),
    '/mech': (context) => mech(),
    '/civil': (context) => civil(),
    '/college': (context) => college(),
    '/placement': (context) => placement(),
    '/impdates': (context) => importantDates(),
    '/documents': (context) => documents(),
    '/phone_sign_in': (context) => PhoneSignIn(),

  };
  List imgData = [
    "images/notices.png",
    "images/admission.png",
    "images/student.png",
    "images/placement.png",
    "images/college.png",
    "images/contact.png",
  ];

  List titles = [
    "IMPORTANT DATES",
    "ADMISSION",
    "FEES & SCHOLARSHIPS",
    "PLACEMENT",
    "CAMPUS LIFE",
    "CONTACT",
  ];
  final String settingsUrl = "https://www.google.com";

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.lightBlue[900],
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * 0.26,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/dyppb.png',
                    height: 200,
                    width: 280,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                width: width,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 25,
                  ),
                  itemCount: imgData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (titles[index] == "CONTACT") {
                          Navigator.pushNamed(context, '/contact');
                        } else if (titles[index] == "FEES & SCHOLARSHIPS") {
                          Navigator.pushNamed(context, '/student');
                        } else if (titles[index] == "CAMPUS LIFE") {
                          Navigator.pushNamed(context, '/college');
                        }
                        else if (titles[index] == "PLACEMENT") {
                          Navigator.pushNamed(context, '/placement');
                        }
                        else if (titles[index] == "IMPORTANT DATES") {
                          Navigator.pushNamed(context, '/impdates');
                        }
                        else if (titles[index] == "ADMISSION") {
                          Navigator.pushNamed(context, '/documents');
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(8), // Adjust margin here
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              imgData[index],
                              width: 100,
                              height: 100, // Adjust image height
                            ),
                            Text(
                              titles[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,


                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*


void main() {
  runApp(Home());
}



import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'contactpage.dart';
import 'student.dart';
import 'cse.dart';
import 'mech.dart';
import 'civil.dart';
import 'college.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
      routes: Dashboard.routes,
    );
  }
}

class Dashboard extends StatelessWidget {
  var height, width;
  static final routes = {

    '/contact': (context) => contactpage(),
    '/student': (context) => student(),
    '/cse': (context) => cse(),
    '/mech': (context) => mech(),
    '/civil': (context) => civil(),
    '/college': (context) => college(),
  };
  List imgData = [
    "images/notices.png",
    "images/admission.png",
    "images/student.png",
    "images/placement.png",
    "images/college.png",
    "images/contact.png",
  ];

  List titles = [
    "NOTICES",
    "ADMISSION",
    "STUDENT",
    "PLACEMENT",
    "COLLEGE",
    "CONTACT",
  ];
  final String settingsUrl = "https://www.google.com";

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(

    /*  appBar: AppBar(
        title: Text("DYP POLYTECHNIC"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    image: const DecorationImage(
                      image: AssetImage("images/dyplogo.jpg"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("images/dyplogo.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Navigate to the home page
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                _launchURL(settingsUrl);
                // Navigate to the settings page
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Supabase.instance.client.auth.signOut();
                Navigator.of(context).pushReplacementNamed('/');
                // Log out the user
              },
            ),
          ],
        ),
      ),
      */

      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlue[900],
          width: width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(),
                height: height * 0.23,
                width: width,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 35,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Image.asset(
                            'images/dyppb.png',
                            height: 100, width: 280,
                          ),

                        /*  Text(
                            "DYP Polytechnic",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ), */
                          SizedBox(height: 10),
                          Text(
                            "Dashboard",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white54,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  width: width,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 25,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: imgData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (titles[index] == "CONTACT") {
                            Navigator.pushNamed(context, '/contact');
                          } else if (titles[index] == "STUDENT") {
                            Navigator.pushNamed(context, '/student');
                          } else if (titles[index] == "COLLEGE") {
                            Navigator.pushNamed(context, '/college');
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                imgData[index],
                                width: 100,
                              ),
                              Text(
                                titles[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 */
