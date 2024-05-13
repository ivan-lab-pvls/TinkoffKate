import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zenmoney/app/router/router.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/common/widget/custom_tile.dart';
import 'package:zenmoney/features/finances/model/money_flow/money_flow.dart';

class MoneyFlowWidget extends StatelessWidget {
  const MoneyFlowWidget({
    super.key,
    required this.moneyFlow,
    required this.sign,
  });

  final MoneyFlow moneyFlow;
  final String sign;

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      assetName: moneyFlow.category.assetName,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  moneyFlow.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '$sign${moneyFlow.amount}\$',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                toBeginningOfSentenceCase(moneyFlow.category.name),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  borderRadius: borderRadius16,
                  color: surfaceColor,
                ),
                child: Text(
                  toBeginningOfSentenceCase(moneyFlow.type.name),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ],
      ),
      onPressed: () => context.router.push(
        MoneyFlowRoute(
          type: moneyFlow.type,
          moneyFlow: moneyFlow,
        ),
      ),
    );
  }
}
