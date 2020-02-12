import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    labelText: 'username or email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(10.0),
                    color: Colors.pink,
                    textColor: Colors.white,
                    splashColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text('Login'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(10.0),
                    color: Colors.white,
                    textColor: Colors.pink,
                    splashColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.pink),
                    ),
                    child: Text('Sign Up'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
