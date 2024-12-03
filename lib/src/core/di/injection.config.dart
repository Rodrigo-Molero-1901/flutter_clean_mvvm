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
    as _i10;
import '../../app/features/notes/data/sources/local/notes_local_data_source.dart'
    as _i7;
import '../../app/features/notes/data/sources/local/notes_local_data_source_impl.dart'
    as _i8;
import '../../app/features/notes/data/sources/remote/notes_remote_data_source.dart'
    as _i5;
import '../../app/features/notes/data/sources/remote/notes_remote_data_source_impl.dart'
    as _i6;
import '../../app/features/notes/domain/repositories/notes_repository.dart'
    as _i9;
import '../../app/features/notes/domain/usecases/create_note.dart' as _i11;
import '../../app/features/notes/domain/usecases/decrease_count.dart' as _i15;
import '../../app/features/notes/domain/usecases/delete_note.dart' as _i12;
import '../../app/features/notes/domain/usecases/get_notes.dart' as _i13;
import '../../app/features/notes/domain/usecases/increase_count.dart' as _i14;
import '../../app/features/notes/presentation/bloc/notes_cubit.dart' as _i16;
import '../../app/features/notes/presentation/view/notes_page.dart' as _i17;
import '../network/api/api_client.dart' as _i4;
import '../network/api/local_api_client.dart' as _i3;
import 'module_injection.dart' as _i18;

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
    gh.factory<_i7.NotesLocalDataSource>(
        () => _i8.NotesLocalDataSourceImpl(gh<_i3.LocalApiClient>()));
    gh.factory<_i9.NotesRepository>(() => _i10.NotesRepositoryImpl(
          gh<_i5.NotesRemoteDataSource>(),
          gh<_i7.NotesLocalDataSource>(),
        ));
    gh.factory<_i11.CreateNoteUseCase>(
        () => _i11.CreateNoteUseCase(gh<_i9.NotesRepository>()));
    gh.factory<_i12.DeleteNoteUseCase>(
        () => _i12.DeleteNoteUseCase(gh<_i9.NotesRepository>()));
    gh.factory<_i13.GetNotesUseCase>(
        () => _i13.GetNotesUseCase(gh<_i9.NotesRepository>()));
    gh.factory<_i14.IncreaseCountUseCase>(
        () => _i14.IncreaseCountUseCase(gh<_i9.NotesRepository>()));
    gh.factory<_i15.DecreaseCountUseCase>(
        () => _i15.DecreaseCountUseCase(gh<_i9.NotesRepository>()));
    gh.factory<_i16.NotesCubit>(() => _i16.NotesCubit(
          getNotesUseCase: gh<_i13.GetNotesUseCase>(),
          createNoteUseCase: gh<_i11.CreateNoteUseCase>(),
          deleteNoteUseCase: gh<_i12.DeleteNoteUseCase>(),
          increaseCountUseCase: gh<_i14.IncreaseCountUseCase>(),
          decreaseCountUseCase: gh<_i15.DecreaseCountUseCase>(),
        ));
    gh.factory<_i17.NotesPage>(
        () => _i17.NotesPage(cubit: gh<_i16.NotesCubit>()));
    return this;
  }
}

class _$AppModuleInjection extends _i18.AppModuleInjection {}
