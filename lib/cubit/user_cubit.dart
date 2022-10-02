import 'package:bloc/bloc.dart';
import 'package:dggcourses/models/user_model.dart';
import 'package:dggcourses/services/user_service.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void login({
    required String email,
    required String password,
  }) async {
    emit(UserLoading());
    UserModel user = await UserService().login(
      email: email,
      password: password
    );
    emit(UserSuccess(user));
  }

  void register({
    required String email,
    required String full_name,
    required String password,
    required String phone_number,
  }) async {
    emit(UserLoading());
    UserModel user = await UserService().register(
      email: email,
      full_name: full_name,
      password: password,
      phone_number: phone_number
    );
    emit(UserSuccess(user));
  }

  void fetch({
    required String user_id,
  }) async {
    emit(UserLoading());
    UserModel user = await UserService().fetch(
      user_id: user_id
    );
    emit(UserSuccess(user));
  }

  void updateDggm({
    required UserModel userData,
    required int dggm
  }) async {
    emit(UserLoading());
    UserModel user = await UserService().updateDggm(
      userData: userData,
      dggm: userData.dggm + dggm
    );
    emit(UserSuccess(user));
  }

  void updateProfile({
    required UserModel userData,
    required String full_name,
    required String phone_number
  }) async {
    emit(UserLoading());
    UserModel user = await UserService().updateProfile(
      userData: userData,
      full_name: full_name,
      phone_number: phone_number
    );
    emit(UserSuccess(user));
  }

  void updatePassword({
    required UserModel userData,
    required String password
  }) async {
    emit(UserLoading());
    UserModel user = await UserService().updatePassword(
      userData: userData,
      password: password
    );
    emit(UserSuccess(user));
  }

  void updateRole({
    required UserModel userData,
    required String role
  }) async {
    emit(UserLoading());
    UserModel user = await UserService().updateRole(
      userData: userData,
      role: role
    );
    emit(UserSuccess(user));
  }

  void updateInterest({
    required UserModel userData,
    required String interests
  }) async {
    emit(UserLoading());
    UserModel user = await UserService().updateInterest(
      userData: userData,
      interests: interests
    );
    emit(UserSuccess(user));
  }
}
