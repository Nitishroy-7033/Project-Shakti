import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shakti/core/routes/routes.dart';
import 'package:project_shakti/core/theme/app_theme.dart';
import 'package:project_shakti/core/utils/update_status_bar.dart';
import 'package:project_shakti/features/live_trip/views/live_trip_screen.dart';
import 'package:project_shakti/features/login/bloc/login_bloc.dart';
import 'package:project_shakti/features/login/repository/login_repository.dart';
import 'package:project_shakti/features/signup/bloc/signup_bloc.dart';
import 'package:project_shakti/features/signup/repository/sign_up_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>(
          create: (_) => SignUpBloc(signupRepository: SignupRepository()),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(loginrepository: LoginRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Shakti',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: AppRoutes.splash,
        routes: AppRoutes.getRoutes(),
        builder: (context, child) {
          updateStatusBar(context);
          return child!;
        },
      ),
    );
  }
}
