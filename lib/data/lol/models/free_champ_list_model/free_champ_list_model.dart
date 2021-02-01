import 'package:json_annotation/json_annotation.dart';

part 'free_champ_list_model.g.dart';

@JsonSerializable()
class FreeChampList {
  final List<int> freeChampionIds;

  FreeChampList(this.freeChampionIds);

  factory FreeChampList.fromJson(Map<String, dynamic> json) =>
      _$FreeChampListFromJson(json);
  Map<String, dynamic> toJson() => _$FreeChampListToJson(this);
}
