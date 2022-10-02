import 'package:bloc/bloc.dart';
import 'package:dggcourses/models/course_model.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  void addFavorite({required List<CourseModel> favorites}) async {
    emit(FavoriteLoading());
    emit(FavoriteSuccess(favorites));
  }
}
