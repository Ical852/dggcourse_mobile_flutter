import 'package:bloc/bloc.dart';
import 'package:dggcourses/models/course_model.dart';
import 'package:dggcourses/services/course_service.dart';
import 'package:equatable/equatable.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  void getAllCourses() async {
    emit(CourseLoading());
    List<CourseModel> courses = await CourseService().getAllCourses();
    emit(CourseSuccess(courses));
  }
}
