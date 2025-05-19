//* run in terminal: dart run generate_module.dart <your module name>

// ignore_for_file: avoid_print
import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Please provide a module name as an argument.');
    return;
  }

  final moduleName =
      args[0]; // Module name (e.g., container, ${moduleName}, ${moduleName})
  final capitalizedModuleName =
      moduleName[0].toUpperCase() + moduleName.substring(1);

  // Base path for the module
  final basePath = 'lib/app/$moduleName';

  // Define the folder structure
  final folders = [
    'application',
    'domain/repository',
    'domain/entities',
    'infrastructure/models',
    'infrastructure/remote',
    'infrastructure/repo_imp',
    'presentation/state/bloc',
    'presentation/state',
    'presentation/ui/widgets',
    'presentation/ui/screen',
  ];

  // Define the files and their content
  final files = {
    '$basePath/application/facade.dart': '''
import 'package:either_dart/either.dart';
import '../domain/entities/add_${moduleName}_param.dart';
import '../domain/entities/all_${moduleName}s_param.dart';
import '../domain/entities/${moduleName}_by_id_param.dart';
import '../domain/repository/${moduleName}_repository.dart';
import '../infrastructure/models/add_${moduleName}_model.dart';
import '../infrastructure/models/all_${moduleName}s_model.dart';
import '../infrastructure/models/modify_${moduleName}_model.dart';
import '../infrastructure/models/${moduleName}_by_id_model.dart';
import '../domain/entities/modify_${moduleName}_param.dart';


class ${capitalizedModuleName}Facade {
  final ${capitalizedModuleName}Repository _remote;

  ${capitalizedModuleName}Facade({
    required ${capitalizedModuleName}Repository remote,
  }) : _remote = remote;

  //* Get All ${capitalizedModuleName}s 
  Future<Either<String, All${capitalizedModuleName}sModel>> getAll${capitalizedModuleName}s({required All${capitalizedModuleName}sParam all${capitalizedModuleName}sParam}) =>
      _remote.getAll${capitalizedModuleName}s(all${capitalizedModuleName}sParam: all${capitalizedModuleName}sParam); 
  
    //* Get $capitalizedModuleName By Id
  Future<Either<String, ${capitalizedModuleName}ByIdModel>> get${capitalizedModuleName}ById(
          {required ${capitalizedModuleName}ByIdParam ${moduleName}ByIdParam}) =>
      _remote.get${capitalizedModuleName}ById(${moduleName}ByIdParam: ${moduleName}ByIdParam);

  //* Add $capitalizedModuleName
  Future<Either<String, Add${capitalizedModuleName}Model>> add$capitalizedModuleName(
          {required Add${capitalizedModuleName}Param add${capitalizedModuleName}Param}) =>
      _remote.add$capitalizedModuleName(add${capitalizedModuleName}Param: add${capitalizedModuleName}Param);

  //* Modify $capitalizedModuleName
  Future<Either<String, Modify${capitalizedModuleName}Model>> modify$capitalizedModuleName(
          {required Modify${capitalizedModuleName}Param modify${capitalizedModuleName}Param}) =>
      _remote.modify$capitalizedModuleName(modify${capitalizedModuleName}Param: modify${capitalizedModuleName}Param);

  //* Delete $capitalizedModuleName
  Future<Either<String, void>> delete$capitalizedModuleName({required String id}) =>
      _remote.delete$capitalizedModuleName(id: id);
}
''',
    '$basePath/domain/repository/${moduleName}_repository.dart': '''
import 'package:either_dart/either.dart';
import '../../infrastructure/models/add_${moduleName}_model.dart';
import '../../infrastructure/models/all_${moduleName}s_model.dart';
import '../../infrastructure/models/modify_${moduleName}_model.dart';
import '../../infrastructure/models/${moduleName}_by_id_model.dart';
import '../entities/add_${moduleName}_param.dart';
import '../entities/all_${moduleName}s_param.dart';
import '../entities/modify_${moduleName}_param.dart';
import '../entities/${moduleName}_by_id_param.dart';

abstract class ${capitalizedModuleName}Repository { 
  ${capitalizedModuleName}Repository();

  //* Get All ${capitalizedModuleName}s 
  Future<Either<String, All${capitalizedModuleName}sModel>> getAll${capitalizedModuleName}s({required All${capitalizedModuleName}sParam all${capitalizedModuleName}sParam});

  
  //* Get $capitalizedModuleName By Id
  Future<Either<String, ${capitalizedModuleName}ByIdModel>> get${capitalizedModuleName}ById(
      {required ${capitalizedModuleName}ByIdParam ${moduleName}ByIdParam});

  //* Add $capitalizedModuleName
  Future<Either<String, Add${capitalizedModuleName}Model>> add$capitalizedModuleName(
      {required Add${capitalizedModuleName}Param add${capitalizedModuleName}Param});

  //* Modify $capitalizedModuleName
  Future<Either<String, Modify${capitalizedModuleName}Model>> modify$capitalizedModuleName(
      {required Modify${capitalizedModuleName}Param modify${capitalizedModuleName}Param});

  //* Delete $capitalizedModuleName
  Future<Either<String, void>> delete$capitalizedModuleName({required String id});
}
''',
    '$basePath/domain/entities/all_${moduleName}s_param.dart': '''
class All${capitalizedModuleName}sParam { 
  Map<String, dynamic> toJson() {
    Map<String, dynamic> toJson = {};
    return toJson;
  }
}
''',
    '$basePath/domain/entities/${moduleName}_by_id_param.dart': '''
class ${capitalizedModuleName}ByIdParam { 
  Map<String, dynamic> toJson() {
    Map<String, dynamic> toJson = {};
    return toJson;
  }
}
''',
    '$basePath/domain/entities/add_${moduleName}_param.dart': '''
class Add${capitalizedModuleName}Param { 
  Map<String, dynamic> toJson() {
    Map<String, dynamic> toJson = {};
    return toJson;
  }
}
''',
    '$basePath/domain/entities/modify_${moduleName}_param.dart': '''
class Modify${capitalizedModuleName}Param  { 
  Map<String, dynamic> toJson() {
    Map<String, dynamic> toJson = {};
    return toJson;
  }
}
''',
    '$basePath/infrastructure/models/all_${moduleName}s_model.dart': '''
class All${capitalizedModuleName}sModel {
  All${capitalizedModuleName}sModel();

  factory All${capitalizedModuleName}sModel.fromJson(Map<String, dynamic> json) {
    return All${capitalizedModuleName}sModel();
  }
}
''',
    '$basePath/infrastructure/models/${moduleName}_by_id_model.dart': '''
class ${capitalizedModuleName}ByIdModel {
  ${capitalizedModuleName}ByIdModel();

  factory ${capitalizedModuleName}ByIdModel.fromJson(Map<String, dynamic> json) {
    return ${capitalizedModuleName}ByIdModel();
  }
}
''',
    '$basePath/infrastructure/models/add_${moduleName}_model.dart': '''
class Add${capitalizedModuleName}Model {
  Add${capitalizedModuleName}Model();

  factory Add${capitalizedModuleName}Model.fromJson(Map<String, dynamic> json) {
    return Add${capitalizedModuleName}Model();
  }
}
''',
    '$basePath/infrastructure/models/modify_${moduleName}_model.dart': '''
class Modify${capitalizedModuleName}Model {
  Modify${capitalizedModuleName}Model();

  factory Modify${capitalizedModuleName}Model.fromJson(Map<String, dynamic> json) {
    return Modify${capitalizedModuleName}Model();
  }
}
''',
    '$basePath/infrastructure/remote/${moduleName}_remote.dart': '''
import 'package:dio/dio.dart';
import '../../../../common/constant/src/url.dart';
import '../../../../common/network/exception/error_handler.dart';
import '../../domain/entities/add_${moduleName}_param.dart';
import '../../domain/entities/all_${moduleName}s_param.dart';
import '../../domain/entities/modify_${moduleName}_param.dart';
import '../../domain/entities/${moduleName}_by_id_param.dart';
import '../models/add_${moduleName}_model.dart';
import '../models/all_${moduleName}s_model.dart';
import '../models/modify_${moduleName}_model.dart';
import '../models/${moduleName}_by_id_model.dart';

class ${capitalizedModuleName}Remote {
  final Dio _dio;

  const ${capitalizedModuleName}Remote(Dio dio) : _dio = dio;

  //* Get All ${capitalizedModuleName}s
  Future<All${capitalizedModuleName}sModel> getAll${capitalizedModuleName}s(
      {required All${capitalizedModuleName}sParam all${capitalizedModuleName}sParam}) {
    return throwDioException(() async {
      final response = await _dio.get(
        AppUrl.getAll${capitalizedModuleName}s,
        queryParameters: all${capitalizedModuleName}sParam.toJson(),
      );
      return All${capitalizedModuleName}sModel.fromJson(response.data);
    });
  }

  //* Get $capitalizedModuleName By Id
  Future<${capitalizedModuleName}ByIdModel> get${capitalizedModuleName}ById(
      {required ${capitalizedModuleName}ByIdParam ${moduleName}ByIdParam}) {
    return throwDioException(() async {
      final response = await _dio.get(
        AppUrl.get${capitalizedModuleName}ById,
        queryParameters: ${moduleName}ByIdParam.toJson(),
      );
      return ${capitalizedModuleName}ByIdModel.fromJson(response.data);
    });
  }

  //* Add $capitalizedModuleName
  Future<Add${capitalizedModuleName}Model> add$capitalizedModuleName(
      {required Add${capitalizedModuleName}Param add${capitalizedModuleName}Param}) {
    return throwDioException(() async {
      final response = await _dio.post(
        AppUrl.add$capitalizedModuleName,
        queryParameters: add${capitalizedModuleName}Param.toJson(),
      );
      return Add${capitalizedModuleName}Model.fromJson(response.data);
    });
  }

  //* Modify $capitalizedModuleName
  Future<Modify${capitalizedModuleName}Model> modify$capitalizedModuleName(
      {required Modify${capitalizedModuleName}Param modify${capitalizedModuleName}Param}) {
    return throwDioException(() async {
      final response = await _dio.post(
        AppUrl.modify$capitalizedModuleName,
        queryParameters: modify${capitalizedModuleName}Param.toJson(),
      );
      return Modify${capitalizedModuleName}Model.fromJson(response.data);
    });
  }

  //* Delete $capitalizedModuleName
  Future<void> delete$capitalizedModuleName({required String id}) {
    return throwDioException(() async {
      await _dio.delete(
        AppUrl.delete$capitalizedModuleName,
        queryParameters: {"id": id},
      );
      return;
    });
  }
}
''',
    '$basePath/infrastructure/repo_imp/${moduleName}_repo_imp.dart': '''
import 'package:either_dart/either.dart';
import '../../../../common/network/exception/error_handler.dart';
import '../../domain/entities/add_${moduleName}_param.dart';
import '../../domain/entities/all_${moduleName}s_param.dart';
import '../../domain/entities/modify_${moduleName}_param.dart';
import '../../domain/entities/${moduleName}_by_id_param.dart';
import '../../domain/repository/${moduleName}_repository.dart';
import '../models/add_${moduleName}_model.dart';
import '../models/all_${moduleName}s_model.dart';
import '../models/modify_${moduleName}_model.dart';
import '../models/${moduleName}_by_id_model.dart';
import '../remote/${moduleName}_remote.dart';

class ${capitalizedModuleName}RepoImp implements ${capitalizedModuleName}Repository {
  final ${capitalizedModuleName}Remote _remote;

  ${capitalizedModuleName}RepoImp({
    required ${capitalizedModuleName}Remote remote,
  }) : _remote = remote;

  @override
  Future<Either<String, All${capitalizedModuleName}sModel>> getAll${capitalizedModuleName}s(
      {required All${capitalizedModuleName}sParam all${capitalizedModuleName}sParam}) {
    return throwAppException(() async {
      return await _remote.getAll${capitalizedModuleName}s(
        all${capitalizedModuleName}sParam: all${capitalizedModuleName}sParam,
      );
    });
  }

  @override
  Future<Either<String, Add${capitalizedModuleName}Model>> add$capitalizedModuleName(
      {required Add${capitalizedModuleName}Param add${capitalizedModuleName}Param}) {
    return throwAppException(() async {
      return await _remote.add$capitalizedModuleName(
        add${capitalizedModuleName}Param: add${capitalizedModuleName}Param,
      );
    });
  }

  @override
  Future<Either<String, void>> delete$capitalizedModuleName({required String id}) {
    return throwAppException(() async {
      return await _remote.delete$capitalizedModuleName(
        id: id,
      );
    });
  }

  @override
  Future<Either<String, ${capitalizedModuleName}ByIdModel>> get${capitalizedModuleName}ById(
      {required ${capitalizedModuleName}ByIdParam ${moduleName}ByIdParam}) {
    return throwAppException(() async {
      return await _remote.get${capitalizedModuleName}ById(
        ${moduleName}ByIdParam: ${moduleName}ByIdParam,
      );
    });
  }

  @override
  Future<Either<String, Modify${capitalizedModuleName}Model>> modify$capitalizedModuleName(
      {required Modify${capitalizedModuleName}Param modify${capitalizedModuleName}Param}) {
    return throwAppException(() async {
      return await _remote.modify$capitalizedModuleName(
        modify${capitalizedModuleName}Param: modify${capitalizedModuleName}Param,
      );
    });
  }
}
''',
    '$basePath/presentation/state/bloc/${moduleName}_bloc.dart': '''
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/result_builder/result.dart';
import '../../../application/facade.dart';
import '../../../domain/entities/add_${moduleName}_param.dart';
import '../../../domain/entities/all_${moduleName}s_param.dart';
import '../../../domain/entities/modify_${moduleName}_param.dart';
import '../../../domain/entities/${moduleName}_by_id_param.dart';
import '../../../infrastructure/models/all_${moduleName}s_model.dart';
import '../../../infrastructure/models/${moduleName}_by_id_model.dart';

part '${moduleName}_event.dart';
part '${moduleName}_state.dart';

class ${capitalizedModuleName}Bloc extends Bloc<${capitalizedModuleName}Event, ${capitalizedModuleName}State> {
  final ${capitalizedModuleName}Facade _facade;

  ${capitalizedModuleName}Bloc({required ${capitalizedModuleName}Facade facade})
      : _facade = facade,
        super(${capitalizedModuleName}State()) {
    on<${capitalizedModuleName}Event>((event, emit) async {
      if (event is GetAll${capitalizedModuleName}sEvent) {
        await _getAll${capitalizedModuleName}s(event, emit);
      } else if (event is Get${capitalizedModuleName}ByIdEvent) {
        await _get${capitalizedModuleName}ById(event, emit);
      } else if (event is Add${capitalizedModuleName}Event) {
        await _add$capitalizedModuleName(event, emit);
      } else if (event is Modify${capitalizedModuleName}Event) {
        await _modify$capitalizedModuleName(event, emit);
      } else if (event is Delete${capitalizedModuleName}Event) {
        await _delete$capitalizedModuleName(event, emit);
      }
    });
  }

  _getAll${capitalizedModuleName}s(GetAll${capitalizedModuleName}sEvent event, Emitter emit) async {
    emit(state.copyWith(all${capitalizedModuleName}sState: const Result.loading()));
    final response = await _facade.getAll${capitalizedModuleName}s(
        all${capitalizedModuleName}sParam: event.all${capitalizedModuleName}sParam);
    response.fold(
      (l) => emit(state.copyWith(all${capitalizedModuleName}sState: Result.error(error: l))),
      (r) => emit(state.copyWith(all${capitalizedModuleName}sState: Result.loaded(data: r))),
    );
  }

  _get${capitalizedModuleName}ById(Get${capitalizedModuleName}ByIdEvent event, Emitter emit) async {
    emit(state.copyWith(${moduleName}ByIdState: const Result.loading()));
    final response = await _facade.get${capitalizedModuleName}ById(
      ${moduleName}ByIdParam: event.${moduleName}ByIdParam,
    );
    response.fold(
      (l) => emit(state.copyWith(${moduleName}ByIdState: Result.error(error: l))),
      (r) => emit(state.copyWith(${moduleName}ByIdState: Result.loaded(data: r))),
    );
  }

  _add$capitalizedModuleName(Add${capitalizedModuleName}Event event, Emitter emit) async {
    emit(state.copyWith(add${capitalizedModuleName}State: const Result.loading()));
    final response = await _facade.add$capitalizedModuleName(
      add${capitalizedModuleName}Param: event.add${capitalizedModuleName}Param,
    );
    response.fold(
      (l) => emit(state.copyWith(add${capitalizedModuleName}State: Result.error(error: l))),
      (r) => emit(
          state.copyWith(add${capitalizedModuleName}State: const Result.loaded(data: true))),
    );
  }

  _modify$capitalizedModuleName(Modify${capitalizedModuleName}Event event, Emitter emit) async {
    emit(state.copyWith(modify${capitalizedModuleName}State: const Result.loading()));
    final response = await _facade.modify$capitalizedModuleName(
      modify${capitalizedModuleName}Param: event.modify${capitalizedModuleName}Param,
    );
    response.fold(
      (l) => emit(state.copyWith(modify${capitalizedModuleName}State: Result.error(error: l))),
      (r) => emit(
          state.copyWith(modify${capitalizedModuleName}State: const Result.loaded(data: true))),
    );
  }

  _delete$capitalizedModuleName(Delete${capitalizedModuleName}Event event, Emitter emit) async {
    emit(state.copyWith(delete${capitalizedModuleName}State: const Result.loading()));
    final response = await _facade.delete$capitalizedModuleName(
      id: event.id,
    );
    response.fold(
      (l) => emit(state.copyWith(delete${capitalizedModuleName}State: Result.error(error: l))),
      (r) => emit(
          state.copyWith(delete${capitalizedModuleName}State: const Result.loaded(data: true))),
    );
  }
}
''',
    '$basePath/presentation/state/bloc/${moduleName}_event.dart': '''
part of '${moduleName}_bloc.dart';

abstract class ${capitalizedModuleName}Event {}

final class GetAll${capitalizedModuleName}sEvent extends ${capitalizedModuleName}Event {
  final All${capitalizedModuleName}sParam all${capitalizedModuleName}sParam;

  GetAll${capitalizedModuleName}sEvent({required this.all${capitalizedModuleName}sParam});
}

final class Get${capitalizedModuleName}ByIdEvent extends ${capitalizedModuleName}Event {
  final ${capitalizedModuleName}ByIdParam ${moduleName}ByIdParam;

  Get${capitalizedModuleName}ByIdEvent({required this.${moduleName}ByIdParam});
}

final class Add${capitalizedModuleName}Event extends ${capitalizedModuleName}Event {
  final Add${capitalizedModuleName}Param add${capitalizedModuleName}Param;

  Add${capitalizedModuleName}Event({required this.add${capitalizedModuleName}Param});
}

final class Modify${capitalizedModuleName}Event extends ${capitalizedModuleName}Event {
  final Modify${capitalizedModuleName}Param modify${capitalizedModuleName}Param;

  Modify${capitalizedModuleName}Event({required this.modify${capitalizedModuleName}Param});
}

final class Delete${capitalizedModuleName}Event extends ${capitalizedModuleName}Event {
  final String id;

  Delete${capitalizedModuleName}Event({required this.id});
}
''',
    '$basePath/presentation/state/bloc/${moduleName}_state.dart': '''
part of '${moduleName}_bloc.dart';

class ${capitalizedModuleName}State {
  Result<All${capitalizedModuleName}sModel> all${capitalizedModuleName}sState;
  Result<${capitalizedModuleName}ByIdModel> ${moduleName}ByIdState;
  Result<bool> add${capitalizedModuleName}State;
  Result<bool> modify${capitalizedModuleName}State;
  Result<bool> delete${capitalizedModuleName}State;

  ${capitalizedModuleName}State({
    this.all${capitalizedModuleName}sState = const Result.init(),
    this.${moduleName}ByIdState = const Result.init(),
    this.add${capitalizedModuleName}State = const Result.init(),
    this.modify${capitalizedModuleName}State = const Result.init(),
    this.delete${capitalizedModuleName}State = const Result.init(),
  });

  ${capitalizedModuleName}State copyWith({
    Result<All${capitalizedModuleName}sModel>? all${capitalizedModuleName}sState,
    Result<${capitalizedModuleName}ByIdModel>? ${moduleName}ByIdState,
    Result<bool>? add${capitalizedModuleName}State,
    Result<bool>? modify${capitalizedModuleName}State,
    Result<bool>? delete${capitalizedModuleName}State,
  }) {
    return ${capitalizedModuleName}State(
      all${capitalizedModuleName}sState: all${capitalizedModuleName}sState ?? this.all${capitalizedModuleName}sState,
      ${moduleName}ByIdState: ${moduleName}ByIdState ?? this.${moduleName}ByIdState,
      add${capitalizedModuleName}State: add${capitalizedModuleName}State ?? this.add${capitalizedModuleName}State,
      modify${capitalizedModuleName}State: modify${capitalizedModuleName}State ?? this.modify${capitalizedModuleName}State,
      delete${capitalizedModuleName}State: delete${capitalizedModuleName}State ?? this.delete${capitalizedModuleName}State,
    );
  }
}
''',
    'lib/common/injection/src/${moduleName}_injection.dart': '''
import 'package:dio/dio.dart';
import '../../../app/$moduleName/application/facade.dart';
import '../../../app/$moduleName/domain/repository/${moduleName}_repository.dart';
import '../../../app/$moduleName/infrastructure/remote/${moduleName}_remote.dart';
import '../../../app/$moduleName/infrastructure/repo_imp/${moduleName}_repo_imp.dart';
import '../../../app/$moduleName/presentation/state/bloc/${moduleName}_bloc.dart';
import '../injection.dart';

Future<void> ${moduleName}Injection() async {
  getIt.registerSingleton<${capitalizedModuleName}Remote>(
      ${capitalizedModuleName}Remote(getIt<Dio>()));

  getIt.registerSingleton<${capitalizedModuleName}Repository>(
    ${capitalizedModuleName}RepoImp(
      remote: getIt<${capitalizedModuleName}Remote>(),
    ),
  );

  getIt.registerSingleton<${capitalizedModuleName}Facade>(
    ${capitalizedModuleName}Facade(
      remote: getIt<${capitalizedModuleName}Repository>(),
    ),
  );

  getIt.registerSingleton<${capitalizedModuleName}Bloc>(
    ${capitalizedModuleName}Bloc(
      facade: getIt<${capitalizedModuleName}Facade>(),
    ),
  );
}
'''
  };

  // Create the folders
  for (var folder in folders) {
    final dir = Directory('$basePath/$folder');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('Created folder: $basePath/$folder');
    }
  }

  // Create the injection folder
  final injectionFolder = Directory('lib/common/injection/src');
  if (!injectionFolder.existsSync()) {
    injectionFolder.createSync(recursive: true);
    print('Created folder: lib/common/injection/src');
  }

  // Create the files with their respective content
  files.forEach((path, content) {
    final file = File(path);
    if (!file.existsSync()) {
      file.writeAsStringSync(content);
      print('Created file: $path');
    }
  });

  print('$capitalizedModuleName module generated successfully!');
}
