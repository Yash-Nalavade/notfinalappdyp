import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhoneVerificationScreen extends StatefulWidget {
  @override
  _PhoneVerificationScreenState createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final _phoneNumberController = TextEditingController();

  Future<void> sendVerificationCode(String phoneNumber) async {
    final accountSid = 'AC9305219a11d6c1789277e26cf8358d12';
    final authToken = '0e2b95bb11eeeee81406b3d69585bfa9';
    final twilioNumber = 'your_twilio_number';
    final twilioApiUrl = 'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json';

    final response = await http.post(
      Uri.parse(twilioApiUrl),
      headers: {
        'Authorization': 'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'To': phoneNumber,
        'From': twilioNumber,
        'Body': 'Your verification code is: 123456', // Replace with a dynamically generated code
      },
    );

    if (response.statusCode == 201) {
      print('SMS sent successfully');
    } else {
      print('Failed to send SMS. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await sendVerificationCode(_phoneNumberController.text);
              },
              child: Text('Send Verification Code'),
            ),
          ],
        ),
      ),
    );
  }
}




/*import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/src/utils/constants.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

/// UI component to create a phone + password signin/ signup form
class SupaPhoneAuth extends StatefulWidget {
  /// Whether the user is sining in or signin up
  final SupaAuthAction authAction;

  /// Method to be called when the auth action is success
  final void Function(AuthResponse response) onSuccess;

  /// Method to be called when the auth action threw an excepction
  final void Function(Object error)? onError;

  const SupaPhoneAuth({
    Key? key,
    required this.authAction,
    required this.onSuccess,
    this.onError,
  }) : super(key: key);

  @override
  State<SupaPhoneAuth> createState() => _SupaPhoneAuthState();
}

class _SupaPhoneAuthState extends State<SupaPhoneAuth> {
  final _formKey = GlobalKey<FormState>();
  final _phone = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSigningIn = widget.authAction == SupaAuthAction.signIn;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              label: Text('Enter your phone number'),
            ),
            controller: _phone,
          ),
          spacer(16),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 6) {
                return 'Please enter a password that is at least 6 characters long';
              }
              return null;
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              label: Text('Enter your password'),
            ),
            obscureText: true,
            controller: _password,
          ),
          spacer(16),
          ElevatedButton(
            child: Text(
              isSigningIn ? 'Sign In' : 'Sign Up',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              try {
                if (isSigningIn) {
                  final response = await supabase.auth.signInWithPassword(
                    phone: _phone.text,
                    password: _password.text,
                  );
                  widget.onSuccess(response);
                } else {
                  final response = await supabase.auth
                      .signUp(phone: _phone.text, password: _password.text);
                  if (!mounted) return;
                  widget.onSuccess(response);
                }
              } on AuthException catch (error) {
                if (widget.onError == null) {
                  context.showErrorSnackBar(error.message);
                } else {
                  widget.onError?.call(error);
                }
              } catch (error) {
                if (widget.onError == null) {
                  context.showErrorSnackBar(
                      'Unexpected error has occurred: $error');
                } else {
                  widget.onError?.call(error);
                }
              }
              setState(() {
                _phone.text = '';
                _password.text = '';
              });
            },
          ),
          spacer(10),
        ],
      ),
    );
  }
}


 */