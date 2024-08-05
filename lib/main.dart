import 'package:codechallenge_francisco_gomez/features/default/presentation/bloc/default_bloc.dart';
import 'package:codechallenge_francisco_gomez/features/default/presentation/pages/default_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DefaultBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Code Challenge',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return const DefaultPage();
            },
          );
        },
      ),
    );
  }
}
