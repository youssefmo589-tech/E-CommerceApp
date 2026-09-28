import 'package:ecommerce/features/layoutView/datalayer/Models/ProductModel.dart';

import '../../domain/Repository/RepositoryInterface.dart';
import '../dataSource/getProducts.dart';

class RepositoryImpLayout implements RepositoryLayoutInterface {
  getProducts _getProducts;

  RepositoryImpLayout(this._getProducts);

  @override
  Future<List<ProductModel>> getAllProducts(String category) {
    try {
      return _getProducts.getAllProducts(category);
    } catch (error) {
      print(error);
      throw error;
    }
  }

  @override
  Future<List<String>> getCategories() {
    try {
      return _getProducts.getCategories();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
