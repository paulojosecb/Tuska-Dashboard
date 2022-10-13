import 'package:tuska_dashboard/presentation/components/products/products_list/products_list.dart';
import 'package:tuska_dashboard/presentation/components/products/search_bar.dart';
import 'package:tuska_dashboard/presentation/navigator_page.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchBar(
              onTap: () => widget.navigatorKey.currentState
                  ?.pushNamed(Routes.createProduct),
            ),
            const SizedBox(
              height: 16,
            ),
            const ProductsList(),
          ],
        ),
      ),
    );
  }
}
