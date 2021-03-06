import 'package:flutter/material.dart';
import '../../model/model.dart';
import '../widget/widget.dart';

class PokemonPage extends StatelessWidget {
  final Future<Pokemon> pokemon;

  PokemonPage({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: pokemon,
        builder: (context, snapshot) {
          
          if(!snapshot.hasData){
            return Scaffold(appBar: AppBar(
              backgroundColor: Colors.redAccent[700],
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
                )),
                body: Loading(),);
          }
          else{return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(snapshot.data.name),
              centerTitle: true,
              backgroundColor: Colors.redAccent[700],
            ),
            body: Column(
              children: <Widget>[
                PokemonPortrait(
                  image: snapshot.data.image,
                ),
                PokemonInfo(
                  pokemon: snapshot.data,
                ),
                PokemonTypeText(pokemonTypes: snapshot.data.types)
              ],
            ),
          );}
        });
  }
}

class PokemonPortrait extends StatelessWidget {
  final PokemonImage image;

  PokemonPortrait({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 130.0,
      height: 130.0,
      margin: EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.lightBlueAccent,
          image: DecorationImage(
              fit: BoxFit.fill, image: NetworkImage(image.url))),
    ));
  }
}

class PokemonInfo extends StatelessWidget {
  final Pokemon pokemon;

  PokemonInfo({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 250.0,
            height: 150.0,
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(6.0)),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        'Weight  ${pokemon.weight / 10} kg',
                        style: PokemonInfoTextStyle.createStyle(context),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Height  ${pokemon.height / 10} m',
                          style: PokemonInfoTextStyle.createStyle(context),
                        )),
                  ],
                ),
              ],
            )));
  }
}

class PokemonInfoTextStyle {
  static TextStyle createStyle(BuildContext context) {
    return TextStyle(fontSize: 16.0);
  }
}

class PokemonTypeText extends StatelessWidget {
  final List<PokemonType> pokemonTypes;

  PokemonTypeText({Key key, this.pokemonTypes}) : super(key: key);

  List<Widget> createPokemonTypesText(BuildContext context) {
    List<Widget> lists = [];
    for (int i = 0; i < pokemonTypes.length; i++) {
      lists.add(Container(
        margin: EdgeInsets.only(left:15.0),
        child: Text(pokemonTypes[i].name),
        decoration: BoxDecoration(shape: BoxShape.rectangle,color:TypeTextColor.mixColor(context, pokemonTypes[i].name),),
      ));
    }
    return lists;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25.0, top: 10.0),
        child: Row(
          children: <Widget>[
                Text(
                  'Types',
                ),
              ] +
              createPokemonTypesText(context),
        ));
  }
}

class TypeTextColor {
  static Color mixColor(BuildContext context, String type) {
    switch (type) {
      case 'normal':
        return Color(0xffa8a878);
      case 'fire':
        return Color(0xfff08030);
      case 'fighting':
        return Color(0xffc03028);
      case 'water':
        return Color(0xff6890f0);
      case 'flying':
        return Color(0xffa890f0);
      case 'grass':
        return Color(0xff78c850);
      case 'poison':
        return Color(0xffa040a0);
      case 'electric':
        return Color(0xfff8d030);
      case 'ground':
        return Color(0xffe0c068);
      case 'psychic':
        return Color(0xfff85888);
      case 'rock':
        return Color(0xffb8a038);
      case 'ice':
        return Color(0xff98d8d8);
      case 'bug':
        return Color(0xffa8b820);
      case 'dragon':
        return Color(0xff7038f8);
      case 'ghost':
        return Color(0xff705898);
      case 'dark':
        return Color(0xff705848);
      case 'steel':
        return Color(0xffb8b8d0);
      case 'fairy':
        return Color(0xffee99ac);
      default:
        return null;
    }
  }
}
