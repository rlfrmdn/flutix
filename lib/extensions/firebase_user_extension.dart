part of 'extensions.dart';

extension FirebaseUserExtension on FirebaseUser {
  User convertToUser(
          {String name = 'No Name',
          List<String> selectedGenres,
          String selectedLanguage,
          int balance = 50000}) =>
      User(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  Future<User> fromFirestore() async => await UserServices.getUser(this.uid);
}
