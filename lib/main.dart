import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'core/constants/constants.dart';
import 'core/themes/app_theme.dart';
import 'data/repositories/repository.dart';
import 'logic/cubit/login/login_cubit.dart';
import 'logic/cubit/reset_password/reset_password_cubit.dart';
import 'logic/cubit/signup/signup_cubit.dart';
import 'logic/debug/app_bloc_observer.dart';
import 'presentation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'GNmVLEiNja76eh7zLt9vFS8RWb4XrhdQAgv2gU4X';
  final keyClientKey = 'wLLf92oYhnQFpupvaOEPiPlYW4p3RjfgD387v8Qd';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey,
      debug: true,
      appName: 'MyApp', //add
      appPackageName: 'com.mypackagename.myapp', //add
      appVersion: '1.0.0' //add
      );

  Bloc.observer = AppBlocObserver();
  runApp(App(
    appRouter: AppRouter(),
  ));
}

class App extends StatelessWidget {
  final AppRouter appRouter;

  const App({
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(LoginRepository()),
        ),
        BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(SignupRepository()),
        ),
        BlocProvider<ResetPasswordCubit>(
          create: (context) => ResetPasswordCubit(ResetPasswordRepository()),
        ),
      ],
      child: MaterialApp(
        title: Strings.appTitle,
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
        
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
