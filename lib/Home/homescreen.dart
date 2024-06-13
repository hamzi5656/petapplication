
      
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
      import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
      import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:petapplication/Authentication/login.dart';
import 'package:petapplication/Home/slider.dart';
import 'package:petapplication/categories/popular.dart';
import 'package:petapplication/consultent/list.dart';
import 'package:petapplication/product/add.dart';
import 'package:petapplication/product/product.dart';
import 'package:petapplication/profile/profile.dart';
import 'package:petapplication/test.dart';
      class HomeScreen extends StatefulWidget {
      const HomeScreen({super.key});

      @override
      State<HomeScreen> createState() => _HomeScreenState();
      }

      class _HomeScreenState extends State<HomeScreen> {

      List<Map> allpopularProduct=[];
      @override
      void initState() {
   
      print("==================");

      getpopularproduct();
     
      }
         Logouthandler() {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Login()),
      );
      print("Logout");
    });
  }
      
      getpopularproduct(){

      FirebaseFirestore.instance.collection("Pets").where("popular", isEqualTo: true, ).get().then((response) {
      List<Map<String,dynamic>> temp=[];
      for (var element in response.docs) {
      temp.add({...element.data(), "id":element.id });
      }
      allpopularProduct = temp; 
      setState(() { });
      print(allpopularProduct);
      print("=====================");

      });
     
      }
      

      @override
      Widget build(BuildContext context) {
      return Scaffold(
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Hello Welcome To PetPall',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfile()));
                // Navigate to Home screen
              },
            ),
             ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
             
                // Navigate to Home screen
              },
            ),
             ListTile(
              leading: Icon(Icons.production_quantity_limits),
              title: Text('Donation'),
              onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminHome()));
             
                // Navigate to Home screen
              },
            ),
             ListTile(
              leading: Icon(Icons.verified_user_outlined),
              title: Text('Consultent'),
              //ServicesList
              onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ServicesList()));
             
            
              },
            ),
             ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () {
        //PetFilterScreen
            Navigator.push(context, MaterialPageRoute(builder: (context)=> PetFilterScreen()));
             
                // Navigate to Home screen
              },
            ),
            //  ListTile(
            //   leading: Icon(Icons.logout),
            //   title: Text('Logout'),
            //   onTap: () {
            //     Logouthandler();
                
            //     // Navigate to Home screen
            //   },
            // ),

  InkWell(
      onTap: (){
        Get.defaultDialog(
                      title: 'Logout',
                      content: const Text(
                          'Are you sure want to Logout'),
                      textCancel: 'Cancel',
                      textConfirm: 'Logout',
                      contentPadding: const EdgeInsets.all(10.0),
                      confirmTextColor: Colors.white,
                      onCancel: () {},
                      onConfirm: () async {
                       
                      Future.delayed(Duration(seconds: 3), 
                      () {
                        EasyLoading.show(status: "Please wait").then((value) => EasyLoading.dismiss());
                        Logouthandler();
                        
                      },
                    
                      );
                         });
   
      },
      child: 
        ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
              
                Logouthandler();
                  EasyLoading.showSuccess("Logout");
                
                // Navigate to Home screen
              },
            ),
      ),

     
            
            ])),
      appBar: AppBar(title:const  Text("PetPal",
      style:TextStyle(color: Colors.white),),backgroundColor: Colors.blue,
   
      ),
      body: 
      SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      const   SizedBox(height: 10,),
      HomeSlider(),
      const   SizedBox(height: 20,),
      // const  HomeSearchBar(),
      const   SizedBox(height: 10,),
      const   Align(alignment: Alignment.topLeft,
      child: Text("Categories",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
      const   SizedBox(height: 20,),

     const   PopularCategories(),
    //   const    SizedBox(height: 50,),
         const  SizedBox(height: 20,),
      //services
    //  const ServicesSliderHome(),
      const SizedBox(height: 20,),

      const Align(alignment: Alignment.topLeft,
      child: Text("Popular Product",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      const  SizedBox(height: 10,),
      Container(padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Wrap(
      children: [
      ...allpopularProduct.map((e) => Product(productinfo: e)),
      ],


      ),)


      ])
      )
      ));

      }}