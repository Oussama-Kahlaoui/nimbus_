import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Username'),
              subtitle: Text('username'),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('email@example.com'),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              title: Text('Password settings'),
              subtitle: Text('********'),
              trailing: Icon(Icons.edit),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions),
            label: 'Directions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/directions');
          if (index == 1) Navigator.pushNamed(context, '/map');
        },
      ),
    );
  }
}
