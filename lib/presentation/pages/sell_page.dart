import 'package:flutter/material.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("sell Page"),
      ),
    );
  }
}
