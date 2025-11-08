import 'package:final_iti/features/Onboboarding/data/models/onboarding_info.dart';


class OnboardingItems {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Welcome",
        descriptions:
            "Welcome to [Your Beauty]! Let's get started,Discover the best of [Your Beauty]",
        image: "assets/onboarding1.gif"),
    OnboardingInfo(
        title: "Feature Highlights",
        descriptions: "Stay connected with the world in one app."
            "Easily manage your tasks with a few taps."
            "Personalize your experience like never before.",
        image: "assets/onboarding2.gif"),
    OnboardingInfo(
        title: "User Benefits",
        descriptions: "Unlock exclusive features just for you!"
            "Achieve more with our seamless tools."
            "Your journey to [desired outcome] starts here.",
        image: "assets/onboarding3.gif"),
    OnboardingInfo(
        title: "Are you ready ?",
        descriptions: "You're all set! Let's dive in."
            "Ready to explore? Tap to continue.",
        image: "assets/onboarding4.gif"),
  ];
}
