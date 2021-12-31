// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreModelAdapter extends TypeAdapter<PreModel> {
  @override
  final int typeId = 0;

  @override
  PreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PreModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as double,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PreModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.paperType)
      ..writeByte(1)
      ..write(obj.rmsPkt)
      ..writeByte(2)
      ..write(obj.unitPrice)
      ..writeByte(3)
      ..write(obj.qty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
