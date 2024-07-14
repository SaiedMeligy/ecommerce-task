import 'package:dio/dio.dart';
import 'package:ecommerce_task/data/dataSource/productDataSource/product_data_Source.dart';
import 'package:ecommerce_task/domain/entities/ProductModel.dart';

class ProductDataSourceImp implements ProductDataSource {
  final Dio dio;
  ProductDataSourceImp(this.dio);
  @override
  Future<Response> getAllProduct(ProductModel productModel) {
    return dio.get(
      "https://dummyjson.com/products",
    );

  }
}
