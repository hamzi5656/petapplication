import 'package:flutter/material.dart';

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
}

class PetFilterScreen extends StatefulWidget {
  @override
  _PetFilterScreenState createState() => _PetFilterScreenState();
}

class _PetFilterScreenState extends State<PetFilterScreen> {
  String selectedCategory = 'All';
  String selectedColor = 'All';
  List<Pet> pets = [];
  List<Pet> filteredPets = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadDummyData();
  }

  void loadDummyData() {
    pets = [
      Pet(
        name: 'German Shehpherd',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6vK9XGVpsZJyLqihEWrl8FZlRTEIvPpn90KC5OnJRh2qiNiEzy0JBlls0ZV3_rkQOmdo&usqp=CAU',
        age: 5,
        description: 'German',
        color: 'Black',
        category: 'Dog',
      ),
      Pet(
        name: 'Labour Dog',
        image: 'https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg',
        age: 3,
        description: 'Loyal and loving',
        color: 'Yellow',
        category: 'Black',
      ),
      Pet(
        name: 'Persian Cat',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShpE4acl_rRf6Gkk2GzNRPfOBVCIRVH1Dcuw&s',
        age: 1,
        description: 'Chirpy and cheerful',
        color: 'Brown',
        category: 'Cat',
      ),
      Pet(
        name: 'Cat',
        image: 'https://www.alleycat.org/wp-content/uploads/2019/03/FELV-cat.jpg',
        age: 4,
        description: 'Curious and adventurous',
        color: 'Borwn',
        category: 'Cat',
      ),
      // Add more dummy pets here
    ];
    fetchFilteredPets();
  }

  void fetchFilteredPets() {
    setState(() {
      isLoading = true;
    });

    filteredPets = pets.where((pet) {
      final categoryMatch = selectedCategory == 'All' || pet.category == selectedCategory;
      final colorMatch = selectedColor == 'All' || pet.color == selectedColor;
      return categoryMatch && colorMatch;
    }).toList();

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
                      fetchFilteredPets();
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
                      fetchFilteredPets();
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
                    itemCount: filteredPets.length,
                    itemBuilder: (context, index) {
                      Pet pet = filteredPets[index];
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
