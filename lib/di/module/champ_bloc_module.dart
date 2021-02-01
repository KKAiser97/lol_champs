import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/champSearch/repositories/lol_repository.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/fetch_by_id_usecases.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/lol_usecase.dart';
import 'package:flutter_architecture/presentation/champ/bloc/champ_bloc.dart';

class ChampBlocModule extends DIModule {
  @override
  provides() {
    getIt.registerFactory<ChampBloc>(() => ChampBloc(
          getChampUseCase: GetChampUseCase(getIt<ChampRepository>()),
          fetchChampByIdUseCase:
              FetchChampByIdUseCase(getIt<ChampRepository>()),
        ));
  }
}
