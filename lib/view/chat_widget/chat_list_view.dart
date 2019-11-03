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
            leading: Container(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundImage: NetworkImage(chatList[position].avatar),
              ),
            ),
            title: Text(chatList[position].name),
            subtitle: Text(
              chatList[position].message,
              maxLines: 1,
            ),
            trailing: Container(
              child: Center(
                child: _buildTrailingWidget(chatList[position]),
              ),
              height: 20,
              width: 20,
            ),
          );
        });
  }

  Widget _buildTrailingWidget(User item) {
    if (item.isBlockNoti) {
      return Icon(Icons.notifications_off);
    }
    if (item.isRead) {
      return CircleAvatar(
        backgroundImage: NetworkImage(item.avatar),
      );
    }
    if (item.isSent) {
      return Icon(Icons.check_circle);
    }

    return null;
  }
}
