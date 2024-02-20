import 'package:flutter/material.dart';

class placement extends StatelessWidget {
  static const routeName = '/placement';

  const placement({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> placements = [
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=19yAp3hRit1ifZysdqM-wt0Cbn1d3YdXQ', // Replace with actual photo URL
        'description': '1',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1nqFmgnIWrFi4GEBIfP2ycZ6n4sRaEQw9', // Replace with actual photo URL
        'description': '2',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1bYKNgJfbONmlOWhsp5twOX8nI_v5KGMd', // Replace with actual photo URL
        'description': '3',
      },
// Add more colleges as needed

      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=15vAVlvIV3h83XprM_GB3u1d35I92Fu0n', // Replace with actual photo URL
        'description': '4',
      },

      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1e6ZzNBTqqhCgvFjohOltRSYywDSkNlgE', // Replace with actual photo URL
        'description': '5',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1XOnh76W8XzzdsL5fe8sKhY8y8it1-ARd', // Replace with actual photo URL
        'description': '6',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1sYfwErhoRhAgCd4ozKrtBbj5T32tY9Hf', // Replace with actual photo URL
        'description': '7',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1DKPMK16T0aQH1SuCiawTDnn55yu8pRig', // Replace with actual photo URL
        'description': '8',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1gtXi8McjBrobX5UDNXvfu8_gKlb2M8Tr', // Replace with actual photo URL
        'description': '9',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1aDNyfSgxt7iAxMTUaWizzkdr_c_iWMnO', // Replace with actual photo URL
        'description': '10',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1Ae7xLRQc6T37J62Fo3kvvcwg-AIiQaYX', // Replace with actual photo URL
        'description': '11',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1aLyYMT7vg45RKeKNL46B9KOlbpNrdPQh', // Replace with actual photo URL
        'description': '12',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=19MR08CK20jBQGrNVn3L3q_upPx4NP4Tg', // Replace with actual photo URL
        'description': '13',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1VAp8m2JO4fwsDgaW7aGtbriDmv70l0-0', // Replace with actual photo URL
        'description': '14',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1g7Cgyj6JO6hnBMVccpF1lHuc7VbL5Wew', // Replace with actual photo URL
        'description': '15',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1SnEkIzZUTazpcNa2JEOugRA79vdj-LTs', // Replace with actual photo URL
        'description': '16',
      },
      {
        'photoUrl': 'https://drive.google.com/uc?export=view&id=1vsszWsSSWoO9MXHwHdzixe_Rk7fpHNJP', // Replace with actual photo URL
        'description': '17',
      },

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Placement'),
    backgroundColor: Colors.lightBlue[700],

      ),
      body: ListView.builder(

        itemCount: placements.length,
        itemBuilder: (context, index) {
          return Card(
            //color: Colors.lightBlue[900],

            child: Column(
              children: [
                Image.network(
                  placements[index]['photoUrl']!,
                  height: 200, // Adjust the height as needed
                  width: double.infinity,
                  fit: BoxFit.contain,

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    placements[index]['description']!,
                    style: TextStyle(fontSize: 16, color: Colors.white),

                  ),
                ),
              ],
            ),
          );
        },
      ),
    );


  }
}

void _navigateToImageDetail(BuildContext context, String imageUrl) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ImageDetailScreen(imageUrl: imageUrl),
    ),
  );
}


class ImageDetailScreen extends StatelessWidget {
  final String imageUrl;

  const ImageDetailScreen({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Detail'),
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          // Customize the image size and properties as needed
        ),
      ),
    );
  }
}