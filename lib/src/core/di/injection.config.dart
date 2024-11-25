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
    as _i8;
import '../../app/features/notes/data/sources/remote/notes_remote_data_source.dart'
    as _i5;
import '../../app/features/notes/data/sources/remote/notes_remote_data_source_impl.dart'
    as _i6;
import '../../app/features/notes/domain/repositories/notes_repository.dart'
    as _i7;
import '../../app/features/notes/domain/usecases/create_note.dart' as _i9;
import '../../app/features/notes/domain/usecases/delete_note.dart' as _i10;
import '../../app/features/notes/domain/usecases/get_notes.dart' as _i11;
import '../../app/features/notes/presentation/bloc/notes_cubit.dart' as _i12;
import '../../app/features/notes/presentation/view/notes_page.dart' as _i13;
import '../network/api/api_client.dart' as _i4;
import '../network/api/local_api_client.dart' as _i3;
import 'module_injection.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModuleInjection = _$AppModuleInjection();
    await gh.factoryAsync<_i3.LocalApiClient>(
      () => appModuleInjection.localApiClient,
      preResolve: true,
    );
    gh.lazySingleton<_i4.ApiClient>(() => appModuleInjection.apiClient);
    gh.factory<_i5.NotesRemoteDataSource>(
        () => _i6.NotesRemoteDataSourceImpl(gh<_i4.ApiClient>()));
    gh.factory<_i7.NotesRepository>(
        () => _i8.NotesRepositoryImpl(gh<_i5.NotesRemoteDataSource>()));
    gh.factory<_i9.CreateNoteUseCase>(
        () => _i9.CreateNoteUseCase(gh<_i7.NotesRepository>()));
    gh.factory<_i10.DeleteNoteUseCase>(
        () => _i10.DeleteNoteUseCase(gh<_i7.NotesRepository>()));
    gh.factory<_i11.GetNotesUseCase>(
        () => _i11.GetNotesUseCase(gh<_i7.NotesRepository>()));
    gh.factory<_i12.NotesCubit>(() => _i12.NotesCubit(
          getNotesUseCase: gh<_i11.GetNotesUseCase>(),
          createNoteUseCase: gh<_i9.CreateNoteUseCase>(),
          deleteNoteUseCase: gh<_i10.DeleteNoteUseCase>(),
        ));
    gh.factory<_i13.NotesPage>(
        () => _i13.NotesPage(cubit: gh<_i12.NotesCubit>()));
    return this;
  }
}

class _$AppModuleInjection extends _i14.AppModuleInjection {}
