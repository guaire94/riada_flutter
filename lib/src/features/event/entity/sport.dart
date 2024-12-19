import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riada/src/utils/build_context_extension.dart';

part 'sport.g.dart';

@JsonSerializable()
class Sport {
  final String id;
  final String name;
  final String emoticon;
  final List<String> covers;

  Sport({
    required this.id,
    required this.name,
    required this.emoticon,
    required this.covers,
  });

  factory Sport.fromJson(Map<String, dynamic> json) => _$SportFromJson(json);

  Map<String, dynamic> toJson() => _$SportToJson(this);

  Sport copyWith({
    String? id,
    String? name,
    String? emoticon,
    List<String>? covers,
    int? rank,
  }) {
    return Sport(
      id: id ?? this.id,
      name: name ?? this.name,
      emoticon: emoticon ?? this.emoticon,
      covers: covers ?? this.covers,
    );
  }

  String localizedName(BuildContext context) {
    switch (name) {
      case "SPORT_SOCCER":
        return context.l10N.soccer;
      case "SPORT_BASKET":
        return context.l10N.basketball;
      case "SPORT_FOOTVOLLEY":
        return context.l10N.footvolley;
      case "SPORT_VOLLEY":
        return context.l10N.volleyball;
      case "SPORT_TENNIS":
        return context.l10N.tennis;
      case "SPORT_GOLF":
        return context.l10N.golf;
      case "SPORT_PADEL":
        return context.l10N.padel;
      default:
        return name;
    }
  }
}
