import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:final_iti/core/services/fetch_categories.dart';
import 'package:final_iti/core/services/fetch_products.dart';
import 'package:final_iti/features/products/presentation/views/category.dart';
import 'package:final_iti/features/products/presentation/views/info_page.dart';
import 'package:final_iti/features/profile/presentation/views/profile_page.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Map<String, dynamic>? userData;

  const HomeScreen({super.key, this.userData});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<dynamic> products = [];
  List<dynamic> filteredProducts = [];
  List<String> categories = [];
  String selectedCategory = 'beauty'; // افتراضي

  final ApiProvider _apiProvider = ApiProvider();
  final FetchCategories fCategories = FetchCategories();
  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchProducts(selectedCategory);
  }

  void fetchProducts(String category) async {
    try {
      final fetchedProducts = await _apiProvider.fetchProducts(category);
      setState(() {
        products = fetchedProducts;
        filteredProducts = products;
      });
    } catch (e) {
      log('Error fetching products: ${e.toString()}');
    }
  }

  void fetchCategories() async {
    try {
      final fetchedCategories = await fCategories.fetchCategories();
      setState(() {
        categories = fetchedCategories;
      });
    } catch (e) {
      log('Error fetching categories: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomeContent(),
      ProfileScreen(userData: widget.userData),
      const CategoriesScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Beauty',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xffEF6494),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xffEF6494)),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Color(0xffEF6494)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const InfoPage();
              }));
            },
          ),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
        ],
        selectedItemColor: const Color(0xffEF6494),
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildHomeContent() {
    int gridColumns = MediaQuery.of(context).size.width > 600 ? 4 : 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Discover the newest products',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: filteredProducts.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridColumns,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color(0xffEF6494),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            filteredProducts[index]['thumbnail'],
                            fit: BoxFit.cover,
                            height: 100,
                            width: double.infinity,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            filteredProducts[index]['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
