import "dart:math";
import 'package:flutter/services.dart';
import "package:flutter/widgets.dart";
import "package:sqflite/sqflite.dart";
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseHelper {
  static bool _isInitialized = false;
  // the function provide all the choices from the database
  Future<List<String>> getChoice() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String assetPath = 'assets/database.db';
    String copyPath = '$appDocPath/database.db';

    if (!_isInitialized) {
      final dbFile = File(copyPath);
      if (!dbFile.existsSync()) {
        // If the database file doesn't exist, copy it from assets
        ByteData data = await rootBundle.load(assetPath);
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await dbFile.writeAsBytes(bytes);
      }
      _isInitialized = true;
    }

    final db = await openDatabase(copyPath);
    final List<int> indices = await getIndices(db);
    // get a random choice from the list
    var random = Random();
    int max = indices.length;
    debugPrint("the length of db id list is $max.toString()");
    String path = await getDatabasesPath();
    debugPrint("THE DB PATH IS $path");
    final int randomIndex = random.nextInt(max);
    // get the choice from the database
    final List<String> choices = await getChoices(indices[randomIndex], db);

    // return ["我们", "许巍", "今天"];
    return choices;
  }

  // this function return the indices of the windows of the canteen
  Future<List<int>> getIndices(final db) async {
    final List<Map<String, dynamic>> maps =
        await db.query("choices", columns: ["id"]);
    return List.generate(maps.length, (i) {
      if (maps[i]["id"] == null) {
        return 0;
      }
      return maps[i]["id"];
    });
  }

  Future<List<String>> getChoices(int choiceIndice, final db) async {
    final List<Map<String, dynamic>> maps = await db.query("choices",
        columns: ["餐厅", "楼层", "窗口", "名称"],
        where: "id = ?",
        whereArgs: [choiceIndice]);

    return [maps[0]["餐厅"], maps[0]["楼层"], maps[0]["窗口"], maps[0]["名称"]];
  }
}
