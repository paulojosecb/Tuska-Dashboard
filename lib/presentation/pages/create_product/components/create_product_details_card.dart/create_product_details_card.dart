import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuska_dashboard/domain/product_categoy.dart';
import 'package:tuska_dashboard/presentation/components/currency_input_formatter.dart';
import 'package:tuska_dashboard/presentation/components/custom_dropdown.dart';
import 'package:tuska_dashboard/presentation/pages/create_product/components/create_product_details_card.dart/create_pruduct_details_card_presenter.dart';
import 'package:tuska_dashboard/presentation/pages/create_product/components/create_product_storage_card.dart';
import 'package:tuska_dashboard/presentation/pages/create_product/components/create_product_variant_card.dart';
import 'package:tuska_dashboard/domain/product_variant.dart';

class CreateProductDetailsCard extends StatefulWidget {
  const CreateProductDetailsCard({super.key});

  @override
  State<CreateProductDetailsCard> createState() =>
      _CreateProductDetailsCardState();
}

class _CreateProductDetailsCardState extends State<CreateProductDetailsCard> {
  final presenter = DefaultCreateProductDetailsCardPresenter();
  String _imagePath = "";

  List<ProductVariant> productVariants = [];
  List<ProductCategory> categories = [];

  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  static const double spacerHeight = 32;

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  void getCategories() {
    presenter.getCategories().then((value) {
      setState(() {
        categories = value;
      });
    });
  }

  void getImage() async {
    String path = await presenter.getImageForProduct();
    setState(() {
      _imagePath = path;
    });
  }

  void createVariant() async {
    List<ProductVariant> productsVariants = await presenter.createVariant();
    setState(() {
      productVariants = productsVariants;
    });
  }

  void deleteVariant(int index) async {
    List<ProductVariant> productsVariants =
        await presenter.deleteVariant(index);

    setState(() {
      productVariants = productsVariants;
    });
  }

  void getImageFor(int index) async {
    List<ProductVariant> productVariants =
        await presenter.getImageForVariantOn(index);
    setState(() {
      productVariants = productVariants;
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
                CreateProductVariationCard(
                  productVariants: productVariants,
                  onCreate: () {
                    createVariant();
                  },
                  onDelete: (index) {
                    deleteVariant(index);
                  },
                  onGetImage: (index) {
                    getImageFor(index);
                  },
                ),
                const SizedBox(
                  height: spacerHeight,
                ),
                CustomDropdown(
                  itens: categories.map((e) => e.name).toList(),
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
