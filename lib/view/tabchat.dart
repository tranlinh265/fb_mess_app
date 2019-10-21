import 'package:fb_mess_app/bloc/tabchatbloc.dart';
import 'package:fb_mess_app/model/user.dart';
import 'package:flutter/material.dart';

class TabChatWidget extends StatefulWidget {
  @override
  _TabChatWidgetState createState() => _TabChatWidgetState();
}

class _TabChatWidgetState extends State<TabChatWidget> {
  TabChatBloc _tabChatBloc = new TabChatBlocImpl();

  @override
  void initState() {
    super.initState();
    if (_tabChatBloc != null) {
      _tabChatBloc.getUserList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sample app'),
      ),
      body: Center(
          child: StreamBuilder(
        stream: _tabChatBloc.userListObservable,
        builder: (context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            return _buildChatListWidget(snapshot);
          } else if (snapshot.hasError) {
            return _buildErrorWidget();
          } else {
            return _buildLoadingWidget();
          }
        },
      )),
    );
  }

  Widget _buildLoadingWidget() => Center(
        child: CircularProgressIndicator(),
      );

  Widget _buildChatListWidget(AsyncSnapshot<List<User>> snapshot) =>
      ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, position) {
            return ListTile(
              title: Text(snapshot.data[position].name),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(snapshot.data[position].avatar),
              ),
              subtitle: Text(snapshot.data[position].message),
            );
          });

  Widget _buildErrorWidget() => Text("Error");

  @override
  void dispose() {
    _tabChatBloc.dispose();
    super.dispose();
  }
}
