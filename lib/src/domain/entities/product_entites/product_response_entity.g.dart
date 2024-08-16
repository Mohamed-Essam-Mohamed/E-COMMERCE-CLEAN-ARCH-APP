// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDataEntityAdapter extends TypeAdapter<ProductDataEntity> {
  @override
  final int typeId = 1;

  @override
  ProductDataEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDataEntity(
      sold: fields[0] as int?,
      images: (fields[1] as List?)?.cast<String>(),
      id: fields[2] as String?,
      title: fields[3] as String?,
      description: fields[4] as String?,
      price: fields[5] as int?,
      imageCover: fields[6] as String?,
      ratingsAverage: fields[7] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDataEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.sold)
      ..writeByte(1)
      ..write(obj.images)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.imageCover)
      ..writeByte(7)
      ..write(obj.ratingsAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
