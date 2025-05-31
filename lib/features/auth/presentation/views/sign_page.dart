import 'package:final_iti/features/home/presentation/views/home_page.dart';
import 'package:flutter/material.dart';

class SignPage extends StatelessWidget {
  SignPage({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final TextEditingController name = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  "SIGN UP",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffEF6494)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: name,
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return "Name cannot be null";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      filled: true,
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder()),
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
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  validator: (confirmpassword) {
                    if (confirmpassword == null || confirmpassword.isEmpty) {
                      return "Password cannot be null";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
                child: Row(
                  children: [
                    const Spacer(flex: 1),
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 13),
                      color: const Color(0xffEF6494),
                      onPressed: () {
                        if ((formKey.currentState as FormState).validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(userData: {
                                'name': name.text,
                                'email': email.text,
                                'profilePicture':
                                    'https://via.placeholder.com/100',
                              }),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
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
