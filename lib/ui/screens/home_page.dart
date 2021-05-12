import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/core/futures/user_provider.dart';

class HomePage extends ConsumerWidget {
  final String id;
  HomePage({this.id});
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var model = watch(userProvider(id));
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: model.when(
        data: (user) => Center(
          child: Text(user),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, s) => Center(
          child: Text("error"),
        ),
      ),
    );
  }
}
