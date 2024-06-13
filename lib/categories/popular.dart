import 'package:flutter/material.dart';
import 'package:petapplication/categories/cats.dart';
import 'package:petapplication/categories/dogs.dart';
import 'package:petapplication/categories/puppy.dart';
class PopularCategories extends StatelessWidget {
  const PopularCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
           
          const   SizedBox(height: 18,),
            Row(children: [
              InkWell(
                onTap: (){

                 Navigator.push(context, MaterialPageRoute(builder: (context)=> Dogs()));
                },
                child: CategoriesWidget(Catimage: "asset/images/dog.jpeg", categoriesText: "Dogs")),
             const SizedBox(width: 25,),
              InkWell(
                          onTap: (){

                 Navigator.push(context, MaterialPageRoute(builder: (context)=> Cats()));
                },
                child: CategoriesWidget(Catimage: "asset/images/cat.png", categoriesText: "Cat")),
                const  SizedBox(width: 25,),
              InkWell(
                          onTap: (){

                 Navigator.push(context, MaterialPageRoute(builder: (context)=> Puppy()));
                },
                child: CategoriesWidget(Catimage: "asset/images/puppy.jpg", categoriesText: "Puppy")),
               const   SizedBox(width: 25,),
          
          
           
            ],)
            
            
        
        
          ],),),
      ),
    );
  }
}
class CategoriesWidget extends StatelessWidget {
  final categoriesText;
  String Catimage;
  CategoriesWidget({super.key,required this.Catimage,required this.categoriesText});

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        CircleAvatar(
          radius: 30,
      backgroundImage:AssetImage(Catimage) ,),
      const SizedBox(height: 10,),
    Text(categoriesText),
    ],);
  }
}

