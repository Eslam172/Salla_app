import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salla_app/models/categories_model.dart';
import 'package:salla_app/shared/cubit/cubit.dart';
import 'package:salla_app/shared/cubit/states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit = AppCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.categoriesModel != null,
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text('Categories',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.aclonica().fontFamily,
                  fontSize: 18
              ),),),
              body: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildCategories(cubit.categoriesModel!.data.data[index],context),
                  separatorBuilder: (context, index) => const SizedBox(height: 20,),
                  itemCount: cubit.categoriesModel!.data.data.length
              ),
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator(),)
        )
        ;
      },
    );
  }

  Widget buildCategories(DataModel? model ,context) =>  Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 10),
    height: MediaQuery.of(context).size.height*.15,
    decoration: BoxDecoration(
      color:  const Color(0xff454D5A),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image(image: NetworkImage(model!.image),
            width: MediaQuery.of(context).size.width*.25,
          ),
        ),
        const SizedBox(width: 10,),
        Text(model.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.alata().fontFamily,
            fontSize: 18
        ),),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff333742)
          ),
          child: IconButton(
              onPressed: (){

              },
              icon: const Icon(Icons.arrow_right,
                size: 30,
                color: Colors.white,
              )
          ),
        )
      ],
    ),
  );
}