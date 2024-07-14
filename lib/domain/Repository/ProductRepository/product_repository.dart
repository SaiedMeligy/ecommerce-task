import 'package:dio/dio.dart';
import 'package:ecommerce_task/domain/entities/ProductModel.dart';

abstract class ProductRepository{
  Future<Response> getAllProduct(ProductModel productModel);
}