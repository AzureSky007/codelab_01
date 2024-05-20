import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
              GoogleProvider(
                  clientId:
                      '674269754544-eek9h4u186enc5nc6v6pec8rgki7div0.apps.googleusercontent.com')
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                    aspectRatio: 1, child: Image.asset('flutterfire_300x.png')),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: action == AuthAction.signIn
                      ? const Text('Flutter Fire Sign In')
                      : const Text('Flutter Fire Sign Up'));
            },
            footerBuilder: (context, action) {
              return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'By signing in, you agree to the terms and conditions',
                    style: TextStyle(),
                  ));
            },
            sideBuilder: (context, shrinkOffSet) {
              return Padding(
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset('flutterfire_300x.png'),
                  ));
            },
          );
        }

        return const HomeScreen();
      },
    );
  }
}
