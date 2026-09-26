import 'package:dio/dio.dart';
import 'package:ecommerce/features/layoutView/datalayer/Models/ProductModel.dart';
import 'package:ecommerce/features/layoutView/networkService/EndPoints/EndPoints.dart';

class getProducts {
  final dio = Dio();

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

    final Categories = products.map((product) => product['category']).toList();

    return Categories;
  }
}
