import 'package:bloc/bloc.dart';
import 'package:dggcourses/models/course_model.dart';
import 'package:dggcourses/services/course_service.dart';
import 'package:equatable/equatable.dart';

part 'categorycourse_state.dart';

class CategorycourseCubit extends Cubit<CategorycourseState> {
  CategorycourseCubit() : super(CategorycourseInitial());

  void getCategoryCourses({required String id}) async {
    emit(CategorycourseLoading());
    List<CourseModel> courses = await CourseService().getCategoryCourses(id: id);
    emit(CategorycourseSuccess(courses));
  }
}
