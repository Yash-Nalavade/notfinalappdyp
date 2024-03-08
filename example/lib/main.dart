import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import './home.dart';
import './sign_in.dart';
import 'phone_sign_in.dart';
import 'phone_sign_up.dart';
final Session? session = Supabase.instance.client.auth.currentSession;

var a = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://qbhwoedrlzamxvtbzlgx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFiaHdvZWRybHphbXh2dGJ6bGd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg4OTYyMDEsImV4cCI6MjAwNDQ3MjIwMX0.KOS3e0xj2aAfE-XsBT5pLjHjWJcWHjOBDSxjBM-6WqE',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DYP Polytechnic',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: FutureBuilder<bool>(
        future: checkUserSignInStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final initialRoute = snapshot.data == true ? '/home' : '/signin';

            return MaterialApp(
              initialRoute: initialRoute,
              routes: {
                '/signin': (context) => SignUp(),
                '/home': (context) => const Home(),
                '/phone_sign_in': (context) => const PhoneSignIn(),
                '/phone_sign_up': (context) => const PhoneSignUp(),
              },
              onUnknownRoute: (RouteSettings settings) {
                return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (BuildContext context) =>
                      Scaffold(
                        body: Center(
                          child: Text(
                            'Not Found',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                );
              },
            );
          } else {
            // Show a loading indicator while checking authentication status
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<bool> checkUserSignInStatus() async {
    // Replace this with your Supabase authentication status check logic
    // Return true if the user is signed in, false otherwise
    if (session == null) {
      return false;
    } else {
      // signed in
      return true;
    }
  }
}


/*
import 'package:example/placement.dart';
import 'package:example/student.dart';
import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import './home.dart';
import './sign_in.dart';
import './magic_link.dart';
import './update_password.dart';
import 'civil.dart';
import 'college.dart';
import 'contactpage.dart';
import 'cse.dart';
import 'mech.dart';
import 'impdates.dart';
import 'linkbuttonspage.dart';
import 'sub_buttons_page.dart';
import 'documents.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// TODO: replace with your credentials
  await Supabase.initialize(
    url: 'https://qbhwoedrlzamxvtbzlgx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFiaHdvZWRybHphbXh2dGJ6bGd4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg4OTYyMDEsImV4cCI6MjAwNDQ3MjIwMX0.KOS3e0xj2aAfE-XsBT5pLjHjWJcWHjOBDSxjBM-6WqE',
     );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DYP Polytechnic',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),







      initialRoute: '/',
      routes: {
       '/': (context) => const SignUp(),
        //   '/': (context) => const Home(),


        //'/magic_link': (context) => const MagicLink(),
        //'/update_password': (context) => const UpdatePassword(),


        '/home': (context) => const Home(),
        '/contact': (context) => contactpage(),
        '/student': (context) => student(),
        '/cse': (context) => cse(),
        '/mech': (context) => mech(),
        '/civil': (context) => civil(),
        '/college': (context) => college(),
        '/signin': (context) => SignUp(),
        '/placement': (context) => placement(),
        '/impdates': (context) => importantDates(),



        //'/userdetails': (context) => UserDetailsPage(),

      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const Scaffold(
            body: Center(
              child: Text(
                'Not Found',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

 */


