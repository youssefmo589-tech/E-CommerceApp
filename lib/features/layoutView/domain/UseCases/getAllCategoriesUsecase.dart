import '../Repository/RepositoryInterface.dart';

class GetAllCategoriesUsecase {
  RepositoryLayoutInterface _repository;

  GetAllCategoriesUsecase(this._repository);

  Future<List<String>> call() async {
    try {
      return _repository.getCategories();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
