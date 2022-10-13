import 'package:tuska_dashboard/presentation/components/products/products_list/products_list_item.dart';

abstract class ProductListPresenter {
  Future<List<ProductsListItemViewModel>> fetchProducts();
  Future<bool> toggleProductWith(String sku);
  Future<bool> deleteProductWith(String sku);
}

class DefaultProductListPresenter implements ProductListPresenter {
  @override
  Future<List<ProductsListItemViewModel>> fetchProducts() async {
    return [
      ProductsListItemViewModel(
          uuid: "1",
          sku: "SKU1",
          name: "Nintendo Swictch",
          category: "Video Game",
          quantity: 8,
          price: 1500.00,
          isSelected: true),
      ProductsListItemViewModel(
          uuid: "2",
          sku: "SKU2",
          name: "Playstation 5",
          category: "Video Game",
          quantity: 3,
          price: 4500.00,
          isSelected: true)
    ];
  }

  @override
  Future<bool> deleteProductWith(String sku) async {
    return true;
  }

  @override
  Future<bool> toggleProductWith(String sku) async {
    return true;
  }
}
