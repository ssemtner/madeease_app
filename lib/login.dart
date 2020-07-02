import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:madeease_app/button.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = new GlobalKey<FormState>();
  String _email, _password, _errorMessage = '';
  bool _isLoginForm = false, _isLoading = false;

  void validateAndSubmit() {}

  void resetForm() {}

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          _errorMessage,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    } else {
      return Container(height: 0);
    }
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Email',
            icon: Icon(
              Icons.mail,
              color: Colors.grey,
            ),
          ),
          validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
          onSaved: (value) => _email = value.trim()),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            ),
          ),
          validator: (value) =>
              value.isEmpty ? 'Password can\'t be empty' : null,
          onSaved: (value) => _password = value.trim()),
    );
  }

  Widget showPrimaryButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MERaisedButton(
        height: 40.0,
        action: validateAndSubmit,
        text: _isLoginForm ? 'Login' : 'Create Account',
      ),
    );
  }

  Widget showSecondaryButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MESecondaryButton(
        height: 40.0,
        width: 20,
        action: toggleFormMode,
        text: _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
      ),
    );
  }

  Widget _showForm() {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          showEmailInput(),
          showPasswordInput(),
          showPrimaryButton(),
          showSecondaryButton(),
          showErrorMessage(),
        ],
      ),
    );
  }

  // To show loading indicator
  Widget _showProgressIndicator() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Container(
        height: 0,
        width: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 25),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                ),
                Hero(
                  tag: 'mLogo',
                  child: SvgPicture.asset(
                    'assets/logos/m.svg',
                    width: 50,
                  ),
                ),
                SizedBox(width: 25)
              ],
            ),
          ),
          Hero(
            tag: 'wave',
            child: SvgPicture.asset(
              'assets/waves/front.svg',
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Expanded(
            child: Container(
              // color: Theme.of(context).primaryColor,
              child: Stack(
                children: <Widget>[
                  _showForm(),
                  _showProgressIndicator(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
