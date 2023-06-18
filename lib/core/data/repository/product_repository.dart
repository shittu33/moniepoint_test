import 'dart:developer';

import 'package:moniepoint_test/core/data/datasource/product_datasource.dart';
import 'package:moniepoint_test/core/data/dto/product_response.dart';

class ProductRepository {
  final LocalProductDataSource localDataSource;
  final ApiProductDataSource apiDataSource;

  ProductRepository({
    required this.localDataSource,
    required this.apiDataSource,
  });

  Future<ProductResponse?> getProducts() async {
    try {
      final apiProducts = await apiDataSource.getProducts();
      var localProducts = await localDataSource.getProducts();
      return apiProducts.products.isEmpty ? localProducts : apiProducts;
    } catch (e) {
      log(e.toString());
    }
  }
}
