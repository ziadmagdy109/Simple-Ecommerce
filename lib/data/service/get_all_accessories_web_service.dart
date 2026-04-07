import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/strings.dart';

class GetAllAccessoriesWebService {
  late Dio dio;
  GetAllAccessoriesWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllProducts() async {
    Response response = await dio.get("products");
    return response.data["products"];
  }
}
