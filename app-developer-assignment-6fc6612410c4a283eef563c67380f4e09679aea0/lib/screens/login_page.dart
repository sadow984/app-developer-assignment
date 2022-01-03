import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/constants/contants.dart';
import 'package:project/screens/home_page.dart';
import 'package:project/utils/preference.dart';
import 'package:project/widgets/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController, _passwordController;
  late bool enableButton;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _usernameController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    enableButton = false;
    _formKey = GlobalKey();
    super.initState();
  }

  void enableLoginButton() {
    setState(() {
      enableButton = _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  bool? validate() {
    return _formKey.currentState?.validate();
  }

  void login() async {
    var user = _usernameController.text;
    var password = _passwordController.text;

    bool found = false;
    var index = -1;
    for (int i = 0; i < Constants.users.length; i++) {
      if (user == Constants.users[i]) {
        found = true;
        index = i;
      }
    }

    if (!found) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Error"),
          content: Text("Invalid user. Please cross check enter details."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );
      return;
    } else {
      if (Constants.passwords[index] != password) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Error"),
            content: Text("Wrong password."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Ok"),
              ),
            ],
          ),
        );
        return;
      }
    }

    await Preference.setLoggedIn(true);
    Get.offAll(HomePage());
  }

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Logo(),
                TextFormField(
                  onChanged: (_) {
                    enableLoginButton();
                  },
                  controller: _usernameController,
                  decoration: InputDecoration(
                    label: Text("Enter username"),
                  ),
                  validator: (value) {
                    if (value!.length < 3) {
                      return "User name should be grater than 3 characters.";
                    } else if (value.length > 11) {
                      return "User name should be less than 11 characters.";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  onChanged: (_) {
                    enableLoginButton();
                  },
                  controller: _passwordController,
                  decoration: InputDecoration(
                    label: Text("Enter password"),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.length < 3) {
                      return "Password should be grater than 3 characters.";
                    } else if (value.length > 11) {
                      return "Password should be less than 11 characters.";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: enableButton
                        ? () {
                            if (validate() != null && validate()!) {
                              login();
                            }
                          }
                        : null,
                    child: Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
