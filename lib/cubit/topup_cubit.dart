import 'package:bloc/bloc.dart';
import 'package:dggcourses/models/topup_model.dart';
import 'package:dggcourses/pages/topupsuccess.dart';
import 'package:dggcourses/services/topup_service.dart';
import 'package:equatable/equatable.dart';

part 'topup_state.dart';

class TopupCubit extends Cubit<TopupState> {
  TopupCubit() : super(TopupInitial());

  void getAllTopUp({
    required String user_id,
  }) async {
    emit(TopupLoading());
    List<TopUpModel> topUps = await TopUpService().getAlltopUp(user_id: user_id);
    emit(TopupSuccess(topUps));
  }

  void topUp({
    required String order_id,
    required int total,
    required String user_id
  }) async {
    emit(TopupLoading());
    await TopUpService().topUp(
      order_id: order_id,
      total: total,
      user_id: user_id
    );
    List<TopUpModel> topUps = await TopUpService().getAlltopUp(user_id: user_id);
    emit(TopupSuccess(topUps));
  }
}
