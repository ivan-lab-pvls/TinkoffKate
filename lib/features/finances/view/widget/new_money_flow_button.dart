import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenmoney/app/router/router.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/layout/section.dart';
import 'package:zenmoney/common/widget/custom_tile.dart';
import 'package:zenmoney/features/finances/model/money_flow_type/money_flow_type.dart';

class NewMoneyFlowButton extends StatelessWidget {
  const NewMoneyFlowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 20.w,
      ),
      borderRadius: BorderRadius.circular(32.r),
      color: Theme.of(context).primaryColor,
      child: Icon(
        Icons.add,
        color: Theme.of(context).highlightColor,
      ),
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context) => Material(
          color: Colors.transparent,
          child: CupertinoPopupSurface(
            child: SizedBox(
              height: 270.h,
              child: Section(
                child: Column(
                  children: [
                    SizedBox(height: 6.h),
                    Container(
                      width: 36.w,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius12,
                        color: const Color.fromRGBO(127, 127, 127, 0.4),
                      ),
                    ),
                    SizedBox(height: 11.h),
                    Text(
                      'What do you want to add?',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(height: 16.h),
                    CustomTile(
                      assetName: 'assets/icons/misc/income.svg',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Income',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const CupertinoListTileChevron(),
                        ],
                      ),
                      onPressed: () {
                        context.router
                          ..popForced()
                          ..push(MoneyFlowRoute(type: MoneyFlowType.income));
                      },
                    ),
                    SizedBox(height: 8.h),
                    CustomTile(
                      assetName: 'assets/icons/misc/expense.svg',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Expense',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const CupertinoListTileChevron(),
                        ],
                      ),
                      onPressed: () {
                        context.router
                          ..popForced()
                          ..push(MoneyFlowRoute(type: MoneyFlowType.expense));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
