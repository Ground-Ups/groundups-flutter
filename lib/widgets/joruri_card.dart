
import 'package:flutter/material.dart';
import 'package:ground_ups/config/colors.dart';

enum JoruriCardType { mart, food, medicine, store }

class JoruriCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final JoruriCardType joruriCardType;
  final Function()? onTap;
  final Color? borderColor;

  const JoruriCard({
    super.key,
    this.width,
    this.height,
    required this.joruriCardType,
    this.borderColor,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          /*BoxShadow(
            color: _color(joruriCardType).withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 100,
            offset: const Offset(0, .1), // changes position of shadow
          ),*/
        ],
      ),
      child: Stack(
        children: [
          Card(
            elevation: 0,
            margin: EdgeInsets.zero,

            shape: RoundedRectangleBorder(
              side: BorderSide(color: _color(joruriCardType)),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: SizedBox(
              width: width ?? double.infinity,
              height: height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: child,
              ),
            ),
          ),
          if (onTap != null)
            Positioned.fill(
              child: Material(

                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  onTap: _onTap,
                ),
              ),
            )
        ],
      ),
    );
  }

  Future<void> _onTap() async {
    await Future.delayed(const Duration(milliseconds: 160));
    if(onTap != null){
      onTap!();
    }

  }

  Color _color(JoruriCardType type) {
    if (type == JoruriCardType.food) {
      return success.withOpacity(.15);
    }
    if (type == JoruriCardType.medicine) {
      return info.withOpacity(.15);
    }
    if (type == JoruriCardType.mart) {
      return secondary.withOpacity(.15);
    } else {
      return primary.withOpacity(.15);
    }
  }
}
