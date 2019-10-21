import 'package:fb_mess_app/model/user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class TabChatBloc {
  Observable<List<User>> get userListObservable;

  void dispose();

  void getUserList();
}

class TabChatBlocImpl implements TabChatBloc {
  BehaviorSubject<List<User>> _behaviorSubject;
  List<User> _userList = [];

  TabChatBlocImpl() {
    this._behaviorSubject =
        new BehaviorSubject<List<User>>.seeded(this._userList);
  }

  @override
  Observable<List<User>> get userListObservable => _behaviorSubject.stream;

  @override
  void dispose() {
    _behaviorSubject.close();
  }

  @override
  void getUserList() async {
    final respose = await http
        .get("http://www.json-generator.com/api/json/get/cfLKbVWkKq?indent=2");

    if (respose.statusCode == 200) {
      var responseData = json.decode(respose.body);
      _userList.clear();
      for (var user in responseData) {
        _userList.add(User.fromJson(user));
      }
      _behaviorSubject.sink.add(_userList);
    }
  }
}