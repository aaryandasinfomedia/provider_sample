import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/provider.dart';

class FavouriteScreen extends StatefulWidget {
  var indexValue;
   FavouriteScreen({super.key, required this.indexValue});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> favourList = [];

  @override
  Widget build(BuildContext context) {
    print('fa123 = ${widget.indexValue}');
    final favpro = Provider.of<SampleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sample'),
      ),
      body: ListView.separated(
        itemCount: favpro.favourList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print('damn = ${favourList.contains(index)}');
                favpro.favourList.remove(index);

              print('res = ${favourList.contains(index)}');


            },
            child: Consumer<SampleProvider>(
              builder: (BuildContext context, SampleProvider value, Widget? child) {
               return ListTile(
                  leading: Text('item ${index} '),
                  trailing: favpro.favourList.contains(index) ?
                  const Icon(Icons.favorite) :
                  const Icon(Icons.favorite_outline_outlined),
                );
              },

            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 1,
          color: Colors.deepPurple,
        );
      },),
    );
  }
}
