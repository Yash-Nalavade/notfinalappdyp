import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {

  final String mobileNumber;

  VerificationPage({required this.mobileNumber});

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  static const routeName = '/verifyotp';
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Number Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the OTP sent to ${widget.mobileNumber}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter OTP',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to verify OTP here
                if (otpController.text == '123456') {
                  // Replace '123456' with the actual OTP to check against
                  // If OTP is correct, you can navigate to the next page or perform the desired action
                  Navigator.of(context).pop(); // Pop the verification page
                  // Add logic to navigate to the next page or perform other actions
                } else {
                  // Display an error message or take appropriate action for incorrect OTP
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Invalid OTP'),
                      content: Text('Please enter the correct OTP.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
