import 'package:hive/hive.dart';

part 'money_flow_type.g.dart';

@HiveType(typeId: 0)
enum MoneyFlowType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
  @HiveField(2)
  all
}
