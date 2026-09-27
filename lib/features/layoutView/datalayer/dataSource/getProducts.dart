import 'package:dio/dio.dart';
import 'package:ecommerce/features/layoutView/datalayer/Models/ProductModel.dart';
import 'package:ecommerce/features/layoutView/networkService/EndPoints/EndPoints.dart';

import '../../networkService/AppConstants/AppConstants.dart';

class getProducts {
  final dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));

  Future<List<ProductModel>> getAllProducts() async {
    final response = await dio.get(EndPoints.productsEndPoints);

    final products = response.data["products"];

    final productsList = products
        .map((product) => ProductModel.fromJson(product))
        .toList();

    return productsList;
  }

  Future<List<String>> getCategories() async {
    final response = await dio.get(EndPoints.productsEndPoints);

    final products = response.data['products'];

    final Categories = products
        .map<String>((product) => product['category'] as String)
        .toSet()
        .toList();

    print(Categories);

    return Categories;
  }
}
