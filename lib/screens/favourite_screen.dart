import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/provider.dart';
import 'package:provider_sample/screens/favourite_list.dart';

class FavouriteExampleScreen extends StatefulWidget {
  const FavouriteExampleScreen({super.key});

  @override
  State<FavouriteExampleScreen> createState() => _FavouriteExampleScreenState();
}

class _FavouriteExampleScreenState extends State<FavouriteExampleScreen> {
  int indexValue = 0;
  List<int> favourList = [];


  @override
  Widget build(BuildContext context) {
    final favpro = Provider.of<SampleProvider>(context, listen: false);
    print('object132');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Sample'),
        actions: [
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen(indexValue: indexValue),)),
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(Icons.favorite),
              )
          )
        ],
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            print('object = ${favourList.contains(index)}');
            if(favourList.contains(index)) {
              favpro.addfavour(index);
            } else {
              favpro.removefavour(index);
            }

           indexValue = index;
          },
          child: Consumer<SampleProvider>(
            builder: (BuildContext context, SampleProvider value, Widget? child) {
              return ListTile(
                leading: Text('item ${index +1} '),
                trailing: value.favourList.contains(index) ?
                Icon(Icons.favorite) :
                Icon(Icons.favorite_outline_outlined),
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
