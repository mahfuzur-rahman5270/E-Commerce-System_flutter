import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.deepPurple.shade100,
            child: const Icon(Icons.person, size: 50, color: Colors.deepPurple),
          ),
          const SizedBox(height: 10),
          const Text("John Doe", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Text("user@example.com", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 30),
          ProfileTile(icon: Icons.shopping_bag, title: "My Orders", onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const MyOrdersPage()));
          }),
          ProfileTile(icon: Icons.location_on, title: "Address Book", onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AddressBookPage()));
          }),
          ProfileTile(icon: Icons.credit_card, title: "Payment Methods", onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentMethodsPage()));
          }),
          ProfileTile(icon: Icons.favorite, title: "Wishlist", onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const WishlistPage()));
          }),
          const Divider(height: 40),
          ProfileTile(icon: Icons.settings, title: "Account Settings", onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AccountSettingsPage()));
          }),
          ProfileTile(icon: Icons.support_agent, title: "Help & Support", onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HelpSupportPage()));
          }),
          ProfileTile(icon: Icons.privacy_tip, title: "Privacy Policy", onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const PrivacyPolicyPage()));
          }),
          const Divider(height: 40),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
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
        ]),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const ProfileTile({super.key, required this.icon, required this.title, required this.onTap});
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

// Sample Pages
class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("My Orders")), body: const Center(child: Text("This is the My Orders page.")));
  }
}
class AddressBookPage extends StatelessWidget {
  const AddressBookPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Address Book")), body: const Center(child: Text("This is the Address Book page.")));
  }
}
class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Payment Methods")), body: const Center(child: Text("This is the Payment Methods page.")));
  }
}
class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Wishlist")), body: const Center(child: Text("This is the Wishlist page.")));
  }
}
class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Account Settings")), body: const Center(child: Text("This is the Account Settings page.")));
  }
}
class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Help & Support")), body: const Center(child: Text("This is the Help & Support page.")));
  }
}
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Privacy Policy")), body: const Center(child: Text("This is the Privacy Policy page.")));
  }
}
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Login Page")), body: const Center(child: Text("Login Page UI here")));
  }
}
