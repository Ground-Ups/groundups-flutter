import 'package:flutter/material.dart';

import 'package:ground_ups/config/theme.dart';
import 'package:ground_ups/widgets/image/image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.lightTheme,
      home:  const Test(),
    );
  }
}
class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              GUImage('assets/images/1.jpg',height: 200, fit: BoxFit.fitHeight,),
              GUImage('assets/images/docker-svgrepo-com.svg',height: 200, fit: BoxFit.fitHeight,),
              GUImage('assets/images/docker-svgrepo-com.svg',height: 200, fit: BoxFit.fitHeight,),
            ],
          ),
        ),
      ),
    );
  }
}
