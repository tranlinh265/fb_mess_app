import 'package:fb_mess_app/bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabChatWidget extends StatefulWidget {
  @override
  _TabChatWidgetState createState() => _TabChatWidgetState();
}

class _TabChatWidgetState extends State<TabChatWidget> {
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
              print(state.chatList);
              return Text("Loaded");
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
