import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_test/screens/start/view/start.dart';

import 'screens/home/bloc/home_bloc.dart';
import 'screens/start/bloc/start_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => StartBloc(),
          ),
          BlocProvider(
            create: (_) => HomeBloc(),
          ),
        ],
        child: const StartScreen(),
      ),
    );
  }
}

