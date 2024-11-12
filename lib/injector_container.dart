import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:malina_delivery/core/local_source/local_source.dart';
import 'package:malina_delivery/features/basket/presentation/bloc/eat_bloc/eat_bloc.dart';
import 'package:malina_delivery/features/basket/presentation/bloc/stuff_bloc/stuff_bloc.dart';
import 'package:malina_delivery/features/main/presentation/bloc/main_bloc.dart';
import 'package:malina_delivery/features/qr_code/presentation/bloc/qr_code_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final sl = GetIt.instance;
late Database database;

Future<void> init() async {
  await initDb();
  sl.registerSingleton<LocalSource>(LocalSource(database));

  // Features
  _mainPage();
  _basket();
  _qrScan();
}

void _mainPage() {
  sl.registerFactory<MainBloc>(() => MainBloc());
}

void _basket() {
  sl.registerFactory<EatBloc>(() => EatBloc());
  sl.registerFactory<StuffBloc>(() => StuffBloc());
}

void _qrScan() {
  sl.registerFactory<QrCodeBloc>(() => QrCodeBloc());
}

Future<void> initDb() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'database.db');
  database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE products (id INTEGER PRIMARY KEY AUTOINCREMENT,product_id TEXT,product_name TEXT,product_count INTEGER,in_basket INTEGER,product_type TEXT,order_type TEXT)');
  });
}

class LogBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print(change);
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      print("$bloc closed");
    }
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print("$bloc created");
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print('${bloc.runtimeType} $event');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      print('${bloc.runtimeType} $error');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(transition.toString());
    }
  }
}
