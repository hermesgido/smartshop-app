

/* import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:auth_app/features/authentication/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool isLoading = false;

  Map<String, dynamic> _currentUser = {};

  bool get isAuthenticated => _isAuthenticated;
  Map<String, dynamic> get currentUser => _currentUser;

  Future<void> checkAuthentication() async {
    final idToken = await _getIdTokenFromSharedPreferences();

    if (idToken == null) {
      _isAuthenticated = false;
      notifyListeners();
      return;
    }
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:?key=AIzaSyD2BVZAVU_0W7izVjvQYC0MN30UPjEFOi4');

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'idToken': idToken}));

    final responseData = jsonDecode(response.body);

    if (responseData['users'] != null) {
      _isAuthenticated = true;
      _currentUser = responseData['users'][0];
    } else {
      _isAuthenticated = false;
      _currentUser = {};
    }
    notifyListeners();
  }

//signup user...
  Future<void> signUp(
      BuildContext context, String email, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyD2BVZAVU_0W7izVjvQYC0MN30UPjEFOi4');

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData.containsKey('error')) {
        throw HttpException(responseData['error']['message']);
      }

      _currentUser = responseData;
      _isAuthenticated = true;
      final _authTimer = Timer(
          Duration(seconds: int.parse(responseData['expiresIn'])), signOut);

      // Store the user data in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userData', json.encode(_currentUser));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } catch (error) {
      throw error;
    }
  }

  Future<void> signIn(String email, String password) async {
    bool _isLoading = true;

    notifyListeners();
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyD2BVZAVU_0W7izVjvQYC0MN30UPjEFOi4');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'email': email, 'password': password, 'returnSecureToken': true}));

    final responseData = jsonDecode(response.body);

    if (responseData['idToken'] != null) {
      _isAuthenticated = true;
      _currentUser = responseData;
      await _saveIdTokenToSharedPreferences(responseData['idToken']);
      notifyListeners();
      isLoading = false;
    }
  }

  Future<void> signOut() async {
    _isAuthenticated = false;
    _currentUser = {};
    await _removeIdTokenFromSharedPreferences();
    notifyListeners();
  }

  Future<String?> _getIdTokenFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('idToken');
  }

  Future<String?> get idTokenf async {
    return await _getIdTokenFromSharedPreferences();
  }

  Future<void> _saveIdTokenToSharedPreferences(String idToken) async {
    // Code to save id token to shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('idToken', idToken);
  }

  Future<void> _removeIdTokenFromSharedPreferences() async {
    // Code to remove id token from shared preferences
  }
}
 */