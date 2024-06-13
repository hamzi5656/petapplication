
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petapplication/product/productdetail.dart';

class Product extends StatelessWidget {
  Map productinfo;
  Product({super.key,required this.productinfo });
  

  @override
  Widget build(BuildContext context) {
      // Timestamp durationTimestamp = productinfo['duration'];
    //DateTime durationDateTime = durationTimestamp.toDate();

    // Extracting hours from DateTime object
 //   int hours = durationDateTime.hour;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
         ProductDetail(productDetails:productinfo ,

        ))); 
      },
      child:
       Container(margin: const EdgeInsets.only(top: 10,left: 2,right: 2,bottom: 10),
        
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.grey.withOpacity(.2))),
        height: 280,width: 170,
       child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
             
          Image(height: 120,width: 120,
            image: NetworkImage(

           "${productinfo["img"]}")),
          const SizedBox(height: 10,),
          Text("${productinfo["name"]}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
       
          Text("${productinfo["des"]}",maxLines: 1,),
          Text( "${productinfo["adopted"]==true ? "Not adopted": "Adopted"}".toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
            Text( "${productinfo["category"]}".toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
          
              ],),
        ),),
    );
  }
}