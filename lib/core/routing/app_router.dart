import 'package:gpt_app/features/chat/ui/screens/home_screen.dart';
import 'package:gpt_app/features/chat/ui/screens/messages_screen.dart';
import 'package:flutter/material.dart';
import 'package:gpt_app/features/onbording_screen/onboarding_screen.dart';
import 'package:gpt_app/splash_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {

      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.messagesScreen:
        return MaterialPageRoute(
          builder: (_) => MessagesScreen(chatName: settings.arguments as String,),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
