import 'package:book_management/utils/services/auth_services.dart';
import 'package:flutter/material.dart';
import '../utils/services/shared_prefernce.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  GlobalKey<FormState> signInKey = GlobalKey();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String? email;

  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Login Screen"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSBebYiqwAKAx1ybnNk2H0ExmVq5zjkC5O9g&s",
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                signUp();
                // SharedPreferencesHelper.setLoggedIn(true);
                // Navigator.of(context).pushReplacementNamed('home_page');
              },
              child: Text("SignUp"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I have allready account ",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    signIn();
                  },
                  child: Container(
                    child: Text(
                      "SignIN ",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  signUp() {
    showDialog(
        context: context,
        builder: (context) {
          return Form(
            key: formkey,
            child: AlertDialog(
              title: Text("signUp"),
              actions: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                      label: Text("Email")),
                  controller: emailController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Email is required ";
                    }
                  },
                  onSaved: (val) {
                    email = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password",
                      label: Text("Password")),
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password is required";
                    } else if (val.length <= 6) {
                      return "Password must Contain 6 Letters";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    password = val;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          emailController.clear();
                          passwordController.clear();
                          email = null;
                          password = null;
                          Navigator.of(context).pop();
                        },
                        child: Text("cancle")),
                    ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            Map<String, dynamic> res = await AuthHelper
                                .authHelper
                                .signUp(email: email, password: password);

                            if (res['user'] != null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("SignUp Sucessfully"),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                                action: SnackBarAction(
                                    label: "SignIn",
                                    onPressed: () {
                                      signIn();
                                    }),
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("SignUp Failed"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                              ));
                            }
                            emailController.clear();
                            passwordController.clear();
                            email = null;
                            password = null;
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text("signUp")),
                  ],
                )
              ],
            ),
          );
        });
  }

  signIn() {
    showDialog(
        context: context,
        builder: (context) {
          return Form(
            key: signInKey,
            child: AlertDialog(
              title: Text("signIn"),
              actions: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                      label: Text("Email")),
                  controller: emailController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Email is required ";
                    }
                  },
                  onSaved: (val) {
                    email = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password",
                      label: Text("Password")),
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password is required";
                    } else if (val.length <= 6) {
                      return "Password must Contain 6 Letters";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    password = val;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          emailController.clear();
                          passwordController.clear();
                          email = null;
                          password = null;
                          Navigator.of(context).pop();
                        },
                        child: Text("cancle")),
                    ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            Map<String, dynamic> res = await AuthHelper
                                .authHelper
                                .signInWithEmailAndPassword(
                                    email: email!, password: password!);

                            if (res['user'] != null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("SignIn Sucessfully"),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                                action: SnackBarAction(
                                    label: "Next",
                                    onPressed: () {
                                      SharedPreferencesHelper.setLoggedIn(true);
                                      Navigator.of(context)
                                          .pushReplacementNamed('home_page');
                                    }),
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("SignIn Failed"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                              ));
                            }
                            emailController.clear();
                            passwordController.clear();
                            email = null;
                            password = null;
                            SharedPreferencesHelper.setLoggedIn(true);
                            Navigator.of(context)
                                .pushReplacementNamed('home_page');
                          }
                        },
                        child: Text("signIn")),
                  ],
                )
              ],
            ),
          );
        });
  }
}
