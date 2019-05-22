import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';
class LoginScreen extends StatefulWidget {
   createState() {
     return new LoginScreenState();
   }
}
// with statement is used to bring ValidationMixin class properties and methods to LoginScreenState class
class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  // Global key allows me to check state of a stateful widget.
  // Here I'm creating an instance GlobalKey of type FormState
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
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
      validator: validateEmail,
      onSaved: (currentValue) {
        email = currentValue;
      },
    );
  }

  Widget passwordField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'password',
      ),
      obscureText: true,
      validator: validatePassword,
      onSaved: (currentValue) {
        password = currentValue;
      },
    );
  }

  Widget submitButton(){
    return RaisedButton(
      color: Colors.blue[200],
      onPressed:() {

        if (formKey.currentState.validate()){
          //validate returns a boolean, so if everything is ok, we are saving the state
          //really not saved but passed into each TextField within the form and with the
          //onSaved function implementation, we can manipulate the data of that TextField
          //individually
          formKey.currentState.save();
          //adding instance variables i can get both or all TextFields from the form at once
          print('Time to post $email and $password to the API');
        }

      },
      child: Text('Submit'),
    );
  }
}