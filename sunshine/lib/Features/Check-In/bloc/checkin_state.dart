part of 'checkin_bloc.dart';

sealed class CheckinState extends Equatable {
  const CheckinState();
  
  @override
  List<Object> get props => [];
}

final class CheckinInitial extends CheckinState {}
