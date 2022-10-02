import 'package:bloc/bloc.dart';
import 'package:dggcourses/models/category_model.dart';
import 'package:dggcourses/services/category_services.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void getAllCategories() async {
    emit(CategoryLoading());
    List<CategoryModel> categories = await CategoryService().getCategories();
    emit(CategorySuccess(categories));
  }
}
