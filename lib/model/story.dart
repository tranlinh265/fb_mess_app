import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final photo;
  final isSeen;

  Story({this.photo, this.isSeen});

  static Story fromJson(dynamic json) {
    return Story(
      photo: json["photo"],
      isSeen: json["isSeen"],
    );
  }

  @override
  List<Object> get props => [this.photo, this.isSeen];
}
