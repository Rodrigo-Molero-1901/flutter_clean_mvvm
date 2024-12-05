// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/features/landing/presentation/bloc/landing_cubit.dart' as _i4;
import '../../app/features/landing/presentation/view/landing_page.dart' as _i6;
import '../../app/features/notes/data/repositories/notes_repository_impl.dart'
    as _i12;
import '../../app/features/notes/data/sources/local/notes_local_data_source.dart'
    as _i9;
import '../../app/features/notes/data/sources/local/notes_local_data_source_impl.dart'
    as _i10;
import '../../app/features/notes/data/sources/remote/notes_remote_data_source.dart'
    as _i7;
import '../../app/features/notes/data/sources/remote/notes_remote_data_source_impl.dart'
    as _i8;
import '../../app/features/notes/domain/repositories/notes_repository.dart'
    as _i11;
import '../../app/features/notes/domain/usecases/create_note.dart' as _i13;
import '../../app/features/notes/domain/usecases/decrease_count.dart' as _i17;
import '../../app/features/notes/domain/usecases/delete_note.dart' as _i14;
import '../../app/features/notes/domain/usecases/get_notes.dart' as _i15;
import '../../app/features/notes/domain/usecases/increase_count.dart' as _i16;
import '../../app/features/notes/presentation/bloc/notes_cubit.dart' as _i18;
import '../../app/features/notes/presentation/view/notes_page.dart' as _i19;
import '../network/api/api_client.dart' as _i5;
import '../network/api/local_api_client.dart' as _i3;
import 'module_injection.dart' as _i20;

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
    gh.factory<_i4.LandingCubit>(() => _i4.LandingCubit());
    gh.lazySingleton<_i5.ApiClient>(() => appModuleInjection.apiClient);
    gh.factory<_i6.LandingPage>(
        () => _i6.LandingPage(cubit: gh<_i4.LandingCubit>()));
    gh.factory<_i7.NotesRemoteDataSource>(
        () => _i8.NotesRemoteDataSourceImpl(gh<_i5.ApiClient>()));
    gh.factory<_i9.NotesLocalDataSource>(
        () => _i10.NotesLocalDataSourceImpl(gh<_i3.LocalApiClient>()));
    gh.factory<_i11.NotesRepository>(() => _i12.NotesRepositoryImpl(
          gh<_i7.NotesRemoteDataSource>(),
          gh<_i9.NotesLocalDataSource>(),
        ));
    gh.factory<_i13.CreateNoteUseCase>(
        () => _i13.CreateNoteUseCase(gh<_i11.NotesRepository>()));
    gh.factory<_i14.DeleteNoteUseCase>(
        () => _i14.DeleteNoteUseCase(gh<_i11.NotesRepository>()));
    gh.factory<_i15.GetNotesUseCase>(
        () => _i15.GetNotesUseCase(gh<_i11.NotesRepository>()));
    gh.factory<_i16.IncreaseCountUseCase>(
        () => _i16.IncreaseCountUseCase(gh<_i11.NotesRepository>()));
    gh.factory<_i17.DecreaseCountUseCase>(
        () => _i17.DecreaseCountUseCase(gh<_i11.NotesRepository>()));
    gh.factory<_i18.NotesCubit>(() => _i18.NotesCubit(
          getNotesUseCase: gh<_i15.GetNotesUseCase>(),
          createNoteUseCase: gh<_i13.CreateNoteUseCase>(),
          deleteNoteUseCase: gh<_i14.DeleteNoteUseCase>(),
          increaseCountUseCase: gh<_i16.IncreaseCountUseCase>(),
          decreaseCountUseCase: gh<_i17.DecreaseCountUseCase>(),
        ));
    gh.factory<_i19.NotesPage>(
        () => _i19.NotesPage(cubit: gh<_i18.NotesCubit>()));
    return this;
  }
}

class _$AppModuleInjection extends _i20.AppModuleInjection {}
