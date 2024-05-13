import 'package:hive_flutter/hive_flutter.dart';
import 'package:zenmoney/features/finances/model/money_flow_category/money_flow_category/money_flow_category.dart';

part 'money_flow_category_income.g.dart';

@HiveType(typeId: 2)
class MoneyFlowCategoryIncome extends MoneyFlowCategory {
  MoneyFlowCategoryIncome(String name, String assetName)
      : super(name, assetName);

  static List<MoneyFlowCategoryIncome> incomeCategories = [
    MoneyFlowCategoryIncome('business', 'assets/icons/income/business.svg'),
    MoneyFlowCategoryIncome('salary', 'assets/icons/income/salary.svg'),
    MoneyFlowCategoryIncome('dividends', 'assets/icons/income/dividends.svg'),
    MoneyFlowCategoryIncome('investment', 'assets/icons/income/investment.svg'),
    MoneyFlowCategoryIncome('rent', 'assets/icons/income/rent.svg'),
    MoneyFlowCategoryIncome('freelance', 'assets/icons/income/freelance.svg'),
    MoneyFlowCategoryIncome('royalty', 'assets/icons/income/royalty.svg'),
    MoneyFlowCategoryIncome('passive', 'assets/icons/income/passive.svg'),
  ];
}
