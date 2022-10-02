//@dart=2.9

import 'dart:convert';

import 'package:dggcourses/models/transaction_model.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  
  Future<TransactionModel> midtransTransaction({
    String course_id,
    String order_id,
    int total,
    String user_id
  }) async {
    var url = "$baseUrl/transaction";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "course_id": course_id,
        "order_id": order_id,
        "payment_type": "manual",
        "total": total,
        "user_id": user_id
      }
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    TransactionModel transaction = TransactionModel.fromJson(data);
    print(data);

    return transaction;
  }

  Future<TransactionModel> dggmTransaction({
    String course_id,
    String order_id,
    int total,
    String user_id
  }) async {
    var url = "$baseUrl/transaction";
    var headers = {
      "Content-Type" : "application/json"
    };
    var body = jsonEncode(
      {
        "course_id": course_id,
        "order_id": order_id,
        "payment_type": "dggm",
        "total": total,
        "user_id": user_id
      }
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    TransactionModel transaction = TransactionModel.fromJson(data);

    return transaction;
  }

  Future<List<TransactionModel>> getAllTransactions({
    String user_id
  }) async {
    var url = "$baseUrl/transaction/user/$user_id";
    var headers = {
      "Content-Type" : "application/json"
    };

    var response = await http.get(
      url,
      headers: headers
    );

    List data = jsonDecode(response.body)['data'];
    List<TransactionModel> transactions = [];
    for (var item in data) {
      transactions.add(TransactionModel.fromJson(item));
    }

    return transactions;
  }
}