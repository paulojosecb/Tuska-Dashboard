import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const CreateProductPageHeader(),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                flex: 1,
                child: CreateProductDetailsCard(),
              ),
              Expanded(
                flex: 1,
                child: CreateProductStorageCard(),
              )
            ],
          )
        ],
      ),
    );
  }
}

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
                      return 'Please enter some text';
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
                      return 'Please enter some text';
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
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: spacerHeight,
                ),
                Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Código do Produto",
                          border: OutlineInputBorder(),
                        ),
                        // The validator receives the text that the user has entered.
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text("Gerar"),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: spacerHeight,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Custo",
                    border: OutlineInputBorder(),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: spacerHeight,
                ),
                const ElevatedButton(
                  onPressed: null,
                  child: Text("Criar"),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class CreateProductStorageCard extends StatelessWidget {
  const CreateProductStorageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Estoque"),
                Row(
                  children: const [
                    Text("Gerenciar estoque"),
                    Switch(value: true, onChanged: null),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Estoque atual"),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Estoque mínimo"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.itens,
    required this.onChanged,
    required this.onSaved,
    this.hint,
  });

  final List<String> itens;
  final Function onChanged;
  final Function onSaved;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: const InputDecoration(
        //Add isDense true and zero Padding.
        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(),
        //Add more decoration as you want here
        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
      ),
      isExpanded: true,
      hint: Text(
        hint ?? "",
        style: const TextStyle(fontSize: 14),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      iconSize: 30,
      buttonHeight: 60,
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      items: itens
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      onChanged: (value) {
        onChanged();
      },
      onSaved: (value) {
        onSaved();
      },
    );
  }
}
