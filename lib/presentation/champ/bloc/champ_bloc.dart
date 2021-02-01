import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/data/lol/models/spell/spell_model.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/fetch_list_champ_id.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/get_free_champs_usecase.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/lol/models/champ/champ_model.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/fetch_by_id_usecases.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/lol_usecase.dart';

part 'champ_event.dart';
part 'champ_state.dart';

class ChampBloc extends Bloc<ChampEvent, ChampState> {
  final GetChampUseCase getChampUseCase;
  final FetchChampByIdUseCase fetchChampByIdUseCase;
  final GetFreeChampsUsecase getAllChampsUsecase;
  final FetchListChampIdUsecase fetchListChampIdUsecase;

  ChampBloc({
    this.getChampUseCase,
    this.fetchChampByIdUseCase,
    this.getAllChampsUsecase,
    this.fetchListChampIdUsecase,
  }) : super(ChampInitial());

  @override
  Stream<ChampState> mapEventToState(
    ChampEvent event,
  ) async* {
    if (event is GetAllChamps) {
      yield ChampLoading();
      try {
        final listFreeChammps =
            await fetchListChampIdUsecase.getFreeChampList();
        // final champs = await fetchChampByIdUseCase.getChampById(2);
        List<Champion> listChampion = [];
        if (listFreeChammps != null) {
          for (int i in listFreeChammps.freeChampionIds) {
            final champs = await fetchChampByIdUseCase.getChampById(i);
            listChampion.add(champs);
            if (i ==
                listFreeChammps.freeChampionIds[
                    listFreeChammps.freeChampionIds.length - 1]) {
              yield ChampsLoaded(champions: listChampion);
            }
          }
        }
      } catch (e) {
        print(e);
        yield ChampFailed();
      }
    }
    if (event is GetChampByName) {
      yield ChampLoading();
      try {
        final champ = await getChampUseCase.getChampByName(event.champName);
        if (champ != null) {
          yield ChampLoaded(champion: champ);
        }
      } catch (e) {
        print(e);
        yield ChampFailed();
      }
    }
  }
}
