import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Configurações Page"),
      ),
    );
  }
}

class SettingsGeneralInformation extends StatefulWidget {
  const SettingsGeneralInformation({super.key});

  @override
  State<SettingsGeneralInformation> createState() =>
      _SettingsGeneralInformationState();
}

class _SettingsGeneralInformationState
    extends State<SettingsGeneralInformation> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Identificação"),
            Form(
              child: Column(
                children: [
                  TextFormField(
                      decoration: const InputDecoration(
                    labelText: "Nome do loja",
                    border: OutlineInputBorder(),
                  )),
                  TextFormField(
                      decoration: const InputDecoration(
                    labelText: "Sobre do loja",
                    border: OutlineInputBorder(),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
