import 'package:flutter/material.dart';
import 'sub_buttons_page.dart';

class DocumentsPage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Text(
          'Documents',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        titleSpacing: 10.0,
        centerTitle: true,
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 120.0),
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
              RoundedButton(
                buttonText: '  Domicile Certificate  ',
                link:
                'https://services.india.gov.in/service/detail/maharashtra-age-nationality-and-domicile-certificate',
                imagePath: 'lib/assets/domecile.png',
                headerText: 'Domicile Certificate Header',
              ),
              SizedBox(height: 20),
              RoundedButton(
                buttonText: 'Nationality Certificate',
                link:
                'https://revenue.delhi.gov.in/revenue/nationality-certificate',
                imagePath: 'lib/assets/nationality.png',
                headerText: 'Nationality Certificate Header',
              ),
              SizedBox(height: 20),
              RoundedButton(
                buttonText: '   Income Certificate   ',
                link: 'https://revenue.delhi.gov.in/revenue/income-certificate',
                imagePath: 'lib/assets/domecile.png',
                headerText: 'Income Certificate Header',
              ),
              SizedBox(height: 20),
              RoundedButton(
                buttonText: '      SSC Certificate      ',
                link:
                'https://www.boardmarksheet.maharashtra.gov.in/emarksheet/',
                imagePath: 'lib/assets/marksheet.png',
                headerText: 'New Certificate Header',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String buttonText;
  final String link;
  final String imagePath;
  final String headerText;

  const RoundedButton({
    required this.buttonText,
    required this.link,
    required this.imagePath,
    required this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(300.0),
      ),
      child: SubButton(
        buttonText: buttonText,
        link: link,
        imagePath: imagePath,
        headerText: headerText,
      ),
    );
  }
}
