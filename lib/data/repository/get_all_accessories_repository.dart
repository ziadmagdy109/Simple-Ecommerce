import 'package:ecommerce/data/model/accessories.dart';
import 'package:ecommerce/data/service/get_all_accessories_web_service.dart';

class GetAllAccessoriesRepository {
  final GetAllAccessoriesWebService getAllProductWebService;
  GetAllAccessoriesRepository({required this.getAllProductWebService});
  Future<List<Accessories>> getAllProducts() async {
    final allProducts = await getAllProductWebService.getAllProducts();
    return allProducts.map((product) => Accessories.fromJson(product)).toList();
  }
}
