// import "package:flutter/material.dart";
// import "package:petapplication/test.dart";

// class HomeNavigator extends StatefulWidget {
//   const HomeNavigator({super.key});

//   @override
//   State<HomeNavigator> createState() => _HomeNavigatorState();
// }

// class _HomeNavigatorState extends State<HomeNavigator> {
//   List<IconData> navigationIcons = [
//    Icons.home,
//    Icons.category_outlined,
//   //  Icons.favorite_outline,
//    Icons.person,
//   ];
//   List<String> iconName = ["home", "store",  "profile"];

//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amberAccent,
//       body: 
//       IndexedStack(
//         index: currentIndex,
//         children:  [
//       Test(),
//        Test(),
//         Test()

//           ],
//       ),
//       bottomNavigationBar: Container(
//         height: 82,
//         margin: const EdgeInsets.all(0
//             ),
//         padding: const EdgeInsets.all(0),
//         decoration: const BoxDecoration(
//           color: Colors.green,
       
//         ),
//         child: Column(children: [
//           Container(
//             color: Colors.black,
//             width: double.infinity,
//             height: 1,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   for (int i = 0; i < navigationIcons.length; i++) ...{
//                     Expanded(
//                       flex: 1,
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             currentIndex = i;
//                           });
//                         },
//                         child: Center(
//                           child: Icon(
//                             navigationIcons[i],
//                             color: i == currentIndex
//                                 ? Colors.blueAccent
//                                 : Colors.black54,
//                             size: i == currentIndex ? 30 : 25,
//                           ),
//                         ),
//                       ),
//                     )
//                   },
//                 ]),
//           ),
//         ]),
//       ),
    
//     );
//   }
// }

import 'package:flutter/material.dart';


class DrawerWidgets extends StatefulWidget {
  const DrawerWidgets({super.key});

  @override
  State<DrawerWidgets> createState() => _DrawerWidgetsState();
}

class _DrawerWidgetsState extends State<DrawerWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        backgroundColor: Colors.teal,
        child: Wrap(
          runSpacing: 10,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Pet Pal",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "Version 1.0.1",
                  style: TextStyle(color: Colors.white),
                ),
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: Colors.teal,
                  child: Text(
                    "pet",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
               
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  "Adoption",
                  style: TextStyle(color:Colors.white),
                ),
                leading: const Icon(
                Icons.abc,
                  color: Colors.white,
                ),
                // trailing: Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                 
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  "Home",
                 // style: TextStyle(color: AppColor.textwhite),
                ),
                leading: const Icon(
                  Icons.home,
               //   color: AppColor.textwhite,
                ),

                // trailing: Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                //  Get.to(() => const PetDonationScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  "Donation",
                //  style: TextStyle(color: AppColor.textwhite),
                ),
                leading: const Icon(
                  Icons.person,
                //  color: AppColor.textwhite,
                ),

                // trailing: Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                //  Get.to(() => const PetCareScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  "Pet Care",
                //  style: TextStyle(color: AppColor.textwhite),
                ),
                leading: const Icon(
                  Icons.health_and_safety,
                 // color: AppColor.textwhite,
                ),
                // trailing: Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                 // Get.to(() => const FavoriteScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  "Favourite",
                 // style: TextStyle(color: AppColor.textwhite),
                ),
                leading: const Icon(
                  Icons.favorite,
                //  color: AppColor.textwhite,
                ),
                // trailing: Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                onTap: () {
               //   Get.to(() => const SettingScreen());
                },

                title: const Text(
                  "Setting",
                 // style: TextStyle(color: AppColor.textwhite),
                ),
                leading: const Icon(
                  Icons.shopping_bag,
                 // color: AppColor.textwhite,
                ),
                // trailing: const Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                //  Get.to(() => const ChatScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  "Messeges",
                //  style: TextStyle(color: AppColor.textwhite),
                ),
                leading: const Icon(
                  Icons.message,
                //  color: AppColor.textwhite,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                //onTap: () {
                // GoogleSignIn googleSignIn = GoogleSignIn();
                // FirebaseAuth _auth = FirebaseAuth.instance;
                // await _auth.signOut();
                // await googleSignIn.signOut();
                // Get.offAll(() => WelcomeScreen());
                // },
                onTap: () {
                  // Navigator.pop(context);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Login()),
                  // );
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  "Logout",
               //   style: TextStyle(color: AppColor.textwhite),
                ),
                leading: const Icon(
                  Icons.logout,
                 // color: AppColor.textwhite,
                ),
                // trailing: const Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
