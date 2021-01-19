import 'package:flutter/material.dart';
import 'package:graduatio_project103/Screens/signUp.dart';
import '../shared_widgets/custombutton.dart';
import './signUp.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Hero(
                //  tag: 'logo',
                //  child: Container(
                //    width: 100.0,
                //    child: Icon(Icons.add_box),
                //  ),
                //),
                Text(
                  "Edu Cergie",
                  style: TextStyle(
                    fontSize: 50.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter UserName please';
                } else if (value.length < 4) {
                  return 'UserName must consist of at least 4 characters';
                } else {
                  return null;
                }
              },
              //onSaved: (value) => userName = value,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'please enter your password';
                } else {
                  return null;
                }
              },
              //onSaved: (value) => userName = value,
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              text: "Log In",
              callback: () {
                // Navigator.of(context).pushNamed(Login.id);
              },
            ),
            CustomButton(
              text: "Register",
              callback: () {
                Navigator.pushNamed(context, 'sign up');
              },
            )
          ],
        ),
      ),
    );
  }
}
