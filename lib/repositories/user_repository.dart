import 'package:fb_mess_app/model/models.dart';
import 'package:fb_mess_app/repositories/user_api_client.dart';
import 'dart:async';

class UserRepository {
  final UserApiClient userApiClient;

  UserRepository({this.userApiClient}) : assert(userApiClient != null);

  Future<List<User>> getChatList() async {
    return await userApiClient.fetchChatList();
  }

  Future<List<Story>> getStoryList() async {
    return await userApiClient.fetchStoryList();
  }
}
