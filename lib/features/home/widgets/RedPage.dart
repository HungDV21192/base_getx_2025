import 'package:base_getx_2025/widgets/custom_screen.dart';
import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  const RedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red.withOpacity(0.2),
    );
  }
}
