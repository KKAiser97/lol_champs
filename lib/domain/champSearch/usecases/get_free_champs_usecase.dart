import 'package:flutter_architecture/data/lol/models/champ/champ_model.dart';
import 'package:flutter_architecture/domain/champSearch/repositories/lol_repository.dart';

class GetFreeChampsUsecase {
  final ChampRepository _champRepository;

  GetFreeChampsUsecase(this._champRepository);

  Future<List<Champion>> getAllChamps() => _champRepository.getAllChamps();
}
