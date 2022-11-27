import 'package:flutter/material.dart';

class JoruriBottomSheet {
  final BuildContext context;
  final Widget child;
  double? height;
  final Future<void> Function()? whenComplete;

  JoruriBottomSheet({required this.context, required this.child,this.height,this.whenComplete}) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: height !=null ? MediaQuery.of(context).size.height * height! :MediaQuery.of(context).size.height * .70,
          child: Column(
            children: [
              Icon(
                Icons.remove,
                color: Colors.grey[600],
              ),
              child
            ],
          ),
        );
      },
    ).whenComplete(whenComplete ??(){});
  }
}
