import 'package:flutter/material.dart';

class DoubleBackExitConfirmation extends StatefulWidget {
  final Widget child;
  final bool? needCheck;

  const DoubleBackExitConfirmation({super.key, required this.child, this.needCheck = false});

  @override
  _DoubleBackExitConfirmationState createState() =>
      _DoubleBackExitConfirmationState();
}

class _DoubleBackExitConfirmationState
    extends State<DoubleBackExitConfirmation> {
  int _lastBackPressedTime = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(widget.needCheck == true) {
          return true;
        }
        int currentTime = DateTime.now().millisecondsSinceEpoch;

        if (currentTime - _lastBackPressedTime < 2000) {
          return true;
        } else {
          _lastBackPressedTime = currentTime;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Press back again to exit"),
              duration: Duration(seconds: 2),
            ),
          );
          return false;
        }
      },
      child: widget.child,
    );
  }
}
