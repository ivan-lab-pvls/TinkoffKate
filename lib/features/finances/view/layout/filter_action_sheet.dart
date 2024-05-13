import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zenmoney/features/finances/model/money_flow_type/money_flow_type.dart';

class FilterActionSheet extends StatelessWidget {
  final MoneyFlowType currentType;
  const FilterActionSheet({
    super.key,
    required this.currentType,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: List.generate(MoneyFlowType.values.length, (index) {
        final condition = currentType == MoneyFlowType.values[index];
        return CupertinoActionSheetAction(
          onPressed: () {
            context.router.popForced(MoneyFlowType.values[index]);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (condition) const Icon(CupertinoIcons.check_mark),
              if (condition) SizedBox(width: 8.w),
              Text(
                toBeginningOfSentenceCase(MoneyFlowType.values[index].name),
              ),
              if (condition) SizedBox(width: 8.w),
              if (condition)
                const Icon(CupertinoIcons.check_mark,
                    color: Colors.transparent),
            ],
          ),
        );
      }),
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => context.router.popForced(),
        isDefaultAction: true,
        child: const Text('Cancel'),
      ),
    );
  }
}
