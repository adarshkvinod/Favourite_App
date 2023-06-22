import 'package:english_words/english_words.dart';
import 'package:favourite_app/provider/favourite_provider.dart';
import 'package:favourite_app/screens/favourite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final words = nouns.take(100).toList();
    final provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('FAVOURITE APP',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: words.length,
          itemBuilder: (context, index){
            final word = words[index];
            return ListTile(
              title: Text(word,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.black),),
              
              trailing: IconButton(
                onPressed: (){
                 provider.togglefavourite(word);
              },
               icon:provider.isExist(word)? const Icon(Icons.favorite,color: Colors.red,): const Icon(Icons.favorite_border,color: Colors.black,)
               
               ),
            );
        }
        ),
      ),
      floatingActionButton:
       FloatingActionButton.extended(
        backgroundColor: Colors.black,
        elevation: 20,
        onPressed: (){
          final route =MaterialPageRoute(builder: (context)=> const FavouritePage());
          Navigator.push(context, route);
        },
       label: const Text('Favourites')),
    );
  }
}