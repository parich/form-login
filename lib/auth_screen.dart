import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool loginMode = false;

  String username = "";
  String email = "";
  String password = "";

  final _formKey = GlobalKey<FormState>();

  void submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();

    _formKey.currentState!.save();

    print(username);
    print(email);
    print(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    FlutterLogo(),
                    Text("RMU Mail"),
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        loginMode
                            ? "Welcome to login,"
                            : "Star using this app by complete this form,",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        loginMode
                            ? "Login to your account"
                            : "Create new account",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    if (loginMode == false)
                      TextFormField(
                        key: ValueKey("username"),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value == null || value.length < 4) {
                            return "Username must be at least 4 characters!";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          username = value.toString();
                        },
                      ),
                    TextFormField(
                      key: ValueKey("email"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null ||
                            !value.contains('@') ||
                            !value.contains('.')) {
                          return "Enter a valid email address!";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value.toString();
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email",
                      ),
                    ),
                    TextFormField(
                      key: ValueKey("password"),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.length < 4) {
                          return "password null";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value.toString();
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Password",
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: ElevatedButton(
                      child: Text(
                        loginMode ? "login" : "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      ),
                      onPressed: submit,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(loginMode
                          ? "Don't have an account yet?"
                          : "Already have an account"),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          setState(() {
                            loginMode = !loginMode;
                          });
                        },
                        child: Text(loginMode ? "Sign up" : 'Login'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
