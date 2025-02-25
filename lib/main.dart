import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/task/task_bloc.dart';
import 'package:todo/config/router.dart';

import 'bloc/blog/blog_bloc.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(),
        ),
        BlocProvider(
          create: (context) => BlogBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: Routes.goRouter,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff0759FF),
          // second: Color(0x9E0560FD),
          scaffoldBackgroundColor: Color(0xFFF5F5F5),
        ),
      ),
    );
  }
}
