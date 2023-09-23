// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_activity_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreateAdapter extends TypeAdapter<Create> {
  @override
  final int typeId = 1;

  @override
  Create read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Create(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[4] as String?,
      fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Create obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.dateCreated)
      ..writeByte(4)
      ..write(obj.IN);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
