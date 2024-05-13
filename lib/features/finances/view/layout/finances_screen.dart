import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zenmoney/main.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/layout/base_screen.dart';
import 'package:zenmoney/common/widget/custom_icon.dart';
import 'package:zenmoney/common/layout/section.dart';
import 'package:zenmoney/common/widget/custom_tile.dart';
import 'package:zenmoney/features/finances/controller/money_flow_cubit.dart';
import 'package:zenmoney/features/finances/model/money_flow/money_flow.dart';
import 'package:zenmoney/features/finances/model/money_flow_type/money_flow_type.dart';
import 'package:zenmoney/features/finances/view/widget/balance_widget.dart';
import 'package:zenmoney/features/finances/view/layout/filter_action_sheet.dart';
import 'package:zenmoney/features/finances/view/widget/money_flow_widget.dart';
import 'package:zenmoney/features/finances/view/widget/new_money_flow_button.dart';

@RoutePage()
class FinancesScreen extends StatefulWidget {
  const FinancesScreen({super.key});

  @override
  State<FinancesScreen> createState() => _FinancesScreenState();
}

class _FinancesScreenState extends State<FinancesScreen> {
  MoneyFlowType filterType = MoneyFlowType.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 32.h),
                  const BalanceWidget(),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Section(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'History',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        final newFilterType =
                            await showCupertinoModalPopup<MoneyFlowType?>(
                          context: context,
                          builder: (context) =>
                              FilterActionSheet(currentType: filterType),
                        );
                        if (newFilterType != null) {
                          setState(() {
                            filterType = newFilterType;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 8.w),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius12,
                          color: surfaceColor,
                        ),
                        child: Row(
                          children: [
                            CustomIcon(
                              assetName: 'assets/icons/misc/filter.svg',
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              'Filter',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              sliver: BlocBuilder<MoneyFlowCubit, List<MoneyFlow>>(
                builder: (context, moneyFlowList) {
                  if (moneyFlowList.isNotEmpty) {
                    late List<MoneyFlow> collection;
                    switch (filterType) {
                      case MoneyFlowType.income:
                        collection = moneyFlowList
                            .where((element) =>
                                element.type == MoneyFlowType.income)
                            .toList();
                        break;
                      case MoneyFlowType.expense:
                        collection = moneyFlowList
                            .where((element) =>
                                element.type == MoneyFlowType.expense)
                            .toList();
                        break;
                      case MoneyFlowType.all:
                        collection = moneyFlowList;
                        break;
                    }
                    return SliverList.separated(
                      itemCount: collection.length,
                      itemBuilder: (context, index) {
                        final moneyFlow = collection[index];
                        late String sign;
                        switch (moneyFlow.type) {
                          case MoneyFlowType.income:
                            sign = '+';
                            break;
                          case MoneyFlowType.expense:
                            sign = '-';
                            break;
                          default:
                        }
                        return MoneyFlowWidget(
                            moneyFlow: moneyFlow, sign: sign);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.h),
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: CustomTile(
                        assetName: 'assets/icons/misc/alert.svg',
                        child: Text(
                          'Your history and balance is empty, add income or expenses so you can track them.',
                        ),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: const NewMoneyFlowButton(),
    );
  }
}
