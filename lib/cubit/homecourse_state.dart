part of 'homecourse_cubit.dart';

abstract class HomecourseState extends Equatable {
  const HomecourseState();

  @override
  List<Object> get props => [];
}

class HomecourseInitial extends HomecourseState {}

class HomecourseLoading extends HomecourseState {}

class HomecourseSuccess extends HomecourseState {
  
  List<CourseModel> courses;

  HomecourseSuccess(this.courses);

  @override
  List<Object> get props => courses;
}