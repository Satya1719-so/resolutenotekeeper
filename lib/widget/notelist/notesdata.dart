import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; // to generate a unique id
import 'package:intl/intl.dart';

final uuid = Uuid();
final formated = DateFormat.yMd();

enum Category {
  High,
  VeryHigh,
  Medium,
  Low,
} // custom type (ex catagory ) which combination of predefine allowed values

//enum is use for fixed set of allowed value we have to use one of them when use catagory to avoid typo error
const CatagoryIcon = {
  Category.High: Icons.arrow_upward_sharp,
  Category.Medium: Icons.line_axis_sharp,
  Category.Low: Icons.arrow_downward_sharp,
  Category.VeryHigh: Icons.flight_takeoff,
};

class Notesdata {
  Notesdata({
    required this.amount,
    required this.date,
    required this.title,
    required this.category,
  }) : id =
           uuid.v4(); //will generate a unique id and asing to id variable and v4 is a type of id
  String id;
  String title;
  String amount;
  DateTime date;
  final Category category;
  String get formattedDate {
    return formated.format(date);
  }
}

// class Expensebucket {
//   Expensebucket({required this.category, required this.expenses});
//   Expensebucket.forCategory(List<Notesdata> allExpenses, this.category)
//     : expenses =
//           allExpenses
//               .where((expense) => expense.category == category)
//               .toList(); //adding external constructer to the class
//   final Category category;
//   final List<Notesdata> expenses;
//   double get totalexpense {
//     double sum = 0;
//     for (final expense in expenses) {
//       sum += expense.amount; //sum=sum+expense.amount
//     }
//     return sum;
//   }
//}
