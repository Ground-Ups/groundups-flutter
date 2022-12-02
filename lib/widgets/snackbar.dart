
import 'package:flutter/material.dart';
import 'package:ground_ups/config/colors.dart';

enum SnackBarType {
  error,
  success,
  danger,
  info,
  warning;
}

void showSnackBar({
  required BuildContext builderContext,
  Function? onPressed,
  required SnackBarType type,
  required String message,
}) {
  late SnackBar snackBar;
  if (type == SnackBarType.warning) {
    snackBar = SnackBar(
      content: Row(
        children: [
           Icon(
            Icons.warning_amber_outlined,
            size: 26,
            color: warning,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style:  TextStyle(fontSize: 14, color: primary),
            ),
          ),
        ],
      ),
      backgroundColor: warning.shade50,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: primary,
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.danger) {
    snackBar = SnackBar(
      content: Row(
        children: [
           Icon(
            Icons.dangerous_outlined,
            size: 26,
            color: danger,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style:  TextStyle(fontSize: 14, color: primary),
            ),
          ),
        ],
      ),
      backgroundColor: danger.shade50,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: primary,
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.success) {
    snackBar = SnackBar(
      content: Row(
        children: [
           Icon(
            Icons.check_circle_outline,
            size: 26,
            color: success,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style:  TextStyle(fontSize: 14, color: primary),
            ),
          ),
        ],
      ),
      backgroundColor: success.shade50,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: primary,
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.error) {
    snackBar = SnackBar(
      content: Row(
        children: [
           Icon(
            Icons.error_outline,
            size: 26,
            color: danger,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style:  TextStyle(fontSize: 14, color: primary),
            ),
          ),
        ],
      ),
      backgroundColor: danger.shade50,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: primary,
        onPressed: () => onPressed,
      ),
    );
  } else if (type == SnackBarType.info) {
    snackBar = SnackBar(
      content: Row(
        children: [
           Icon(
            Icons.info_outline,
            size: 26,
            color: info,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style:  TextStyle(fontSize: 14, color: primary),
            ),
          ),
        ],
      ),
      backgroundColor: info.shade50,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: primary,
        onPressed: () => onPressed,
      ),
    );
  }

  ScaffoldMessenger.of(builderContext)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}
