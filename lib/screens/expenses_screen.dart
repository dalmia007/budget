import 'package:budget_app/models/budget_repository.dart';
import 'package:budget_app/models/categories_repository.dart';
import 'package:budget_app/models/expenses_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var expensesRepo = Provider.of<ExpensesRepository>(context);
    var categoriesList =
        Provider.of<CategoriesRepository>(context).getCategories();
    var budgetRepo = Provider.of<BudgetRepository>(context);
    var expenseList = expensesRepo.getExpenses();
    var currentValue;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses',
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: expenseList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Card(
                            color: Colors.black,
                            child: ListTile(
                              title: Text(
                                expenseList[index].name.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Container(
                                child: expenseList[index].categoryId != null
                                    ? Text(
                                        'Category: ' +
                                            expenseList[index].categoryId,
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    : DropdownButtonHideUnderline(
                                        child: Wrap(
                                          children: [
                                            DropdownButton(
                                              isDense: true,
                                              value: currentValue,
                                              hint: Text(
                                                'Select Category',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              items: categoriesList.keys
                                                  .map((value) =>
                                                      DropdownMenuItem(
                                                        value: value,
                                                        child: Text(value),
                                                      ))
                                                  .toList(),
                                              onChanged: (newValue) {
                                                expensesRepo.tagExpense(
                                                  expenseList[index].id,
                                                  newValue,
                                                );
                                                budgetRepo.updateBudget(
                                                    newValue,
                                                    expenseList[index].amount);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                              ),
                              trailing: Text(
                                '₹ ' + expenseList[index].amount.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
