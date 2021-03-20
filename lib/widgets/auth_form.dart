import 'package:aufgabe/widgets/button_widget.dart';
import 'package:aufgabe/pages/table_screen.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  const AuthForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _tryToAuth() {
      FocusScope.of(context).unfocus();

      // This function navigates to the table page if the form is valid, otherwise it does nothing and prints an error.
      if (_formKey.currentState.validate()) {
        Navigator.of(context).pushReplacementNamed(TablePage.routeName);
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              //actually this is an empty field. I added it just because because I wanted to make it as similar as possible to the example.
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Association code",
                  hintStyle: TextStyle(color: Colors.grey[400])),
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              validator: (value) {
                //validation the entered info. If an incorrect username is entered, an error is displayed, otherwise the verification succeeds.
                if (value.isEmpty) {
                  return 'Please enter the login';
                }
                if (value != 'Mustermann') {
                  return 'Incorrect login. Please check your credentials';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              key: ValueKey('login'),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Username of email address",
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              validator: (value) {
                //validation the entered info. If an incorrect password or nothing is entered, an error is displayed, otherwise the verification succeeds.
                if (value.isEmpty || value.length < 5) {
                  return 'Password must be at least 5 characters long.';
                }
                if (value != '12345') {
                  return 'Inncorect password. Please check your credentials';
                }
                return null;
              },
              obscureText: true,
              key: ValueKey("password"),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            //This uses one custom  button widget  for both login and registration
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ButtonWidget(title: 'Registration', hasBorder: true)),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: ButtonWidget(
                  title: 'Login',
                  hasBorder: false,
                  icon: Icons.login,
                  validation: _tryToAuth,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
