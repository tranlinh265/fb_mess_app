import 'dart:async';

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
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    this._refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        BlocProvider.of<ChatBloc>(context).add(RefreshChats());

        return _refreshCompleter.future;
      },
      child: Center(
        child: BlocListener<ChatBloc, ChatState>(
          listener: (context, state) {
            // hide indicator when load complete or error
            if (state is! ChatsLoading) {
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
            }
          },
          child: BlocBuilder<ChatBloc, ChatState>(
            condition: (prev, next) {
              return !(prev is ChatsLoaded);
            },
            builder: (context, state) {
              if (state is ChatsEmpty) {
                return Text("Empty");
              }
              if (state is ChatsLoading) {
                return Text("Loading");
              }
              if (state is ChatsLoaded) {
                final chatList = state.chatList;
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
      ),
    );
  }
}
