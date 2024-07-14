
import 'package:dio/dio.dart';
import 'package:ecommerce_task/domain/Repository/ProductRepository/product_repository.dart';
import 'package:ecommerce_task/domain/entities/ProductModel.dart';

class ProductUseCase{
final ProductRepository productRepository;

ProductUseCase({required this.productRepository});

Future<Response> execute(ProductModel productModel){
 return productRepository.getAllProduct(productModel);
}
}