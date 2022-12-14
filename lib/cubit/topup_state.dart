part of 'topup_cubit.dart';

abstract class TopupState extends Equatable {
  const TopupState();

  @override
  List<Object> get props => [];
}

class TopupInitial extends TopupState {}

class TopupLoading extends TopupState {}

class TopupSuccess extends TopupState {
  
  List<TopUpModel> topups;

  TopupSuccess(this.topups);

  @override
  List<Object> get props => topups;
}