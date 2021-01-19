import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduatio_project103/Screens/signIn.dart';
import 'package:graduatio_project103/Screens/signUp.dart';
import 'package:graduatio_project103/Services/authentication.dart';
import 'package:provider/provider.dart';
import 'Screens/signUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EduCergie',
        theme: ThemeData.light(),
        initialRoute: 'sign in',
        routes: {
          'sign in': (context) => SignIn(),
          'sign up': (context) => SignUp(),
        },
        home: SignUp(),
      ),
    );
  }
}
