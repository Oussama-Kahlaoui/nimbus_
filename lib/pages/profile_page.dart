import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  String email = '';
  String password = '********';

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      email = user!.email ?? '';
    }
  }

  Future<void> _changeEmail(BuildContext context) async {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Email'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Enter new email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Enter current password'),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              try {
                // Reauthenticate the user
                AuthCredential credential = EmailAuthProvider.credential(
                  email: user!.email!,
                  password: passwordController.text,
                );
                await user!.reauthenticateWithCredential(credential);

                // Update email
                await user!.updateEmail(emailController.text);
                await user!.reload();
                user = FirebaseAuth.instance.currentUser;

                setState(() {
                  email = user?.email ?? '';
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Email updated successfully')),
                );
              } catch (e) {
                print('Failed to change email: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to change email: $e')),
                );
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _changePassword(BuildContext context) async {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmNewPasswordController =
        TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: currentPasswordController,
              decoration: InputDecoration(hintText: 'Enter current password'),
              obscureText: true,
            ),
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(hintText: 'Enter new password'),
              obscureText: true,
            ),
            TextField(
              controller: confirmNewPasswordController,
              decoration: InputDecoration(hintText: 'Confirm new password'),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (newPasswordController.text !=
                  confirmNewPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('New passwords do not match')),
                );
                return;
              }

              try {
                // Reauthenticate the user
                AuthCredential credential = EmailAuthProvider.credential(
                  email: user!.email!,
                  password: currentPasswordController.text,
                );
                await user!.reauthenticateWithCredential(credential);

                // Update password
                await user!.updatePassword(newPasswordController.text);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Password updated successfully')),
                );
              } catch (e) {
                print('Failed to change password: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to change password: $e')),
                );
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Email', style: TextStyle(color: Colors.white)),
              subtitle: Text(email, style: TextStyle(color: Colors.white70)),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: Colors.white70),
                onPressed: () => _changeEmail(context),
              ),
            ),
            ListTile(
              title: Text('Password', style: TextStyle(color: Colors.white)),
              subtitle: Text(password, style: TextStyle(color: Colors.white70)),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: Colors.white70),
                onPressed: () => _changePassword(context),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Correct parameter
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
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
