import 'package:bloc/bloc.dart';
import 'package:dggcourses/models/article_model.dart';
import 'package:dggcourses/services/articles_service.dart';
import 'package:equatable/equatable.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  void getAllArticles() async {
    emit(ArticleLoading());
    List<ArticleModel> articles = await ArticleService().getArticles();
    emit(ArticleSuccess(articles));
  }

}
