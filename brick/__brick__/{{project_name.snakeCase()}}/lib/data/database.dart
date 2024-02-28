// database.dart

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:{{project_name.snakeCase()}}/data/dao/settings_dao.dart';
import 'package:{{project_name.snakeCase()}}/domain/model/settings.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Settings])
abstract class AppDatabase extends FloorDatabase {
  SettingsDao get settings;
}
