import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuska_dashboard/presentation/components/currency_input_formatter.dart';
import 'package:tuska_dashboard/presentation/components/custom_dropdown.dart';
import 'package:tuska_dashboard/presentation/pages/create_product/create_product_storage_card.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductDetailsCard extends StatefulWidget {
  const CreateProductDetailsCard({super.key});

  @override
  State<CreateProductDetailsCard> createState() =>
      _CreateProductDetailsCardState();
}

class _CreateProductDetailsCardState extends State<CreateProductDetailsCard> {
  String dropdownValue = "";
  List<String> list = [];
  String _imagePath = "";

  final _controller = TextEditingController();

  static const double spacerHeight = 32;

  final _formKey = GlobalKey<FormState>();

  // void _validateForm() {}

  void getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imagePath = image!.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Column(children: [
          SizedBox(
            height: 200,
            child: Center(
              child: SizedBox(
                width: 100,
                height: 150,
                child: InkWell(
                    onTap: () => getImage(),
                    child: Row(
                      children: [
                        Visibility(
                          visible: _imagePath != "",
                          child: Image.network(_imagePath),
                        ),
                        Visibility(
                          visible: _imagePath == "",
                          child: const DecoratedBox(
                            decoration: BoxDecoration(color: Colors.grey),
                          ),
                        )
                      ],
                    )),
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
                  decoration: const InputDecoration(
                    labelText: "R\$0.00",
                    border: OutlineInputBorder(),
                  ),
                  controller: _controller,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyInputFormatter(),
                  ],
                ),
                const SizedBox(
                  height: spacerHeight,
                ),
                const CreateProductVariationCard(),
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

class ProductVariant {
  String name;
  Image? image;

  ProductVariant({required this.name});
}

class CreateProductVariationCard extends StatefulWidget {
  const CreateProductVariationCard({super.key});

  @override
  State<CreateProductVariationCard> createState() =>
      _CreateProductVariationCardState();
}

class _CreateProductVariationCardState
    extends State<CreateProductVariationCard> {
  bool isVariantEnabled = false;
  List<ProductVariant> productVariants = [];

  void createVariant() {
    ProductVariant variant = ProductVariant(name: "");
    setState(() {
      productVariants.add(variant);
    });
  }

  void deleteVariant(int index) {
    setState(() {
      productVariants.removeAt(index);
    });
  }

  void getImageFor(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    print(image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Desejar incluir variação de produto?"),
            Switch(
              value: isVariantEnabled,
              onChanged: ((value) {
                setState(() {
                  isVariantEnabled = value;
                });
              }),
            ),
          ],
        ),
        Visibility(
            visible: isVariantEnabled,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => createVariant(),
                  child: const Text("Adicionar nova variante"),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: productVariants.length,
                  itemBuilder: (context, index) {
                    return CreateProductVariantCardRow(
                      image: productVariants[0].image,
                      name: productVariants[0].name,
                      onGetImage: () {
                        getImageFor(index);
                      },
                      onDelete: () {
                        deleteVariant(index);
                      },
                    );
                  },
                )
              ],
            )),
      ],
    );
  }
}

class CreateProductVariantCardRow extends StatelessWidget {
  const CreateProductVariantCardRow(
      {super.key,
      this.image,
      required this.name,
      required this.onGetImage,
      required this.onDelete});

  final Image? image;
  final String name;
  final void Function() onGetImage;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      child: Row(
        children: [
          SizedBox(
            width: 90,
            height: 160,
            child: InkWell(
              onTap: () {
                onGetImage();
              },
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Nome da variante",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          IconButton(
              onPressed: () {
                onDelete();
              },
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
