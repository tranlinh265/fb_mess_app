import 'package:fb_mess_app/bloc/bloc.dart';
import 'package:fb_mess_app/view/chat_widget/chat_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Default"),
      ),
      body: Center(
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is ChatsEmpty) {
              return Text("Empty");
            }
            if (state is ChatsLoading) {
              return Text("Loading");
            }
            if (state is ChatsLoaded) {
              final chatList = state.chatList;
              print(state.chatList);
              return ChatListView(
                chatList: chatList,
              );
            }
            if (state is ChatsLoadError) {
              return Text('error');
            }
            return Text("default");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          BlocProvider.of<ChatBloc>(context).add(FetchChats());
        },
      ),
    );
  }
}
