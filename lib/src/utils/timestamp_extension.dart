import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jiffy/jiffy.dart';

extension TimestampExtension on Timestamp {
  String fromNow() {
    return Jiffy.parse(this.toDate().toString()).fromNow();
  }

  String get dateDescription {
    return Jiffy.parse(this.toDate().toString()).format(pattern: "EEEE d MMMM");
  }

  String get shortDateDescription {
    return Jiffy.parse(this.toDate().toString()).format(pattern: "yyyy/MM/dd");
  }

  String get timeDescription {
    return Jiffy.parse(this.toDate().toString()).format(pattern: "hh:mm");
  }
}

extension DateTimeExtension on DateTime {
  Timestamp get toTimestamp {
    return Timestamp.fromDate(this);
  }

  String get fullDate {
    return Jiffy.parse(this.toString())
        .format(pattern: 'MMMM do yyyy, h:mm:ss a');
  }

  String get fromNow {
    return Jiffy.parse(this.toString()).fromNow();
  }

  String get dateDescription {
    return Jiffy.parse(this.toString()).format(pattern: "EEEE d MMMM");
  }

  String get fullDateDescription {
    return Jiffy.parse(this.toString()).format(pattern: "yyyy/MM/dd - hh:mm");
  }
}

// MARK: - Static
DateTime get tomorrow {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day + 1);
}

DateTime get yesterday {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day - 1);
}

DateTime get nextWeek {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day + 7);
}

DateTime get nextYear {
  final now = DateTime.now();
  return DateTime(now.year + 1, now.month, now.day);
}

DateTime yearsBefore(int year) {
  final now = DateTime.now();
  return DateTime(now.year - year, now.month, now.day);
}
