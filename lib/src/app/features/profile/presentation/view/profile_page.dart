// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mvvm/src/core/router/page_routes.dart';
import 'package:flutter_clean_mvvm/src/core/theme/app_colors.dart';
import 'package:flutter_clean_mvvm/src/core/theme/app_dimensions.dart';
import 'package:flutter_clean_mvvm/src/core/theme/app_spacing.dart';
import 'package:flutter_clean_mvvm/src/core/theme/app_text_styles.dart';
import 'package:flutter_clean_mvvm/src/core/utils/extensions/l10n_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../bloc/profile_cubit.dart';
import '../bloc/viewmodels/profile_view_model.dart';

part 'components/app_bar.dart';
part 'components/navigation.dart';
part 'components/profile_view.dart';
part 'components/section.dart';

@injectable
class ProfilePage extends StatefulWidget {
  final ProfileCubit _cubit;

  const ProfilePage({
    required ProfileCubit cubit,
  }) : _cubit = cubit;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = widget._cubit;
    _cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(
        cubit: _cubit,
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state case ProfileMain(:final viewModel)) {
            if (viewModel.navigation != null) {
              viewModel.navigation!.navigate(context);
            }
          }
        },
        builder: (context, state) {
          return switch (state) {
            ProfileInitial() => const SizedBox.shrink(),
            ProfileMain() => _ProfileView(
                cubit: _cubit,
              ),
          };
        },
      ),
    );
  }
}
