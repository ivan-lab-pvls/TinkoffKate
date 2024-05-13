import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/layout/base_screen.dart';
import 'package:zenmoney/common/layout/titled_section.dart';
import 'package:zenmoney/common/widget/contained_icon.dart';
import 'package:zenmoney/common/widget/rounded_contained_icon.dart';
import 'package:zenmoney/features/finances/controller/money_flow_cubit.dart';
import 'package:zenmoney/features/finances/model/money_flow/money_flow.dart';
import 'package:zenmoney/features/finances/model/money_flow_category/money_flow_category/money_flow_category.dart';
import 'package:zenmoney/features/finances/model/money_flow_category/money_flow_category_expense/money_flow_category_expense.dart';
import 'package:zenmoney/features/finances/model/money_flow_category/money_flow_category_income/money_flow_category_income.dart';
import 'package:zenmoney/features/finances/model/money_flow_type/money_flow_type.dart';

@RoutePage()
class MoneyFlowScreen extends StatefulWidget {
  final MoneyFlowType type;
  final MoneyFlow? moneyFlow;
  const MoneyFlowScreen({super.key, required this.type, this.moneyFlow});

  @override
  State<MoneyFlowScreen> createState() => _MoneyFlowScreenState();
}

class _MoneyFlowScreenState extends State<MoneyFlowScreen> {
  late TextEditingController titleController;
  late TextEditingController amountController;

  List<MoneyFlowCategory> categories = [];
  MoneyFlowCategory? selectedCategory;
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    amountController = TextEditingController();
    switch (widget.type) {
      case MoneyFlowType.income:
        categories = MoneyFlowCategoryIncome.incomeCategories;
        break;
      case MoneyFlowType.expense:
        categories = MoneyFlowCategoryExpense.expenseCategories;
        break;
      default:
    }
    final moneyFlow = widget.moneyFlow;
    if (moneyFlow != null) {
      titleController.text = moneyFlow.title;
      amountController.text = moneyFlow.amount.toString();
      selectedCategory = moneyFlow.category;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  validate() => setState(() {
        final amount = amountController.text;
        isValid = titleController.text.isNotEmpty &&
            amount.isNotEmpty &&
            (num.tryParse(amount) != null) &&
            selectedCategory != null;
      });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BaseScreen(
        navigationBar: CupertinoNavigationBar(
          middle: Text(toBeginningOfSentenceCase(widget.type.name)),
          leading: RoundedContainedIcon(
            assetName: 'assets/icons/misc/back.svg',
            onPressed: () => context.router.popForced(),
          ),
          trailing: widget.moneyFlow != null
              ? CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text('Delete'),
                  onPressed: () => showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text('Are you sure?'),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            context.router.popForced();
                          },
                          isDefaultAction: true,
                          child: const Text('No'),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            _deleteMoneyFlow(context);
                          },
                          isDestructiveAction: true,
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
          border: null,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: TitledSection(
                title: 'Title',
                child: SizedBox(
                  height: 44.h,
                  child: CupertinoTextField.borderless(
                    placeholderStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16),
                    controller: titleController,
                    placeholder: 'Example: (Salary)',
                    padding:
                        EdgeInsets.symmetric(vertical: 11.h, horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: borderRadius16,
                    ),
                    onChanged: (_) => validate(),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TitledSection(
                title: 'Amount of money',
                child: SizedBox(
                  height: 44.h,
                  child: CupertinoTextField.borderless(
                    placeholderStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16),
                    controller: amountController,
                    placeholder: 'Amount (\$)',
                    padding:
                        EdgeInsets.symmetric(vertical: 11.h, horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: borderRadius16,
                    ),
                    onChanged: (_) => validate(),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TitledSection(
                title: 'Category',
                child: Wrap(
                  spacing: 8.r,
                  runSpacing: 8.r,
                  children: List.generate(categories.length, (index) {
                    final MoneyFlowCategory category = categories[index];
                    late Color iconClr;
                    late Color surfaceClr;
                    final conditon = category.name == selectedCategory?.name;
                    if (conditon) {
                      iconClr = Theme.of(context).primaryColor;
                      surfaceClr = Theme.of(context).highlightColor;
                    } else {
                      iconClr = Theme.of(context).disabledColor;
                      surfaceClr = surfaceColor;
                    }
                    return CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: 175.w,
                        padding: EdgeInsets.symmetric(
                          vertical: 6.h,
                          horizontal: 8.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius16,
                          color: surfaceClr,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ContainedIcon(
                                  assetName: category.assetName,
                                  color: iconClr,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  toBeginningOfSentenceCase(category.name),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: iconClr),
                                ),
                              ],
                            ),
                            Builder(builder: (context) {
                              if (conditon) {
                                return const Icon(Icons.check_circle);
                              } else {
                                return const Icon(Icons.circle_outlined);
                              }
                            }),
                          ],
                        ),
                      ),
                      onPressed: () {
                        selectedCategory = categories[index];
                        validate();
                      },
                    );
                  }),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: CupertinoButton.filled(
                    onPressed: isValid
                        ? () {
                            if (widget.moneyFlow == null) {
                              _createMoneyFlow(context);
                            } else {
                              _updateMoneyFlow(context);
                            }
                          }
                        : null,
                    child: const Text('Done'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _deleteMoneyFlow(BuildContext context) {
    final moneyFlows = context.read<MoneyFlowCubit>().state;
    final index = moneyFlows.indexOf(widget.moneyFlow!);
    context.read<MoneyFlowCubit>().delete(index);
    context.router
      ..popForced()
      ..popForced();
  }

  void _createMoneyFlow(BuildContext context) {
    context.read<MoneyFlowCubit>().create(
          MoneyFlow(
            type: widget.type,
            title: titleController.text,
            amount: num.parse(amountController.text),
            category: selectedCategory!,
          ),
        );
    context.router.popForced();
  }

  void _updateMoneyFlow(BuildContext context) {
    final moneyFlows = context.read<MoneyFlowCubit>().state;
    final index = moneyFlows.indexOf(widget.moneyFlow!);
    context.read<MoneyFlowCubit>().update(
          index,
          MoneyFlow(
            type: widget.type,
            title: titleController.text,
            amount: num.parse(amountController.text),
            category: selectedCategory!,
          ),
        );
    context.router.popForced();
  }
}
