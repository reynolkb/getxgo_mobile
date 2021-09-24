import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:bloc_architecture_app/logic/cubit/login/login_cubit.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/NavBar1.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/material/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.loginScreenTitle),
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
                child: const Text('Welcome to the GetxGo preparendess app',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2c5977),
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                style: TextStyle(),
                controller: controllerUsername,
                enabled: !isLoggedIn,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
                controller: controllerPassword,
                enabled: !isLoggedIn,
                obscureText: true,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xff2c5977),
                        )),
                    labelStyle: new TextStyle(color: Color(0xff2c5977)),
                    labelText: 'Password'),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: isLoggedIn ? null : () => doUserLogin(),
                    style: ElevatedButton.styleFrom(
                      primary: ColorConstants.primaryColor,
                    ),
                  )),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () => {Navigator.of(context).pushNamed('sign_up')},
                  style: ElevatedButton.styleFrom(
                    primary: ColorConstants.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextButton(
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff81B6C9),
                    ),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('reset_password'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar1(),
    );
  }

  void doUserLogin() async {
    final username = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();

    var response = await BlocProvider.of<LoginCubit>(context)
        .loginUser(username, password);
    if (response == 'getxgo_home') {
      Navigator.of(context).pushReplacementNamed(response);
    } else {
      Message.showError(context: context, message: response);
    }
  }
}
