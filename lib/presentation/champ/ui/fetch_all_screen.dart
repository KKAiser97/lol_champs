import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/const.dart';
import 'package:flutter_architecture/data/lol/models/champ/champ_model.dart';
import 'package:flutter_architecture/data/lol/models/passive/passive_model.dart';
import 'package:flutter_architecture/presentation/champ/bloc/champ_bloc.dart';
import 'package:flutter_architecture/presentation/champ/champ_route.dart';
import 'package:flutter_architecture/presentation/champ/search_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchAllScreen extends StatefulWidget {
  @override
  _FetchAllScreenState createState() => _FetchAllScreenState();
}

class _FetchAllScreenState extends State<FetchAllScreen> {
  @override
  void initState() {
    BlocProvider.of<ChampBloc>(context).add(GetAllChamps());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Free Champions'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(
              context,
              SearchRoute.id,
            ),
          ),
        ],
      ),
      body: BlocConsumer<ChampBloc, ChampState>(listener: (context, state) {
        print(state);
      }, builder: (context, state) {
        if (state is ChampLoading) {
          return Center(
            child: CircularProgressIndicator(),
          ); //test
        } else if (state is ChampsLoaded) {
          return GridView.count(
            crossAxisCount: 2,
            children: (state.champions).map((champ) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ChampRoute.id, arguments: champ);
                },
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Image.network(
                          'http://ddragon.leagueoflegends.com/cdn/$PATCH/img/champion/${champ.alias}.png'),
                      SizedBox(height: 5),
                      Text(
                        champ.champName,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        } else {
          return Center(
            child: Text('no data'),
          );
        }
      }),
    );
  }
}
