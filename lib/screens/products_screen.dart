import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salla_app/models/home_model.dart';
import 'package:salla_app/shared/cubit/cubit.dart';
import 'package:salla_app/shared/cubit/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: ConditionalBuilder(
            condition: cubit.homeModel != null,
            builder: (context) => productsBuilder(cubit.homeModel, context),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  Widget productsBuilder(HomeModel? model, context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              CarouselSlider(
                items: model!.data.banners.map((e) {
                  return Image(
                    image: NetworkImage(e.image),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * .32,
                  initialPage: 0,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayInterval: const Duration(seconds: 3),
                  reverse: false,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  viewportFraction: 1.0,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 0,
                childAspectRatio: 1 / 1.22,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                    model.data.products.length,
                    (index) =>
                        buildProductItem(model.data.products[index], context)),
              )
            ],
          ),
        ),
      );

  Widget buildProductItem(ProductsModel model, context) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height * .37,
        width: MediaQuery.of(context).size.width * .45,
        decoration: BoxDecoration(
            color: const Color(0xff454D5A),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: NetworkImage(model.image),
                      width: MediaQuery.of(context).size.width * .3,
                      height: MediaQuery.of(context).size.height * .2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      model.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.alata().fontFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          model.price.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.alata().fontFamily,
                              fontSize:
                                  MediaQuery.of(context).size.height * .020,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        if (model.discount != 0)
                          Text(
                            model.old_price.toString(),
                            style: TextStyle(
                                color: Colors.grey[300],
                                fontFamily: GoogleFonts.alata().fontFamily,
                                fontSize:
                                    MediaQuery.of(context).size.height * .014,
                                fontWeight: FontWeight.w600),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.grey[300],
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .06,
                    width: MediaQuery.of(context).size.width * .1,
                    decoration: BoxDecoration(
                        color: const Color(0xff333742),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.add_shopping_cart,
                        size: MediaQuery.of(context).size.height * .03,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
