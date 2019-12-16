import 'package:bootstrap/utils/SharedPreferencesManager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';

//void main() => runApp(MyApp());
void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesManager.initSharedPreferences();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.getToken().then((tokenID) => print('Device Token : ' + tokenID));

  SharedPreferencesManager.setSharedPreference(sharedPreferenceKey: "sdevicetoken", sharedPreferenceValue: await _firebaseMessaging.getToken());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.orange,
        cursorColor: Colors.orange,
        textTheme: TextTheme(
          display2: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            color: Colors.orange,
          ),
          button: TextStyle(
            fontFamily: 'OpenSans',
          ),
          subhead: TextStyle(fontFamily: 'NotoSans'),
          body1: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      home: LoginScreen(),
    );
  }
}