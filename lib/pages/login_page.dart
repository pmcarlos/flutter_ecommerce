import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _obscureText = true;

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _buildTitle(),
                  _buildEmailInput(),
                  _buildPasswordInput(),
                  _buildRegisterActions()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Login',
      style: Theme.of(context).textTheme.headline,
    );
  }

  Widget _buildEmailInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _email = val,
        validator: (val) => !val.contains('@') ? 'Invalid email' : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
          hintText: 'Enter a valid email',
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Padding _buildPasswordInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _password = val,
        validator: (val) => val.length < 6 ? 'Password too short' : null,
        obscureText: _obscureText,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          border: OutlineInputBorder(),
          labelText: 'Password',
          hintText: 'Enter password, min length 6',
          icon: Icon(
            Icons.lock,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Padding _buildRegisterActions() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(
              'Sumbit',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.black),
            ),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: _submit,
          ),
          FlatButton(
            child: Text('New user? Register'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/register');
            },
          )
        ],
      ),
    );
  }
}
