import 'package:flutter/material.dart';
import 'package:password_screens/otp_screen.dart';
import 'package:password_screens/verified_screen.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialogAgain(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/verify');
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, '/otp');
            },
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('New ',
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize: 40),),
                Text('Password',
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize: 40),),
              ],
            ),
            SizedBox(height: 10,),
            Text('Enter your New Password',
            style: TextStyle(fontWeight: FontWeight.normal),),
            SizedBox(height: 50,),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              // maxLines: null,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                labelText: 'Enter Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            // Confirm Password TextField
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                labelText: 'Re-Enter Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 180),
            ElevatedButton(
              onPressed: () {
                // Validate and process the new password
                String password = _passwordController.text;
                String confirmPassword = _confirmPasswordController.text;

                if (password == confirmPassword) {
                  // Passwords match
                  _showErrorDialogAgain('Password changed successfully');
                }
                else {
                  // Passwords don't match
                  _showErrorDialog('Passwords do not match');
                }
              },
              child: Text('Completed'),
            ),
          ],
        ),
      ),
    );
  }
}
