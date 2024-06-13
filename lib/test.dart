import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Pet {
  final String name;
  final String image;
  final int age;
  final String description;
  final String color;
  final String category;

  Pet({
    required this.name,
    required this.image,
    required this.age,
    required this.description,
    required this.color,
    required this.category,
  });

  factory Pet.fromDocument(DocumentSnapshot doc) {
    return Pet(
      name: doc['name'],
      image: doc['image'],
      age: doc['age'],
      description: doc['description'],
      color: doc['color'],
      category: doc['category'],
    );
  }
}

Future<List<Pet>> fetchPets({String? category, String? color}) async {
  Query query = FirebaseFirestore.instance.collection('pets');
  
  if (category != null && category != 'All') {
    query = query.where('category', isEqualTo: category);
  }

  if (color != null && color != 'All') {
    query = query.where('color', isEqualTo: color);
  }

  QuerySnapshot snapshot = await query.get();
  return snapshot.docs.map((doc) => Pet.fromDocument(doc)).toList();
}

class PetFilterScreen extends StatefulWidget {
  @override
  _PetFilterScreenState createState() => _PetFilterScreenState();
}

class _PetFilterScreenState extends State<PetFilterScreen> {
  String selectedCategory = 'All';
  String selectedColor = 'All';
  List<Pet> pets = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFilteredPets();
  }

  void fetchFilteredPets() async {
    setState(() {
      isLoading = true;
    });
    pets = await fetchPets(
      category: selectedCategory == 'All' ? null : selectedCategory,
      color: selectedColor == 'All' ? null : selectedColor,
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Filter'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items: <String>['All', 'Cat', 'Dog', 'Bird', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: selectedColor,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedColor = newValue!;
                    });
                  },
                  items: <String>['All', 'Red', 'Blue', 'Green', 'Yellow', 'Black']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: fetchFilteredPets,
                  child: Text('Search'),
                ),
              ],
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: pets.length,
                    itemBuilder: (context, index) {
                      Pet pet = pets[index];
                      return ListTile(
                        leading: Image.network(pet.image),
                        title: Text(pet.name),
                        subtitle: Text('Age: ${pet.age}, Color: ${pet.color}, Category: ${pet.category}'),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
