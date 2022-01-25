// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nam_training/bloc/authentication/authentication_cubit.dart';
import 'package:nam_training/bloc/authentication/authentication_state.dart';
import 'package:nam_training/bloc/login/login_cubit.dart';
import 'package:nam_training/bloc/observer/simple_bloc_observer.dart';
import 'package:nam_training/features/core/splash_page.dart';
import 'package:nam_training/features/home/home_page.dart';
import 'package:nam_training/features/login/login_page.dart';
import 'package:nam_training/firebase_options.dart';
import 'package:nam_training/repository/user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepositoryImplement(),
      child: BlocProvider(
        create: (context) =>
            AuthenticationCubit(context.read<UserRepositoryImplement>())
              ..started(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, authenticationState) {
              if (authenticationState is AuthenticationStateUnauthenticated) {
                return BlocProvider(
                  create: (context) => LoginCubit(
                      userRepository: context.read<UserRepositoryImplement>()),
                  child: const LoginPage(),
                );
              } else if (authenticationState
                  is AuthenticationStateAuthenticated) {
                return HomePage();
              } else {
                return const SplashPage();
              }
            },
          ),
        ),
      ),
    );
  }
}
