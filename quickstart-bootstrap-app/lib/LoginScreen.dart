import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:bootstrap/MainScreen.dart';
import 'package:bootstrap/apis/APIDirectory.dart';
import 'package:bootstrap/utils/SharedPreferencesManager.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

/*
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data, bool loginRequest) {
    print('Name: ${data.name}, Password: ${data.password}');
    if (loginRequest) {
      return APIDirectory.loginUser(
          username: data.name, password: data.password);
    } else {
      return APIDirectory.signupUser(
          username: data.name, password: data.password);
    }
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => executeAfterWholeBuildProcess(context));
    return FlutterLogin(
      title: 'Bootstrap',
      logo: 'assets/icon/qb.png',
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _authUser(loginData, true);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _authUser(loginData, false);
      },
      onSubmitAnimationCompleted: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      },
      onRecoverPassword: _recoverPassword,
    );
  }

  executeAfterWholeBuildProcess(BuildContext context) async {
    print("Login Screen Was Built!");

    String currentUsername = SharedPreferencesManager.getSharedPreference(
        sharedPreferenceKey: "susername")
        .toString();
    print("Current Username is : " + currentUsername);
    String currentPassword = SharedPreferencesManager.getSharedPreference(
        sharedPreferenceKey: "spassword")
        .toString();
    print("Current Password is : " + currentPassword);
    String currentDeviceToken = SharedPreferencesManager.getSharedPreference(
        sharedPreferenceKey: "sdevicetoken")
        .toString();
    print("Current Device Token is : " + currentDeviceToken);
    if (currentUsername.length > 0) {
      if ((await APIDirectory.loginUser(
          username: currentUsername, password: currentPassword)) ==
          null) {
        APIDirectory.updateUserDeviceToken(
            username: currentUsername,
            password: currentPassword,
            deviceToken: currentDeviceToken);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
    }
  }
}
*/

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data, bool loginRequest) {
    print('Name: ${data.name}, Password: ${data.password}');
    if (loginRequest) {
      return APIDirectory.loginUser(
          username: data.name, password: data.password);
    } else {
      return APIDirectory.signupUser(
          username: data.name, password: data.password);
    }
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => executeAfterWholeBuildProcess(context));
    return FlutterLogin(
      title: 'Bootstrap',
      logo: 'assets/icon/qb.png',
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _authUser(loginData, true);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _authUser(loginData, false);
      },
      onSubmitAnimationCompleted: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      },
      onRecoverPassword: _recoverPassword,
    );
  }

  executeAfterWholeBuildProcess(BuildContext context) async {
    print("Login Screen Was Built!");

    String currentUsername = SharedPreferencesManager.getSharedPreference(
        sharedPreferenceKey: "susername")
        .toString();
    print("Current Username is : " + currentUsername);
    String currentPassword = SharedPreferencesManager.getSharedPreference(
        sharedPreferenceKey: "spassword")
        .toString();
    print("Current Password is : " + currentPassword);
    String currentDeviceToken = SharedPreferencesManager.getSharedPreference(
        sharedPreferenceKey: "sdevicetoken")
        .toString();
    print("Current Device Token is : " + currentDeviceToken);
    if (currentUsername.length > 0) {
      if ((await APIDirectory.loginUser(
          username: currentUsername, password: currentPassword)) ==
          null) {
        APIDirectory.updateUserDeviceToken(
            username: currentUsername,
            password: currentPassword,
            deviceToken: currentDeviceToken);
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
    }
  }
}

