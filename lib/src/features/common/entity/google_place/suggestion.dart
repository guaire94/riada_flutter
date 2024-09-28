class Suggestion {
  final String placeId;
  final String description;

  Suggestion({
    required this.placeId,
    required this.description,
  });

  Suggestion._fromJson(Map<String, dynamic> json)
      : placeId = json['place_id'],
        description = json['description'];

  static List<Suggestion> fromJson({required Map<String, dynamic> json}) {
    if (json['status'] == 'OK') {
      return json['predictions']
          .map<Suggestion>((p) => Suggestion._fromJson(p))
          .toList();
    }
    if (json['status'] == 'ZERO_RESULTS') {
      return [];
    }
    throw Exception(json['error_message']);
  }
}
