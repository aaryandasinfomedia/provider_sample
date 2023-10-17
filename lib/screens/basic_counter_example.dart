import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/provider.dart';

class BasicCounterExample extends StatefulWidget {
  const BasicCounterExample({super.key});

  @override
  State<BasicCounterExample> createState() => _BasicCounterExampleState();
}

class _BasicCounterExampleState extends State<BasicCounterExample> {
  // var counter = 0;


  @override
  void initState() {
    super.initState();
    final sampleProvider = Provider.of<SampleProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 3), (timer) {
      sampleProvider.incrementCounter();
      print('damn = ${sampleProvider.counter}');

    });
  }

  @override
  Widget build(BuildContext context) {
    print('object123');
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Sample'),
      ),
      body: Center(
        child: /*Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [*/
            /* Text(
              DateTime.now().hour.toString()+ ':' + DateTime.now().minute.toString()+ ':' + DateTime.now().second.toString() ,
            ),*/
            Consumer<SampleProvider>(
              builder: ( context, value, child) {
                print('object');
                return Text(
                  value.counter.toString(),
                  // counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );

              },
            ),
        /*  ],
        ),*/
      ),
    );
  }
}
