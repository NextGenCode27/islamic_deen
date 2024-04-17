import 'package:flutter/material.dart';

class ScaffoldBackGround extends StatelessWidget {
  const ScaffoldBackGround({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        image: const DecorationImage(
          image: AssetImage('assets/images/background1.png'),
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      child: child,
    );
  }
}
