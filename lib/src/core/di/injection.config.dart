// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/features/notes/data/repositories/notes_repository_impl.dart'
    as _i7;
import '../../app/features/notes/data/sources/remote/notes_remote_data_source.dart'
    as _i4;
import '../../app/features/notes/data/sources/remote/notes_remote_data_source_impl.dart'
    as _i5;
import '../../app/features/notes/domain/repositories/notes_repository.dart'
    as _i6;
import '../../app/features/notes/domain/usecases/create_note.dart' as _i8;
import '../../app/features/notes/domain/usecases/delete_note.dart' as _i9;
import '../../app/features/notes/domain/usecases/get_notes.dart' as _i10;
import '../../app/features/notes/presentation/bloc/notes_cubit.dart' as _i11;
import '../../app/features/notes/presentation/view/notes_page.dart' as _i12;
import '../network/api/api_client.dart' as _i3;
import 'module_injection.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModuleInjection = _$AppModuleInjection();
    gh.lazySingleton<_i3.ApiClient>(() => appModuleInjection.apiClient);
    gh.factory<_i4.NotesRemoteDataSource>(
        () => _i5.NotesRemoteDataSourceImpl(gh<_i3.ApiClient>()));
    gh.factory<_i6.NotesRepository>(
        () => _i7.NotesRepositoryImpl(gh<_i4.NotesRemoteDataSource>()));
    gh.factory<_i8.CreateNoteUseCase>(
        () => _i8.CreateNoteUseCase(gh<_i6.NotesRepository>()));
    gh.factory<_i9.DeleteNoteUseCase>(
        () => _i9.DeleteNoteUseCase(gh<_i6.NotesRepository>()));
    gh.factory<_i10.GetNotesUseCase>(
        () => _i10.GetNotesUseCase(gh<_i6.NotesRepository>()));
    gh.factory<_i11.NotesCubit>(() => _i11.NotesCubit(
          getNotesUseCase: gh<_i10.GetNotesUseCase>(),
          createNoteUseCase: gh<_i8.CreateNoteUseCase>(),
          deleteNoteUseCase: gh<_i9.DeleteNoteUseCase>(),
        ));
    gh.factory<_i12.NotesPage>(
        () => _i12.NotesPage(cubit: gh<_i11.NotesCubit>()));
    return this;
  }
}

class _$AppModuleInjection extends _i13.AppModuleInjection {}
