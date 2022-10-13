import 'package:flutter/material.dart';

class ProductsListItem extends StatelessWidget {
  const ProductsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        IconButton(
          onPressed: null,
          icon: Icon(Icons.star),
        ),
        ProductListItemImage(),
        Text("Nintendo switch"),
        Text("Video games"),
        Text("8"),
        Text("R\$ 1500,00"),
        Switch(value: true, onChanged: null),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.delete),
        )
      ],
    );
  }
}

class ProductListItemImage extends StatelessWidget {
  const ProductListItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
