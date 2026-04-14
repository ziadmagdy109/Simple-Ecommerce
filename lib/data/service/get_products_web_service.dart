import 'package:dio/dio.dart';
import 'package:simple_ecommerce/core/constants/app_strings.dart';

class GetProductsWebService {
  late Dio dio;
  GetProductsWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 60),
      connectTimeout: Duration(seconds: 60),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllProducts() async {
    final allProducts = await dio.get("products");
    return allProducts.data["products"];
  }
}
