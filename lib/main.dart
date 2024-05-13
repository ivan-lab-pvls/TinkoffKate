import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:zenmoney/app/init/init_di.dart';
import 'package:zenmoney/app/init/init_hive.dart';
import 'package:zenmoney/app/router/router.dart';
import 'package:zenmoney/app/theme.dart';
import 'package:zenmoney/features/finances/model/money_flow/money_flow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zenmoney/features/finances/controller/money_flow_cubit.dart';

final di = GetIt.instance;
late Box<MoneyFlow> moneyFlowBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  await initHive();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(BlocProvider(
    create: (context) => MoneyFlowCubit(),
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: _appRouter.config(),
          theme: theme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
