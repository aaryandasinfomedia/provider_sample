import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/providers/simple_provider.dart';
import 'package:provider_sample/screens/favourite_list.dart';

class FavouriteExampleScreen extends StatefulWidget {
  const FavouriteExampleScreen({super.key});

  @override
  State<FavouriteExampleScreen> createState() => _FavouriteExampleScreenState();
}

class _FavouriteExampleScreenState extends State<FavouriteExampleScreen> {
  // List<int> favourList = [];
  @override
  Widget build(BuildContext context) {
    print('object132');
    return Scaffold(

      body: Consumer<SampleProvider>(
        builder: ( context,  value,  child) => ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
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
            leading: Text('item ${index +1} '),
            trailing:
            Icon(value.favourList.contains(index) ?
            Icons.favorite :
            Icons.favorite_outline_outlined)
          );
        }, separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 1,
              color: Colors.deepPurple,
            );
        },),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Sample'),
        actions: [
          InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen(),)),
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(Icons.favorite),
              )
          )
        ],
      ),
    );
  }
}
