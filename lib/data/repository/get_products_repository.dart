import 'package:simple_ecommerce/data/model/product.dart';
import 'package:simple_ecommerce/data/service/get_products_web_service.dart';

class GetProductsRepository {
  final GetProductsWebService getProductsWebService;
  GetProductsRepository({required this.getProductsWebService});

  Future<List<Product>> getAllProducts() async {
    final allProducts = await getProductsWebService.getAllProducts();
    return allProducts.map((e) => Product.fromJson(e)).toList();
  }
}
