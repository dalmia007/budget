import 'package:budget_app/models/budget_repository.dart';
import 'package:budget_app/models/categories_repository.dart';
import 'package:budget_app/models/expenses_repository.dart';
import 'package:budget_app/widgets/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoriesRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExpensesRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => BudgetRepository(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Navbar(),
        ),
      ),
    );
  }
}
