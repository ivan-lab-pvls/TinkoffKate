// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_flow_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoneyFlowTypeAdapter extends TypeAdapter<MoneyFlowType> {
  @override
  final int typeId = 0;

  @override
  MoneyFlowType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MoneyFlowType.income;
      case 1:
        return MoneyFlowType.expense;
      case 2:
        return MoneyFlowType.all;
      default:
        return MoneyFlowType.income;
    }
  }

  @override
  void write(BinaryWriter writer, MoneyFlowType obj) {
    switch (obj) {
      case MoneyFlowType.income:
        writer.writeByte(0);
        break;
      case MoneyFlowType.expense:
        writer.writeByte(1);
        break;
      case MoneyFlowType.all:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoneyFlowTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
