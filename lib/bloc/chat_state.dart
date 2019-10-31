import 'package:equatable/equatable.dart';
import 'package:fb_mess_app/model/models.dart';
import "package:meta/meta.dart";

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => null;
}

class ChatsEmpty extends ChatState {}

class ChatsLoading extends ChatState {}

class ChatsLoaded extends ChatState {
  final List<User> chatList;

  const ChatsLoaded({@required this.chatList}) : assert(chatList != null);

  @override
  List<Object> get props => [chatList];
}

class ChatsLoadError extends ChatState {}
