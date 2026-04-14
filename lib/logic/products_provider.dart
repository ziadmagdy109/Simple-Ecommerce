import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_ecommerce/data/model/product.dart';
import 'package:simple_ecommerce/data/repository/get_products_repository.dart';
import 'package:simple_ecommerce/data/service/get_products_web_service.dart';

final productsRepoProvider = Provider<GetProductsRepository>(
  (ref) =>
      GetProductsRepository(getProductsWebService: GetProductsWebService()),
);

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final repo = ref.read(productsRepoProvider);
  return await repo.getAllProducts();
});
