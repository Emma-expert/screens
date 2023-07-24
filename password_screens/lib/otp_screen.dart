import 'package:flutter/material.dart';
import 'package:password_screens/change_password.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              },
          ),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/mailbox.png',
              width: 206,
              height: 206,
            ),
            SizedBox(height: 40),
            Text(
              'Enter the verification code',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 11),
            Text('Enter the Verification Code sent to your mail',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                child: Pinput(
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  defaultPinTheme: PinTheme(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 85,),
            Text('Resend Code',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.blue,),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/change');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              ),
              child: Text('Verify',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


