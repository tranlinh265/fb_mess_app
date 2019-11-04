import 'package:fb_mess_app/bloc/bloc.dart';
import 'package:fb_mess_app/repositories/repositories.dart';
import 'package:fb_mess_app/view/chat_widget/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();

  final UserRepository userRepository = UserRepository(
    userApiClient: UserApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(MyApp(
    userRepository: userRepository,
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("default"),
          ),
          body: BlocProvider(
            builder: (context) => ChatBloc(userRepository: this.userRepository)
              ..add(FetchChatAndStory()),
            child: ChatWidget(),
          ),
        ));
  }
}
