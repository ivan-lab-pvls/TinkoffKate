// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_flow_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoneyFlowCategoryAdapter extends TypeAdapter<MoneyFlowCategory> {
  @override
  final int typeId = 1;

  @override
  MoneyFlowCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoneyFlowCategory(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MoneyFlowCategory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.assetName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoneyFlowCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
