import 'package:flutter/material.dart';

class ProductsListItemViewModel {
  String uuid;
  String sku;
  String name;
  String category;
  int quantity;
  double price;
  bool isSelected;

  ProductsListItemViewModel(
      {required this.uuid,
      required this.sku,
      required this.name,
      required this.category,
      required this.quantity,
      required this.price,
      required this.isSelected});
}

class ProductsListItem extends StatelessWidget {
  const ProductsListItem(
      {super.key, required this.viewModel, this.onToggle, this.onDelete});

  final ProductsListItemViewModel viewModel;
  final Function? onToggle;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.star),
        ),
        const ProductListItemImage(),
        Text(viewModel.name),
        Text(viewModel.category),
        Text("${viewModel.quantity}"),
        Text("R\$ ${viewModel.price}"),
        Switch(
            value: viewModel.isSelected, onChanged: ((value) => onToggle!())),
        IconButton(
          onPressed: (() => onDelete!()),
          icon: const Icon(Icons.delete),
        )
      ],
    );
  }

  DataRow makeDataRowWith() {
    return DataRow(
      cells: [
        const DataCell(
          Icon(Icons.star),
        ),
        const DataCell(
          ProductListItemImage(),
        ),
        DataCell(
          Text(viewModel.name),
        ),
        DataCell(
          Text(viewModel.category),
        ),
        DataCell(
          Text("${viewModel.quantity}"),
        ),
        DataCell(
          Text("R\$ ${viewModel.price}"),
        ),
        DataCell(
          Switch(
              value: viewModel.isSelected,
              onChanged: ((value) {
                onToggle!();
              })),
        ),
        DataCell(
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: (() {
              onDelete!();
            }),
          ),
        ),
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
