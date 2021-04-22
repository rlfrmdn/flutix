part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign Up
  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      // Send User Data to Firebase
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      // Save User Data To Firestore
      await UserServices.uppdateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(
        message: e.toString().split(',')[1].trim(),
      );
    }
  }

  // Sign In
  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = await result.user.fromFirestore();

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(
        message: e.toString().split(',')[1].trim(),
      );
    }
  }

  // Sign Out
  static Future<void> signOut() async {
    await _auth.signOut();
  }

  // Stream untuk mengetahui kondisi terkini autentikasi user
  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

class SignInSignUpResult {
  final User user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
