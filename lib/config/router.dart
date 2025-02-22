import 'package:go_router/go_router.dart';
import 'package:todo/presentation/screens/splash_screen.dart';
import 'package:todo/presentation/screens/task_screen.dart';
import 'package:todo/presentation/screens/welcome_screen.dart';

class RouteName {
  static const splash = 'splash_screen';
 static const welcome='welcome_screen';
 static const task='Task_Screen';
}

final goRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => SplashScreen(),
    name: RouteName.splash,
   
  ),
   GoRoute(
    path: '/',
    builder: (context, state) => WelcomeScreen(),
    name: RouteName.welcome,
   
  ),
   GoRoute(
    path: '/',
    builder: (context, state) => TaskScreen(),
    name: RouteName.task,
  ),
]);
