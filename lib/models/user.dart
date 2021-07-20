import './photo.dart';
class User{

  int id;
  String username;
  Photo? avatar;
  String firstName;
  String lastName;

  User({required this.id, required this.username, required this.firstName, required this.lastName, this.avatar});
}