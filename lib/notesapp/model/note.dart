//steps 11 create table notes
final String tableNotes = 'notes';

//steps 12
//creat kelas table name
//kita define smua nama field
class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, number, title, description, time
  ];
  //klau dalam database default format mmg kne ada underscore
  //kita define smua column name utk table kita
  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

//steps 10 buat dlu satu kelas utk nota
class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

//steps 19 buat method copy
//kita ambil fields dalam kelas notefields
//method ni kita copy current objek nota tu kita hntr smua value letak dalam note copy utk kita modify nanti
  Note copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      //steps 20 dalam ni kita create satu objek nota
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        isImportant: json[NoteFields.isImportant] == 1,
        number: json[NoteFields.number] as int,
        title: json[NoteFields.title] as String,
        description: json[NoteFields.description] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );
  //step 17 letak key utk notefields kelas kemudian lepastu isi value based on kelas note
  //kita nk jadikan notefields sebagai tempat access
  //then kita jadi kelas note tu sbg corresponding kpad notefields dn jdikan die sbg value
  //utk isimportant tu kalau die pnting dia return nilai 1 kalau 0 die not true.. sbb mmg format die mmg mcm tu
  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.number: number,
        NoteFields.description: description,
        NoteFields.time: createdTime.toIso8601String(),
      };
}
