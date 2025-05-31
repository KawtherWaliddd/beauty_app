import 'package:final_iti/features/Onboboarding/presentation/views/onboarding_view.dart';
import 'package:final_iti/features/auth/presentation/views/login_page.dart';
import 'package:final_iti/features/auth/presentation/views/sign_page.dart';
import 'package:final_iti/features/home/presentation/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? false;

  runApp(MyApp(onboarding: onboarding));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({super.key, this.onboarding = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffEF6494),
        ),
        useMaterial3: true,
      ),
      home: onboarding ? SignPage() : const OnboardingView(),
      routes: {
        '/home': (context) {
          final userData = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>?;
          return HomeScreen(userData: userData);
        },
        '/login': (context) => LoginPage(),
      },
    );
  }
}
