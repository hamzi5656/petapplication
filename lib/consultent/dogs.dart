//ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_const, non_constant_identifier_names, prefer_const_constructors_in_immutables


import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:google_fonts/google_fonts.dart';


class Dogsconsultent extends StatefulWidget {

  
  Dogsconsultent({super.key, });

  @override
  State<Dogsconsultent> createState() => _DogsconsultentState();
}

class _DogsconsultentState extends State<Dogsconsultent> {
 final String phoneNumber = '1234567890';

  Future<void> _launchPhoneDialer(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
             Stack(
               children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                     color: Colors.grey.withOpacity(.2),
                     ),
                   
               Container(
                    height: MediaQuery.of(context).size.height*0.35,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                         AssetImage("asset/images/dog.jpeg"),
                    fit:BoxFit.fill )
                    ),
                  ),
                    Positioned(top: 20,
                      child: IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(
                        Icons.arrow_back,color: Colors.black,
                        ))),
                   Positioned(
                    top: 190,left: 15,right: 15,
                     child: Column(
                           children: [
                             Container(
                              height: MediaQuery.of(context).size.height*0.22,
                              width: MediaQuery.of(context).size.width*0.9,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(
                                    "Dogs Specialist",
style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),                              
                                  ),
                                  Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Price:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                      Text("1200",style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                         Text("Duration:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                      Text("30 min",style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],),
                              ),
                                             ),
                            Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                         Text(
                                           "Description:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                          
                                         ),  
                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                         Text("Pets and dogs specialist",
                         ), 
                          
                           /////////////////////////////////////////////
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                  Text(
                                        "Avalible At",
                                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                                       ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                       Container(
                                         height: MediaQuery.of(context).size.height*0.05,
                              width: MediaQuery.of(context).size.width*0.5,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(.8),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: 
                             Text("Mansehra",
                              style:TextStyle(color: Colors.white,fontSize: 16) ,
                              )),
                                       ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                          Text(
                                        "About Provider",
                                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                                       ), 
                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                        InkWell(
                                          // onTap: (){
                                          //   Navigator.push(context, MaterialPageRoute(builder: 
                                          //   (context)=> Test()));
                                          // },
                                          child: Card(
                                             child: Padding(
                                                                 padding: const EdgeInsets.all(12),
                                                                 child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                   children: [
                                                                    CircleAvatar(
                                             backgroundImage:AssetImage("asset/images/dog.jpeg") ,
                                           backgroundColor: Colors.blueGrey,
                                            radius: 30,
                                          ), 
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                          
                                          Text(
                                          "Dr Yasir",
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                          "MBBS",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          
                                          ],
                                          ),
                                          ],
                                          ),
                                          ),
                                          ),
                                        ),                              
                                      
        SizedBox(height: 20,),
                         SizedBox(
            height: 60,
            width: double.infinity,
            child: 
            ElevatedButton(
              
            onPressed: () {
              _launchPhoneDialer(phoneNumber);
            },
            child: Text('Hire ME'), 
                    ),
          
          
          )       
                                   
                                   
                                      ],
                                     ),
                                    
]  ),

                     
                                 ),
            //                      Positioned(
            //                       bottom: 10,
            //                       left: 5,
            //                       right: 5,
            //                       child:
            //                       FloatingActionButton(
            //                         onPressed: (){
            //                          Navigator.push(
            // context,MaterialPageRoute(
            // builder: (context) =>  )
            // );
            //                       },
            //                       backgroundColor: Colors.deepPurple.withOpacity(.8),
            //                       child: Text("Book Now",
            //                       style:TextStyle(color: Colors.white,fontSize: 16) ,
            //                       ),
            //                       )
            //                       )
                          
                         
                           ],
                         ),
          ]
                       ),
               
                     ),             
    );
  }
}