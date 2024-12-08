import 'package:json_annotation/json_annotation.dart';

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
}
