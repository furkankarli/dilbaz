import 'package:flutter/material.dart';

class NotePad extends StatefulWidget {
  const NotePad({super.key});

  @override
  State<NotePad> createState() => _NotePadState();
}

class _NotePadState extends State<NotePad> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('NotePad'),
      ),
    );
  }
}
