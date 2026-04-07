import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/model/accessories.dart';
import 'package:ecommerce/data/repository/get_all_accessories_repository.dart';
import 'package:meta/meta.dart';

part 'accessories_state.dart';

class AccessoriesCubit extends Cubit<AccessoriesState> {
  AccessoriesCubit({required this.getAllProductRepository})
    : super(AccessoriesInitial());

  List<Accessories> allProducts = [];

  final GetAllAccessoriesRepository getAllProductRepository;
  List<Accessories> getAllProducts() {
    getAllProductRepository.getAllProducts().then((allProducts) {
      emit(AccessoriesLoaded(allAccessories: allProducts));
      this.allProducts = allProducts;
    });
    return allProducts;
  }
}
