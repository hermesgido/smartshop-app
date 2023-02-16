import 'dart:convert';

import 'package:auth_app/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  var isLoading = false;
  bool isAuthenticated = false;
  String? errorMessage;

  //function to get idToken from shared_preferences
  Future _getidTokenFromPreferences() async {
    final idTokenInstance = await SharedPreferences.getInstance();
    final idToken = idTokenInstance.getString('idToken');
    return idToken;
  }

  Future get getidTokenFromPreferences => _getidTokenFromPreferences();

//remove id token from preferences function
  Future<void> _removeIdToken() async {
    final idToken = await SharedPreferences.getInstance();
    idToken.remove('idToken');
    notifyListeners();
  }

//remove token getter
  Future<void> removeIdToken() => _removeIdToken();

//get current user
  Future currentUser() async {
    try {
      final String idToken2 = await getidTokenFromPreferences;
      final url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyD2BVZAVU_0W7izVjvQYC0MN30UPjEFOi4');
      final my_users =
          await http.post(url, body: json.encode({'idToken': idToken2}));
      final users1 = json.decode(my_users.body);
      print(users1);
      final List<dynamic> users_list = users1['users'];
      final Map<String, dynamic> currentUser = users_list.first;
      print(currentUser['email']);
      isAuthenticated = true;
      notifyListeners();
      return currentUser['email'];
    } catch (e) {
      print(e);
    }
  }

//sihmup witn email and password
  Future signUp(BuildContext context, String email, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyD2BVZAVU_0W7izVjvQYC0MN30UPjEFOi4');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      isAuthenticated = true;
      notifyListeners();

      final responseData = json.decode(response.body);
      print(responseData['idToken']);

      final prefs = await SharedPreferences.getInstance();
      bool success = await prefs.setString('idToken', responseData['idToken']);

      if (success) {
        print('idToken successfully added to user preferences.');
      } else {
        print('Failed to add idToken to user preferences.');
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //logout userr

  Future signOut(BuildContext context) async {
    await removeIdToken();
    isAuthenticated = false;

    notifyListeners();
    Navigator.of(context).pop();
  }

  //signin user with email and passsword

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyD2BVZAVU_0W7izVjvQYC0MN30UPjEFOi4');

    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    if (response.statusCode == 200) {
      isAuthenticated = true;

      notifyListeners();
      final responseData = json.decode(response.body);
      print(responseData);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(
        'idToken',
        responseData['idToken'].toString(),
      );
      notifyListeners();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
    } else {
      var errorData = jsonDecode(response.body);
      String errorMessage1 = errorData['error']['message'].toString();
      if (errorMessage1 == 'INVALID_EMAIL') {
        errorMessage = 'Email not correct';
      }
      if (errorMessage1 == 'INVALID_PASSWORD') {
        errorMessage = 'Wrong information';
      }
      if (errorMessage1 == 'EMAIL_NOT_FOUND') {
        errorMessage = "User not found";
      }
      // display error message to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}
