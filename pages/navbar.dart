import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kms/pages/add_product.dart';
import 'package:kms/pages/menu_page.dart';
import 'package:kms/pages/auth_service.dart';
import 'package:kms/pages/login_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String? accountName;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final user = await AuthService.getUser();
    final loggedIn = await AuthService.isLoggedIn();
    setState(() {
      isLoggedIn = loggedIn;
      accountName = user?['name'] ?? 'Guest';
    });
  }

  void _handleLogout() async {
    await AuthService.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
    _loadUser(); // Refresh the user state
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              accountName ?? 'Guest',
              style: GoogleFonts.dmSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              'Welcome!',
              style: GoogleFonts.dmSans(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('lib/images/girl.png')),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 155, 118, 242),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text(
              'Add Product',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProductScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              'Likes',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () => print('Likes tapped'),
          ),
          ListTile(
            leading: Icon(Icons.pending),
            title: Text(
              'Pending Orders',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () => print('Pending Orders tapped'),
          ),
          ListTile(
            leading: Icon(Icons.history_outlined),
            title: Text(
              'Order History',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () => print('Order History tapped'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(
              'Notifications',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () => print('Notification tapped'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () => print('Settings tapped'),
          ),
          ListTile(
            leading: Icon(isLoggedIn ? Icons.logout : Icons.login),
            title: Text(
              isLoggedIn ? 'Log Out' : 'Log In',
              style: GoogleFonts.dmSans(fontSize: 18, color: Colors.black),
            ),
            onTap: () {
              if (isLoggedIn) {
                _handleLogout();
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
