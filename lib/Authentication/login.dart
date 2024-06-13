import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petapplication/Authentication/signup.dart';
import 'package:petapplication/Home/Homenavigator.dart';
import 'package:petapplication/Home/homescreen.dart';
import 'package:petapplication/test.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
  //   NavigateUser(String title) {
  //   switch (title) {
  //     case "user":
  //       {
  //         Navigator.of(context).push(
  //             MaterialPageRoute(builder: ((context) => Test())));
  //         break;
  //       }
       

  //     case "Admin":
  //       {
  //         Navigator.of(context).push(
  //             MaterialPageRoute(builder: ((context) => 
  //           Test())));
  //         break;
  //       }

        
  //   }
  // } 
   
   
    
TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    
    
  //    getUserType([String? uid]) {
  //   final docRef = FirebaseFirestore.instance.collection("UserDetail").doc(uid);
  //   docRef.get().then(
  //     (doc) {
  //       print("2");

  //       Map<String, dynamic> userType = doc.data()!;
  //       final type = userType["Type"];
  //       print(userType);
  //       NavigateUser(type);
  //     },
  //     onError: (e) => print("Error getting document: $e"),
  //   );
  // }
 
 
 loginHandler() async {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((res) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              
        //  getUserType(res.user!.uid);
        });
      } on FirebaseAuthException catch (e) {
        print(e.code);
      }
    }





    return 
    
  Scaffold(drawer: DrawerWidgets(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Center(
                child: Text(
                  "Login Here",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: "poppins"),
                ),
              ),

              // Text(
              //   "Login to continue",
              //   style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //       fontFamily: "poppins"),
              // ),
              SizedBox(
                height: 10,
              ),
              SizedBox(height: 40,),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(1),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  controller: passwordController,
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(1),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 10.0),
              //     child: InkWell(
              //       onTap: (){

              //         Navigator.push(context, MaterialPageRoute(builder: (context)=> Test()));
              //       },
              //       child: Text(
              //         "Forget Password?",
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             decoration: TextDecoration.underline,
              //             color: Colors.black),
              //       ),
              //     ),
              //   ),
              // ),
         
              // SizedBox(
              //   height: 40,
              // ),
              ElevatedButton(
                onPressed: () {
                  loginHandler();
                },
                child: Text("Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Background color
                    onPrimary: Colors.white, // Text color
                    elevation: 5,
                    minimumSize: Size(
                        MediaQuery.sizeOf(context).width * .9,
                        MediaQuery.sizeOf(context).width *
                            .16) // Elevation (shadow)
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "Don't Have an account?",
                    style: TextStyle(),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );




  }
}
