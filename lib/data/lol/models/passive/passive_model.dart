import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'passive_model.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Passive extends Equatable {
  @JsonKey(name: 'name')
  final String passiveName;
  @JsonKey(name: 'abilityVideoPath')
  final String videoPath;
  @JsonKey(name: 'description')
  final String passiveDescription;
  // final String passiveImg;

  Passive({
    this.passiveName,
    this.videoPath,
    this.passiveDescription,
    // this.passiveImg,
  });

  factory Passive.fromJson(Map<String, dynamic> json) =>
      _$PassiveFromJson(json);

  Map<String, dynamic> toJson() => _$PassiveToJson(this);
  @override
  List<Object> get props => [
        passiveName,
        videoPath,
        passiveDescription,
        // passiveImg,
      ];
}
