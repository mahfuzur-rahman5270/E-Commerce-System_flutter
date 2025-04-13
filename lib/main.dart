import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  String validEmail = "user";
  String validPassword = "1234";

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_emailController.text == validEmail &&
          _passwordController.text == validPassword) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainNavigationPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid email or password")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shopping_cart, size: 80, color: Colors.deepPurple),
              const SizedBox(height: 20),
              const Text("Welcome to MyShop",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text("Login to continue", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == null || value.isEmpty ? "Enter email" : null,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == null || value.isEmpty ? "Enter password" : null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Login"),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;
  final List<int> _cart = [];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addToCart(int index) {
    setState(() {
      _cart.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(onAddToCart: _addToCart),
      CartPage(initialCartItems: _cart),
      const ProfilePage(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
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
                                        width: 10, // ✅ Decreased image width
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
                                  width: 10, // ✅ Decreased image width
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartPage(initialCartItems: [index]),
                    ),
                  );
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



class CartPage extends StatefulWidget {
  final List<int> initialCartItems;

  const CartPage({super.key, required this.initialCartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<int> cartItems;

  final List<Map<String, dynamic>> productList = List.generate(
    20,
    (index) => {
      'name': 'Product ${index + 1}',
      'price': (index + 1) * 20,
      'imageColor': Colors.blue[(index + 1) * 100] ?? Colors.blue, // Color for each product
    },
  );

  @override
  void initState() {
    super.initState();
    cartItems = List.from(widget.initialCartItems);
  }

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(0, (sum, itemId) => sum + productList[itemId]['price']);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Clear Cart"),
                  content: const Text("Are you sure you want to clear the cart?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          cartItems.clear();
                        });
                        Navigator.pop(context);
                      },
                      child: const Text("Clear"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart, size: 100, color: Colors.grey),
                  const SizedBox(height: 20),
                  const Text("Your cart is empty!", style: TextStyle(fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage(onAddToCart: (index) {
                          setState(() {
                            cartItems.add(index);
                          });
                        })),
                      );
                    },
                    child: const Text("Start Shopping"),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final productId = cartItems[index];
                      final product = productList[productId];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        elevation: 4,
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: product['imageColor'] as Color, // Ensure type safety
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                (product['name'] as String).substring(0, 1), // Cast to String safely
                                style: const TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          title: Text(product['name'] as String), // Cast to String safely
                          subtitle: Text("Price: \$${product['price']}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Remove Item"),
                                  content: const Text("Are you sure you want to remove this item?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          cartItems.removeAt(index);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Remove"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Total: \$${total.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => CheckoutPage(total: total, cartItems: cartItems)),
                          );
                        },
                        child: const Text("Proceed to Checkout"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  final double total;
  final List<int> cartItems;

  const CheckoutPage({super.key, required this.total, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Cart Items: ",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...cartItems.map((itemId) {
              final product = {
                'name': 'Product ${itemId + 1}',
                'price': (itemId + 1) * 20,
                'imageColor': Colors.blue[(itemId + 1) * 100] ?? Colors.blue,
              };
              return ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: product['imageColor'] as Color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      (product['name'] as String).substring(0, 1),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                title: Text(product['name'] as String),
                subtitle: Text("Price: \$${product['price']}"),
              );
            }),
            const SizedBox(height: 20),
            Text(
              "Total: \$${total.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Order Completed"),
                    content: const Text("Thank you for your purchase!"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context); // Go back to CartPage or HomePage
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Complete Purchase"),
            ),
          ],
        ),
      ),
    );
  }
}


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture and Basic Info
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple.shade100,
              child: const Icon(Icons.person, size: 50, color: Colors.deepPurple),
            ),
            const SizedBox(height: 10),
            const Text("John Doe", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("user@example.com", style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 30),

            // Account Options
            ProfileTile(
              icon: Icons.shopping_bag,
              title: "My Orders",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MyOrdersPage()),
                );
              },
            ),
            ProfileTile(
              icon: Icons.location_on,
              title: "Address Book",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddressBookPage()),
                );
              },
            ),
            ProfileTile(
              icon: Icons.credit_card,
              title: "Payment Methods",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PaymentMethodsPage()),
                );
              },
            ),
            ProfileTile(
              icon: Icons.favorite,
              title: "Wishlist",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const WishlistPage()),
                );
              },
            ),

            const Divider(height: 40),

            // Settings
            ProfileTile(
              icon: Icons.settings,
              title: "Account Settings",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AccountSettingsPage()),
                );
              },
            ),
            ProfileTile(
              icon: Icons.support_agent,
              title: "Help & Support",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HelpSupportPage()),
                );
              },
            ),
            ProfileTile(
              icon: Icons.privacy_tip,
              title: "Privacy Policy",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PrivacyPolicyPage()),
                );
              },
            ),

            const Divider(height: 40),

            // Logout
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()), // Your existing LoginPage
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

// Sample pages for navigation
class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Orders")),
      body: const Center(child: Text("This is the My Orders page.")),
    );
  }
}

class AddressBookPage extends StatelessWidget {
  const AddressBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Address Book")),
      body: const Center(child: Text("This is the Address Book page.")),
    );
  }
}

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Methods")),
      body: const Center(child: Text("This is the Payment Methods page.")),
    );
  }
}

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      body: const Center(child: Text("This is the Wishlist page.")),
    );
  }
}

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account Settings")),
      body: const Center(child: Text("This is the Account Settings page.")),
    );
  }
}

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help & Support")),
      body: const Center(child: Text("This is the Help & Support page.")),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy")),
      body: const Center(child: Text("This is the Privacy Policy page.")),
    );
  }
}