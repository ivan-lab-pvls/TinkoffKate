import 'package:bloc/bloc.dart';
import 'package:zenmoney/main.dart';
import 'package:zenmoney/features/finances/model/money_flow/money_flow.dart';

class MoneyFlowCubit extends Cubit<List<MoneyFlow>> {
  MoneyFlowCubit() : super([]) {
    read();
  }

  void create(MoneyFlow moneyFlow) {
    moneyFlowBox.add(moneyFlow).whenComplete(() {
      emit([...state, moneyFlow]);
    });
  }

  void read() {
    List<MoneyFlow> moneyFlowList = [];
    if (moneyFlowBox.isNotEmpty) {
      for (var i = 0; i < moneyFlowBox.length; i++) {
        moneyFlowList.add(moneyFlowBox.getAt(i)!);
      }
      emit(moneyFlowList);
    } else {
      emit([]);
    }
  }

  void update(int index, MoneyFlow moneyFlow) {
    moneyFlowBox.putAt(index, moneyFlow).whenComplete(() {
      final List<MoneyFlow> updatedList = List.from(state);
      updatedList[index] = moneyFlow;
      emit(updatedList);
    });
  }

  void delete(int index) {
    moneyFlowBox.deleteAt(index).whenComplete(() {
      final List<MoneyFlow> updatedList = List.from(state);
      updatedList.removeAt(index);
      emit(updatedList);
    });
  }
}
