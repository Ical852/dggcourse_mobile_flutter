import 'package:bloc/bloc.dart';
import 'package:dggcourses/models/article_model.dart';
import 'package:dggcourses/services/articles_service.dart';
import 'package:equatable/equatable.dart';

part 'homearticle_state.dart';

class HomearticleCubit extends Cubit<HomearticleState> {
  HomearticleCubit() : super(HomearticleInitial());

  void getHomeArticles() async {
    emit(HomearticleLoading());
    List<ArticleModel> articles = await ArticleService().getPopularArticles();
    emit(HomearticleSuccess(articles));
  }
}
