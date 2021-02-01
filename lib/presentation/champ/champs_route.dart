import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/lol/repositories/get_champ_repo_imtl.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/fetch_by_id_usecases.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/fetch_list_champ_id.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/lol_usecase.dart';
import 'package:flutter_architecture/presentation/champ/ui/fetch_all_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/champ_bloc.dart';

class ChampsRoute extends RouteDefine {
  static const id = 'champs';

  @override
  List<Path> initRoute(Object arguments) => [
        Path(
          name: id,
          builder: (_) => BlocProvider(
            create: (_) => ChampBloc(
                fetchListChampIdUsecase:
                    FetchListChampIdUsecase(getIt.get<GetChampImpl>()),
                fetchChampByIdUseCase:
                    FetchChampByIdUseCase(getIt.get<GetChampImpl>()),
                getChampUseCase: GetChampUseCase(getIt.get<GetChampImpl>())),
            child: FetchAllScreen(),
          ),
        )
      ];
}
