// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExpenseModel {
  String? expenseTitle;
  String? expenseDate;
  String? expenseCategory;
  int? expenseprice;
  ExpenseModel({
    this.expenseTitle,
    this.expenseDate,
    this.expenseCategory,
    this.expenseprice,
  });

  ExpenseModel copyWith({
    String? expenseTitle,
    String? expenseDate,
    String? expenseCategory,
    int? expenseprice,
  }) {
    return ExpenseModel(
      expenseTitle: expenseTitle ?? this.expenseTitle,
      expenseDate: expenseDate ?? this.expenseDate,
      expenseCategory: expenseCategory ?? this.expenseCategory,
      expenseprice: expenseprice ?? this.expenseprice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'expenseTitle': expenseTitle,
      'expenseDate': expenseDate,
      'expenseCategory': expenseCategory,
      'expenseprice': expenseprice,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      expenseTitle: map['expenseTitle'] as String,
      expenseDate: map['expenseDate'] as String,
      expenseCategory: map['expenseCategory'] as String,
      expenseprice: map['expenseprice'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExpenseModel(expenseTitle: $expenseTitle, expenseDate: $expenseDate, expenseCategory: $expenseCategory, expenseprice: $expenseprice)';
  }

  @override
  bool operator ==(covariant ExpenseModel other) {
    if (identical(this, other)) return true;

    return other.expenseTitle == expenseTitle &&
        other.expenseDate == expenseDate &&
        other.expenseCategory == expenseCategory &&
        other.expenseprice == expenseprice;
  }

  @override
  int get hashCode {
    return expenseTitle.hashCode ^
        expenseDate.hashCode ^
        expenseCategory.hashCode ^
        expenseprice.hashCode;
  }
}
