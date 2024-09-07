// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_local_notification.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppLocalNotificationAdapter extends TypeAdapter<AppLocalNotification> {
  @override
  final int typeId = 3;

  @override
  AppLocalNotification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppLocalNotification(
      id: fields[0] as String,
      title: fields[1] as String,
      body: fields[2] as String,
      payload: fields[3] as String,
      dateTime: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AppLocalNotification obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(3)
      ..write(obj.payload)
      ..writeByte(4)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppLocalNotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
