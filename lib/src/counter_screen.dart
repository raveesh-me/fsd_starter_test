import 'package:flutter/material.dart';
import 'package:fsdstartertest/src/counter_bloc.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBlocModel counterBlocModel = Provider.of<CounterBlocModel>(context);
    return Scaffold(
      body: Center(
        child: Text(
          "Count is: \n${counterBlocModel?.count ?? 0}",
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          counterBlocModel.bloc.addOne();
        },
        label: Text("Increment"),
        icon: Icon(Icons.plus_one),
      ),
    );
  }
}
