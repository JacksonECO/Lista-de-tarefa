// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTaskCollection on Isar {
  IsarCollection<Task> get tasks => getCollection();
}

const TaskSchema = CollectionSchema(
  name: 'Task',
  schema:
      '{"name":"Task","idName":"id","properties":[{"name":"completed","type":"Bool"},{"name":"completedDate","type":"Long"},{"name":"created","type":"Long"},{"name":"description","type":"String"},{"name":"folderId","type":"Long"},{"name":"lastModified","type":"Long"},{"name":"title","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'completed': 0,
    'completedDate': 1,
    'created': 2,
    'description': 3,
    'folderId': 4,
    'lastModified': 5,
    'title': 6
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _taskGetId,
  setId: _taskSetId,
  getLinks: _taskGetLinks,
  attachLinks: _taskAttachLinks,
  serializeNative: _taskSerializeNative,
  deserializeNative: _taskDeserializeNative,
  deserializePropNative: _taskDeserializePropNative,
  serializeWeb: _taskSerializeWeb,
  deserializeWeb: _taskDeserializeWeb,
  deserializePropWeb: _taskDeserializePropWeb,
  version: 3,
);

int? _taskGetId(Task object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _taskSetId(Task object, int id) {
  object.id = id;
}

List<IsarLinkBase> _taskGetLinks(Task object) {
  return [];
}

void _taskSerializeNative(IsarCollection<Task> collection, IsarRawObject rawObj,
    Task object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.completed;
  final _completed = value0;
  final value1 = object.completedDate;
  final _completedDate = value1;
  final value2 = object.created;
  final _created = value2;
  final value3 = object.description;
  IsarUint8List? _description;
  if (value3 != null) {
    _description = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_description?.length ?? 0) as int;
  final value4 = object.folderId;
  final _folderId = value4;
  final value5 = object.lastModified;
  final _lastModified = value5;
  final value6 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_title.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBool(offsets[0], _completed);
  writer.writeDateTime(offsets[1], _completedDate);
  writer.writeDateTime(offsets[2], _created);
  writer.writeBytes(offsets[3], _description);
  writer.writeLong(offsets[4], _folderId);
  writer.writeDateTime(offsets[5], _lastModified);
  writer.writeBytes(offsets[6], _title);
}

Task _taskDeserializeNative(IsarCollection<Task> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Task();
  object.completed = reader.readBool(offsets[0]);
  object.completedDate = reader.readDateTimeOrNull(offsets[1]);
  object.created = reader.readDateTime(offsets[2]);
  object.description = reader.readStringOrNull(offsets[3]);
  object.folderId = reader.readLong(offsets[4]);
  object.id = id;
  object.lastModified = reader.readDateTime(offsets[5]);
  object.title = reader.readString(offsets[6]);
  return object;
}

P _taskDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _taskSerializeWeb(IsarCollection<Task> collection, Task object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'completed', object.completed);
  IsarNative.jsObjectSet(jsObj, 'completedDate',
      object.completedDate?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(
      jsObj, 'created', object.created.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'description', object.description);
  IsarNative.jsObjectSet(jsObj, 'folderId', object.folderId);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'lastModified',
      object.lastModified.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

Task _taskDeserializeWeb(IsarCollection<Task> collection, dynamic jsObj) {
  final object = Task();
  object.completed = IsarNative.jsObjectGet(jsObj, 'completed') ?? false;
  object.completedDate = IsarNative.jsObjectGet(jsObj, 'completedDate') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'completedDate'),
              isUtc: true)
          .toLocal()
      : null;
  object.created = IsarNative.jsObjectGet(jsObj, 'created') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'created'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.description = IsarNative.jsObjectGet(jsObj, 'description');
  object.folderId =
      IsarNative.jsObjectGet(jsObj, 'folderId') ?? double.negativeInfinity;
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.lastModified = IsarNative.jsObjectGet(jsObj, 'lastModified') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'lastModified'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.title = IsarNative.jsObjectGet(jsObj, 'title') ?? '';
  return object;
}

P _taskDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'completed':
      return (IsarNative.jsObjectGet(jsObj, 'completed') ?? false) as P;
    case 'completedDate':
      return (IsarNative.jsObjectGet(jsObj, 'completedDate') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'completedDate'),
                  isUtc: true)
              .toLocal()
          : null) as P;
    case 'created':
      return (IsarNative.jsObjectGet(jsObj, 'created') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'created'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'description':
      return (IsarNative.jsObjectGet(jsObj, 'description')) as P;
    case 'folderId':
      return (IsarNative.jsObjectGet(jsObj, 'folderId') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'lastModified':
      return (IsarNative.jsObjectGet(jsObj, 'lastModified') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'lastModified'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _taskAttachLinks(IsarCollection col, int id, Task object) {}

extension TaskQueryWhereSort on QueryBuilder<Task, Task, QWhere> {
  QueryBuilder<Task, Task, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TaskQueryWhere on QueryBuilder<Task, Task, QWhereClause> {
  QueryBuilder<Task, Task, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension TaskQueryFilter on QueryBuilder<Task, Task, QFilterCondition> {
  QueryBuilder<Task, Task, QAfterFilterCondition> completedEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'completed',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> completedDateIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'completedDate',
      value: null,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> completedDateEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'completedDate',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> completedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'completedDate',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> completedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'completedDate',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> completedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'completedDate',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> createdEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'created',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> createdGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'created',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> createdLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'created',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> createdBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'created',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'description',
      value: null,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'description',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'description',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> folderIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'folderId',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> folderIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'folderId',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> folderIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'folderId',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> folderIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'folderId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> lastModifiedEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lastModified',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> lastModifiedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'lastModified',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> lastModifiedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'lastModified',
      value: value,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> lastModifiedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'lastModified',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TaskQueryLinks on QueryBuilder<Task, Task, QFilterCondition> {}

extension TaskQueryWhereSortBy on QueryBuilder<Task, Task, QSortBy> {
  QueryBuilder<Task, Task, QAfterSortBy> sortByCompleted() {
    return addSortByInternal('completed', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByCompletedDesc() {
    return addSortByInternal('completed', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByCompletedDate() {
    return addSortByInternal('completedDate', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByCompletedDateDesc() {
    return addSortByInternal('completedDate', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByCreated() {
    return addSortByInternal('created', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByCreatedDesc() {
    return addSortByInternal('created', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByFolderId() {
    return addSortByInternal('folderId', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByFolderIdDesc() {
    return addSortByInternal('folderId', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByLastModified() {
    return addSortByInternal('lastModified', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByLastModifiedDesc() {
    return addSortByInternal('lastModified', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension TaskQueryWhereSortThenBy on QueryBuilder<Task, Task, QSortThenBy> {
  QueryBuilder<Task, Task, QAfterSortBy> thenByCompleted() {
    return addSortByInternal('completed', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByCompletedDesc() {
    return addSortByInternal('completed', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByCompletedDate() {
    return addSortByInternal('completedDate', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByCompletedDateDesc() {
    return addSortByInternal('completedDate', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByCreated() {
    return addSortByInternal('created', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByCreatedDesc() {
    return addSortByInternal('created', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByFolderId() {
    return addSortByInternal('folderId', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByFolderIdDesc() {
    return addSortByInternal('folderId', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByLastModified() {
    return addSortByInternal('lastModified', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByLastModifiedDesc() {
    return addSortByInternal('lastModified', Sort.desc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension TaskQueryWhereDistinct on QueryBuilder<Task, Task, QDistinct> {
  QueryBuilder<Task, Task, QDistinct> distinctByCompleted() {
    return addDistinctByInternal('completed');
  }

  QueryBuilder<Task, Task, QDistinct> distinctByCompletedDate() {
    return addDistinctByInternal('completedDate');
  }

  QueryBuilder<Task, Task, QDistinct> distinctByCreated() {
    return addDistinctByInternal('created');
  }

  QueryBuilder<Task, Task, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<Task, Task, QDistinct> distinctByFolderId() {
    return addDistinctByInternal('folderId');
  }

  QueryBuilder<Task, Task, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Task, Task, QDistinct> distinctByLastModified() {
    return addDistinctByInternal('lastModified');
  }

  QueryBuilder<Task, Task, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension TaskQueryProperty on QueryBuilder<Task, Task, QQueryProperty> {
  QueryBuilder<Task, bool, QQueryOperations> completedProperty() {
    return addPropertyNameInternal('completed');
  }

  QueryBuilder<Task, DateTime?, QQueryOperations> completedDateProperty() {
    return addPropertyNameInternal('completedDate');
  }

  QueryBuilder<Task, DateTime, QQueryOperations> createdProperty() {
    return addPropertyNameInternal('created');
  }

  QueryBuilder<Task, String?, QQueryOperations> descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<Task, int, QQueryOperations> folderIdProperty() {
    return addPropertyNameInternal('folderId');
  }

  QueryBuilder<Task, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Task, DateTime, QQueryOperations> lastModifiedProperty() {
    return addPropertyNameInternal('lastModified');
  }

  QueryBuilder<Task, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
