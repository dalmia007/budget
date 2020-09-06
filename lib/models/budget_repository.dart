import 'package:flutter/material.dart';

class BudgetRepository with ChangeNotifier {
  static final Map<String, double> budget = {
    "0": 0, //unknown expenses, no budgeting
    "1": 1000, //Rs. 1000 budgeted for category id 1 i.e Travel
    "2": 1500,
    "3": 2000
  };

  static final Map<String, double> usedBudget = {
    "0": 0,
    "1": 90,
    "2": 990.87,
    "3": 1100
  };

  BudgetRepository();
  Map<String, double> getBudget() {
    return budget;
  }

  Map<String, double> getUsedBudget() {
    return usedBudget;
  }

  void updateBudget(String categoryId, double budgetAmount) {
    usedBudget[categoryId] = usedBudget[categoryId] + budgetAmount;
    notifyListeners();
  }

  void addBudget(String categoryId, String budgetAmount) {
    budget.putIfAbsent(categoryId.toString(), () => double.parse(budgetAmount));
    usedBudget.putIfAbsent(categoryId.toString(), () => 0.00);
    notifyListeners();
  }
}
