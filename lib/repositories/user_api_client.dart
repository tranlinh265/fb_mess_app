import 'dart:convert';
import 'package:fb_mess_app/model/models.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class UserApiClient {
  static const baseUrl = "http://www.json-generator.com";
  final http.Client httpClient;

  UserApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<User>> fetchChatList() async {
    final chatListUrl = "$baseUrl/api/json/get/bUfXNwEOXm?indent=2";

    final chatListResponse = await this.httpClient.get(chatListUrl);

    if (chatListResponse.statusCode != 200) {
      throw Exception('Error when getting user list');
    }

    final data = json.decode(chatListResponse.body) as List;

    return data.map((raw) => User.fromJson(raw)).toList();
  }

  Future<List<Story>> fetchStoryList() async{
    final storyFetchUrl = "$baseUrl/api/json/get/cgazxfeAKq?indent=2";

    final response = await this.httpClient.get(storyFetchUrl);

    if(response.statusCode != 200){
      throw Exception('Error');
    }

    final data = json.decode(response.body) as List;

    return data.map((raw) => Story.fromJson(raw)).toList();
  }
}

