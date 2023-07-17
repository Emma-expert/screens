import 'package:flutter/material.dart';
import 'package:password_screens/screen1.dart';
import 'package:password_screens/otp_screen.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: '/',
       routes: {
        '/': (context) => FirstScreen(),
        '/otp': (context) => OtpScreen(),
      },
    );
  }
}
