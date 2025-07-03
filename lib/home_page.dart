import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'post_confession.dart';
import 'confession_list.dart';
import 'moderator_login.dart';
import 'moderator_dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getModeratorScreen() {
    return StreamBuilder<User?>(
      stream: _auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return const ModeratorDashboardScreen();
        } else {
          return const ModeratorLoginScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const PostConfessionScreen(),
      const ConfessionListScreen(),
      _getModeratorScreen(),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Post'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Confessions'),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Moderator',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
