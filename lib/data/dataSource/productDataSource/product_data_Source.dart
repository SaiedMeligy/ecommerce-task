import 'package:dio/dio.dart';
import 'package:ecommerce_task/domain/entities/ProductModel.dart';

abstract class ProductDataSource{
  Future<Response> getAllProduct(ProductModel productModel);
}