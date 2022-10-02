import 'package:bloc/bloc.dart';
import 'package:dggcourses/models/notification_model.dart';
import 'package:dggcourses/services/notification_service.dart';
import 'package:equatable/equatable.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  void getAllNotifications({required String user_id}) async {
    emit(NotificationLoading());
    List<NotificationModel> notifications = await NotificationService().getNotifications(id: user_id);
    emit(NotificationSuccess(notifications));
  }

  void createNotifications({
    required String date,
    required String desc,
    required String title,
    required String user_id
  }) async {
    emit(NotificationLoading());
    await NotificationService().createNotifications(
      date: date,
      desc: desc,
      title: title,
      user_id: user_id
    );
    List<NotificationModel> notifications = await NotificationService().getNotifications(id: user_id);
    emit(NotificationSuccess(notifications));
  }
}
