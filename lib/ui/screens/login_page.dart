import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/core/view_models/auth_view_model/auth_view_model_provider.dart';
import 'package:riverpod_demo/ui/screens/home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authModel = context.read(authViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            onChanged: (v) {
              authModel.email = v;
            },
          ),
          TextField(
            onChanged: (v) {
              authModel.password = v;
            },
          ),
          Consumer(
            builder: (conetxt, watch, child) {
              var model = watch(authViewModelProvider);
              return model.loading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      child: Text("Login"),
                      onPressed: () async {
                        String id = await model.login();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              id: id,
                            ),
                          ),
                        );
                      },
                    );
            },
          )
        ],
      ),
    );
  }
}
