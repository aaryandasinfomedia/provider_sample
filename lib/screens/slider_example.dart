import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/providers/simple_provider.dart';

class SliderExampleScreen extends StatefulWidget {
  const SliderExampleScreen({super.key});

  @override
  State<SliderExampleScreen> createState() => _SliderExampleScreenState();
}

class _SliderExampleScreenState extends State<SliderExampleScreen> {


  @override
  void initState() {
    super.initState();
  //
  }

  @override
  Widget build(BuildContext context) {
    final sliderProv = Provider.of<SampleProvider>(context, listen: false);
    print('object123');
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SampleProvider>(
              builder: (BuildContext context, sliderProv, Widget? child) {
               return Slider(
                  min: 0,
                  max: 1,
                  value: sliderProv.sliderValue,
                  onChanged: (val) {
                    sliderProv.sliderDiffer(val);
                  },

                );
              },

            ),
            Consumer<SampleProvider>(
              builder: (BuildContext context, SampleProvider value, Widget? child) {
                return  Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.withOpacity(value.sliderValue),
                        ),
                        child: Center(child: Text('Pehla')),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(value.sliderValue),
                        ),
                        child: Center(child: Text('Dursa')),
                      ),
                    ),
                  ],
                );
              },
            )

          ],
        ),
      ),
    );
  }
}
