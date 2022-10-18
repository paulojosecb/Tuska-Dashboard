import 'package:flutter/material.dart';

class CreateProductPageHeader extends StatelessWidget {
  const CreateProductPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Row(
                children: const [
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.star),
                  ),
                  Text("Destacar produto"),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: const [
                  Switch(value: true, onChanged: null),
                  Text("Exibir no Catálogo online"),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: const [
                  IconButton(onPressed: null, icon: Icon(Icons.copy)),
                  Text("Duplicar"),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              const IconButton(onPressed: null, icon: Icon(Icons.delete))
            ],
          )
        ]),
      ),
    );
  }
}
