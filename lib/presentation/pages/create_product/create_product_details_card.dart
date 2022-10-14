import 'package:flutter/material.dart';
import 'package:tuska_dashboard/presentation/components/custom_dropdown.dart';
import 'package:tuska_dashboard/presentation/pages/create_product/create_product_storage_card.dart';

class CreateProductDetailsCard extends StatefulWidget {
  const CreateProductDetailsCard({super.key});

  @override
  State<CreateProductDetailsCard> createState() =>
      _CreateProductDetailsCardState();
}

class _CreateProductDetailsCardState extends State<CreateProductDetailsCard> {
  String dropdownValue = "";
  List<String> list = [];

  static const double spacerHeight = 32;

  final _formKey = GlobalKey<FormState>();

  // void _validateForm() {}

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Column(children: [
          const SizedBox(
            height: 200,
            child: Center(
              child: SizedBox(
                width: 100,
                height: 150,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nome do Produto",
                    border: OutlineInputBorder(),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor digite um nome para o produto';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: spacerHeight,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Preço de Venda",
                    border: OutlineInputBorder(),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite o preço de venda';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: spacerHeight,
                ),
                CustomDropdown(
                  itens: const [],
                  onChanged: () {},
                  onSaved: () {},
                  hint: "Categoria(s)",
                ),
                const SizedBox(
                  height: spacerHeight,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: "Descrição",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: spacerHeight,
                ),
                const SizedBox(
                  height: spacerHeight,
                ),
                const CreateProductStorageCard(),
                const SizedBox(
                  height: spacerHeight,
                ),
                ElevatedButton(
                  onPressed: (() {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  }),
                  child: const Text("Criar"),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
