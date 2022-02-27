import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  final size;
  MyBarrier({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 42, 116, 44), width: 10.0),
          color: Colors.green,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
