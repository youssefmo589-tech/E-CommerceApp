import '../../datalayer/Models/ProductModel.dart';
import '../Repository/RepositoryInterface.dart';

class GetAllProductsUsecase {
  RepositoryLayoutInterface _repository;

  GetAllProductsUsecase(this._repository);

  Future<List<ProductModel>> call(String category) async {
    try {
      return _repository.getAllProducts(category);
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
