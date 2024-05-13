// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_flow_category_expense.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoneyFlowCategoryExpenseAdapter
    extends TypeAdapter<MoneyFlowCategoryExpense> {
  @override
  final int typeId = 3;

  @override
  MoneyFlowCategoryExpense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoneyFlowCategoryExpense(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MoneyFlowCategoryExpense obj) {
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
      other is MoneyFlowCategoryExpenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
