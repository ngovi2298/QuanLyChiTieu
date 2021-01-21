import 'package:Expenses_Tracker_App/core/enums/viewstate.dart';
import 'package:Expenses_Tracker_App/core/services/category_icon_service.dart';
import 'package:Expenses_Tracker_App/core/viewmodels/base_model.dart';
import 'package:Expenses_Tracker_App/core/database/moor_database.dart';
import 'package:Expenses_Tracker_App/core/services/moordatabase_service.dart';
import '../../locator.dart';

class PieChartModel extends BaseModel {
  List<String> months = [
    'Tháng 1',
    'Tháng 2',
    'Tháng 3',
    'Tháng 4',
    'Tháng 5',
    'Tháng 6',
    'Tháng 7',
    'Tháng 8',
    'Tháng 9',
    'Tháng 10',
    'Tháng 11',
    'Tháng 12'
  ];

  final MoorDatabaseService _moorDatabaseService =
  locator<MoorDatabaseService>();

  final CategoryIconService _categoryIconService =
  locator<CategoryIconService>();

  List<Transaction> transactions = List<Transaction>();

  int selectedMonthIndex = 0;

  Map<String, double> dataMap = new Map<String, double>();
  String type = 'Tiền ra';

  List<String> types = ["Tiền vào", "Tiền ra"];

  init(bool firstTime) async {
    if (firstTime) selectedMonthIndex = DateTime
        .now()
        .month - 1;

    setState(ViewState.Busy);
    notifyListeners();

    transactions = await _moorDatabaseService.getAllTransactionsForType(
        months.elementAt(selectedMonthIndex), type);

    dataMap = getDefaultDataMap(transactions);

    transactions.forEach((element) {
      prepareDataMap(element);
    });

    print(dataMap.toString());
    setState(ViewState.Idle);
    notifyListeners();
  }

  changeSelectedMonth(int val) async {
    selectedMonthIndex = val;

    transactions = await _moorDatabaseService.getAllTransactionsForType(
        months.elementAt(selectedMonthIndex), type);
    //clear old data
    dataMap = getDefaultDataMap(transactions);

    transactions.forEach((element) {
      prepareDataMap(element);
    });

    notifyListeners();
  }

  Map<String, double> getDefaultDataMap(List<Transaction> transactions) {
    Map<String, double> fullExpensesMap = {
      'Ăn Uống': 0,
      'Hoá Đơn': 0,
      'Đi Lại': 0,
      'Nhà Cữa': 0,
      'Giải Trí': 0,
      'Mua Sắm': 0,
      'Quần Áo': 0,
      'Bảo Hiểm': 0,
      'Điện Thoại': 0,
      'Sức Khoẻ': 0,
      'Thể Thao': 0,
      'Làm Đẹp': 0,
      'Giáo Dục': 0,
      'Tặng Quà': 0,
      'Thú Nuôi': 0,
      'Tiền Lương': 0,
      'Tiền Thưởng': 0,
      'Trợ Cấp': 0,
      'Vay Mượn': 0,
      'Lợi Nhuận': 0,
      'Xổ số': 0,
    };

    Map<String, double> fullIncomeMap = {
      'Tiền Lương': 0,
      'Tiền Thưởng': 0,
      'Trợ Cấp': 0,
      'Vay Mượn': 0,
      'Lợi Nhuận': 0,
      'Xổ số': 0,
    };

    List<String> transactionsCategories = List();

    transactions.forEach((element) {
      if (type == 'Tiền vào') {
        String category = _categoryIconService.incomeList
            .elementAt(element.categoryindex)
            .name;
        transactionsCategories.add(category);
      } else {
        String category = _categoryIconService.expenseList
            .elementAt(element.categoryindex)
            .name;
        transactionsCategories.add(category);
      }
    });
    if (type == 'Tiền vào') {
      fullIncomeMap.removeWhere((key, value) {
        return !transactionsCategories.contains(key);
      });
      return fullIncomeMap;
    }

    fullExpensesMap.removeWhere((key, value) {
      return !transactionsCategories.contains(key);
    });
    return fullExpensesMap;
  }

  changeType(int val) async {
    // 0 => tiền vào
    // 1 => tiền ra
    if (val == 0) {
      type = 'Tiền vào';
    } else {
      type = 'Tiền ra';
    }

    await init(true);
  }

  void prepareDataMap(element) {
    if (type == 'Tiền vào') {
      dataMap[_categoryIconService.incomeList
          .elementAt(element.categoryindex)
          .name] = dataMap[_categoryIconService.incomeList
          .elementAt(element.categoryindex)
          .name] + element.amount;
    } else {
      dataMap[_categoryIconService.expenseList
          .elementAt(element.categoryindex)
          .name] = dataMap[_categoryIconService.expenseList
          .elementAt(element.categoryindex)
          .name] +
          element.amount;
    }
  } //prepareDatamap
}
