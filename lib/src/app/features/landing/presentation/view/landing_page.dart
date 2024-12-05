// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mvvm/src/core/router/page_routes.dart';
import 'package:flutter_clean_mvvm/src/core/theme/app_spacing.dart';
import 'package:flutter_clean_mvvm/src/core/utils/extensions/l10n_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../bloc/landing_cubit.dart';
import '../bloc/viewmodels/landing_view_model.dart';

part 'components/landing_view.dart';
part 'components/navigation.dart';

@injectable
class LandingPage extends StatefulWidget {
  final LandingCubit _cubit;

  const LandingPage({
    required LandingCubit cubit,
  }) : _cubit = cubit;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late LandingCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = widget._cubit;
    _cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LandingCubit, LandingState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state case LandingMain(:final viewModel)) {
              if (viewModel.navigation != null) {
                viewModel.navigation!.navigate(context);
              }
            }
          },
          builder: (context, state) {
            return switch (state) {
              LandingInitial() => const SizedBox.shrink(),
              LandingMain() => _LandingView(
                  cubit: _cubit,
                ),
            };
          },
        ),
      ),
    );
  }
}
