import '../../datalayer/Models/ProductModel.dart';
import '../Repository/RepositoryInterface.dart';

class GetAllProductsUsecase {
  RepositoryLayoutInterface _repository;

  GetAllProductsUsecase(this._repository);

  Future<List<ProductModel>> call() async {
    try {
      return _repository.getAllProducts();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
