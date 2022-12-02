
import 'package:flutter/material.dart';
import 'package:ground_ups/config/colors.dart';

class AppBarBottom extends StatelessWidget {
  final Widget child;
  const AppBarBottom({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(0.0, 60.0),
      child: GestureDetector(
        onTap: () {
          /*Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SearchModal()));*/
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          padding: const EdgeInsets.only(left: 16),
          decoration: const BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: child,
        ),
      ),
    );
  }
}
