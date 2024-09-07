// class data notifcation hive
import 'package:hive/hive.dart';
part 'app_local_notification.g.dart';

@HiveType(typeId: 3)
class AppLocalNotification extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String body;
  @HiveField(3)
  String payload;

  @HiveField(4)
  DateTime dateTime;

  AppLocalNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
    required this.dateTime,
  });
}
