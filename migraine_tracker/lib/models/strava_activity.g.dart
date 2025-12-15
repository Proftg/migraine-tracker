// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strava_activity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStravaActivityCollection on Isar {
  IsarCollection<StravaActivity> get stravaActivitys => this.collection();
}

const StravaActivitySchema = CollectionSchema(
  name: r'StravaActivity',
  id: -3696801488619567971,
  properties: {
    r'activityIcon': PropertySchema(
      id: 0,
      name: r'activityIcon',
      type: IsarType.string,
    ),
    r'activityType': PropertySchema(
      id: 1,
      name: r'activityType',
      type: IsarType.string,
    ),
    r'averageHeartRate': PropertySchema(
      id: 2,
      name: r'averageHeartRate',
      type: IsarType.long,
    ),
    r'averagePace': PropertySchema(
      id: 3,
      name: r'averagePace',
      type: IsarType.string,
    ),
    r'averageSpeed': PropertySchema(
      id: 4,
      name: r'averageSpeed',
      type: IsarType.double,
    ),
    r'averageSpeedKmh': PropertySchema(
      id: 5,
      name: r'averageSpeedKmh',
      type: IsarType.double,
    ),
    r'calories': PropertySchema(
      id: 6,
      name: r'calories',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 7,
      name: r'description',
      type: IsarType.string,
    ),
    r'distanceMeters': PropertySchema(
      id: 8,
      name: r'distanceMeters',
      type: IsarType.double,
    ),
    r'durationSeconds': PropertySchema(
      id: 9,
      name: r'durationSeconds',
      type: IsarType.long,
    ),
    r'elevationGain': PropertySchema(
      id: 10,
      name: r'elevationGain',
      type: IsarType.double,
    ),
    r'formattedDistance': PropertySchema(
      id: 11,
      name: r'formattedDistance',
      type: IsarType.string,
    ),
    r'formattedDuration': PropertySchema(
      id: 12,
      name: r'formattedDuration',
      type: IsarType.string,
    ),
    r'fromGarmin': PropertySchema(
      id: 13,
      name: r'fromGarmin',
      type: IsarType.bool,
    ),
    r'intensityLevel': PropertySchema(
      id: 14,
      name: r'intensityLevel',
      type: IsarType.string,
    ),
    r'isPotentialTrigger': PropertySchema(
      id: 15,
      name: r'isPotentialTrigger',
      type: IsarType.bool,
    ),
    r'lastSync': PropertySchema(
      id: 16,
      name: r'lastSync',
      type: IsarType.dateTime,
    ),
    r'maxHeartRate': PropertySchema(
      id: 17,
      name: r'maxHeartRate',
      type: IsarType.long,
    ),
    r'maxSpeed': PropertySchema(
      id: 18,
      name: r'maxSpeed',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 19,
      name: r'name',
      type: IsarType.string,
    ),
    r'pacePerKm': PropertySchema(
      id: 20,
      name: r'pacePerKm',
      type: IsarType.string,
    ),
    r'perceivedExertion': PropertySchema(
      id: 21,
      name: r'perceivedExertion',
      type: IsarType.long,
    ),
    r'rawData': PropertySchema(
      id: 22,
      name: r'rawData',
      type: IsarType.string,
    ),
    r'relativeEffort': PropertySchema(
      id: 23,
      name: r'relativeEffort',
      type: IsarType.long,
    ),
    r'startDate': PropertySchema(
      id: 24,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'stravaId': PropertySchema(
      id: 25,
      name: r'stravaId',
      type: IsarType.long,
    ),
    r'sufferScore': PropertySchema(
      id: 26,
      name: r'sufferScore',
      type: IsarType.double,
    ),
    r'temperature': PropertySchema(
      id: 27,
      name: r'temperature',
      type: IsarType.double,
    ),
    r'weatherCondition': PropertySchema(
      id: 28,
      name: r'weatherCondition',
      type: IsarType.string,
    ),
    r'workoutType': PropertySchema(
      id: 29,
      name: r'workoutType',
      type: IsarType.string,
    )
  },
  estimateSize: _stravaActivityEstimateSize,
  serialize: _stravaActivitySerialize,
  deserialize: _stravaActivityDeserialize,
  deserializeProp: _stravaActivityDeserializeProp,
  idName: r'id',
  indexes: {
    r'stravaId': IndexSchema(
      id: 3559372165434007524,
      name: r'stravaId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'stravaId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'startDate': IndexSchema(
      id: 7723980484494730382,
      name: r'startDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'startDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _stravaActivityGetId,
  getLinks: _stravaActivityGetLinks,
  attach: _stravaActivityAttach,
  version: '3.1.0+1',
);

int _stravaActivityEstimateSize(
  StravaActivity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activityIcon.length * 3;
  bytesCount += 3 + object.activityType.length * 3;
  {
    final value = object.averagePace;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.formattedDistance.length * 3;
  bytesCount += 3 + object.formattedDuration.length * 3;
  bytesCount += 3 + object.intensityLevel.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.pacePerKm.length * 3;
  {
    final value = object.rawData;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.weatherCondition;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.workoutType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _stravaActivitySerialize(
  StravaActivity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activityIcon);
  writer.writeString(offsets[1], object.activityType);
  writer.writeLong(offsets[2], object.averageHeartRate);
  writer.writeString(offsets[3], object.averagePace);
  writer.writeDouble(offsets[4], object.averageSpeed);
  writer.writeDouble(offsets[5], object.averageSpeedKmh);
  writer.writeLong(offsets[6], object.calories);
  writer.writeString(offsets[7], object.description);
  writer.writeDouble(offsets[8], object.distanceMeters);
  writer.writeLong(offsets[9], object.durationSeconds);
  writer.writeDouble(offsets[10], object.elevationGain);
  writer.writeString(offsets[11], object.formattedDistance);
  writer.writeString(offsets[12], object.formattedDuration);
  writer.writeBool(offsets[13], object.fromGarmin);
  writer.writeString(offsets[14], object.intensityLevel);
  writer.writeBool(offsets[15], object.isPotentialTrigger);
  writer.writeDateTime(offsets[16], object.lastSync);
  writer.writeLong(offsets[17], object.maxHeartRate);
  writer.writeDouble(offsets[18], object.maxSpeed);
  writer.writeString(offsets[19], object.name);
  writer.writeString(offsets[20], object.pacePerKm);
  writer.writeLong(offsets[21], object.perceivedExertion);
  writer.writeString(offsets[22], object.rawData);
  writer.writeLong(offsets[23], object.relativeEffort);
  writer.writeDateTime(offsets[24], object.startDate);
  writer.writeLong(offsets[25], object.stravaId);
  writer.writeDouble(offsets[26], object.sufferScore);
  writer.writeDouble(offsets[27], object.temperature);
  writer.writeString(offsets[28], object.weatherCondition);
  writer.writeString(offsets[29], object.workoutType);
}

StravaActivity _stravaActivityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StravaActivity(
    activityType: reader.readString(offsets[1]),
    distanceMeters: reader.readDouble(offsets[8]),
    durationSeconds: reader.readLong(offsets[9]),
    name: reader.readString(offsets[19]),
    startDate: reader.readDateTime(offsets[24]),
    stravaId: reader.readLong(offsets[25]),
  );
  object.averageHeartRate = reader.readLongOrNull(offsets[2]);
  object.averagePace = reader.readStringOrNull(offsets[3]);
  object.averageSpeed = reader.readDoubleOrNull(offsets[4]);
  object.calories = reader.readLongOrNull(offsets[6]);
  object.description = reader.readStringOrNull(offsets[7]);
  object.elevationGain = reader.readDoubleOrNull(offsets[10]);
  object.fromGarmin = reader.readBool(offsets[13]);
  object.id = id;
  object.lastSync = reader.readDateTimeOrNull(offsets[16]);
  object.maxHeartRate = reader.readLongOrNull(offsets[17]);
  object.maxSpeed = reader.readDoubleOrNull(offsets[18]);
  object.perceivedExertion = reader.readLongOrNull(offsets[21]);
  object.rawData = reader.readStringOrNull(offsets[22]);
  object.relativeEffort = reader.readLongOrNull(offsets[23]);
  object.sufferScore = reader.readDoubleOrNull(offsets[26]);
  object.temperature = reader.readDoubleOrNull(offsets[27]);
  object.weatherCondition = reader.readStringOrNull(offsets[28]);
  object.workoutType = reader.readStringOrNull(offsets[29]);
  return object;
}

P _stravaActivityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readDoubleOrNull(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readLongOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readDateTime(offset)) as P;
    case 25:
      return (reader.readLong(offset)) as P;
    case 26:
      return (reader.readDoubleOrNull(offset)) as P;
    case 27:
      return (reader.readDoubleOrNull(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stravaActivityGetId(StravaActivity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stravaActivityGetLinks(StravaActivity object) {
  return [];
}

void _stravaActivityAttach(
    IsarCollection<dynamic> col, Id id, StravaActivity object) {
  object.id = id;
}

extension StravaActivityByIndex on IsarCollection<StravaActivity> {
  Future<StravaActivity?> getByStravaId(int stravaId) {
    return getByIndex(r'stravaId', [stravaId]);
  }

  StravaActivity? getByStravaIdSync(int stravaId) {
    return getByIndexSync(r'stravaId', [stravaId]);
  }

  Future<bool> deleteByStravaId(int stravaId) {
    return deleteByIndex(r'stravaId', [stravaId]);
  }

  bool deleteByStravaIdSync(int stravaId) {
    return deleteByIndexSync(r'stravaId', [stravaId]);
  }

  Future<List<StravaActivity?>> getAllByStravaId(List<int> stravaIdValues) {
    final values = stravaIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'stravaId', values);
  }

  List<StravaActivity?> getAllByStravaIdSync(List<int> stravaIdValues) {
    final values = stravaIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'stravaId', values);
  }

  Future<int> deleteAllByStravaId(List<int> stravaIdValues) {
    final values = stravaIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'stravaId', values);
  }

  int deleteAllByStravaIdSync(List<int> stravaIdValues) {
    final values = stravaIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'stravaId', values);
  }

  Future<Id> putByStravaId(StravaActivity object) {
    return putByIndex(r'stravaId', object);
  }

  Id putByStravaIdSync(StravaActivity object, {bool saveLinks = true}) {
    return putByIndexSync(r'stravaId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByStravaId(List<StravaActivity> objects) {
    return putAllByIndex(r'stravaId', objects);
  }

  List<Id> putAllByStravaIdSync(List<StravaActivity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'stravaId', objects, saveLinks: saveLinks);
  }
}

extension StravaActivityQueryWhereSort
    on QueryBuilder<StravaActivity, StravaActivity, QWhere> {
  QueryBuilder<StravaActivity, StravaActivity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhere> anyStravaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'stravaId'),
      );
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhere> anyStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'startDate'),
      );
    });
  }
}

extension StravaActivityQueryWhere
    on QueryBuilder<StravaActivity, StravaActivity, QWhereClause> {
  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause>
      stravaIdEqualTo(int stravaId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'stravaId',
        value: [stravaId],
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause>
      stravaIdNotEqualTo(int stravaId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stravaId',
              lower: [],
              upper: [stravaId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stravaId',
              lower: [stravaId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stravaId',
              lower: [stravaId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stravaId',
              lower: [],
              upper: [stravaId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause>
      stravaIdGreaterThan(
    int stravaId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stravaId',
        lower: [stravaId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause>
      stravaIdLessThan(
    int stravaId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stravaId',
        lower: [],
        upper: [stravaId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause>
      stravaIdBetween(
    int lowerStravaId,
    int upperStravaId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stravaId',
        lower: [lowerStravaId],
        includeLower: includeLower,
        upper: [upperStravaId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause>
      startDateEqualTo(DateTime startDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'startDate',
        value: [startDate],
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause>
      startDateNotEqualTo(DateTime startDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [],
              upper: [startDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [startDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [startDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startDate',
              lower: [],
              upper: [startDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause>
      startDateGreaterThan(
    DateTime startDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [startDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause>
      startDateLessThan(
    DateTime startDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [],
        upper: [startDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterWhereClause>
      startDateBetween(
    DateTime lowerStartDate,
    DateTime upperStartDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startDate',
        lower: [lowerStartDate],
        includeLower: includeLower,
        upper: [upperStartDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StravaActivityQueryFilter
    on QueryBuilder<StravaActivity, StravaActivity, QFilterCondition> {
  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityIconEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityIconGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activityIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityIconLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activityIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityIconBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activityIcon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityIconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activityIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityIconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activityIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityIconContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activityIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityIconMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activityIcon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityIconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityIconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activityIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activityType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityType',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      activityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activityType',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageHeartRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageHeartRate',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageHeartRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageHeartRate',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageHeartRateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageHeartRateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageHeartRateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageHeartRateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageHeartRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averagePaceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averagePace',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averagePaceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averagePace',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averagePaceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averagePace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averagePaceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averagePace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averagePaceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averagePace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averagePaceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averagePace',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averagePaceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'averagePace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averagePaceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'averagePace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averagePaceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'averagePace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averagePaceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'averagePace',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averagePaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averagePace',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averagePaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'averagePace',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageSpeedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageSpeed',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageSpeedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageSpeed',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageSpeedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageSpeedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageSpeedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageSpeedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageSpeed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageSpeedKmhEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageSpeedKmh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageSpeedKmhGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageSpeedKmh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageSpeedKmhLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageSpeedKmh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      averageSpeedKmhBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageSpeedKmh',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      caloriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'calories',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      caloriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'calories',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      caloriesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      caloriesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      caloriesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      caloriesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      distanceMetersEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distanceMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      distanceMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'distanceMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      distanceMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'distanceMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      distanceMetersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'distanceMeters',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      durationSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      durationSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      durationSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      durationSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      elevationGainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'elevationGain',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      elevationGainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'elevationGain',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      elevationGainEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elevationGain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      elevationGainGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'elevationGain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      elevationGainLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'elevationGain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      elevationGainBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'elevationGain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDistanceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedDistance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDistanceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedDistance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDistanceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedDistance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDistanceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedDistance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDistanceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedDistance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDistanceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedDistance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDistanceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedDistance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDistanceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedDistance',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDistanceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedDistance',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDistanceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedDistance',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDurationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedDuration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDurationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedDuration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDurationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedDuration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDurationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDurationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedDuration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDurationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedDuration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDurationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedDuration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDurationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedDuration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDurationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedDuration',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      formattedDurationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedDuration',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      fromGarminEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromGarmin',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      intensityLevelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intensityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      intensityLevelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intensityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      intensityLevelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intensityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      intensityLevelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intensityLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      intensityLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'intensityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      intensityLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'intensityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      intensityLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'intensityLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      intensityLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'intensityLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      intensityLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intensityLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      intensityLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'intensityLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      isPotentialTriggerEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPotentialTrigger',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      lastSyncIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSync',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      lastSyncIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSync',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      lastSyncEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSync',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      lastSyncGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSync',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      lastSyncLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSync',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      lastSyncBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSync',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      maxHeartRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxHeartRate',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      maxHeartRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxHeartRate',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      maxHeartRateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      maxHeartRateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      maxHeartRateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      maxHeartRateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxHeartRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      maxSpeedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxSpeed',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      maxSpeedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxSpeed',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      maxSpeedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      maxSpeedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      maxSpeedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      maxSpeedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxSpeed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      pacePerKmEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pacePerKm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      pacePerKmGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pacePerKm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      pacePerKmLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pacePerKm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      pacePerKmBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pacePerKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      pacePerKmStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pacePerKm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      pacePerKmEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pacePerKm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      pacePerKmContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pacePerKm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      pacePerKmMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pacePerKm',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      pacePerKmIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pacePerKm',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      pacePerKmIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pacePerKm',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      perceivedExertionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'perceivedExertion',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      perceivedExertionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'perceivedExertion',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      perceivedExertionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'perceivedExertion',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      perceivedExertionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'perceivedExertion',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      perceivedExertionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'perceivedExertion',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      perceivedExertionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'perceivedExertion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      rawDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rawData',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      rawDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rawData',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      rawDataEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      rawDataGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      rawDataLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      rawDataBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rawData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      rawDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      rawDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      rawDataContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      rawDataMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rawData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      rawDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawData',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      rawDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rawData',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      relativeEffortIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'relativeEffort',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      relativeEffortIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'relativeEffort',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      relativeEffortEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relativeEffort',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      relativeEffortGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relativeEffort',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      relativeEffortLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relativeEffort',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      relativeEffortBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relativeEffort',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      startDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      startDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      stravaIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stravaId',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      stravaIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stravaId',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      stravaIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stravaId',
        value: value,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      stravaIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stravaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      sufferScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sufferScore',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      sufferScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sufferScore',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      sufferScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sufferScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      sufferScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sufferScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      sufferScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sufferScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      sufferScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sufferScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      temperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperature',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      temperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperature',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      temperatureEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      temperatureGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      temperatureLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      temperatureBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      weatherConditionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weatherCondition',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      weatherConditionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weatherCondition',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      weatherConditionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      weatherConditionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      weatherConditionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      weatherConditionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weatherCondition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      weatherConditionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      weatherConditionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      weatherConditionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weatherCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      weatherConditionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weatherCondition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      weatherConditionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherCondition',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      weatherConditionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weatherCondition',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      workoutTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workoutType',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      workoutTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workoutType',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      workoutTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workoutType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      workoutTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workoutType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      workoutTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workoutType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      workoutTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workoutType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      workoutTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'workoutType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      workoutTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'workoutType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      workoutTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workoutType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      workoutTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workoutType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      workoutTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workoutType',
        value: '',
      ));
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterFilterCondition>
      workoutTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workoutType',
        value: '',
      ));
    });
  }
}

extension StravaActivityQueryObject
    on QueryBuilder<StravaActivity, StravaActivity, QFilterCondition> {}

extension StravaActivityQueryLinks
    on QueryBuilder<StravaActivity, StravaActivity, QFilterCondition> {}

extension StravaActivityQuerySortBy
    on QueryBuilder<StravaActivity, StravaActivity, QSortBy> {
  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByActivityIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityIcon', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByActivityIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityIcon', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByActivityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityType', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByActivityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityType', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByAverageHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageHeartRate', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByAverageHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageHeartRate', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByAveragePace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averagePace', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByAveragePaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averagePace', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByAverageSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageSpeed', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByAverageSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageSpeed', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByAverageSpeedKmh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageSpeedKmh', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByAverageSpeedKmhDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageSpeedKmh', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> sortByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceMeters', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByDistanceMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceMeters', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByElevationGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elevationGain', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByElevationGainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elevationGain', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByFormattedDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDistance', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByFormattedDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDistance', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByFormattedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDuration', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByFormattedDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDuration', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByFromGarmin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromGarmin', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByFromGarminDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromGarmin', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByIntensityLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityLevel', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByIntensityLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityLevel', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByIsPotentialTrigger() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPotentialTrigger', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByIsPotentialTriggerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPotentialTrigger', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> sortByLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByLastSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByMaxHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHeartRate', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByMaxHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHeartRate', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> sortByMaxSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSpeed', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByMaxSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSpeed', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> sortByPacePerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pacePerKm', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByPacePerKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pacePerKm', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByPerceivedExertion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perceivedExertion', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByPerceivedExertionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perceivedExertion', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> sortByRawData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawData', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByRawDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawData', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByRelativeEffort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relativeEffort', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByRelativeEffortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relativeEffort', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> sortByStravaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stravaId', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByStravaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stravaId', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortBySufferScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sufferScore', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortBySufferScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sufferScore', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByWeatherCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCondition', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByWeatherConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCondition', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByWorkoutType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workoutType', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      sortByWorkoutTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workoutType', Sort.desc);
    });
  }
}

extension StravaActivityQuerySortThenBy
    on QueryBuilder<StravaActivity, StravaActivity, QSortThenBy> {
  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByActivityIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityIcon', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByActivityIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityIcon', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByActivityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityType', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByActivityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityType', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByAverageHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageHeartRate', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByAverageHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageHeartRate', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByAveragePace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averagePace', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByAveragePaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averagePace', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByAverageSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageSpeed', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByAverageSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageSpeed', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByAverageSpeedKmh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageSpeedKmh', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByAverageSpeedKmhDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageSpeedKmh', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> thenByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceMeters', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByDistanceMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceMeters', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSeconds', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByElevationGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elevationGain', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByElevationGainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elevationGain', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByFormattedDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDistance', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByFormattedDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDistance', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByFormattedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDuration', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByFormattedDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDuration', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByFromGarmin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromGarmin', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByFromGarminDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromGarmin', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByIntensityLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityLevel', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByIntensityLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityLevel', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByIsPotentialTrigger() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPotentialTrigger', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByIsPotentialTriggerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPotentialTrigger', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> thenByLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByLastSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByMaxHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHeartRate', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByMaxHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHeartRate', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> thenByMaxSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSpeed', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByMaxSpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxSpeed', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> thenByPacePerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pacePerKm', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByPacePerKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pacePerKm', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByPerceivedExertion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perceivedExertion', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByPerceivedExertionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perceivedExertion', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> thenByRawData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawData', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByRawDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawData', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByRelativeEffort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relativeEffort', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByRelativeEffortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relativeEffort', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy> thenByStravaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stravaId', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByStravaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stravaId', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenBySufferScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sufferScore', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenBySufferScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sufferScore', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByWeatherCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCondition', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByWeatherConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherCondition', Sort.desc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByWorkoutType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workoutType', Sort.asc);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QAfterSortBy>
      thenByWorkoutTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workoutType', Sort.desc);
    });
  }
}

extension StravaActivityQueryWhereDistinct
    on QueryBuilder<StravaActivity, StravaActivity, QDistinct> {
  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByActivityIcon({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activityIcon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByActivityType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activityType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByAverageHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageHeartRate');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct> distinctByAveragePace(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averagePace', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByAverageSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageSpeed');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByAverageSpeedKmh() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageSpeedKmh');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct> distinctByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calories');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distanceMeters');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationSeconds');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByElevationGain() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'elevationGain');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByFormattedDistance({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedDistance',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByFormattedDuration({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedDuration',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByFromGarmin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromGarmin');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByIntensityLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intensityLevel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByIsPotentialTrigger() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPotentialTrigger');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct> distinctByLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSync');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByMaxHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxHeartRate');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct> distinctByMaxSpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxSpeed');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct> distinctByPacePerKm(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pacePerKm', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByPerceivedExertion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'perceivedExertion');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct> distinctByRawData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rawData', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByRelativeEffort() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relativeEffort');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct> distinctByStravaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stravaId');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctBySufferScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sufferScore');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature');
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct>
      distinctByWeatherCondition({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherCondition',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StravaActivity, StravaActivity, QDistinct> distinctByWorkoutType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workoutType', caseSensitive: caseSensitive);
    });
  }
}

extension StravaActivityQueryProperty
    on QueryBuilder<StravaActivity, StravaActivity, QQueryProperty> {
  QueryBuilder<StravaActivity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StravaActivity, String, QQueryOperations>
      activityIconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityIcon');
    });
  }

  QueryBuilder<StravaActivity, String, QQueryOperations>
      activityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityType');
    });
  }

  QueryBuilder<StravaActivity, int?, QQueryOperations>
      averageHeartRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageHeartRate');
    });
  }

  QueryBuilder<StravaActivity, String?, QQueryOperations>
      averagePaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averagePace');
    });
  }

  QueryBuilder<StravaActivity, double?, QQueryOperations>
      averageSpeedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageSpeed');
    });
  }

  QueryBuilder<StravaActivity, double, QQueryOperations>
      averageSpeedKmhProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageSpeedKmh');
    });
  }

  QueryBuilder<StravaActivity, int?, QQueryOperations> caloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calories');
    });
  }

  QueryBuilder<StravaActivity, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<StravaActivity, double, QQueryOperations>
      distanceMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distanceMeters');
    });
  }

  QueryBuilder<StravaActivity, int, QQueryOperations>
      durationSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationSeconds');
    });
  }

  QueryBuilder<StravaActivity, double?, QQueryOperations>
      elevationGainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'elevationGain');
    });
  }

  QueryBuilder<StravaActivity, String, QQueryOperations>
      formattedDistanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedDistance');
    });
  }

  QueryBuilder<StravaActivity, String, QQueryOperations>
      formattedDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedDuration');
    });
  }

  QueryBuilder<StravaActivity, bool, QQueryOperations> fromGarminProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromGarmin');
    });
  }

  QueryBuilder<StravaActivity, String, QQueryOperations>
      intensityLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intensityLevel');
    });
  }

  QueryBuilder<StravaActivity, bool, QQueryOperations>
      isPotentialTriggerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPotentialTrigger');
    });
  }

  QueryBuilder<StravaActivity, DateTime?, QQueryOperations> lastSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSync');
    });
  }

  QueryBuilder<StravaActivity, int?, QQueryOperations> maxHeartRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxHeartRate');
    });
  }

  QueryBuilder<StravaActivity, double?, QQueryOperations> maxSpeedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxSpeed');
    });
  }

  QueryBuilder<StravaActivity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<StravaActivity, String, QQueryOperations> pacePerKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pacePerKm');
    });
  }

  QueryBuilder<StravaActivity, int?, QQueryOperations>
      perceivedExertionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'perceivedExertion');
    });
  }

  QueryBuilder<StravaActivity, String?, QQueryOperations> rawDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rawData');
    });
  }

  QueryBuilder<StravaActivity, int?, QQueryOperations>
      relativeEffortProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relativeEffort');
    });
  }

  QueryBuilder<StravaActivity, DateTime, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<StravaActivity, int, QQueryOperations> stravaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stravaId');
    });
  }

  QueryBuilder<StravaActivity, double?, QQueryOperations>
      sufferScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sufferScore');
    });
  }

  QueryBuilder<StravaActivity, double?, QQueryOperations>
      temperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature');
    });
  }

  QueryBuilder<StravaActivity, String?, QQueryOperations>
      weatherConditionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherCondition');
    });
  }

  QueryBuilder<StravaActivity, String?, QQueryOperations>
      workoutTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workoutType');
    });
  }
}
