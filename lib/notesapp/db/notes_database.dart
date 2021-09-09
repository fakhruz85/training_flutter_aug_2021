import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myapp/notesapp/model/note.dart';
// import 'package:fluttercrud_notes/model/note.dart';

//steps 1 create class
class NotesDatabase {

  //steps 3 kita create global field iaitu kita punya instance
  //NotesDatabase._init(); kita panggil balik constructor
  static final NotesDatabase instance = NotesDatabase._init();

  //steps 4 kita create satu field baru utk kita punya database
  //file ni dtg direct dari package sqflite package
  static Database? _database;


  //steps 2 kita create private constructor
  NotesDatabase._init();


  //steps 5 kita nk pakai DB so kena ad connection
  Future<Database> get database async {
    if (_database != null) return _database!;

  //steps 6 kita simpan db dlam notes.db
    _database = await _initDB('notes.db');
    return _database!;
  }

  //steps 7 kita nk initialize db kita
  //kita create satu metod utk kita dptkan file path dan nk simpan db dlm file storage sistem
  //klau nk ubah tmpat simpan db kena ubah getdatabasepath
  //dbpath tu location db kita simpan
  //path
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  //steps 8 kita create db metod dn dalam tu kita kne define schema tapi kita kosong kan dlu
  Future _createDB(Database db, int version) async {

    //steps 14 kita kena create identifier utk table yg kita create
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    //steps 13 buat create table
    await db.execute('''
CREATE TABLE $tableNotes ( 
  ${NoteFields.id} $idType, 
  ${NoteFields.isImportant} $boolType,
  ${NoteFields.number} $integerType,
  ${NoteFields.title} $textType,
  ${NoteFields.description} $textType,
  ${NoteFields.time} $textType
  )
''');
  }

  //steps 15 buat create data method
  //yang (note note) tu kita nak convert note object kepada json objek
  Future<Note> create(Note note) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

  //step 16 buat insert operation (tablenotes letak nama tables, define data apa yg kita nak isi dalam database.. so kita kena convert ke dalam map)
    final id = await db.insert(tableNotes, note.toJson());

    //steps 18 kita nak pass data tu ke note semula so kita kena create copy method
    //dan dalam tu kita copy kita punya current object nota dan modify id
    return note.copy(id: id);
  }

  Future<Note> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${NoteFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableNotes, orderBy: orderBy);

    return result.map((json) => Note.fromJson(json)).toList();
  }

  Future<int> update(Note note) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }


  //steps 9 kita buat method utk tutup db
  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
