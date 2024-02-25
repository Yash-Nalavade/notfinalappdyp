import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class contactpage extends StatelessWidget {
  static const routeName = '/contact';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor:Colors.lightBlue[900] ,
        title: Text('Contact', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Card(
              color: Colors.blue[50],
              child: ListTile(
                leading: Icon(Icons.phone_outlined, color: Colors.blue),
                title: Text('Phone', style: TextStyle(color: Colors.blue)),
                subtitle: Text('+02312601436', style: TextStyle(color: Colors.black)),
                onTap: () => launch('tel:+02312601436'),
              ),
            ),
            Card(
              color: Colors.blue[50],
              child: ListTile(
                leading: Icon(Icons.email_outlined, color: Colors.blue),
                title: Text('Email', style: TextStyle(color: Colors.blue)),
                subtitle: Text('dyp.poly16@gmail.com', style: TextStyle(color: Colors.black)),
                onTap: () => launch('mailto:dyp.poly16@gmail.com'),
              ),
            ),
            Card(
              color: Colors.blue[50],
              child: ListTile(
                leading: Icon(Icons.location_on_outlined, color: Colors.blue),
                title: Text('Address', style: TextStyle(color: Colors.blue)),
                subtitle: Text('D. Y. Patil Polytechnic Kasaba Bawada Kolhapur, Maharashtra 416113',
                    style: TextStyle(color: Colors.black)),
                onTap: () => launch('https://www.google.com/maps/search/?api=1&query=D. Y. Patil Polytechnic Kasaba Bawada Kolhapur, Maharashtra 416113'),
              ),
            ),
            Card(
              color: Colors.blue[50],
              child: ListTile(
                leading: Icon(Icons.camera_alt_outlined, color: Colors.blue),
                title: Text('Instagram', style: TextStyle(color: Colors.blue)),
                subtitle: Text('@dyppkop', style: TextStyle(color: Colors.black)),
                onTap: () => launch('https://www.instagram.com/dyppkop'),
              ),
            ),
            Card(
              color: Colors.blue[50],
              child: ListTile(
                leading: Icon(Icons.facebook_outlined, color: Colors.blue),
                title: Text('Facebook', style: TextStyle(color: Colors.blue)),
                subtitle: Text('dyppkol', style: TextStyle(color: Colors.black)),
                onTap: () => launch('https://www.facebook.com/dyppkol'),
              ),
            ),

            Card(
              color: Colors.blue[50],
              child: ListTile(
                leading:Icon(Icons.announcement_outlined, color: Colors.blue),
                title: Text('Click for Admission Enquiry', style: TextStyle(color: Colors.blue)),
                subtitle: Text('Fill Form', style: TextStyle(color: Colors.black)),
                onTap: () => launch('https://forms.gle/BcR838AvAJJaTr7x8'),
              ),
            ),
            //SizedBox(height: 0.0),
            Image.asset('images/dyppb.png', height: 290,
                width: 200,
                fit: BoxFit.fitWidth),
      ],
        ),
      ),
    );
  }
}




/*
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class contactpage extends StatelessWidget {
  static const routeName = '/contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
            subtitle: Text('+02312601436'),
            onTap: () => launch('tel:+02312601436'),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('dyp.poly16@gmail.com'),
            onTap: () => launch('mailto:dyp.poly16@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Address'),
            subtitle: Text('D. Y. Patil Polytechnic Kasaba Bawada Kolhapur, Maharashtra 416113'),
            onTap: () => launch('https://www.google.com/maps/search/?api=1&query=D. Y. Patil Polytechnic Kasaba Bawada Kolhapur, Maharashtra 416113'),
          ),
          // Added ListTile for Instagram and Facebook page
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Instagram'),
            subtitle: Text('@dyppkop'),
            onTap: () => launch('https://www.instagram.com/dyppkop'), // Replace with your Instagram username
          ),
          ListTile(
            leading: Icon(Icons.facebook),
            title: Text('Facebook'),
            subtitle: Text('dyppkol'),
            onTap: () => launch('https://www.facebook.com/dyppkol'), // Replace with your Facebook page name
          ),
        ],
      ),
    );
  }
} */
