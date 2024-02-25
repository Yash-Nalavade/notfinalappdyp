import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubButton extends StatelessWidget {
  final String buttonText;
  final String link;
  final String imagePath;
  final String headerText;

  SubButton({
    required this.buttonText,
    required this.link,
    required this.imagePath,
    required this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20.0), // Adjust the value as needed
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubButtonPage(
              link: link,
              imagePath: imagePath,
              headerText: headerText,
            ),
          ),
        );
      },
      child: Text(buttonText),
    );
  }
}

class SubButtonPage extends StatelessWidget {
  final String link;
  final String imagePath;
  final String headerText;

  SubButtonPage({
    required this.link,
    required this.imagePath,
    required this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(44, 64, 114, 15),
        title: Text(
          headerText,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(20.0), // Adjust the value as needed
                ),
              ),
              onPressed: () {
                launchUrl(link);
              },
              child: Text('Open Link'),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius:
                BorderRadius.circular(20.0), // Adjust the value as needed
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
