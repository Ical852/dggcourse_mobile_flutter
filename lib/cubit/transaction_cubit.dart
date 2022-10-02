import 'package:bloc/bloc.dart';
import 'package:dggcourses/models/transaction_model.dart';
import 'package:dggcourses/services/transaction_service.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void getAllTransactions({required String user_id}) async {
    emit(TransactionLoading());
    List<TransactionModel> transactions = await TransactionService().getAllTransactions(user_id: user_id);
    emit(TransactionSuccess(transactions));
  }

  void midtransTransactions({
    required String course_id,
    required String order_id,
    required int total,
    required String user_id
  }) async {
    emit(TransactionLoading());
    await TransactionService().midtransTransaction(
      course_id: course_id,
      order_id: order_id,
      total: total,
      user_id: user_id
    );
    List<TransactionModel> transactions = await TransactionService().getAllTransactions(user_id: user_id);
    emit(TransactionSuccess(transactions));
  }

  void dggmTransactions({
    required String course_id,
    required String order_id,
    required int total,
    required String user_id
  }) async {
    emit(TransactionLoading());
    await TransactionService().dggmTransaction(
      course_id: course_id,
      order_id: order_id,
      total: total,
      user_id: user_id
    );
    List<TransactionModel> transactions = await TransactionService().getAllTransactions(user_id: user_id);
    emit(TransactionSuccess(transactions));
  }
}
