import 'package:flutter/material.dart';
import 'package:petapplication/categories/dogs.dart';
import 'package:petapplication/categories/puppy.dart';
import 'package:petapplication/consultent/cats.dart';
import 'package:petapplication/consultent/dogs.dart';
class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("All Consultent"),),
    body: Column(children: [
  InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Catconsultent()));
    },
    child: ServicesRow(imageurl:  "https://img.freepik.com/free-photo/kitten-puppy-ai-generated-image_268835-6570.jpg",
     serviceText: "Cat"),
  ),
  InkWell(
      onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Dogsconsultent()));
    },
    child: ServicesRow(imageurl: 
    "https://t4.ftcdn.net/jpg/01/99/00/79/360_F_199007925_NolyRdRrdYqUAGdVZV38P4WX8pYfBaRP.jpg", serviceText: "Dogs")),
 
   
   ],),
   
   
    );
  }
}
 class ServicesRow extends StatelessWidget {
  String imageurl,serviceText;
 ServicesRow({super.key,required this.imageurl,required this.serviceText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
             
          CircleAvatar(backgroundColor: Colors.white,
            child: Image.network(imageurl)),
          const SizedBox(width: 20,),
          Text(serviceText,style: const TextStyle(fontWeight: FontWeight.bold),)
              ],),
        ),),
    );
  }
}