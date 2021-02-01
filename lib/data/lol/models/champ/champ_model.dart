import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/lol/models/passive/passive_model.dart';
import 'package:flutter_architecture/data/lol/models/skin/skin_model.dart';
import 'package:flutter_architecture/data/lol/models/spell/spell_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'champ_model.g.dart';

@JsonSerializable()
class Champion extends Equatable {
  @JsonKey(name: 'name')
  final String champName;
  final String alias;
  final int id;
  final String title;
  // final String champImg;
  // final String blurb;
  @JsonKey(name: 'shortBio')
  final String lore;
  final List<String> roles;
  @JsonKey(name: 'spells')
  final List<Spell> spells;
  @JsonKey(name: 'skins')
  final List<Skin> skins;
  final Passive passive;

  Champion({
    this.champName,
    this.alias,
    this.id,
    this.title,
    // this.champImg,
    // this.blurb,
    this.lore,
    this.roles,
    this.spells,
    this.skins,
    this.passive,
  });
  factory Champion.fromJson(Map<String, dynamic> json) =>
      _$ChampionFromJson(json);
  Map<String, dynamic> toJson() => _$ChampionToJson(this);
  @override
  List<Object> get props => [
        champName,
        alias,
        id,
        title,
        // champImg,
        // blurb,
        lore,
        roles,
        spells,
        skins,
        passive,
      ];
}
