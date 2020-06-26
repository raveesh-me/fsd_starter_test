import 'package:flutter/material.dart';
import 'package:fsdstartertest/src/counter_bloc.dart';
import 'package:fsdstartertest/src/counter_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'counter_screen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CounterBloc counterBloc;
  SharedPreferences preferences;
  bool isLoading = true;

  init() async {
    setState(() {
      isLoading = true;
    });
    preferences = await SharedPreferences.getInstance();
    counterBloc = CounterBloc(CounterService(preferences));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLoading
          ? Column(
              children: [LinearProgressIndicator()],
              mainAxisAlignment: MainAxisAlignment.end,
            )
          : StreamProvider<CounterBlocModel>.value(
              value: counterBloc.stream,
              child: CounterScreen(),
            ),
    );
  }
}
