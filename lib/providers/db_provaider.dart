// ignore_for_file: unnecessary_new, unused_local_variable

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qaride/models/scan_models.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = new DBProvider._();
  DBProvider._();

  get database async {
    if (_database != null) return _database;
    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    Directory documenteDirectory = await getApplicationDocumentsDirectory();
    final path = join(documenteDirectory.path, 'ScansDB.db');
    print(path);
    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
        ''');
      },
      version: 1,
    );
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    final db = await database;
    final res = await db.rawInsert(
      ''' INSERT INTO Scans(id , tipo , valor)
    VALUES ($id , '$tipo' , '$valor') ''',
    );
    return res;
  }

  Future<ScanModel?> getScanById(int i) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [i]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel?>> getTodosScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<List<ScanModel>> getTodosScansPorTipo(String scan) async {
    final db = await database;
    final res = await db.rawQuery(''' 

    SELECT * FROM Scans WHERE tipo = '$scan'
    
     ''');

    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }
}
