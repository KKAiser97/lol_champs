import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/lol/repositories/get_champ_repo_imtl.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/fetch_by_id_usecases.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/fetch_list_champ_id.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/lol_usecase.dart';
import 'package:flutter_architecture/presentation/champ/ui/champ_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/champ_bloc.dart';

class ChampRoute extends RouteDefine {
  static const id = 'champ';

  @override
  List<Path> initRoute(Object arguments) => [
        Path(
          name: id,
          builder: (_) => BlocProvider(
            create: (_) => ChampBloc(
                getChampUseCase: GetChampUseCase(getIt.get<GetChampImpl>())),
            child: ChampScreen(arguments),
          ),
        )
      ];
}
