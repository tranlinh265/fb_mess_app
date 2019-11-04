import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fb_mess_app/model/models.dart';
import 'package:fb_mess_app/repositories/user_repository.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final UserRepository userRepository;

  ChatBloc({@required this.userRepository}) : assert(userRepository != null);

  @override
  ChatState get initialState => ChatsUninittialized();

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    if (event is FetchChatAndStory || event is RefreshChats) {
      yield ChatsLoading();

      try {
        final List<User> chatlist = await userRepository.getChatList();
        final List<Story> storyList = await userRepository.getStoryList();

        if (chatlist.isEmpty) {
          yield ChatsEmpty();
        }
        yield ChatsLoaded(chatList: chatlist, storyList: storyList);
      } catch (_) {
        yield ChatsLoadError();
      }
    }
  }
}
