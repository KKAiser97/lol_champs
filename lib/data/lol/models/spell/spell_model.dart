import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spell_model.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Spell extends Equatable {
  @JsonKey(name: 'spellKey')
  final String spellKey;
  @JsonKey(name: 'name')
  final String spellName;
  @JsonKey(name: 'abilityVideoPath')
  final String videoPath;
  @JsonKey(name: 'description')
  final String spellDescription;
  // final int maxrank;
  // final String cooldowmBurn;
  // final String costBurn;
  // final String spellImg;

  Spell({
    this.spellKey,
    this.spellName,
    this.videoPath,
    this.spellDescription,
    // this.maxrank,
    // this.cooldowmBurn,
    // this.costBurn,
    // this.spellImg,
  });

  factory Spell.fromJson(Map<String, dynamic> json) => _$SpellFromJson(json);

  Map<String, dynamic> toJson() => _$SpellToJson(this);
  @override
  List<Object> get props => [
        spellKey,
        spellName,
        videoPath,
        spellDescription,
        // maxrank,
        // cooldowmBurn,
        // costBurn,
        // spellImg,
      ];
}
