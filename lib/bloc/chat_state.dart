import 'package:equatable/equatable.dart';
import 'package:fb_mess_app/model/models.dart';
import "package:meta/meta.dart";

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => null;
}

class ChatsUninittialized extends ChatState {}

class ChatsEmpty extends ChatState {}

class ChatsLoading extends ChatState {}

class ChatsLoaded extends ChatState {
  final List<User> chatList;
  final bool hasReachedMax;

  const ChatsLoaded({@required this.chatList, this.hasReachedMax})
      : assert(chatList != null);

  ChatsLoaded copyWith({List<User> chatList, bool hasReachedMax}) {
    return ChatsLoaded(
      chatList: chatList ?? this.chatList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [chatList, hasReachedMax];
}

class ChatsLoadError extends ChatState {}
