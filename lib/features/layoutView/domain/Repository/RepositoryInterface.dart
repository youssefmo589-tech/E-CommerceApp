import '../../datalayer/Models/ProductModel.dart';

abstract class RepositoryLayoutInterface {
  Future<List<String>> getCategories();

  Future<List<ProductModel>> getAllProducts(String category);
}
