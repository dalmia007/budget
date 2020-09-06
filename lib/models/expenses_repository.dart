import 'package:flutter/material.dart';

import 'expense.dart';

class ExpensesRepository with ChangeNotifier {
  static final Map<int, Expense> expenseList = {
    1: Expense(1, "Fast Food", 200.87, categoryId: "2"),
    2: Expense(2, "Cab", 90.0, categoryId: "1"),
    3: Expense(3, "Cab 2", 15.98),
    4: Expense(4, "Jeans", 1100, categoryId: "3"),
    5: Expense(5, "Stationary", 70),
    6: Expense(6, "Shirt", 900),
    7: Expense(7, "Pizza", 790, categoryId: "2"),
    8: Expense(8, "Mobile", 10000),
  };

  ExpensesRepository();
  List<Expense> getExpenses() {
    return expenseList.values.toList();
  }

  void tagExpense(int expenseId, String categoryId) {
    expenseList[expenseId].categoryId = categoryId;
    notifyListeners();
  }
}
