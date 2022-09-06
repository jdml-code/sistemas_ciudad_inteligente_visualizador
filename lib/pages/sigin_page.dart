import 'package:flutter/material.dart';
import '../widgets/sigin_widget.dart';

class SiginPage extends StatelessWidget {
  const SiginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(170, 24, 117, 209),
      body: SiginWidget());
  }
}