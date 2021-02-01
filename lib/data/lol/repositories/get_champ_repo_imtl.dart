import 'dart:async';

import 'package:flutter_architecture/config/const.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/lol/datasources/champ_remote_data.dart';
import 'package:flutter_architecture/data/lol/models/champ/champ_model.dart';
import 'package:flutter_architecture/data/lol/models/free_champ_list_model/free_champ_list_model.dart';
import 'package:flutter_architecture/data/lol/models/spell/spell_model.dart';
import 'package:flutter_architecture/domain/champSearch/repositories/lol_repository.dart';

import 'package:dio/dio.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/get_free_champs_usecase.dart';

class GetChampImpl implements ChampRepository {
  final ChampApi champApi;

  GetChampImpl({this.champApi});

  @override
  Future<Champion> getChampByName(String champName) async {
    try {
      assert(champName != null);
      return await champApi.getChampByName(champName);
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  @override
  Future<Champion> getChampById(int id) async {
    try {
      return await champApi.getChampById(id);
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  @override
  Future<FreeChampList> getFreeChampList() async {
    try {
      return await champApi.getFreeChampList();
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  @override
  Future<Spell> getSpellByName(String spellName) async {
    try {
      assert(spellName != null);
      return await champApi.getSpellByName(spellName);
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  @override
  Future<Spell> getSpellById(int id) async {
    try {
      return await champApi.getSpellById(id);
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  @override
  Future<List<Champion>> getAllChamps() async {}
}
