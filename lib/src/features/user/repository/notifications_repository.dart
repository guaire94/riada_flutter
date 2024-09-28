import 'package:template_flutter_app/src/features/user/datasource/notifications_data_source.dart';
import 'package:template_flutter_app/src/features/user/entity/notification.dart';
import 'package:template_flutter_app/src/features/user/entity/notification_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationsRepository {
  final NotificationsDataSource _notificationsDataSource;

  NotificationsRepository({
    required NotificationsDataSource notificationsDataSource,
  }) : _notificationsDataSource = notificationsDataSource;

  Future<String?> getInitialDeeplink() async {
    return _notificationsDataSource.getInitialDeeplink();
  }

  Future requestPermission({
    required Function(NotificationData) onMessageTapped,
  }) async {
    return _notificationsDataSource.requestPermission(
      onMessageTapped: onMessageTapped,
    );
  }

  Future<void> sendNotification({required Notification notification}) async {
    return _notificationsDataSource.sendNotification(
      notification: notification,
    );
  }
}
