import 'package:flutter/material.dart';
import 'documents_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'linkbuttonspage.dart';

class documents extends StatelessWidget {
  static const routeName = '/documents';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admission',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue[900],
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          title: Text(
            'Admission',
            style: TextStyle(color: Colors.white),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(
                12.0, 2.0, 12.0, 120.0), // Adjust padding as needed
            decoration: BoxDecoration(
              color: Colors.lightBlue[900],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'images/dypp-removebg-preview.png',
                    height: 250.0,
                    width: 250.0,
                  ),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LinkButtonsPage(),
                      ),
                    );
                  },
                  child: Text('Cutoff'),
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
                  onPressed: () => launchUrl('https://example.com/othercolleges'),
                  child: Text('Other Colleges'),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DocumentsPage(),
                      ),
                    );
                  },
                  child: Text('Documents for Admission'),
                ),
              ],
            ),
          ),
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







/*import 'package:flutter/material.dart';
import 'documents_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'linkbuttonspage.dart';

class documents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admission',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue[900],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Text(
          'Admission',
          style: TextStyle(color: Colors.white),
        ),

      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(
              12.0, 2.0, 12.0, 120.0), // Adjust padding as needed
          decoration: BoxDecoration(
            color: Colors.lightBlue[900],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'images/dypp-removebg-preview.png',
                  height: 250.0,
                  width: 250.0,
                ),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LinkButtonsPage(),
                    ),
                  );
                },
                child: Text('Cutoff'),
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
                onPressed: () => launchUrl('https://example.com/othercolleges'),
                child: Text('Other Colleges'),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DocumentsPage(),
                    ),
                  );
                },
                child: Text('Documents for Admission'),
              ),
            ],
          ),
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

 */
