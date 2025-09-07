// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_files.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNewProjectCollection on Isar {
  IsarCollection<NewProject> get newProjects => this.collection();
}

const NewProjectSchema = CollectionSchema(
  name: r'NewProject',
  id: 7831747443602622257,
  properties: {
    r'analysisCompleted': PropertySchema(
      id: 0,
      name: r'analysisCompleted',
      type: IsarType.bool,
    ),
    r'completedFileCount': PropertySchema(
      id: 1,
      name: r'completedFileCount',
      type: IsarType.long,
    ),
    r'completedFilePath': PropertySchema(
      id: 2,
      name: r'completedFilePath',
      type: IsarType.stringList,
    ),
    r'fileCount': PropertySchema(
      id: 3,
      name: r'fileCount',
      type: IsarType.long,
    ),
    r'inputFolder': PropertySchema(
      id: 4,
      name: r'inputFolder',
      type: IsarType.string,
    ),
    r'listOfKeysPerFile': PropertySchema(
      id: 5,
      name: r'listOfKeysPerFile',
      type: IsarType.objectList,
      target: r'FileToKeyValueList',
    ),
    r'operationsToBeDone': PropertySchema(
      id: 6,
      name: r'operationsToBeDone',
      type: IsarType.stringList,
    ),
    r'outputFolder': PropertySchema(
      id: 7,
      name: r'outputFolder',
      type: IsarType.string,
    ),
    r'performanceLoadable': PropertySchema(
      id: 8,
      name: r'performanceLoadable',
      type: IsarType.long,
    ),
    r'projectDescription': PropertySchema(
      id: 9,
      name: r'projectDescription',
      type: IsarType.string,
    ),
    r'projectName': PropertySchema(
      id: 10,
      name: r'projectName',
      type: IsarType.string,
    ),
    r'totalKeys': PropertySchema(
      id: 11,
      name: r'totalKeys',
      type: IsarType.stringList,
    ),
    r'uncompletedFileCount': PropertySchema(
      id: 12,
      name: r'uncompletedFileCount',
      type: IsarType.long,
    ),
    r'uncompletedFilePath': PropertySchema(
      id: 13,
      name: r'uncompletedFilePath',
      type: IsarType.stringList,
    )
  },
  estimateSize: _newProjectEstimateSize,
  serialize: _newProjectSerialize,
  deserialize: _newProjectDeserialize,
  deserializeProp: _newProjectDeserializeProp,
  idName: r'projectId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'FileToKeyValueList': FileToKeyValueListSchema},
  getId: _newProjectGetId,
  getLinks: _newProjectGetLinks,
  attach: _newProjectAttach,
  version: '3.1.0+1',
);

int _newProjectEstimateSize(
  NewProject object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.completedFilePath;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.inputFolder.length * 3;
  {
    final list = object.listOfKeysPerFile;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FileToKeyValueList]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              FileToKeyValueListSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.operationsToBeDone;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.outputFolder.length * 3;
  {
    final value = object.projectDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.projectName.length * 3;
  {
    final list = object.totalKeys;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.uncompletedFilePath;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _newProjectSerialize(
  NewProject object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.analysisCompleted);
  writer.writeLong(offsets[1], object.completedFileCount);
  writer.writeStringList(offsets[2], object.completedFilePath);
  writer.writeLong(offsets[3], object.fileCount);
  writer.writeString(offsets[4], object.inputFolder);
  writer.writeObjectList<FileToKeyValueList>(
    offsets[5],
    allOffsets,
    FileToKeyValueListSchema.serialize,
    object.listOfKeysPerFile,
  );
  writer.writeStringList(offsets[6], object.operationsToBeDone);
  writer.writeString(offsets[7], object.outputFolder);
  writer.writeLong(offsets[8], object.performanceLoadable);
  writer.writeString(offsets[9], object.projectDescription);
  writer.writeString(offsets[10], object.projectName);
  writer.writeStringList(offsets[11], object.totalKeys);
  writer.writeLong(offsets[12], object.uncompletedFileCount);
  writer.writeStringList(offsets[13], object.uncompletedFilePath);
}

NewProject _newProjectDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NewProject();
  object.analysisCompleted = reader.readBool(offsets[0]);
  object.completedFileCount = reader.readLong(offsets[1]);
  object.completedFilePath = reader.readStringList(offsets[2]);
  object.fileCount = reader.readLong(offsets[3]);
  object.inputFolder = reader.readString(offsets[4]);
  object.listOfKeysPerFile = reader.readObjectList<FileToKeyValueList>(
    offsets[5],
    FileToKeyValueListSchema.deserialize,
    allOffsets,
    FileToKeyValueList(),
  );
  object.operationsToBeDone = reader.readStringList(offsets[6]);
  object.outputFolder = reader.readString(offsets[7]);
  object.performanceLoadable = reader.readLong(offsets[8]);
  object.projectDescription = reader.readStringOrNull(offsets[9]);
  object.projectId = id;
  object.projectName = reader.readString(offsets[10]);
  object.totalKeys = reader.readStringList(offsets[11]);
  object.uncompletedFileCount = reader.readLong(offsets[12]);
  object.uncompletedFilePath = reader.readStringList(offsets[13]);
  return object;
}

P _newProjectDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringList(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readObjectList<FileToKeyValueList>(
        offset,
        FileToKeyValueListSchema.deserialize,
        allOffsets,
        FileToKeyValueList(),
      )) as P;
    case 6:
      return (reader.readStringList(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringList(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _newProjectGetId(NewProject object) {
  return object.projectId;
}

List<IsarLinkBase<dynamic>> _newProjectGetLinks(NewProject object) {
  return [];
}

void _newProjectAttach(IsarCollection<dynamic> col, Id id, NewProject object) {
  object.projectId = id;
}

extension NewProjectQueryWhereSort
    on QueryBuilder<NewProject, NewProject, QWhere> {
  QueryBuilder<NewProject, NewProject, QAfterWhere> anyProjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NewProjectQueryWhere
    on QueryBuilder<NewProject, NewProject, QWhereClause> {
  QueryBuilder<NewProject, NewProject, QAfterWhereClause> projectIdEqualTo(
      Id projectId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: projectId,
        upper: projectId,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterWhereClause> projectIdNotEqualTo(
      Id projectId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: projectId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: projectId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: projectId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: projectId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterWhereClause> projectIdGreaterThan(
      Id projectId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: projectId, includeLower: include),
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterWhereClause> projectIdLessThan(
      Id projectId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: projectId, includeUpper: include),
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterWhereClause> projectIdBetween(
    Id lowerProjectId,
    Id upperProjectId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerProjectId,
        includeLower: includeLower,
        upper: upperProjectId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NewProjectQueryFilter
    on QueryBuilder<NewProject, NewProject, QFilterCondition> {
  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      analysisCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'analysisCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFileCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedFileCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFileCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedFileCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFileCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedFileCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFileCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedFileCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedFilePath',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedFilePath',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedFilePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'completedFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'completedFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'completedFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'completedFilePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedFilePath',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'completedFilePath',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedFilePath',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedFilePath',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedFilePath',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedFilePath',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedFilePath',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      completedFilePathLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedFilePath',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition> fileCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      fileCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition> fileCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition> fileCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      inputFolderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inputFolder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      inputFolderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inputFolder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      inputFolderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inputFolder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      inputFolderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inputFolder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      inputFolderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inputFolder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      inputFolderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inputFolder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      inputFolderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inputFolder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      inputFolderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inputFolder',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      inputFolderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inputFolder',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      inputFolderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inputFolder',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      listOfKeysPerFileIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'listOfKeysPerFile',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      listOfKeysPerFileIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'listOfKeysPerFile',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      listOfKeysPerFileLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listOfKeysPerFile',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      listOfKeysPerFileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listOfKeysPerFile',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      listOfKeysPerFileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listOfKeysPerFile',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      listOfKeysPerFileLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listOfKeysPerFile',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      listOfKeysPerFileLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listOfKeysPerFile',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      listOfKeysPerFileLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listOfKeysPerFile',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'operationsToBeDone',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'operationsToBeDone',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operationsToBeDone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'operationsToBeDone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'operationsToBeDone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'operationsToBeDone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'operationsToBeDone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'operationsToBeDone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'operationsToBeDone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'operationsToBeDone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operationsToBeDone',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'operationsToBeDone',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'operationsToBeDone',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'operationsToBeDone',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'operationsToBeDone',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'operationsToBeDone',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'operationsToBeDone',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      operationsToBeDoneLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'operationsToBeDone',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      outputFolderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outputFolder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      outputFolderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'outputFolder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      outputFolderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'outputFolder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      outputFolderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'outputFolder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      outputFolderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'outputFolder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      outputFolderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'outputFolder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      outputFolderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'outputFolder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      outputFolderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'outputFolder',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      outputFolderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outputFolder',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      outputFolderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'outputFolder',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      performanceLoadableEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performanceLoadable',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      performanceLoadableGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'performanceLoadable',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      performanceLoadableLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'performanceLoadable',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      performanceLoadableBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'performanceLoadable',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'projectDescription',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'projectDescription',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'projectDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'projectDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition> projectIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectId',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectId',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition> projectIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectId',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition> projectIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'projectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'projectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectName',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      projectNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectName',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalKeys',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalKeys',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalKeys',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'totalKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'totalKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'totalKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'totalKeys',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalKeys',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'totalKeys',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'totalKeys',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'totalKeys',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'totalKeys',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'totalKeys',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'totalKeys',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      totalKeysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'totalKeys',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFileCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uncompletedFileCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFileCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uncompletedFileCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFileCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uncompletedFileCount',
        value: value,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFileCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uncompletedFileCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uncompletedFilePath',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uncompletedFilePath',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uncompletedFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uncompletedFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uncompletedFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uncompletedFilePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uncompletedFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uncompletedFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uncompletedFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uncompletedFilePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uncompletedFilePath',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uncompletedFilePath',
        value: '',
      ));
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uncompletedFilePath',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uncompletedFilePath',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uncompletedFilePath',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uncompletedFilePath',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uncompletedFilePath',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      uncompletedFilePathLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'uncompletedFilePath',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension NewProjectQueryObject
    on QueryBuilder<NewProject, NewProject, QFilterCondition> {
  QueryBuilder<NewProject, NewProject, QAfterFilterCondition>
      listOfKeysPerFileElement(FilterQuery<FileToKeyValueList> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'listOfKeysPerFile');
    });
  }
}

extension NewProjectQueryLinks
    on QueryBuilder<NewProject, NewProject, QFilterCondition> {}

extension NewProjectQuerySortBy
    on QueryBuilder<NewProject, NewProject, QSortBy> {
  QueryBuilder<NewProject, NewProject, QAfterSortBy> sortByAnalysisCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analysisCompleted', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      sortByAnalysisCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analysisCompleted', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      sortByCompletedFileCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedFileCount', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      sortByCompletedFileCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedFileCount', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> sortByFileCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileCount', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> sortByFileCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileCount', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> sortByInputFolder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputFolder', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> sortByInputFolderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputFolder', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> sortByOutputFolder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputFolder', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> sortByOutputFolderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputFolder', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      sortByPerformanceLoadable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performanceLoadable', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      sortByPerformanceLoadableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performanceLoadable', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      sortByProjectDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectDescription', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      sortByProjectDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectDescription', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> sortByProjectName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectName', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> sortByProjectNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectName', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      sortByUncompletedFileCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uncompletedFileCount', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      sortByUncompletedFileCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uncompletedFileCount', Sort.desc);
    });
  }
}

extension NewProjectQuerySortThenBy
    on QueryBuilder<NewProject, NewProject, QSortThenBy> {
  QueryBuilder<NewProject, NewProject, QAfterSortBy> thenByAnalysisCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analysisCompleted', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      thenByAnalysisCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'analysisCompleted', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      thenByCompletedFileCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedFileCount', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      thenByCompletedFileCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedFileCount', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> thenByFileCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileCount', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> thenByFileCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileCount', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> thenByInputFolder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputFolder', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> thenByInputFolderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputFolder', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> thenByOutputFolder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputFolder', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> thenByOutputFolderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outputFolder', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      thenByPerformanceLoadable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performanceLoadable', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      thenByPerformanceLoadableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performanceLoadable', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      thenByProjectDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectDescription', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      thenByProjectDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectDescription', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> thenByProjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> thenByProjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectId', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> thenByProjectName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectName', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy> thenByProjectNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectName', Sort.desc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      thenByUncompletedFileCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uncompletedFileCount', Sort.asc);
    });
  }

  QueryBuilder<NewProject, NewProject, QAfterSortBy>
      thenByUncompletedFileCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uncompletedFileCount', Sort.desc);
    });
  }
}

extension NewProjectQueryWhereDistinct
    on QueryBuilder<NewProject, NewProject, QDistinct> {
  QueryBuilder<NewProject, NewProject, QDistinct>
      distinctByAnalysisCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'analysisCompleted');
    });
  }

  QueryBuilder<NewProject, NewProject, QDistinct>
      distinctByCompletedFileCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedFileCount');
    });
  }

  QueryBuilder<NewProject, NewProject, QDistinct>
      distinctByCompletedFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedFilePath');
    });
  }

  QueryBuilder<NewProject, NewProject, QDistinct> distinctByFileCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileCount');
    });
  }

  QueryBuilder<NewProject, NewProject, QDistinct> distinctByInputFolder(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inputFolder', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewProject, NewProject, QDistinct>
      distinctByOperationsToBeDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operationsToBeDone');
    });
  }

  QueryBuilder<NewProject, NewProject, QDistinct> distinctByOutputFolder(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outputFolder', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewProject, NewProject, QDistinct>
      distinctByPerformanceLoadable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'performanceLoadable');
    });
  }

  QueryBuilder<NewProject, NewProject, QDistinct> distinctByProjectDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewProject, NewProject, QDistinct> distinctByProjectName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NewProject, NewProject, QDistinct> distinctByTotalKeys() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalKeys');
    });
  }

  QueryBuilder<NewProject, NewProject, QDistinct>
      distinctByUncompletedFileCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uncompletedFileCount');
    });
  }

  QueryBuilder<NewProject, NewProject, QDistinct>
      distinctByUncompletedFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uncompletedFilePath');
    });
  }
}

extension NewProjectQueryProperty
    on QueryBuilder<NewProject, NewProject, QQueryProperty> {
  QueryBuilder<NewProject, int, QQueryOperations> projectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectId');
    });
  }

  QueryBuilder<NewProject, bool, QQueryOperations> analysisCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'analysisCompleted');
    });
  }

  QueryBuilder<NewProject, int, QQueryOperations> completedFileCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedFileCount');
    });
  }

  QueryBuilder<NewProject, List<String>?, QQueryOperations>
      completedFilePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedFilePath');
    });
  }

  QueryBuilder<NewProject, int, QQueryOperations> fileCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileCount');
    });
  }

  QueryBuilder<NewProject, String, QQueryOperations> inputFolderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inputFolder');
    });
  }

  QueryBuilder<NewProject, List<FileToKeyValueList>?, QQueryOperations>
      listOfKeysPerFileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listOfKeysPerFile');
    });
  }

  QueryBuilder<NewProject, List<String>?, QQueryOperations>
      operationsToBeDoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operationsToBeDone');
    });
  }

  QueryBuilder<NewProject, String, QQueryOperations> outputFolderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outputFolder');
    });
  }

  QueryBuilder<NewProject, int, QQueryOperations>
      performanceLoadableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'performanceLoadable');
    });
  }

  QueryBuilder<NewProject, String?, QQueryOperations>
      projectDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectDescription');
    });
  }

  QueryBuilder<NewProject, String, QQueryOperations> projectNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectName');
    });
  }

  QueryBuilder<NewProject, List<String>?, QQueryOperations>
      totalKeysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalKeys');
    });
  }

  QueryBuilder<NewProject, int, QQueryOperations>
      uncompletedFileCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uncompletedFileCount');
    });
  }

  QueryBuilder<NewProject, List<String>?, QQueryOperations>
      uncompletedFilePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uncompletedFilePath');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FileToKeyValueListSchema = Schema(
  name: r'FileToKeyValueList',
  id: 9051496270647473488,
  properties: {
    r'key': PropertySchema(
      id: 0,
      name: r'key',
      type: IsarType.string,
    ),
    r'value': PropertySchema(
      id: 1,
      name: r'value',
      type: IsarType.stringList,
    )
  },
  estimateSize: _fileToKeyValueListEstimateSize,
  serialize: _fileToKeyValueListSerialize,
  deserialize: _fileToKeyValueListDeserialize,
  deserializeProp: _fileToKeyValueListDeserializeProp,
);

int _fileToKeyValueListEstimateSize(
  FileToKeyValueList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.key.length * 3;
  bytesCount += 3 + object.value.length * 3;
  {
    for (var i = 0; i < object.value.length; i++) {
      final value = object.value[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _fileToKeyValueListSerialize(
  FileToKeyValueList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.key);
  writer.writeStringList(offsets[1], object.value);
}

FileToKeyValueList _fileToKeyValueListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FileToKeyValueList();
  object.key = reader.readString(offsets[0]);
  object.value = reader.readStringList(offsets[1]) ?? [];
  return object;
}

P _fileToKeyValueListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FileToKeyValueListQueryFilter
    on QueryBuilder<FileToKeyValueList, FileToKeyValueList, QFilterCondition> {
  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      keyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      keyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      keyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'key',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      keyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      keyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'key',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      keyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      keyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'value',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'value',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'value',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'value',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'value',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FileToKeyValueList, FileToKeyValueList, QAfterFilterCondition>
      valueLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'value',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension FileToKeyValueListQueryObject
    on QueryBuilder<FileToKeyValueList, FileToKeyValueList, QFilterCondition> {}
