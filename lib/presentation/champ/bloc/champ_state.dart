part of 'champ_bloc.dart';

abstract class ChampState extends Equatable {
  const ChampState();

  @override
  List<Object> get props => [];
}

class ChampInitial extends ChampState {}

class ChampLoading extends ChampState {}

class ChampLoaded extends ChampState {
  final Champion champion;

  ChampLoaded({this.champion});

  @override
  List<Object> get props => [champion];
}

class ChampsLoaded extends ChampState {
  final List<Champion> champions;
  // final bool hasReachedMax;

  ChampsLoaded({this.champions});

  ChampsLoaded copyWith(Champion champions, bool hasReachedMax) {
    return ChampsLoaded(
      champions: champions ?? this.champions,
      // hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [champions];
}

class ChampFailed extends ChampState {
  final String error;

  ChampFailed({this.error});

  @override
  List<Object> get props => [error];
}

class SearchFinished extends ChampState {
  final Champion champion;

  SearchFinished({this.champion});

  @override
  List<Object> get props => [champion];
}

class SkillLoaded extends ChampState {
  final Spell spell;

  SkillLoaded({this.spell});

  @override
  List<Object> get props => [spell];
}
