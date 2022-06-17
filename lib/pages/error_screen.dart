import 'package:flutter/cupertino.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "SOMETHING WENT WRONG!!!",
        style: TextStyle(
          color: Color(0xFF5dccd5),
          fontSize: 15.0,
        ),
      ),
    );
  }
}
