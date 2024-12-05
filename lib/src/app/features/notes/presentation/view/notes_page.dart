// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mvvm/src/core/l10n/app_l10n.dart';
import 'package:flutter_clean_mvvm/src/core/router/page_routes.dart';
import 'package:flutter_clean_mvvm/src/core/theme/app_colors.dart';
import 'package:flutter_clean_mvvm/src/core/theme/app_dimensions.dart';
import 'package:flutter_clean_mvvm/src/core/theme/app_spacing.dart';
import 'package:flutter_clean_mvvm/src/core/theme/app_text_styles.dart';
import 'package:flutter_clean_mvvm/src/core/utils/extensions/l10n_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../bloc/notes_cubit.dart';
import '../bloc/viewmodels/notes_view_model.dart';

part 'components/app_bar.dart';
part 'components/navigation.dart';
part 'components/note_card.dart';
part 'components/notes_loading_view.dart';
part 'components/notes_view.dart';
part 'components/overlay.dart';

@injectable
class NotesPage extends StatefulWidget {
  final NotesCubit _cubit;

  const NotesPage({
    required NotesCubit cubit,
  }) : _cubit = cubit;

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late NotesCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = widget._cubit;
    _cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      bloc: _cubit,
      listener: (context, state) {
        if (state case NotesMain(:final viewModel)) {
          if (viewModel.navigation != null) {
            viewModel.navigation!.navigate(context);
          }

          if (viewModel.overlay != null) {
            viewModel.overlay!.showOverlay(context, _cubit, context.l10n);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: _AppBar(
            cubit: _cubit,
          ),
          floatingActionButton: (state is NotesMain)
              ? FloatingActionButton(
                  onPressed: _cubit.onCreateNoteTapped,
                  child: const Icon(Icons.add),
                )
              : null,
          body: switch (state) {
            NotesInitial() => const SizedBox.shrink(),
            NotesLoading() => const _NotesLoadingView(),
            NotesMain(:final viewModel) => _NotesView(
                cubit: _cubit,
                viewModel: viewModel,
              ),
          },
        );
      },
    );
  }
}
