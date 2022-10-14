import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateProductStorageCard extends StatefulWidget {
  const CreateProductStorageCard({super.key});

  @override
  State<CreateProductStorageCard> createState() =>
      _CreateProductStorageCardState();
}

class _CreateProductStorageCardState extends State<CreateProductStorageCard> {
  bool _isStockEnabled = false;

  TextEditingController currentStockController = TextEditingController();
  TextEditingController minimunStockController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isStockEnabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Estoque"),
            Row(
              children: [
                const Text("Gerenciar estoque"),
                Switch(
                    value: _isStockEnabled,
                    onChanged: (newValue) {
                      setState(() {
                        _isStockEnabled = newValue;
                      });
                    }),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: TextFormField(
                controller: currentStockController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite uma quantidade para o estoque';
                  } else if (int.parse(currentStockController.text) <
                      int.parse(minimunStockController.text)) {
                    return "O estoque atual não pode ser menor que o mínimo";
                  } else {
                    return null;
                  }
                },
                enabled: _isStockEnabled,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Estoque atual"),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                controller: minimunStockController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite uma quantidade para o estoque';
                  } else if (int.parse(currentStockController.text) <
                      int.parse(minimunStockController.text)) {
                    return "O estoque mínino não pode ser maior que o atual";
                  } else {
                    return null;
                  }
                },
                enabled: _isStockEnabled,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Estoque mínimo"),
              ),
            )
          ],
        )
      ],
    );
  }
}
