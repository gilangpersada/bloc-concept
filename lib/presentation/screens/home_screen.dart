import 'package:bloc_concept/constants/enum.dart';
import 'package:bloc_concept/logic/cubit/counter_cubit.dart';
import 'package:bloc_concept/logic/cubit/internet_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocListener<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.wasIncremented) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Incremented!'),
                  duration: Duration(milliseconds: 500),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Decremented!'),
                  duration: Duration(milliseconds: 500),
                ),
              );
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                    if (state is InternetConnected &&
                        state.connectionType == ConnectionType.Wifi) {
                      return Text('Wifi');
                    } else if (state is InternetConnected &&
                        state.connectionType == ConnectionType.Mobile) {
                      return Text('Mobile');
                    } else if (state is InternetDisconnected) {
                      return Text('Disconnected');
                    }

                    return CircularProgressIndicator();
                  },
                ),
                Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Decrement',
                      child: Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  color: widget.color,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/second');
                  },
                  child: Text('Second Page'),
                ),
                SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  color: widget.color,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/third');
                  },
                  child: Text('Third Page'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
