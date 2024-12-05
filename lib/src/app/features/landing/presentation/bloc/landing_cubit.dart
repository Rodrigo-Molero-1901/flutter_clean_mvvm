import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'viewmodels/landing_view_model.dart';

part 'landing_state.dart';

@injectable
class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());

  void initialize() {
    _emitMain();
  }

  void _emitMain({
    LandingNavigation? navigation,
  }) {
    emit(
      LandingMain(
        viewModel: LandingViewModel.fromSuccessState(
          navigation: navigation,
        ),
      ),
    );
  }

  void onContinueTapped() {
    _emitMain(navigation: NotesNavigation());
  }
}
