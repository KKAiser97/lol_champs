import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/const.dart';
import 'package:flutter_architecture/data/lol/models/champ/champ_model.dart';
import 'package:flutter_architecture/data/lol/models/spell/spell_model.dart';
import 'package:flutter_architecture/presentation/champ/bloc/champ_bloc.dart';
import 'package:flutter_architecture/presentation/champ/skill_route.dart';
import 'package:flutter_architecture/presentation/champ/skin_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChampScreen extends StatefulWidget {
  final Champion champion;

  ChampScreen(this.champion);

  @override
  _ChampScreenState createState() => _ChampScreenState();
}

class _ChampScreenState extends State<ChampScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.champion.champName),
          centerTitle: true,
        ),
        body: BlocConsumer<ChampBloc, ChampState>(
          listener: (context, state) {},
          builder: (context, state) {
            print(state);
            if (state is ChampLoading) {
              return CircularProgressIndicator();
            } else if (state is ChampInitial) {
              return ListView(children: [
                Image.network(
                  'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${widget.champion.alias}_0.jpg',
                  height: MediaQuery.of(context).size.height * .3,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 20),
                Text(
                  widget.champion.champName.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  widget.champion.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: Colors.amber,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.champion.lore,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                )),
                SizedBox(height: 20),
                Text(
                  'Skills',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: (widget.champion.spells).map((spell) {
                    print(spell.spellKey);
                    String shortSpellKey =
                        spell.spellKey[spell.spellKey.length - 1];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SkillRoute.id,
                            arguments: spell);
                        // }
                      },
                      child: CircleAvatar(
                        child: Text(
                          shortSpellKey.toUpperCase(),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        radius: 35,
                        backgroundImage: NetworkImage(
                            '$ASSETS_BASE/${widget.champion.id}/ability-icon/$shortSpellKey.png'),
                      ),
                    );
                  }).toList(),
                )),
                SizedBox(height: 10),
                Text(
                  "*Click the icon to see the skill's detail",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Text(
                  'Skins',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * .5,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: (widget.champion.skins).map((skin) {
                    String skinId = skin.id
                        .toString()
                        .substring(skin.id.toString().length - 3);
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, SkinRoute.id,
                          arguments: skin),
                      child: Image.network(
                          '$ASSETS_BASE/${widget.champion.id}/portrait/skin/$skinId'),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),
                Text(
                  "*Click the icon to see the skill's detail",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
              ]);
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
