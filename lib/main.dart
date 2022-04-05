import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_beginng/redux/middleware.dart';
import 'package:redux_beginng/redux/store.dart';
import 'package:redux_beginng/screens/home-screen.dart';

import 'redux/reducers.dart';

void main() {
  Store<AppState> _store = Store<AppState>(reducers,
      initialState: AppState.initial(), middleware: [appStateMiddleWare]);
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  Store<AppState> store;
  MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
