import 'package:bloc_architecture_app/logic/cubit/reset_password/reset_password_cubit.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final controllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reset Password'),
          backgroundColor: Color(0xff2c5977),
          brightness: Brightness.dark,
          
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
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
                    labelText: 'Email'),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ElevatedButton(
                  child: const Text('Reset Password'),
                  onPressed: () => doUserResetPassword(),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff2c5977),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void doUserResetPassword() async {
    final email = controllerEmail.text.trim();

    var response =
        await BlocProvider.of<ResetPasswordCubit>(context).resetPassword(email);

    if (response == 'Password reset instructions have been sent to email!') {
      Message.showSuccess(
          context: context,
          message: response,
          onPressed: () {
            Navigator.of(context).pop();
          });
    } else if (response == 'Email not found in database') {
      Message.showError(
          context: context,
          message: response,
          onPressed: () {
            Navigator.of(context).pop();
          });
    } else {
      Message.showError(
          context: context,
          message: response,
          onPressed: () {
            Navigator.of(context).pop();
          });
    }
  }
}
