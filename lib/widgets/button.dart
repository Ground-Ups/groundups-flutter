import 'package:customerapp/common/utils/extensions.dart';
import 'package:customerapp/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Button extends HookWidget {
  final Function()? onPressed;
  final ButtonType buttonType;
  final ButtonSize buttonSize;
  final ButtonColor buttonColor;
  final bool? isFullWidth;
  final Widget child;

  const Button({
    super.key,
    this.onPressed,
    required this.child,
    required this.buttonType,
    required this.buttonSize,
    required this.buttonColor,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.text) {
      return textButton(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else if (buttonType == ButtonType.elevatedPrimary) {
      return elevatedButtonPrimary(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else if (buttonType == ButtonType.elevatedSecondary) {
      return elevatedButtonSecondary(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else if (buttonType == ButtonType.outline) {
      return outlineButton(
        buttonSize: buttonSize,
        child: child,
        context: context,
        buttonColor: buttonColor,
        onPressed: onPressed,
        isFullWidth: isFullWidth,
      );
    } else {
      return SizedBox(
        width: isFullWidth! ? double.infinity : 108,
        height: 48,
        child: ElevatedButton(
          onPressed: onPressed,
          child: child,
        ),
      );
    }
  }
}

enum ButtonType { text, elevatedPrimary, elevatedSecondary, outline }

enum ButtonSize {
  xl,
  lg,
  md,
  sm,
}

enum ButtonColor {
  info,
  primary,
  warning,
  danger,
  success,
  secondary
}

Widget textButton({
  required ButtonSize buttonSize,
  bool? isFullWidth = true,
  Function()? onPressed,
  required Widget child,
  required BuildContext context,
  required ButtonColor buttonColor,
}) {
  return SizedBox(
    width: isFullWidth! ? double.infinity : getWidth(buttonSize),
    height: getHeight(buttonSize),
    child: TextButton(
      onPressed: onPressed,
      style: context.textButtonTheme.style?.copyWith(
        foregroundColor: getColor(buttonColor: buttonColor),
      ),
      child: child,
    ),
  );
}

Widget elevatedButtonPrimary({
  required ButtonSize buttonSize,
  bool? isFullWidth = true,
  Function()? onPressed,
  required Widget child,
  required BuildContext context,
  required ButtonColor buttonColor,
}) {
  return SizedBox(
    width: isFullWidth! ? double.infinity : getWidth(buttonSize),
    height: getHeight(buttonSize),
    child: TextButton(
      onPressed: onPressed,
      style: context.elevatedButtonTheme.style?.copyWith(
        foregroundColor: onPressed != null
            ? const MaterialStatePropertyAll(Colors.white)
            : const MaterialStatePropertyAll(disableText),
        backgroundColor: onPressed != null
            ? getColor(buttonColor: buttonColor)
            : const MaterialStatePropertyAll(disableBg),
      ),
      child: child,
    ),
  );
}

Widget elevatedButtonSecondary({
  required ButtonSize buttonSize,
  bool? isFullWidth = true,
  Function()? onPressed,
  required Widget child,
  required BuildContext context,
  required ButtonColor buttonColor,
}) {
  return SizedBox(
    width: isFullWidth! ? double.infinity : getWidth(buttonSize),
    height: getHeight(buttonSize),
    child: TextButton(
      onPressed: onPressed,
      style: context.elevatedButtonTheme.style?.copyWith(
        foregroundColor: onPressed != null
            ? getColor(buttonColor: buttonColor)
            : const MaterialStatePropertyAll(disableText),
        backgroundColor: onPressed != null
            ? getColor(
          buttonColor: buttonColor,
          buttonType: ButtonType.elevatedSecondary,
        )
            : const MaterialStatePropertyAll(disableBg),
      ),
      child: child,
    ),
  );
}

Widget outlineButton({
  required ButtonSize buttonSize,
  bool? isFullWidth = true,
  Function()? onPressed,
  required Widget child,
  required BuildContext context,
  required ButtonColor buttonColor,
}) {
  return SizedBox(
    width: isFullWidth! ? double.infinity : getWidth(buttonSize),
    height: getHeight(buttonSize),
    child: TextButton(
      onPressed: onPressed,
      style: context.outlineButtonTheme.style?.copyWith(
        foregroundColor: onPressed != null
            ? getColor(buttonColor: buttonColor)
            : const MaterialStatePropertyAll(disableText),
        side: MaterialStateProperty.resolveWith<BorderSide>((_) {
          return BorderSide(
            color: onPressed != null
                ? getColorOnly(buttonColor: buttonColor)
                : disableBg,
          );
        }),
      ),
      child: child,
    ),
  );
}

double getHeight(ButtonSize buttonSize) {
  if (buttonSize == ButtonSize.xl) {
    return 56;
  } else if (buttonSize == ButtonSize.lg) {
    return 48;
  } else if (buttonSize == ButtonSize.md) {
    return 40;
  } else {
    return 32;
  }
}

double getWidth(ButtonSize buttonSize) {
  if (buttonSize == ButtonSize.xl) {
    return 108;
  } else if (buttonSize == ButtonSize.lg) {
    return 100;
  } else {
    return 82;
  }
}

MaterialStateProperty<Color?> getColor({
  required ButtonColor buttonColor,
  ButtonType? buttonType,
}) {
  if (buttonType != null && buttonType == ButtonType.elevatedSecondary) {
    if (buttonColor == ButtonColor.success) {
      return MaterialStatePropertyAll(success.shade50);
    } else if (buttonColor == ButtonColor.primary) {
      return MaterialStatePropertyAll(primary.shade50);
    } else if (buttonColor == ButtonColor.info) {
      return MaterialStatePropertyAll(info.shade50.withOpacity(.3));
    } else if (buttonColor == ButtonColor.warning) {
      return MaterialStatePropertyAll(warning.shade50);
    }
    else if (buttonColor == ButtonColor.secondary) {
      return MaterialStatePropertyAll(secondary.shade50);
    }
    else {
      return MaterialStatePropertyAll(danger.shade50);
    }
  } else {
    return MaterialStatePropertyAll(getColorOnly(buttonColor: buttonColor));
  }
}

Color getColorOnly({required ButtonColor buttonColor}) {
  if (buttonColor == ButtonColor.success) {
    return success;
  } else if (buttonColor == ButtonColor.primary) {
    return primary;
  } else if (buttonColor == ButtonColor.info) {
    return info;
  } else if (buttonColor == ButtonColor.warning) {
    return warning;
  }
  else if (buttonColor == ButtonColor.secondary) {
    return secondary;
  }
  else {
    return danger;
  }
}
