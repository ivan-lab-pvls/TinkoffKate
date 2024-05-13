// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_flow.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoneyFlowAdapter extends TypeAdapter<MoneyFlow> {
  @override
  final int typeId = 4;

  @override
  MoneyFlow read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoneyFlow(
      type: fields[0] as MoneyFlowType,
      title: fields[1] as String,
      amount: fields[2] as num,
      category: fields[3] as MoneyFlowCategory,
    );
  }

  @override
  void write(BinaryWriter writer, MoneyFlow obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoneyFlowAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
