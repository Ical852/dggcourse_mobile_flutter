part of 'usercourse_cubit.dart';

abstract class UsercourseState extends Equatable {
  const UsercourseState();

  @override
  List<Object> get props => [];
}

class UsercourseInitial extends UsercourseState {}

class UsercourseLoading extends UsercourseState {}

class UsercourseSuccess extends UsercourseState {
  
  List<UserCourseModel> usercourses;

  UsercourseSuccess(this.usercourses);

  @override
  List<Object> get props => usercourses;
}