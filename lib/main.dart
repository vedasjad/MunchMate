import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmate/firebase_options.dart';
import 'package:munchmate/models/user.dart';
import 'package:munchmate/screens/home_screen.dart';
import 'package:munchmate/screens/login_screen.dart';
import 'package:munchmate/utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'MunchMate',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.ralewayTextTheme(),
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final currentUser = FirebaseAuth.instance.currentUser;
            if (currentUser != null) {
              user = LocalUser(
                id: currentUser.uid,
                name: currentUser.displayName!,
                email: currentUser.email!,
                photoURL: currentUser.photoURL!,
                favourites: [],
                lastOrders: [],
              );
            }
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
