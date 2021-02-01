import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skin_model.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Skin extends Equatable {
  final int id;
  @JsonKey(name: 'name')
  final String skinName;
  final String description;
  final bool isBase;
  final String rarity;
  final bool isLegacy;

  Skin({
    this.id,
    this.skinName,
    this.description,
    this.isBase,
    this.rarity,
    this.isLegacy,
  });

  factory Skin.fromJson(Map<String, dynamic> json) => _$SkinFromJson(json);

  Map<String, dynamic> toJson() => _$SkinToJson(this);
  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        skinName,
        description,
        isBase,
        rarity,
        isLegacy,
      ];
}
