import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            CatalogPageHeader(),
            CatalogPagePersonalization(),
          ],
        ),
      ),
    );
  }
}

class CatalogPageHeader extends StatelessWidget {
  const CatalogPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.share),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Link do catálogo"),
                    Text("Link aqui"),
                  ],
                )
              ],
            ),
            ElevatedButton(
              onPressed: null,
              child: Row(
                children: const [
                  Icon(Icons.open_in_browser),
                  Text("Ver em outra aba"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CatalogPagePersonalization extends StatefulWidget {
  const CatalogPagePersonalization({super.key});

  @override
  State<CatalogPagePersonalization> createState() =>
      _CatalogPagePersonalizationState();
}

class _CatalogPagePersonalizationState
    extends State<CatalogPagePersonalization> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Publicar Catálogo Online ",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black87),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("data"),
                        TextButton(
                          onPressed: null,
                          child: Text(
                            "Editar",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Switch(value: true, onChanged: null),
              ],
            ),
          ),
        )
      ],
    );
  }
}
