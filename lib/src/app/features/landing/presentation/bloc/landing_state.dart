part of 'landing_cubit.dart';

sealed class LandingState {}

class LandingInitial extends LandingState {}

class LandingMain extends LandingState {
  final LandingViewModel viewModel;

  LandingMain({
    required this.viewModel,
  });
}
