import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
   createState() {
     return new LoginScreenState();
   }
}

class LoginScreenState extends State<LoginScreen> {
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }
  Widget emailField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'example@example.com'
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget passwordField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'password',
      ),
      obscureText: true,
    );
  }

  Widget submitButton(){
    return RaisedButton(
      color: Colors.blue[400],
      onPressed:() {print('hello');},
      child: Text('Submit'),
    );
  }
}