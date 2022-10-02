part of 'course_cubit.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseSuccess extends CourseState {
  
  List<CourseModel> courses;

  CourseSuccess(this.courses);

  @override
  List<Object> get props => courses;
}