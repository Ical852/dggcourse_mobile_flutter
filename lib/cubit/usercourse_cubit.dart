import 'package:bloc/bloc.dart';
import 'package:dggcourses/models/user_course_model.dart';
import 'package:dggcourses/services/usercourse_service.dart';
import 'package:equatable/equatable.dart';

part 'usercourse_state.dart';

class UsercourseCubit extends Cubit<UsercourseState> {
  UsercourseCubit() : super(UsercourseInitial());

  void getAllUserCourses({
    required String user_id
  }) async {
    emit(UsercourseLoading());
    List<UserCourseModel> usercourses = await UserCourseService().getAllUserCourse(
      user_id: user_id
    );
    emit(UsercourseSuccess(usercourses));
  }

  void buyCourse({
    required String course_id,
    required String user_id
  }) async {
    emit(UsercourseLoading());
    await UserCourseService().buyCourse(
      course_id: course_id,
      user_id: user_id
    );
    List<UserCourseModel> usercourses = await UserCourseService().getAllUserCourse(
      user_id: user_id
    );
    emit(UsercourseSuccess(usercourses));
  }
}
