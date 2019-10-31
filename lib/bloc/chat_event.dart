import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class FetchChats extends ChatEvent {
  @override
  List<Object> get props => [];
}
