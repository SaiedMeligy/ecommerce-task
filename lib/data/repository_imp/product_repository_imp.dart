import 'package:dio/dio.dart';
import 'package:ecommerce_task/core/Failure/server_failure.dart';
import 'package:ecommerce_task/data/dataSource/productDataSource/product_data_Source.dart';
import 'package:ecommerce_task/domain/Repository/ProductRepository/product_repository.dart';
import 'package:ecommerce_task/domain/entities/ProductModel.dart';

class ProductRepositoryImp implements ProductRepository{
  ProductDataSource productDataSource;
  ProductRepositoryImp(this.productDataSource);
  @override
  Future<Response> getAllProduct(ProductModel productModel) async{
    try {
      final response = await productDataSource.getAllProduct(productModel);
      if(response.statusCode==200) {
        return response;
      }
      else{
        throw ServerFailure(statusCode: response.statusCode.toString()??"",
          message: response.data["message"].toString()??"");
      }
    }
        on DioException catch(dio_exception) {
      throw ServerFailure(statusCode: dio_exception.response?.statusCode.toString()??"",
    message: dio_exception.response?.data["message"].toString()??"");

        }

  }

}