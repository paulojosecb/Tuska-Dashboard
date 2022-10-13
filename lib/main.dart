import 'package:flutter/material.dart';
import 'package:tuska_dashboard/presentation/routers/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRouter();
  }
}
