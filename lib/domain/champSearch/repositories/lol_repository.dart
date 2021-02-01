import 'package:flutter_architecture/data/lol/models/champ/champ_model.dart';
import 'package:flutter_architecture/data/lol/models/free_champ_list_model/free_champ_list_model.dart';
import 'package:flutter_architecture/data/lol/models/spell/spell_model.dart';

abstract class ChampRepository {
  Future<Champion> getChampById(int id);
  Future<List<Champion>> getAllChamps();
  Future<Champion> getChampByName(String champName);
  Future<FreeChampList> getFreeChampList();
  Future<Spell> getSpellByName(String name);
  Future<Spell> getSpellById(int id);
}
