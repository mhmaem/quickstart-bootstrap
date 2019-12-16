import 'package:bootstrap/LoginScreen.dart';
import 'package:bootstrap/utils/SharedPreferencesManager.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //_logOut(context);
            SharedPreferencesManager.setSharedPreference(
                sharedPreferenceKey: "susername", sharedPreferenceValue: "");
            SharedPreferencesManager.setSharedPreference(
                sharedPreferenceKey: "spassword", sharedPreferenceValue: "");
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Text('Sign Out!'),
        ),
      ),
    );
  }
}


