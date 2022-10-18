import 'package:flutter/material.dart';
import 'package:tuska_dashboard/domain/product_categoy.dart';
import 'package:tuska_dashboard/domain/product_variant.dart';
import 'package:image_picker/image_picker.dart';

abstract class CreateProductDetailsCardPresenter {
  Future<String> getImageForProduct();
  Future<List<ProductVariant>> createVariant();
  Future<List<ProductVariant>> deleteVariant(int index);
  Future<List<ProductVariant>> getImageForVariantOn(int index);
  Future<List<ProductCategory>> getCategories();
}

class DefaultCreateProductDetailsCardPresenter
    implements CreateProductDetailsCardPresenter {
  List<ProductVariant> productVariants = [];
  List<ProductCategory> categories = [
    ProductCategory(name: "Acessórios", uuid: "1"),
    ProductCategory(name: "Roupas", uuid: "2"),
    ProductCategory(name: "Sapatos", uuid: "3"),
  ];

  String _imagePath = "";

  @override
  Future<List<ProductVariant>> createVariant() async {
    ProductVariant variant = ProductVariant(name: "");
    productVariants.add(variant);
    return productVariants;
  }

  @override
  Future<List<ProductVariant>> deleteVariant(int index) async {
    productVariants.removeAt(index);
    return productVariants;
  }

  @override
  Future<String> getImageForProduct() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    _imagePath = image!.path;
    return _imagePath;
  }

  @override
  Future<List<ProductVariant>> getImageForVariantOn(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    productVariants[index].image = Image.network(image!.path);

    return productVariants;
  }

  @override
  Future<List<ProductCategory>> getCategories() async {
    return categories;
  }
}
