import 'package:flutter_architecture/data/lol/models/free_champ_list_model/free_champ_list_model.dart';
import 'package:flutter_architecture/domain/champSearch/repositories/lol_repository.dart';

class FetchListChampIdUsecase {
  final ChampRepository _champRepository;

  FetchListChampIdUsecase(this._champRepository);

  Future<FreeChampList> getFreeChampList() =>
      _champRepository.getFreeChampList();
}
