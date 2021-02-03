import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:graduatio_project103/Screens/admin_page.dart';
import 'package:graduatio_project103/Screens/users_page.dart';
import 'package:graduatio_project103/Services/authentication.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formkey = GlobalKey<FormState>();

  String userName = '';

  String email = '';

  String password = '';

  String role = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('this is an app'),
      ),
      body: Form(
        key: formkey,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'UserName',
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
                  height: 16,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      final pattern =
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

                      final regExp = RegExp(pattern);

                      if (value.isEmpty) {
                        return 'Enter an Email please';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Enter a valid Email please';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.name,
                    onSaved: (value) {
                      email = value;
                      FocusScope.of(context).nextFocus();
                    }),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Password please';
                    } else if (value.length < 4) {
                      return 'Password must be at least 7 characters';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => password = value,
                  obscureText: true,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'role',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter role please';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => role = value,
                ),
                SizedBox(
                  height: 16,
                ),
                DropDownField(
                  controller: dropDown,
                  hintText: 'select a year',
                  enabled: true,
                  items: fac_years,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Faculty ID',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter your Faculty ID please';
                    } else {
                      return null;
                    }
                  },
                  //onSaved: (value) => userName = value,
                ),
                SizedBox(
                  height: 25.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    final isValid = formkey.currentState.validate();
                    FocusScope.of(context).unfocus();
                    if (isValid) {
                      formkey.currentState.save();
                    }
                    (context)
                        .read<AuthenticationService>()
                        .signUp(email: email, password: password, role: role);
                    if (role == 'admin') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminPage(),
                        ),
                      );
                    } else if (role == 'user') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UsersPage(),
                        ),
                      );
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextEditingController dropDown = TextEditingController();

List<String> fac_years = ['1st year', '2nd year', '3rd year', '4th year'];
