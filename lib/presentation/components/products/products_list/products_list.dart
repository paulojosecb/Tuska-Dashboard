import 'package:tuska_dashboard/presentation/components/products/products_list/products_list_item.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<DataRow> rows = [
      const DataRow(
        cells: [
          DataCell(
            Icon(Icons.star),
          ),
          DataCell(
            ProductListItemImage(),
          ),
          DataCell(
            Text("Nintendo Switch"),
          ),
          DataCell(
            Text("Video game"),
          ),
          DataCell(
            Text("8"),
          ),
          DataCell(
            Text("R\$ 1800"),
          ),
          DataCell(
            Switch(value: true, onChanged: null),
          ),
          DataCell(
            Icon(Icons.delete),
          ),
        ],
      ),
    ];

    const TextStyle headerStyle =
        TextStyle(fontWeight: FontWeight.w600, color: Colors.grey);

    return DataTable(
      columns: const [
        DataColumn(
            label: Text(
          "Favorito",
          style: headerStyle,
        )),
        DataColumn(
            label: Text(
          "Produto",
          style: headerStyle,
        )),
        DataColumn(label: Text("")),
        DataColumn(
            label: Text(
          "Categoria",
          style: headerStyle,
        )),
        DataColumn(
            label: Text(
          "Estoque",
          style: headerStyle,
        )),
        DataColumn(
            label: Text(
          "Preço",
          style: headerStyle,
        )),
        DataColumn(
            label: Text(
          "Catálogo",
          style: headerStyle,
        )),
        DataColumn(label: Text("")),
      ],
      rows: rows,
    );
  }
}
