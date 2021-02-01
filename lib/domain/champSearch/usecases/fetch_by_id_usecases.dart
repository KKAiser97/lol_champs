import 'package:flutter_architecture/data/lol/models/champ/champ_model.dart';
import 'package:flutter_architecture/domain/champSearch/repositories/lol_repository.dart';

class FetchChampByIdUseCase {
  final ChampRepository _champRepository;

  FetchChampByIdUseCase(this._champRepository);

  Future<Champion> getChampById(int id) => _champRepository.getChampById(id);

  // Future<List<Champion>> getAllChamps() => _champRepository.getAllChamps();
}
