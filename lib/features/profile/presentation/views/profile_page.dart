import 'package:final_iti/features/auth/presentation/views/login_page.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic>? userData;

  const ProfileScreen({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xffEF6494),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage(
                userData?['profilePicture'] ??
                    'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_640.png',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              userData?['name'] ?? 'User Name',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              userData?['email'] ?? 'user@example.com',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 23),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffEF6494),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text('Upgrade to PRO'),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  const ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Privacy',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.history),
                    title: Text('Purchase History',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help & Support',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  const ListTile(
                    leading: Icon(Icons.person_add),
                    title: Text('Invite a Friend',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false,
                      );
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
