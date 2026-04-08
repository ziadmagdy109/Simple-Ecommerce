import 'package:ecommerce/data/model/accessories.dart';
import 'package:ecommerce/data/repository/get_all_accessories_repository.dart';
import 'package:ecommerce/data/service/get_all_accessories_web_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepoProvider = Provider<GetAllAccessoriesRepository>((ref) {
  return GetAllAccessoriesRepository(
    getAllProductWebService: GetAllAccessoriesWebService(),
  );
});

final productProvider = FutureProvider<List<Accessories>>((ref) async {
  final repo = ref.read(productRepoProvider);
  return await repo.getAllProducts();
});
