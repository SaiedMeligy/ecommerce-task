import '../../domain/entities/ProductModel.dart';

sealed class ProductStates{}
class LoadingProductStates extends ProductStates{}
class SuccessProductStates extends ProductStates{
  List<Products> products ;
  SuccessProductStates(this.products);
}
class ErrorProductStates extends ProductStates{
  final String errorMessage;
  ErrorProductStates(this.errorMessage);
}