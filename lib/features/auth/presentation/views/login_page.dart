import 'package:final_iti/features/auth/presentation/views/sign_page.dart';
import 'package:final_iti/features/home/presentation/views/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<Map<String, dynamic>?> _validateUser() async {
    if (email.text == 'test@example.com' && password.text == 'password') {
      return {
        'name': 'Test User',
        'email': email.text,
        'profilePicture': 'https://via.placeholder.com/100',
      };
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                color: const Color(0xffEF6494),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15),
                  child: IconButton(
                    icon: const Icon(Icons.menu, size: 40, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffEF6494)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: email,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return "Email cannot be null";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      filled: true,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return "Password cannot be null";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Don'nt Have Account ?",
                        style:
                            TextStyle(color: Color(0xffEF6494), fontSize: 16),
                      ),
                    ),
                    const Spacer(flex: 1),
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 13),
                      color: const Color(0xffEF6494),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignPage();
                        }));
                      },
                      child: const Text(
                        "Sign UP",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                width: double.infinity,
                height: 80,
                child: MaterialButton(
                  color: const Color(0xffEF6494),
                  onPressed: () async {
                    if ((formKey.currentState as FormState).validate()) {
                      final userData = await _validateUser();
                      if (userData != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(userData: userData),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Invalid email or password.'),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
