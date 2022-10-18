import 'package:flutter/material.dart';
import 'package:tuska_dashboard/domain/product_variant.dart';

class CreateProductVariationCard extends StatefulWidget {
  CreateProductVariationCard(
      {super.key,
      required this.productVariants,
      required this.onGetImage,
      required this.onDelete,
      required this.onCreate});

  List<ProductVariant> productVariants = [];
  final void Function(int) onGetImage;
  final void Function(int) onDelete;
  final void Function() onCreate;

  @override
  State<CreateProductVariationCard> createState() =>
      _CreateProductVariationCardState();
}

class _CreateProductVariationCardState
    extends State<CreateProductVariationCard> {
  bool isVariantEnabled = false;

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
            Visibility(
              visible: isVariantEnabled,
              child: ElevatedButton(
                onPressed: () => widget.onCreate(),
                child: const Text("Adicionar nova variante"),
              ),
            ),
          ],
        ),
        Visibility(
          visible: isVariantEnabled,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: widget.productVariants.length,
            itemBuilder: (context, index) {
              return CreateProductVariantCardRow(
                image: widget.productVariants[0].image,
                name: widget.productVariants[0].name,
                onGetImage: () {
                  widget.onGetImage(index);
                },
                onDelete: () {
                  widget.onDelete(index);
                },
              );
            },
          ),
        ),
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
