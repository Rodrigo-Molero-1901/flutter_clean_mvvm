import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'viewmodels/profile_view_model.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void initialize() {
    _emitMain();
  }

  void _emitMain({
    ProfileNavigation? navigation,
  }) {
    emit(
      ProfileMain(
        viewModel: ProfileViewModel.fromSuccessState(
          navigation: navigation,
        ),
      ),
    );
  }

  void onExitTapped() {
    _emitMain(navigation: ExitNavigation());
  }
}
