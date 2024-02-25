// LinkButtonsPage.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Text('Link Buttons'),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: Offset(0.0, -25.0),
              child: Image.asset(
                'images/dypp-removebg-preview.png',
                width: 250.0, // Change the width as needed
                height: 250.0, // Change the height as needed
                fit: BoxFit.contain, // Adjust the BoxFit as needed
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Circular shape
                ),
                fixedSize: Size(200, 20),
              ),
              onPressed: () => launchUrl(
                  'https://drive.google.com/file/d/16Ie_-pTpwG7M7EARsbdLLT1sfY9FSy6g/view?usp=drive_link'),
              child: Text('CAP 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Circular shape
                ),
                fixedSize: Size(200, 20),
              ),
              onPressed: () => launchUrl(
                  'https://drive.google.com/file/d/1-Ja5fo9sE44Us8xNaCH2yO3CY0vnI06Y/view?usp=drive_link'),
              child: Text('CAP 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Circular shape
                ),
                fixedSize: Size(200, 20),
              ),
              onPressed: () => launchUrl(
                  'https://drive.google.com/file/d/1I66Phu8Vv-jv3G0hQBLU1ckO9oQBHw11/view?usp=drive_link'),
              child: Text('CAP 3'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Circular shape
                ),
                fixedSize: Size(200, 20),
              ),
              onPressed: () => launchUrl(
                  'https://drive.google.com/file/d/1I66Phu8Vv-jv3G0hQBLU1ckO9oQBHw11/view?usp=drive_link'),
              child: Text('Other College Cutoff'),
            ),
          ],
        ),
      ),
    );
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
