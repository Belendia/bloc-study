import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocstudy/logic/cubit/counter_cubit.dart';
import 'package:blocstudy/presentation/router/app_router.dart';

import 'logic/cubit/internet_cubit.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(), connectivity: Connectivity()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter, required this.connectivity})
      : super(key: key);

  final AppRouter appRouter;
  final Connectivity connectivity;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
