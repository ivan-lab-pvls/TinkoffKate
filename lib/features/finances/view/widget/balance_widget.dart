import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/layout/section.dart';
import 'package:zenmoney/features/finances/controller/money_flow_cubit.dart';
import 'package:zenmoney/features/finances/model/money_flow/money_flow.dart';
import 'package:zenmoney/features/finances/model/money_flow_type/money_flow_type.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyFlowCubit, List<MoneyFlow>>(
      builder: (context, state) {
        final income = state
            .where((element) => element.type == MoneyFlowType.income)
            .fold(0.0,
                (previousValue, element) => previousValue + element.amount);
        final expense = state
            .where((element) => element.type == MoneyFlowType.expense)
            .fold(0.0,
                (previousValue, element) => previousValue + element.amount);
        return Section(
          child: Container(
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: borderRadius12,
            ),
            child: Column(
              children: [
                SizedBox(height: 12.h),
                const Text('Balance Amount'),
                Text(
                  '${income - expense}\$',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 32.sp,
                      ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: borderRadius12,
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Column(
                              children: [
                                const Text('Income'),
                                Text(
                                  '$income\$',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontSize: 18.sp),
                                ),
                              ],
                            ),
                          ),
                          const VerticalDivider(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Column(
                              children: [
                                const Text('Expense'),
                                Text(
                                  '$expense\$',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontSize: 18.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
