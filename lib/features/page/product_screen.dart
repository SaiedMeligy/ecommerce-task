import 'package:ecommerce_task/core/extensions/padding_ext.dart';
import 'package:ecommerce_task/features/manager/cubit.dart';
import 'package:ecommerce_task/features/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/config/constants.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  var allProductsCubit =ProductCubit();

  @override
  void initState() {
    super.initState();
    allProductsCubit.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/Route_Icon.png").setHorizontalPadding(context,enableMediaQuery: false, 10),
            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: Constants.mediaQuery.width * 0.8,
                  child: const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          borderSide: BorderSide(color: Color(0xff004182))),
                      prefixIcon: Icon(Icons.search, size: 40),
                      prefixIconColor: Color(0xff004182),
                      hintText: "What do you search for?",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Color(0xff06004F),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                  },
                  icon: Image.asset(
                    "assets/images/shoping_Cart.png",
                    scale: 2.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            BlocBuilder<ProductCubit,ProductStates>(
              bloc: allProductsCubit,
              builder: (context, state) {
                if (state is LoadingProductStates) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else if (state is SuccessProductStates) {
                  var productList = state.products;
                  return Expanded(
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        String imageUrl =productList[index].thumbnail.toString();
                        return Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            border: Border.all(color: Colors.blueGrey.withOpacity(0.5), width: 1),
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      CachedNetworkImage(
                                      imageUrl: imageUrl,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => const Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons.error,
                                          size: 60, color: Colors.grey),

                                    ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    radius: 12,
                                                    child: ImageIcon(
                                                        const AssetImage("assets/images/fav.png"),
                                                        color: Constants.theme.primaryColor),
                                                  ).setHorizontalAndVerticalPadding(context, enableMediaQuery: false, 5, 5)),
                                            )

                          ]
                                  ),
                                ),
                              Expanded(
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .stretch,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            productList[index].title.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Constants.theme
                                                  .primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            productList[index].description.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Constants.theme
                                                  .primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Egp ${productList[index].price}",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Constants.theme
                                                      .primaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("${allProductsCubit.getDiscount(productList[index].price!, productList[index].discountPercentage!).toStringAsFixed(2)} Egp",
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  color: Colors.blueGrey,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Reviews (${productList[index].rating})",
                                                style: TextStyle(
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  color: Constants.theme
                                                      .primaryColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(
                                                Icons.star,
                                                color: Color(0xFFF4B400),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: InkWell(
                                        onTap: () {},
                                        child:
                                        IconButton(
                                          icon: Icon(Icons.add_circle, color: Constants.theme.primaryColor,),
                                          onPressed: () {},
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  ),
                );}
                else if (state is ErrorProductStates){
                  return Center(child: Text(state.errorMessage.toString(),style: Constants.theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.red
                  ),));
                }
                else{
                  return const Center(child: Text("Some thing went wrong"),);
                }


              }
            )

          ],
        ),
      ),


    );
  }
}
