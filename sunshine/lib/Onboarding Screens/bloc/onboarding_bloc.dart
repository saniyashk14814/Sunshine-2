import 'package:flutter/physics.dart';
import 'package:sunshine/utils.dart';


part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingOne>((event, emit) => emit(OnboardingOneState()));
    on<OnboardingTwo>((event, emit) => emit(OnboardingTwoState()));
    on<GetStarted>((event, emit) => emit(GetStartedState()));
  }
}
