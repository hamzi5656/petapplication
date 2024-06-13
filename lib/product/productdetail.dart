import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:petapplication/product/model.dart';

class ProductDetail extends StatefulWidget {
  Map productDetails;

  ProductDetail({super.key, Key , required this.productDetails});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
    Map<String, dynamic> user = {};

  // adoptedmethod() {
    
  //   FirebaseFirestore.instance
  //       .collection("Pets")
  //       .doc()
  //       .update({"adopted": true});
  // }
  getpopularproduct(){

      FirebaseFirestore.instance.collection("Pets").doc().update({"adopted": true})  .then((response) {
      List<Map<String,dynamic>> temp=[];
      // for (var element in response.docs) {
      // temp.add({...element.data(), "id":element.id });
      // }
      print(temp);
      // allpopularProduct = temp; 
      // setState(() { });
      // print(allpopularProduct);
      // print("=====================");

      });
     
      }

  @override
  Widget build(BuildContext context) {
   // Timestamp durationTimestamp = productDetails['duration'];
   // DateTime durationDateTime = durationTimestamp.toDate();

    // Extracting hours from DateTime object
   // int hours = durationDateTime.hour;
    List<productModel> itemlist=[
      productModel(petid:"${widget.productDetails["id"]}"  , petname: "${widget.productDetails["name"]}", petdes: "${widget.productDetails["description"]}", petimg: "${widget.productDetails["img"]}", adopted:  true)

    ];

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Image(height: 500,
                        image: NetworkImage("${widget.productDetails["img"]}"),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 30,
                    right: 30,
                    child: Icon(Icons.favorite_outline, size: 28),
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Card(
                  
                  color: Colors.white,
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: 20,),
                        Text(
                          "${widget.productDetails["name"]}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Descripton ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 10,),
                        Text(
                          "${widget.productDetails["des"]}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,color: Colors.black.withOpacity(.7)
                          ),
                        ),
                        // const SizedBox(height: 10),
                        // Text(
                        //   "${productDetails["price"]} PKR",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.deepPurple.withOpacity(.8),
                        //     fontSize: 20,
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                    
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Status:",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              widget.productDetails["status"] == true ? " Adopted" : "Not Adopted",style: const TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
         
          
              ],
            ),
      
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          
            PersistentShoppingCart().showAndUpdateCartItemWidget(
              inCartWidget: const Text(
                "Remove",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              notInCartWidget: 
              TextButton(onPressed: (){
                getpopularproduct();
                print("hahhahahahahahha");

              }, child:   Text(
                              widget.productDetails["status"] == true ? "Not Adopted" : "Adopted",style: const TextStyle(color: Colors.green),
                            ),),
              // const Text(
              //   "Add",
              //   style: TextStyle(color: Colors.green, fontSize: 18),
              // ),
              product: PersistentShoppingCartItem(
                productId:"${widget.productDetails["id"]}",
                productName: "${widget.productDetails["name"]}",
                unitPrice: 66,
                quantity:1,
                productThumbnail: "${widget.productDetails["img"]}",
              
              ),
            ),
          ],
        ),  
      ),
    );
  }
}
