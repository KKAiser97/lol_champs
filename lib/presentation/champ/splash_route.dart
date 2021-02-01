import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/lol/repositories/get_champ_repo_imtl.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/champSearch/usecases/lol_usecase.dart';
import 'package:flutter_architecture/presentation/champ/ui/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/champ_bloc.dart';

class SplashRoute extends RouteDefine {
  static const id = 'splash';
  @override
  List<Path> initRoute(Object arguments) => [
        Path(
          name: id,
          builder: (_) => BlocProvider(
            create: (_) => ChampBloc(
                getChampUseCase: GetChampUseCase(getIt.get<GetChampImpl>())),
            child: SplashScreen(),
          ),
        )
      ];
}
