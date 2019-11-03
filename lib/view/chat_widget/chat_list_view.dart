import 'package:fb_mess_app/model/user.dart';
import 'package:flutter/material.dart';

class ChatListView extends StatelessWidget {
  final List<User> chatList;

  const ChatListView({Key key, this.chatList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, position) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chatList[position].avatar),
            ),
            title: Text(chatList[position].name),
            subtitle: Text(chatList[position].message),
          );
        });
  }
}
