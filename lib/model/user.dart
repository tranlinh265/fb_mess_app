import 'package:equatable/equatable.dart';

class User extends Equatable {
  final name;
  final avatar;
  final message;

  User({this.name, this.avatar, this.message});

  static User fromJson(dynamic json) {
    return User(
      name: json["name"],
      avatar: json["picture"],
      message: json["greeting"],
    );
  }

  @override
  List<Object> get props => [name, avatar, message];
}
