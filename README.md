# codelab_01

A Flutter Project built with the help of [this guide](https://firebase.google.com/codelabs/firebase-auth-in-flutter-apps#0)

---

# <u>Project setup</u>

- Add Project in Firebase console

- Enable Email sign under the Sign in methods tab in Authentication, which can be seen in the Build menu

- Create app in IDE

- In a new window in the terminal, run 
```
firebase login 
```

- Test connection by running 
``` 
firebase projects:list 
```

- Run following command in global directory
```
dart pub global activate flutterfire_cli
```

- Run following command in project directory
```
flutterfire --help
```

- Follow it by running this in project directory
```
flutterfire configure
```

- '**firebase_options.dart**' will be added

- Run following commands to remove any errors 
``` 
flutter pub add firebase_core

flutter pub add firebase_auth

flutter pub add firebase_ui_auth
```

---

#  <u>main.dart File</u>

```
  WidgetsFlutterBinding.ensureInitialized(); 
```
- Tells app not to start running till Flutter framework is completely booted

```
  await Firebase.initializeApp(                               
    options: DefaultFirebaseOptions.currentPlatform,
  );
``` 
- Sets up a connection between Firebase and Flutter

- Default Firebase Options are imported from the generated firebase_options.dart

---

#  <u>app.dart File</u>

- Acts as a landing page, and ensures that user is authenticated before proceeding

```
return MaterialApp(
  ...
)
```

- FlutterFire UI requires application wrapped in either a MaterialApp or Cupertino App 



---

# <u>auth_gate.dart File</u>

- Stream Builder rebuilds the widget tree everytime new data is observed in the stream

```
    return StreamBuilder<User?>(
        ...
    );
```

- 'User?' indicates stream can potentially emit null values

- We use the Firebase Auth plugin to listen for any changes 
- The stream we use is 
```
stream: FirebaseAuth.instance.authStateChanges()
```

- It is from the Firebase Authentication Library

- The builder is
```
      builder: (context, snapshot) {
            ...
        }
```

- context takes in the BuildContext of AuthGate
- snapshot takes latest data emitted from the stream

```
    if (!snapshot.hasData) {
        return SignInScreen(
        providers: [],
        );
```
- The if loop checks if snapshot has data
- If data is found, it returns the Sign In screen widget
- Providers is an empty list, but could be used to specify authentication providers like Google or Facebook

```
return const HomeScreen();
```
- Renders Home Screen if user is signed in, otherwise renders Sign In screen




---

```
flutter pub add google_sign_in
```

```
flutter pub add firebase_ui_oauth_google
```

