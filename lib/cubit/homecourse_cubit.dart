import 'package:bloc/bloc.dart';
import 'package:dggcourses/models/course_model.dart';
import 'package:dggcourses/services/course_service.dart';
import 'package:equatable/equatable.dart';

part 'homecourse_state.dart';

class HomecourseCubit extends Cubit<HomecourseState> {
  HomecourseCubit() : super(HomecourseInitial());

  void getHomeCourses() async {
    emit(HomecourseLoading());
    List<CourseModel> courses = await CourseService().getHomeCourses();
    emit(HomecourseSuccess(courses));
  }
}
