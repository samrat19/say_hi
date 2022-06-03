import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:say_hi/logic/services/auth_service.dart';
import 'package:say_hi/logic/services/database_service.dart';
import 'package:say_hi/screens/authentication/splash_screen.dart';

setUpServiceLocator() {
  GetIt.instance.registerLazySingleton<AuthService>(() => AuthService());
}

Future<void> main() async {
  setUpServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().userAuthStream,
          initialData: null,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Say Hi',
      home: SplashScreen(),
    );
  }
}
