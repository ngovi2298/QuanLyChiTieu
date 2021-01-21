import 'package:flutter/material.dart';
import 'package:Expenses_Tracker_App/core/database/moor_database.dart';
import 'package:Expenses_Tracker_App/core/services/category_icon_service.dart';
import 'package:Expenses_Tracker_App/core/services/moordatabase_service.dart';
import 'package:Expenses_Tracker_App/core/viewmodels/base_model.dart';

import '../../locator.dart';
//model màng hình thông tin giao dich
class DetailsModel extends BaseModel {
  final CategoryIconService _categoryIconService =
      locator<CategoryIconService>();

  final MoorDatabaseService _moorDatabaseService =
      locator<MoorDatabaseService>();
//lấy icon
  Icon getIconForCategory(int index, String type) {
    if (type == 'Tiền vào') {
      final categoryIcon = _categoryIconService.incomeList.elementAt(index);

      return Icon(
        categoryIcon.icon,
        color: categoryIcon.color,
      );
    } else {
      final categoryIcon = _categoryIconService.expenseList.elementAt(index);

      return Icon(
        categoryIcon.icon,
        color: categoryIcon.color,
      );
    }
  }
//lấy tên
  String getCategoryIconName(index, type) {
    if (type == 'Tiền vào') {
      return _categoryIconService.incomeList.elementAt(index).name;
    } else {
      return _categoryIconService.expenseList.elementAt(index).name;
    }
  }
  Future deleteTransacation(Transaction transaction) async {
    return await _moorDatabaseService.deleteTransaction(transaction);
  }
}
