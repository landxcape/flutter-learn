import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[50]
              : null),
      home: Scaffold(
        body: Center(
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
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(10.0),
                      color: Colors.transparent,
                      textColor: Colors.pink,
                      splashColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(2.0),
                    child: ButtonTheme(
                      minWidth: 200.0,
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/homepage');
                        },
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
        ),
      ),
    );
  }
}
