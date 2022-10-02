part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  
  List<CategoryModel> categories;

  CategorySuccess(this.categories);

  @override
  List<Object> get props => categories;
}
