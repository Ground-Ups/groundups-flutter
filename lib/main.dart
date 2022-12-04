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
          child: SingleChildScrollView(child: Column(
                children: [
                GUImage('assets/images/1.jpg',height: 200, fit: BoxFit.fitHeight,),
                GUImage('assets/images/Group (9).png',height: 200, fit: BoxFit.fitHeight,),
                GUImage('assets/images/docker-svgrepo-com.svg',height: 200, fit: BoxFit.fitHeight,),
                GUImage('https://raw.githubusercontent.com/shafi-org/portfolio/master/src/assets/google-material-design.svg',height: 200, fit: BoxFit.fitHeight,),
                GUImage('<svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M13.6465 0.291595V3.32032H16.675L13.6465 0.291595Z" fill="#FB3640"/> <path d="M13.1484 4.31641C12.8734 4.31641 12.6504 4.09341 12.6504 3.81836V0H5.51172C4.68785 0 4.01758 0.670272 4.01758 1.49414V7.06194C4.18167 7.04706 4.34772 7.03906 4.51562 7.03906C6.21323 7.03906 7.73291 7.81522 8.7386 9.03125H14.1445C14.4196 9.03125 14.6426 9.25424 14.6426 9.5293C14.6426 9.80435 14.4196 10.0273 14.1445 10.0273H9.39476C9.70607 10.6348 9.90682 11.3078 9.97126 12.0195H14.1445C14.4196 12.0195 14.6426 12.2425 14.6426 12.5176C14.6426 12.7926 14.4196 13.0156 14.1445 13.0156H9.97126C9.82231 14.6605 8.94349 16.0977 7.66189 17H15.4727C16.2965 17 16.9668 16.3297 16.9668 15.5059V4.31641H13.1484ZM14.1445 7.03906H6.83984C6.56479 7.03906 6.3418 6.81607 6.3418 6.54102C6.3418 6.26596 6.56479 6.04297 6.83984 6.04297H14.1445C14.4196 6.04297 14.6426 6.26596 14.6426 6.54102C14.6426 6.81607 14.4196 7.03906 14.1445 7.03906Z" fill="#FB3640"/> <path d="M4.51562 8.03516C2.04402 8.03516 0.0332031 10.046 0.0332031 12.5176C0.0332031 14.9892 2.04402 17 4.51562 17C6.98723 17 8.99805 14.9892 8.99805 12.5176C8.99805 10.046 6.98723 8.03516 4.51562 8.03516ZM5.84375 13.0156H4.51562C4.24057 13.0156 4.01758 12.7926 4.01758 12.5176V10.5254C4.01758 10.2503 4.24057 10.0273 4.51562 10.0273C4.79068 10.0273 5.01367 10.2503 5.01367 10.5254V12.0195H5.84375C6.1188 12.0195 6.3418 12.2425 6.3418 12.5176C6.3418 12.7926 6.1188 13.0156 5.84375 13.0156Z" fill="red"/> </svg>',height: 200,),
              ],
            ),)
        ),
      ),
    );
  }
}
