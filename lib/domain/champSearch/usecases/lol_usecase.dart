import 'package:flutter_architecture/data/lol/models/champ/champ_model.dart';
import 'package:flutter_architecture/domain/champSearch/repositories/lol_repository.dart';

class GetChampUseCase {
  final ChampRepository _champRepository;

  GetChampUseCase(this._champRepository);

  Future<Champion> getChampByName(String champName) =>
      _champRepository.getChampByName(champName);
}
