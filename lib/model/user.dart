import 'package:equatable/equatable.dart';

class User extends Equatable {
  final name;
  final avatar;
  final message;
  final isRead;
  final isSent;
  final isBlockNoti;
  final lastMsgTime;

  User(
      {this.name,
      this.avatar,
      this.message,
      this.isRead,
      this.isSent,
      this.isBlockNoti,
      this.lastMsgTime});

  static User fromJson(dynamic json) {
    return User(
      name: json["name"],
      avatar: json["picture"],
      message: json["greeting"],
      isRead: json["isRead"],
      isSent: json["isSent"],
      isBlockNoti: json["isBlockNoti"],
      lastMsgTime: json["lastMsgTime"],
    );
  }

  @override
  List<Object> get props => [name, avatar, message];
}
