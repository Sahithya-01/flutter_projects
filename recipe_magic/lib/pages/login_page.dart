import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _loginFormKey = GlobalKey();
  String? username, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _loginForm(),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      "RecipBook",
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w300),
    );
  }

  Widget _loginForm() {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.90,
        height: MediaQuery.sizeOf(context).height * 0.30,
        child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: "sony",
                onSaved: (value) {
                  setState(() {
                    username = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a username";
                  }
                  // return null;
                },
                decoration: InputDecoration(hintText: "Username"),
              ),
              TextFormField(
                initialValue: "12345",
                onSaved: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return "Please enter a valid Password";
                  }
                  // return null;
                },
                decoration: InputDecoration(hintText: "Password"),
              ),
              _loginButton(),
            ],
          ),
        ));
  }

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.60,
      child: ElevatedButton(
        child: const Text("Login"),
        onPressed: () {
          if (_loginFormKey.currentState?.validate() ?? false) {
            _loginFormKey.currentState?.save();
            print("$username-$password");
          }
        },
      ),
    );
  }
}
