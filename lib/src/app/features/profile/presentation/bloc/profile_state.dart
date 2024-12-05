part of 'profile_cubit.dart';

sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileMain extends ProfileState {
  final ProfileViewModel viewModel;

  ProfileMain({
    required this.viewModel,
  });
}
