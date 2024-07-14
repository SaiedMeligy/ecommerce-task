import 'package:bloc_test/bloc_test.dart';
import 'package:ecommerce_task/features/manager/cubit.dart';
import 'package:ecommerce_task/features/manager/states.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductCubit', () {
    late ProductCubit productCubit;

    setUp(() {
      productCubit = ProductCubit();
    });

    tearDown(() {
      productCubit.close();
    });

    blocTest<ProductCubit, ProductStates>(
      'emits [LoadingProductStates, SuccessProductStates] when getProduct is called',
      build: () => productCubit,
      act: (cubit) => cubit.getProduct(),
      expect: () => [
        isA<LoadingProductStates>(),
        isA<SuccessProductStates>(),
      ],
    );
  });
}
