import 'package:floor/floor.dart';
import 'package:{{project_name.snakeCase()}}/domain/model/settings.dart';

@dao
abstract class SettingsDao {
  @Query('SELECT * FROM Settings')
  Future<List<Settings>> findAllSettings();

  @Query('SELECT * FROM Settings WHERE id = :id')
  Stream<Settings?> findPersonById(int id);

  @insert
  Future<void> insertPerson(Settings settings);
}
