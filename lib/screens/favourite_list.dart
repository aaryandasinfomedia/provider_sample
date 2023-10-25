import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/providers/simple_provider.dart';

class FavouriteScreen extends StatefulWidget {
   FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> favourList = [];

  @override
  Widget build(BuildContext context) {
    final favpro = Provider.of<SampleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sample'),
      ),
      body: Consumer<SampleProvider>(
      builder: ( context,  value,  child) {
        return  ListView.separated(
          itemCount: value.favourList.length,
          itemBuilder: (context, index) {
            return Consumer<SampleProvider>(
              builder: (context, value, child) {
                return ListTile(
                    onTap: () {
                      // print('object = ${index}');
                      if(value.favourList.contains(index)) {
                        value.removefavour(index);
                        // isfavour = !isfavour;
                      } else {
                        value.addfavour(index);

                        // isfavour = !isfavour;
                      }
                      print('object1 = ${value.favourList.contains(index)}');
                    },
                    leading: Text('item ${index +1}'),
                    trailing: const Icon(Icons.favorite)

                );
              },

            );
          },
          separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 1,
            color: Colors.deepPurple,
          );
        },);
      }
      // ),
    ),
    );
  }
}
