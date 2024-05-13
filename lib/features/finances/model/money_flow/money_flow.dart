import 'package:hive_flutter/hive_flutter.dart';
import 'package:zenmoney/features/finances/model/money_flow_category/money_flow_category/money_flow_category.dart';
import 'package:zenmoney/features/finances/model/money_flow_type/money_flow_type.dart';

part 'money_flow.g.dart';

@HiveType(typeId: 4)
class MoneyFlow {
  @HiveField(0)
  final MoneyFlowType type;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final num amount;
  @HiveField(3)
  final MoneyFlowCategory category;

  MoneyFlow({
    required this.type,
    required this.title,
    required this.amount,
    required this.category,
  });
}
