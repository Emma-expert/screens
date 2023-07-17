import 'package:flutter/material.dart';
import 'package:password_screens/otp_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/illustration.png',
              height: 200,
              width: 200,),
            SizedBox(height: 40,),
            Text('Forgot Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 10,),
            Text('Enter your email address below, a 6 digit code will be sent to your mail',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,),
            ),
            SizedBox(height: 15,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 85,),
            Text('Reset with SMS',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.blue,),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/otp',);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              ),
              child: Text('Send Code',
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

