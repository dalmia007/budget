import 'package:budget_app/screens/budget_screen.dart';
import 'package:budget_app/screens/expenses_screen.dart';
import 'package:budget_app/screens/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    CategoriesScreen(),
    ExpensesScreen(),
    BudgetScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.white,
                tabs: [
                  GButton(
                    icon: Icons.category,
                    iconColor: Colors.white,
                    text: 'Categories',
                  ),
                  GButton(
                    icon: Icons.attach_money,
                    iconColor: Colors.white,
                    text: 'Expenses',
                  ),
                  GButton(
                    icon: Icons.account_balance_wallet,
                    iconColor: Colors.white,
                    text: 'Budget',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
