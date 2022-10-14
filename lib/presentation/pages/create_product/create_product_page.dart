import 'package:flutter/material.dart';
import 'package:tuska_dashboard/presentation/pages/create_product/create_product_details_card.dart';
import 'package:tuska_dashboard/presentation/pages/create_product/create_product_page_header.dart';
import 'package:tuska_dashboard/presentation/pages/create_product/create_product_storage_card.dart';

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
      padding: const EdgeInsets.all(18),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
