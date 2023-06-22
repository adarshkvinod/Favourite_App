import 'package:favourite_app/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    final words = provider.words;
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAVOURITES',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body:  Padding(
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
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        
      }, label: const Icon(Icons.delete_forever)),
    );
  }
}