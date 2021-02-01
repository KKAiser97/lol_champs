import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/lol/datasources/champ_remote_data.dart';
import 'package:flutter_architecture/data/lol/repositories/get_champ_repo_imtl.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/champSearch/repositories/lol_repository.dart';

class ChampRepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<GetChampImpl>(
        () => GetChampImpl(champApi: getIt.get<ChampApi>()));
  }
}
