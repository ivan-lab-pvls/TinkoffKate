import 'package:hive/hive.dart';

part 'money_flow_category.g.dart';

@HiveType(typeId: 1)
class MoneyFlowCategory {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String assetName;

  MoneyFlowCategory(this.name, this.assetName);
}
