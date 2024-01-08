// asundarpichai@gmail.com
import 'package:example/phone_sign_up.dart';
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
import 'phone_sign_in.dart';
import './verify_phone.dart';

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
        '/magic_link': (context) => const MagicLink(),
        '/update_password': (context) => const UpdatePassword(),
        '/phone_sign_in': (context) => const PhoneSignIn(),
        '/phone_sign_up': (context) => const PhoneSignUp(),
        '/verify_phone': (context) => const VerifyPhone(),
        '/home': (context) => const Home(),
        '/contact': (context) => contactpage(),
        '/student': (context) => student(),
        '/cse': (context) => cse(),
        '/mech': (context) => mech(),
        '/civil': (context) => civil(),
        '/college': (context) => college(),
        '/signin': (context) => SignUp(),



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
