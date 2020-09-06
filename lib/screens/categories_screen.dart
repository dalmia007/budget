import 'package:budget_app/models/budget_repository.dart';
import 'package:budget_app/models/categories_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var category = Provider.of<CategoriesRepository>(context);
    var budgetRepo = Provider.of<BudgetRepository>(context);
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerBudget = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.98,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: category.getCategories().length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Card(
                            color: Colors.black,
                            child: ListTile(
                              title: Text(
                                category
                                    .getCategories()
                                    .values
                                    .elementAt(index)
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {
                                  category.removeCategory(category
                                      .getCategories()
                                      .keys
                                      .elementAt(index));
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            child: AlertDialog(
              title: Text(
                "Add Category",
                textAlign: TextAlign.center,
              ),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Category Name'),
                        controller: controllerName,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(hintText: 'Category Budget'),
                        controller: controllerBudget,
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                RaisedButton(
                  color: Colors.black,
                  child: Text('ADD'),
                  onPressed: () {
                    Navigator.pop(context);
                    budgetRepo.addBudget(
                        category.addCategory(controllerName.text),
                        controllerBudget.text);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
