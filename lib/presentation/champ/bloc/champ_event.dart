part of 'champ_bloc.dart';

abstract class ChampEvent extends Equatable {
  const ChampEvent();

  @override
  List<Object> get props => [];
}

class GetChampByName extends ChampEvent {
  final String champName;

  GetChampByName({@required this.champName});

  @override
  List<Object> get props => [champName];
}

class GetAllChamps extends ChampEvent {}

class SearchChamp extends ChampEvent {}

class GetSkillByName extends ChampEvent {
  final String spellName;

  GetSkillByName(this.spellName);

  @override
  List<Object> get props => [spellName];
}
