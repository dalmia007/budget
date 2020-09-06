import 'package:equatable/equatable.dart';

class Expense extends Equatable {
  final int id;
  final String name;
  double amount;
  String categoryId = "0";
  Expense(this.id, this.name, this.amount, {this.categoryId});
  @override
  List<Object> get props => [id, name, amount];
  @override
  String toString() {
    return 'Expense { id: $id, name: $name, amount: $amount, category: $categoryId }';
  }
}
