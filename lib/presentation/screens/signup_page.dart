import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:bloc_architecture_app/logic/cubit/signup/signup_cubit.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Sign Up'),
          backgroundColor: ColorConstants.primaryColor,
          brightness: Brightness.dark,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 70,
                  child: Image.asset('assets/images/getxgo_logo.png'),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 80.0),
                  child: const Text('Create your account',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2c5977),
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: controllerUsername,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color(0xff2c5977),
                          )),
                      labelStyle: new TextStyle(color: Color(0xff2c5977)),
                      labelText: 'Username'),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color(0xff2c5977),
                          )),
                      labelStyle: new TextStyle(color: Color(0xff2c5977)),
                      labelText: 'Email'),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: controllerPassword,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color(0xff2c5977),
                          )),
                      labelStyle: new TextStyle(color: Color(0xff2c5977)),
                      labelText: 'Password'),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ), //this doesn't show
                  child: ElevatedButton(
                    child: const Text('Sign Up'),
                    onPressed: () => doUserRegistration(),
                    style: ElevatedButton.styleFrom(
                      primary: ColorConstants.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void doUserRegistration() async {
    final username = controllerUsername.text.trim();
    final email = controllerEmail.text.trim();
    final password = controllerPassword.text.trim();

    var response = await BlocProvider.of<SignupCubit>(context)
        .signupUser(username, password, email);

    if (response ==
        'User was successfully created! Please verify your email before Login') {
      Message.showSuccess(
          context: context,
          message: response,
          onPressed: () async {
            Navigator.pop(context);
          });
    } else {
      Message.showError(context: context, message: response);
    }
  }
}
