import 'dart:convert';

class NotificationData {
  final String title;
  final String body;
  final List<String> titleArgs;
  final List<String> bodyArgs;
  final String? deeplink;

  NotificationData({
    required this.title,
    required this.body,
    required this.titleArgs,
    required this.bodyArgs,
    this.deeplink,
  });

  factory NotificationData.fromJson(Map<String, dynamic> data) {
    final String title = data["title_loc_key"];
    final String body = data["body_loc_key"];
    final String? deeplink = data["deeplink"];

    final titleArgsString = data["title_loc_args"] as String;
    final List<String> titleArgs =
        json.decode(titleArgsString).toList().cast<String>();
    final bodyArgsString = data["body_loc_args"] as String;
    final List<String> bodyArgs =
        json.decode(bodyArgsString).toList().cast<String>();

    return NotificationData(
      title: title,
      body: body,
      titleArgs: titleArgs,
      bodyArgs: bodyArgs,
      deeplink: deeplink,
    );
  }
}
