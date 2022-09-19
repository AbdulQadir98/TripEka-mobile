import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth/auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future signInEmail() async {
    print("HERE @ signInEmail()");
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  final myController = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  // final _formKey = GlobalKey<FormState>();

  // String email = '';
  // String password = '';
  // String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        elevation: 0.0,
        title: Text('Sign in to TripEka'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Email',
                ),
                controller: _email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Email';
                  }
                  return null;
                },
                // onChanged: (val) {
                //   setState(() => _email = val);
                // },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Password',
                ),
                controller: _password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
                // onChanged: (val) {
                //   setState(() => _password = val);
                // },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    print(_email);
                    print(_password);
                    // if (_formKey.currentState!.validate()) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Processing Data')),
                    //   );
                    // }
                    await signInEmail();
                  }),
              SizedBox(height: 20.0),
              Divider(),
              SizedBox(height: 20.0),
              Text(
                'or sign in using google',
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Email',
                ),
                controller: _email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Email';
                  }
                  return null;
                },
                // onChanged: (val) {
                //   setState(() => _email = val);
                // },
              ),
              SizedBox(height: 20.0),
              SignInButton(
                Buttons.Google,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
