import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
const List<String> category = <String>[
  'Dog',
  'Cat',
  'Puppy',
  'Horse'
];
const List<String> petcolor = <String>[
  'Grey',
  'Brown',
  'Black',
  'White'
];
const List<bool> popularproduct = <bool>[
 true,
 false
];
const List<bool> adopted = <bool>[

 false,
];

class AdminHome extends StatefulWidget {
 
  const AdminHome({super.key,});

  @override
  State<AdminHome> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AdminHome> {
  String  categoryValue = category.first;
    bool popularValue = popularproduct.first;
    bool statusValue = adopted.first;
    String petvalue = petcolor.first;

  
  TextEditingController _productTitle = TextEditingController();
  TextEditingController _productPrice = TextEditingController();
  TextEditingController _productqty = TextEditingController();
  TextEditingController _productCategory = TextEditingController();
  TextEditingController _productDesc = TextEditingController();

  File? tempImage;
  XFile? pickedImage;

  uploadImage() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then(
      (value) {
        if (value != null) {
          print(value.path);
          setState(() {
            pickedImage = value;
            tempImage = File(value.path);
          });
        } else {
          print(null);
        }
      },
    );
  }

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  addProductHandler() async {
    print("step1");
    EasyLoading.show(status: "Loading...");
    try {
    print("step2");

      String uid = await FirebaseAuth.instance.currentUser!.uid;
    print("step3");

      String imageUrl = "";
      print(pickedImage!.path);
      if (pickedImage != null) {
        Reference ref = FirebaseStorage.instance
            .ref()
            .child("prodimg/${pickedImage!.name}");
        File imageFile = File(pickedImage!.path);
        await ref.putFile(imageFile);
        imageUrl = await ref.getDownloadURL();
        setState(() {});
      }
    
      await FirebaseFirestore.instance.collection("Pets").doc().set({
        "name": _productTitle.text,
        "des": _productDesc.text,
        "img": imageUrl,
        "category": categoryValue,
        "adopted": statusValue,
        "color": petvalue,
        "popular": popularValue,
        "age": _productPrice.text  //int.parse(_productqty.text),
      }).then((value) {
        EasyLoading.showSuccess("Product Uploaded");
      });
    } on FirebaseException catch (e) {
      EasyLoading.showError(e.code);
      print(e);
    } catch (e) {
      EasyLoading.showError(e.toString());
      print(e);

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(("add the product"));
  }

  printStore() {
    print("data");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFCF8),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height,
        child: ListView(scrollDirection: Axis.vertical, children: [
          SizedBox(height: 25),
          Stack(
            children: [
              Container(
                height: 200, 
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: Color(0xff7743DB),
                  ),
                ),
                width: double.infinity,
                child: pickedImage != null
                    ? ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        child: Image.file(tempImage!, fit: BoxFit.cover))
                    : ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        child:
                            Image.asset("asset/images/puppy.jpg", fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: InkWell(
                  onTap: uploadImage,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff7743DB),
                    radius: 30,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          TextInputFieldWithoutIcon("Pet Name", _productTitle,
              "Pet Name", TextInputType.text, (p0) {}),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
           TextInputFieldWithoutIcon("Pet Description", _productDesc,
              "Pet Description", TextInputType.text, (p0) {}),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column( mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Color"),
                      SizedBox(height: 10,),
                      Container(
                                                       color: Colors.white,
                                                       width: MediaQuery.of(context).size.width * 0.4,
                                                       child: DropdownMenu<String>(
                                                         width: MediaQuery.of(context).size.width * 0.4,
                                                         initialSelection: petcolor.first,
                                                         onSelected: (String? value) {
                                      setState(() {
                                        petvalue = value!;
                                      });
                                                         },
                                                         dropdownMenuEntries: petcolor
                                        .map<DropdownMenuEntry<String>>((String value) {
                                      return DropdownMenuEntry<String>(
                                          value: value, label: "$value");
                                                         }).toList(),
                                                       ),
                                                     ),
                    ],
                  ),
                  
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Category"),
                        SizedBox(height: 10,),
                        Container(
                                                       color: Colors.white,
                                                       width: MediaQuery.of(context).size.width * 0.4,
                                                       child: DropdownMenu<String>(
                                                         width: MediaQuery.of(context).size.width * 0.4,
                                                         initialSelection: category.first,
                                                         onSelected: (String? value) {
                                      setState(() {
                                        categoryValue = value!;
                                      });
                                                         },
                                                         dropdownMenuEntries: category
                                        .map<DropdownMenuEntry<String>>((String value) {
                                      return DropdownMenuEntry<String>(
                                          value: value, label: "$value");
                                                         }).toList(),
                                                       ),
                                                     ),
                      ],
                    ),
            
                ],
              ),
                        
         
         
          TextInputFieldWithoutIcon("Age", _productPrice, "1 Year",
              TextInputType.text, (p0) {}),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            Text("Popular"),
                            SizedBox(height: 5,),
                             Container(
                                               color: Colors.white,
                                               width: MediaQuery.of(context).size.width * 0.4,
                                               child: DropdownMenu<bool>(
                                                 width: MediaQuery.of(context).size.width * 0.4,
                                                 initialSelection: popularproduct.first,
                                                 onSelected: (bool? value) {
                              setState(() {
                                popularValue = value!;
                              });
                                                 },
                                                 dropdownMenuEntries: popularproduct
                                .map<DropdownMenuEntry<bool>>((bool value) {
                              return DropdownMenuEntry<bool>(
                                  value: value, label: "$value");
                                                 }).toList(),
                                               ),
                                             ),
                        
                           ],
                         ),
                Column(mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            Text("Adopted"),
                            SizedBox(height: 5,),
                             Container(
                                               color: Colors.white,
                                               width: MediaQuery.of(context).size.width * 0.4,
                                               child: DropdownMenu<bool>(
                                                 width: MediaQuery.of(context).size.width * 0.4,
                                                 initialSelection: adopted.first,
                                                 onSelected: (bool? value) {
                              setState(() {
                                statusValue = value!;
                              });
                                                 },
                                                 dropdownMenuEntries: popularproduct
                                .map<DropdownMenuEntry<bool>>((bool value) {
                              return DropdownMenuEntry<bool>(
                                  value: value, label: "${value}");
                                                 }).toList(),
                                               ),
                                             ),
                           ],
                         ),
        
        
        ],
      ),
              
            
               
          
          SizedBox(height: 25),
          ElevatedButton(onPressed: addProductHandler, child: Text("Add Product")),
        ]),
      ),
    );
  }
}
Widget TextInputFieldWithoutIcon(
  String label,
  TextEditingController editingController,
  String textHint,
  TextInputType keyBoardType,
  String? Function(String?)? validation,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
           // fontFamily: GoogleFonts.inter().fontFamily,
            color: Color(0xff000000),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          keyboardType: keyBoardType,
          controller: editingController,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w200,
           // fontFamily: GoogleFonts.inter().fontFamily,
            color: Color(0xff000000),
          ),
          decoration: InputDecoration(
            fillColor: Color(0xffFFFFFF),
            //  Color(0xffF7F8F9),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color(0xffD8DADC)), // Change this color
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffF7F8F9)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: textHint,

            hintStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
          //    fontFamily: GoogleFonts.inter().fontFamily,
              color: Color(0xff8391A1),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validation,
        ),
      ],
    ),
  );
}