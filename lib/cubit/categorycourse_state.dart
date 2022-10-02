part of 'categorycourse_cubit.dart';

abstract class CategorycourseState extends Equatable {
  const CategorycourseState();

  @override
  List<Object> get props => [];
}

class CategorycourseInitial extends CategorycourseState {}

class CategorycourseLoading extends CategorycourseState {}

class CategorycourseSuccess extends CategorycourseState {
  
  List<CourseModel> courses;

  CategorycourseSuccess(this.courses);

  @override
  List<Object> get props => courses;
}