import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class importantDates extends StatelessWidget {
  static const routeName = '/impdates';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Important Dates'),
      ),
      body: Container(
        color: Colors.lightBlue[900], // Set background color
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Marquee(
                text: 'IMPORTANT DATES | IMPORTANT DATES | IMPORTANT DATES | IMPORTANT DATES',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 50.0,
                pauseAfterRound: Duration(seconds: 1),
                startPadding: 40.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cardData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards per row
                ),
                itemBuilder: (context, index) {
                  final card = cardData[index];
                  return Card(
                    color: Colors.white, // Set card background color
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                card['title'] ?? '',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                card['date'] ?? '',
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.calendar_today, size: 80, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Replace this with your actual card data
List<Map<String, String?>> cardData = [
  {'title': 'Application Starts', 'date': '2024-03-25'},
  {'title': 'Deadline', 'date': '2024-05-11'},
  {'title': 'CAP ROUND 1', 'date': '2024-06-01'},
  {'title': 'CAP ROUND 2', 'date': '2024-06-15'},
  {'title': 'CAP ROUND 3', 'date': '2024-06-01'},
  {'title': 'Merit List', 'date': '2024-06-15'},
  // Add more cards here...
];


/*import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class importantDates extends StatelessWidget {
  static const routeName = '/impdates';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Important Dates'),
      ),
      body: Container(
        color: Colors.lightBlue[900], // Set background color
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Marquee(
                text: 'IMPORTANT DATES | IMPORTANT DATES | IMPORTANT DATES | IMPORTANT DATES',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 50.0,
                pauseAfterRound: Duration(seconds: 1),
                startPadding: 40.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cardData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards per row
                ),
                itemBuilder: (context, index) {
                  final card = cardData[index];
                  return Card(
                    color: Colors.white, // Set card background color
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            card['title'] ?? '',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            card['date'] ?? '',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Replace this with your actual card data
List<Map<String, String?>> cardData = [
  {'title': 'Application Starts', 'date': '2024-03-25'},
  {'title': 'Deadline', 'date': '2024-05-11'},
  {'title': 'CAP ROUND 1', 'date': '2024-06-01'},
  {'title': 'CAP ROUND 2', 'date': '2024-06-15'},
  {'title': 'CAP ROUND 3', 'date': '2024-06-01'},
  {'title': 'Merit List', 'date': '2024-06-15'},
  // Add more cards here...
];

 */