import 'package:budget_app/models/budget_repository.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BudgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var budgetRepo = Provider.of<BudgetRepository>(context);
    var budgetList = budgetRepo.getBudget();
    var usedBudgetList = budgetRepo.getUsedBudget();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Budget',
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
                    itemCount: budgetList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          if (index != 0)
                            Card(
                              color: Colors.black,
                              child: ListTile(
                                leading: (usedBudgetList.values
                                                .elementAt(index) /
                                            budgetList.values
                                                .elementAt(index)) <
                                        1
                                    ? Lottie.asset('assets/lotties/happy.json',
                                        width: 50, height: 50)
                                    : Lottie.asset('assets/lotties/sad.json',
                                        width: 50, height: 50),
                                title: Text(
                                  'Total Budget: ₹' +
                                      budgetList.values
                                          .elementAt(index)
                                          .toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  'Budget Used: ₹' +
                                      usedBudgetList.values
                                          .elementAt(index)
                                          .toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                trailing: Text(
                                  (usedBudgetList.values.elementAt(index) *
                                              100 /
                                              budgetList.values
                                                  .elementAt(index))
                                          .toStringAsFixed(1) +
                                      ' %',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
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
