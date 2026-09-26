import '../../datalayer/Models/ProductModel.dart';

abstract class RepositoryInterface {
  Future<List<String>> getCategories();

  Future<List<ProductModel>> getAllProducts();
}
