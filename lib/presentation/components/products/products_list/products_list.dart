import 'package:tuska_dashboard/presentation/components/products/products_list/product_list_presenter.dart';
import 'package:tuska_dashboard/presentation/components/products/products_list/products_list_item.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  late Future<List<ProductsListItemViewModel>> itens;

  final ProductListPresenter presenter = DefaultProductListPresenter();

  @override
  void initState() {
    super.initState();
    itens = presenter.fetchProducts();
  }

  void onToggle(String sku) {
    presenter.toggleProductWith(sku);
  }

  void onDelete(String sku) {
    presenter.deleteProductWith(sku);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductsListItemViewModel>>(
        future: itens,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return makeDataTable(snapshot.data!);
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(child: Text("Você ainda não criou um produto"));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        });
  }

  DataTable makeDataTable(List<ProductsListItemViewModel> data) {
    List<DataRow> rows = data
        .map((e) => ProductsListItem(
              viewModel: e,
              onDelete: () => onToggle(e.uuid),
              onToggle: () => onDelete(e.uuid),
            ).makeDataRowWith())
        .toList();

    return DataTable(columns: makeDataColumns(), rows: rows);
  }

  List<DataColumn> makeDataColumns() {
    const TextStyle headerStyle =
        TextStyle(fontWeight: FontWeight.w600, color: Colors.grey);

    return const [
      DataColumn(
        label: Text(
          "Favorito",
          style: headerStyle,
        ),
      ),
      DataColumn(
        label: Text(
          "Produto",
          style: headerStyle,
        ),
      ),
      DataColumn(
        label: Text(
          "",
          style: headerStyle,
        ),
      ),
      DataColumn(
        label: Text(
          "",
          style: headerStyle,
        ),
      ),
      DataColumn(
        label: Text(
          "Estoque",
          style: headerStyle,
        ),
      ),
      DataColumn(
        label: Text(
          "Preço",
          style: headerStyle,
        ),
      ),
      DataColumn(
        label: Text(
          "Catálogo",
          style: headerStyle,
        ),
      ),
      DataColumn(
        label: Text(
          "Deletar",
          style: headerStyle,
        ),
      ),
    ];
  }
}
