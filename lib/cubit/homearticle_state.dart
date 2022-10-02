part of 'homearticle_cubit.dart';

abstract class HomearticleState extends Equatable {
  const HomearticleState();

  @override
  List<Object> get props => [];
}

class HomearticleInitial extends HomearticleState {}

class HomearticleLoading extends HomearticleState {}

class HomearticleSuccess extends HomearticleState {
  
  List<ArticleModel> articles;

  HomearticleSuccess(this.articles);

  @override
  List<Object> get props => articles;
}