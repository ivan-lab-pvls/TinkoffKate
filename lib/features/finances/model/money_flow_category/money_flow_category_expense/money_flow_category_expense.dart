import 'package:hive_flutter/hive_flutter.dart';
import 'package:zenmoney/features/finances/model/money_flow_category/money_flow_category/money_flow_category.dart';

part 'money_flow_category_expense.g.dart';

@HiveType(typeId: 3)
class MoneyFlowCategoryExpense extends MoneyFlowCategory {
  MoneyFlowCategoryExpense(String name, String assetName)
      : super(name, assetName);

  static List<MoneyFlowCategoryExpense> expenseCategories = [
    MoneyFlowCategoryExpense(
        'acquisition', 'assets/icons/expense/acquisition.svg'),
    MoneyFlowCategoryExpense('food', 'assets/icons/expense/food.svg'),
    MoneyFlowCategoryExpense('transport', 'assets/icons/expense/transport.svg'),
    MoneyFlowCategoryExpense('rest', 'assets/icons/expense/rest.svg'),
    MoneyFlowCategoryExpense(
        'investment', 'assets/icons/expense/investment.svg'),
  ];
}
