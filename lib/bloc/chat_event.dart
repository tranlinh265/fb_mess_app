import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class FetchChatAndStory extends ChatEvent {}

class RefreshChats extends ChatEvent {}

class FetchChat extends ChatEvent{}