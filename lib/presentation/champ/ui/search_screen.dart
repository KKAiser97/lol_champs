import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/lol/models/champ/champ_model.dart';
import 'package:flutter_architecture/presentation/champ/bloc/champ_bloc.dart';

import 'package:flutter_architecture/presentation/champ/champ_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String inputStr;
  Champion champion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Search Champion')),
        body: BlocConsumer<ChampBloc, ChampState>(listener: (context, state) {
          if (state is ChampLoaded) {
            print(state.champion.champName);
            Navigator.pushNamed(context, ChampRoute.id,
                arguments: state.champion);
          }
          if (state is ChampLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('ERROR'),
                  content: Text(
                      "You may have typed a wrong name! Please try again!"),
                );
              },
            );
          }
        }, builder: (context, state) {
          return Center(
              child: Column(children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Input a champion's name",
              ),
              onChanged: (value) {
                inputStr = value;
              },
              onSubmitted: (_) {
                _controller.clear();
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: () {
                  BlocProvider.of<ChampBloc>(context)
                      .add(GetChampByName(champName: inputStr));
                })
          ]));
        }));
  }
}
