import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomePage(onAddToCart: (index) {}),
    );
  }
}

class HomePage extends StatefulWidget {
  final Function(int) onAddToCart;
  const HomePage({super.key, required this.onAddToCart});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<String> categoryNames = ['Men', 'Women', 'Children', 'Electronics', 'Accessories'];
  late final List<Map<String, dynamic>> _products;

  @override
  void initState() {
    super.initState();
    _products = [
      {'name': 'Polo T-Shirt', 'price': 25, 'image': 'assets/images/product1.jpg', 'category': 'Men'},
      {'name': 'Slim Fit Jeans', 'price': 40, 'image': 'assets/images/product2.jpg', 'category': 'Men'},
      {'name': 'Leather Jacket', 'price': 100, 'image': 'assets/images/product3.jpg', 'category': 'Men'},
      {'name': 'Formal Shirt', 'price': 35, 'image': 'assets/images/product4.jpg', 'category': 'Men'},
      {'name': 'Sports Shoes', 'price': 70, 'image': 'assets/images/product5.jpg', 'category': 'Men'},
      {'name': 'Cotton Saree', 'price': 30, 'image': 'assets/images/product6.jpg', 'category': 'Women'},
      {'name': 'Anarkali Dress', 'price': 60, 'image': 'assets/images/product7.jpg', 'category': 'Women'},
      {'name': 'Handbag', 'price': 45, 'image': 'assets/images/product8.jpg', 'category': 'Women'},
      {'name': 'Heels', 'price': 55, 'image': 'assets/images/product9.jpg', 'category': 'Women'},
      {'name': 'Skincare Set', 'price': 40, 'image': 'assets/images/product10.jpg', 'category': 'Women'},
      {'name': 'Kids T-Shirt', 'price': 15, 'image': 'assets/images/product11.jpg', 'category': 'Children'},
      {'name': 'Toy Car', 'price': 20, 'image': 'assets/images/product12.jpg', 'category': 'Children'},
      {'name': 'School Bag', 'price': 25, 'image': 'assets/images/product13.jpg', 'category': 'Children'},
      {'name': 'Coloring Book', 'price': 10, 'image': 'assets/images/product14.jpg', 'category': 'Children'},
      {'name': 'Baby Shoes', 'price': 18, 'image': 'assets/images/product15.jpg', 'category': 'Children'},
      {'name': 'Bluetooth Speaker', 'price': 60, 'image': 'assets/images/product16.jpg', 'category': 'Electronics'},
      {'name': 'Laptop', 'price': 600, 'image': 'assets/images/product17.jpg', 'category': 'Electronics'},
      {'name': 'Smartphone', 'price': 400, 'image': 'assets/images/product18.jpg', 'category': 'Electronics'},
      {'name': 'Smartwatch', 'price': 150, 'image': 'assets/images/product19.jpg', 'category': 'Electronics'},
      {'name': 'Headphones', 'price': 80, 'image': 'assets/images/product20.jpg', 'category': 'Electronics'},
      {'name': 'Sunglasses', 'price': 25, 'image': 'assets/images/product21.jpg', 'category': 'Accessories'},
      {'name': 'Leather Wallet', 'price': 30, 'image': 'assets/images/product22.jpg', 'category': 'Accessories'},
      {'name': 'Belt', 'price': 20, 'image': 'assets/images/product23.jpg', 'category': 'Accessories'},
      {'name': 'Watch', 'price': 50, 'image': 'assets/images/product24.jpg', 'category': 'Accessories'},
      {'name': 'Cap', 'price': 15, 'image': 'assets/images/product25.jpg', 'category': 'Accessories'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _products
        .where((product) => product['name'].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("MyShop")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: "Search Products...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            Text("Categories", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryNames.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ActionChip(
                      label: Text(category),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CategoryProductsPage(
                              category: category,
                              allProducts: _products,
                              onAddToCart: widget.onAddToCart,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Text("Featured Products", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.75,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  final productIndex = _products.indexOf(product);
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsPage(
                          index: productIndex,
                          product: product,
                          onAddToCart: widget.onAddToCart,
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: product['image'] is String
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        product['image'],
                                        fit: BoxFit.cover,
                                        width: 10,
                                      ),
                                    )
                                  : Icon(product['image'], size: 10, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(product['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text("\$${product['price']}", style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryProductsPage extends StatelessWidget {
  final String category;
  final List<Map<String, dynamic>> allProducts;
  final Function(int) onAddToCart;

  const CategoryProductsPage({
    super.key,
    required this.category,
    required this.allProducts,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final filtered = allProducts.where((p) => p['category'] == category).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: filtered.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final product = filtered[index];
            final productIndex = allProducts.indexOf(product);
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsPage(
                    index: productIndex,
                    product: product,
                    onAddToCart: onAddToCart,
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: product['image'] is String
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  product['image'],
                                  fit: BoxFit.cover,
                                  width: 10,
                                ),
                              )
                            : Icon(product['image'], size: 10, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(product['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text("\$${product['price']}", style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final int index;
  final Map<String, dynamic> product;
  final Function(int) onAddToCart;

  const ProductDetailsPage({
    super.key,
    required this.index,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name'])),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: product['image'] is String
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        product['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                  : Icon(product['image'], size: 10, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(product['name'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Price: \$${product['price']}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text(
              "This is a detailed description of the product. It provides all necessary information like quality, category, and specifications.",
              style: TextStyle(color: Colors.grey),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  onAddToCart(index);
                  Navigator.pop(context);
                },
                child: const Text("Add to Cart"),
              ),
            )
          ],
        ),
      ),
    );
  }
}