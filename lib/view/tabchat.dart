import 'package:fb_mess_app/bloc/tabchatbloc.dart';
import 'package:fb_mess_app/define.dart';
import 'package:fb_mess_app/model/user.dart';
import 'package:flutter/cupertino.dart';
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
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildSearchView(),
              _buildStoryList(),
              StreamBuilder(
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
              )
            ],
          )),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildStoryList() => SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              height: 90,
              width: 70,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage("http://placehold.it/32x32"),
                  ),
                  Text("Linh")
                ],
              ),
            );
          },
        ),
      );

  Widget _buildSearchView() => Row(
        children: <Widget>[
          Icon(Icons.search),
          Text("Search people, message"),
          FlatButton(
            child: Text("SMS"),
          )
        ],
      );

  BottomAppBar _buildBottomNavigationBar() => BottomAppBar(
          child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.people),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.near_me),
              onPressed: () {},
            )
          ],
        ),
      ));

  AppBar _buildAppBar() => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(13.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("http://placehold.it/32x32"),
          ),
        ),
        title: Text(ScreenName.CHAT_SCREEN),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              print("camera pressed");
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              print("new mess");
            },
          )
        ],
      );

  Widget _buildLoadingWidget() => Center(
        child: CircularProgressIndicator(),
      );

  Widget _buildChatListWidget(AsyncSnapshot<List<User>> snapshot) =>
      ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
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
