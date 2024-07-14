import 'package:ecommerce_task/core/Services/web_services.dart';
import 'package:ecommerce_task/data/dataSource/productDataSource/product_data_source_imp.dart';
import 'package:ecommerce_task/data/repository_imp/product_repository_imp.dart';
import 'package:ecommerce_task/domain/entities/ProductModel.dart';
import 'package:ecommerce_task/domain/useCase/productUseCase/product_use_case.dart';
import 'package:ecommerce_task/features/manager/states.dart';
import 'package:bloc/bloc.dart';

import '../../data/dataSource/productDataSource/product_data_Source.dart';
import '../../domain/Repository/ProductRepository/product_repository.dart';

class ProductCubit extends Cubit<ProductStates>{
  ProductCubit() : super(LoadingProductStates());

  late ProductUseCase productUseCase;
  late ProductRepository productRepository;
  late ProductDataSource productDataSource;

  Future<void> getProduct() async {
    WebServices service = WebServices();
    productDataSource =ProductDataSourceImp(service.freeDio);
    productRepository = ProductRepositoryImp(productDataSource);
    productUseCase =ProductUseCase(productRepository: productRepository);
    emit(LoadingProductStates());
    var result = await productUseCase.execute(ProductModel());
    final data = ProductModel.fromJson(result.data);
    emit(SuccessProductStates(data.products??[]));
  }
  double getDiscount(double price , double disscountPercentage){
    return  (price * disscountPercentage / 100);
  }
}