import 'package:flutter_architecture/config/const.dart';
import 'package:flutter_architecture/data/lol/models/champ/champ_model.dart';
import 'package:flutter_architecture/data/lol/models/free_champ_list_model/free_champ_list_model.dart';
import 'package:flutter_architecture/data/lol/models/spell/spell_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'champ_remote_data.g.dart';

@RestApi()
abstract class ChampApi {
  factory ChampApi(Dio dio, {String baseUrl}) = _ChampApi;

  // @GET('/champion.json')
  // Future<List<Champion>> getChamps();//FIX:

  @GET('https://cdn.communitydragon.org/11.1.1/champion/{id}/data')
  Future<Champion> getChampById(@Path("id") int id);

  @GET('https://cdn.communitydragon.org/11.1.1/champion/{name}/data')
  Future<Champion> getChampByName(@Path("name") String name);

  //TODO: change api key here
  @GET(
      'https://kr.api.riotgames.com/lol/platform/v3/champion-rotations?api_key=RGAPI-37215921-75f7-45cc-8a12-fe7b053dccf1')
  Future<FreeChampList> getFreeChampList();

  @GET('/{id}/data')
  Future<Spell> getSpellById(@Path("id") int id);

  @GET('/{name}/data')
  Future<Spell> getSpellByName(@Path("name") String name);
}
