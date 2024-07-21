import 'package:chat_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

main() async
{
  WidgetsFlutterBinding.ensureInitialized() ;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      const RunApp()
  );
}


class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Chat App",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
