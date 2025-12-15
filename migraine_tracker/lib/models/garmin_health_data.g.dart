// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garmin_health_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGarminHealthDataCollection on Isar {
  IsarCollection<GarminHealthData> get garminHealthDatas => this.collection();
}

const GarminHealthDataSchema = CollectionSchema(
  name: r'GarminHealthData',
  id: 584654279200346821,
  properties: {
    r'activeCalories': PropertySchema(
      id: 0,
      name: r'activeCalories',
      type: IsarType.long,
    ),
    r'averageHeartRate': PropertySchema(
      id: 1,
      name: r'averageHeartRate',
      type: IsarType.long,
    ),
    r'averageStress': PropertySchema(
      id: 2,
      name: r'averageStress',
      type: IsarType.long,
    ),
    r'awakenings': PropertySchema(
      id: 3,
      name: r'awakenings',
      type: IsarType.long,
    ),
    r'bodyBatteryAverage': PropertySchema(
      id: 4,
      name: r'bodyBatteryAverage',
      type: IsarType.long,
    ),
    r'bodyBatteryMax': PropertySchema(
      id: 5,
      name: r'bodyBatteryMax',
      type: IsarType.long,
    ),
    r'bodyBatteryMin': PropertySchema(
      id: 6,
      name: r'bodyBatteryMin',
      type: IsarType.long,
    ),
    r'date': PropertySchema(
      id: 7,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'deepSleepMinutes': PropertySchema(
      id: 8,
      name: r'deepSleepMinutes',
      type: IsarType.long,
    ),
    r'distanceMeters': PropertySchema(
      id: 9,
      name: r'distanceMeters',
      type: IsarType.double,
    ),
    r'formattedDistance': PropertySchema(
      id: 10,
      name: r'formattedDistance',
      type: IsarType.string,
    ),
    r'formattedSleepDuration': PropertySchema(
      id: 11,
      name: r'formattedSleepDuration',
      type: IsarType.string,
    ),
    r'isHighRiskDay': PropertySchema(
      id: 12,
      name: r'isHighRiskDay',
      type: IsarType.bool,
    ),
    r'lastSync': PropertySchema(
      id: 13,
      name: r'lastSync',
      type: IsarType.dateTime,
    ),
    r'lightSleepMinutes': PropertySchema(
      id: 14,
      name: r'lightSleepMinutes',
      type: IsarType.long,
    ),
    r'maxHeartRate': PropertySchema(
      id: 15,
      name: r'maxHeartRate',
      type: IsarType.long,
    ),
    r'maxStress': PropertySchema(
      id: 16,
      name: r'maxStress',
      type: IsarType.long,
    ),
    r'minHeartRate': PropertySchema(
      id: 17,
      name: r'minHeartRate',
      type: IsarType.long,
    ),
    r'moderateActivityMinutes': PropertySchema(
      id: 18,
      name: r'moderateActivityMinutes',
      type: IsarType.long,
    ),
    r'overallDayQuality': PropertySchema(
      id: 19,
      name: r'overallDayQuality',
      type: IsarType.long,
    ),
    r'rawData': PropertySchema(
      id: 20,
      name: r'rawData',
      type: IsarType.string,
    ),
    r'remSleepMinutes': PropertySchema(
      id: 21,
      name: r'remSleepMinutes',
      type: IsarType.long,
    ),
    r'restMinutes': PropertySchema(
      id: 22,
      name: r'restMinutes',
      type: IsarType.long,
    ),
    r'restingHeartRate': PropertySchema(
      id: 23,
      name: r'restingHeartRate',
      type: IsarType.long,
    ),
    r'sleepDurationMinutes': PropertySchema(
      id: 24,
      name: r'sleepDurationMinutes',
      type: IsarType.long,
    ),
    r'sleepScore': PropertySchema(
      id: 25,
      name: r'sleepScore',
      type: IsarType.long,
    ),
    r'source': PropertySchema(
      id: 26,
      name: r'source',
      type: IsarType.string,
    ),
    r'steps': PropertySchema(
      id: 27,
      name: r'steps',
      type: IsarType.long,
    ),
    r'vigorousActivityMinutes': PropertySchema(
      id: 28,
      name: r'vigorousActivityMinutes',
      type: IsarType.long,
    )
  },
  estimateSize: _garminHealthDataEstimateSize,
  serialize: _garminHealthDataSerialize,
  deserialize: _garminHealthDataDeserialize,
  deserializeProp: _garminHealthDataDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _garminHealthDataGetId,
  getLinks: _garminHealthDataGetLinks,
  attach: _garminHealthDataAttach,
  version: '3.1.0+1',
);

int _garminHealthDataEstimateSize(
  GarminHealthData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.formattedDistance.length * 3;
  bytesCount += 3 + object.formattedSleepDuration.length * 3;
  {
    final value = object.rawData;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.source.length * 3;
  return bytesCount;
}

void _garminHealthDataSerialize(
  GarminHealthData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.activeCalories);
  writer.writeLong(offsets[1], object.averageHeartRate);
  writer.writeLong(offsets[2], object.averageStress);
  writer.writeLong(offsets[3], object.awakenings);
  writer.writeLong(offsets[4], object.bodyBatteryAverage);
  writer.writeLong(offsets[5], object.bodyBatteryMax);
  writer.writeLong(offsets[6], object.bodyBatteryMin);
  writer.writeDateTime(offsets[7], object.date);
  writer.writeLong(offsets[8], object.deepSleepMinutes);
  writer.writeDouble(offsets[9], object.distanceMeters);
  writer.writeString(offsets[10], object.formattedDistance);
  writer.writeString(offsets[11], object.formattedSleepDuration);
  writer.writeBool(offsets[12], object.isHighRiskDay);
  writer.writeDateTime(offsets[13], object.lastSync);
  writer.writeLong(offsets[14], object.lightSleepMinutes);
  writer.writeLong(offsets[15], object.maxHeartRate);
  writer.writeLong(offsets[16], object.maxStress);
  writer.writeLong(offsets[17], object.minHeartRate);
  writer.writeLong(offsets[18], object.moderateActivityMinutes);
  writer.writeLong(offsets[19], object.overallDayQuality);
  writer.writeString(offsets[20], object.rawData);
  writer.writeLong(offsets[21], object.remSleepMinutes);
  writer.writeLong(offsets[22], object.restMinutes);
  writer.writeLong(offsets[23], object.restingHeartRate);
  writer.writeLong(offsets[24], object.sleepDurationMinutes);
  writer.writeLong(offsets[25], object.sleepScore);
  writer.writeString(offsets[26], object.source);
  writer.writeLong(offsets[27], object.steps);
  writer.writeLong(offsets[28], object.vigorousActivityMinutes);
}

GarminHealthData _garminHealthDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GarminHealthData(
    averageStress: reader.readLongOrNull(offsets[2]),
    restingHeartRate: reader.readLongOrNull(offsets[23]),
    sleepDurationMinutes: reader.readLongOrNull(offsets[24]),
    sleepScore: reader.readLongOrNull(offsets[25]),
    steps: reader.readLongOrNull(offsets[27]),
  );
  object.activeCalories = reader.readLongOrNull(offsets[0]);
  object.averageHeartRate = reader.readLongOrNull(offsets[1]);
  object.awakenings = reader.readLongOrNull(offsets[3]);
  object.bodyBatteryAverage = reader.readLongOrNull(offsets[4]);
  object.bodyBatteryMax = reader.readLongOrNull(offsets[5]);
  object.bodyBatteryMin = reader.readLongOrNull(offsets[6]);
  object.date = reader.readDateTime(offsets[7]);
  object.deepSleepMinutes = reader.readLongOrNull(offsets[8]);
  object.distanceMeters = reader.readDoubleOrNull(offsets[9]);
  object.id = id;
  object.lastSync = reader.readDateTimeOrNull(offsets[13]);
  object.lightSleepMinutes = reader.readLongOrNull(offsets[14]);
  object.maxHeartRate = reader.readLongOrNull(offsets[15]);
  object.maxStress = reader.readLongOrNull(offsets[16]);
  object.minHeartRate = reader.readLongOrNull(offsets[17]);
  object.moderateActivityMinutes = reader.readLongOrNull(offsets[18]);
  object.rawData = reader.readStringOrNull(offsets[20]);
  object.remSleepMinutes = reader.readLongOrNull(offsets[21]);
  object.restMinutes = reader.readLongOrNull(offsets[22]);
  object.source = reader.readString(offsets[26]);
  object.vigorousActivityMinutes = reader.readLongOrNull(offsets[28]);
  return object;
}

P _garminHealthDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readLongOrNull(offset)) as P;
    case 22:
      return (reader.readLongOrNull(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readLongOrNull(offset)) as P;
    case 25:
      return (reader.readLongOrNull(offset)) as P;
    case 26:
      return (reader.readString(offset)) as P;
    case 27:
      return (reader.readLongOrNull(offset)) as P;
    case 28:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _garminHealthDataGetId(GarminHealthData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _garminHealthDataGetLinks(GarminHealthData object) {
  return [];
}

void _garminHealthDataAttach(
    IsarCollection<dynamic> col, Id id, GarminHealthData object) {
  object.id = id;
}

extension GarminHealthDataByIndex on IsarCollection<GarminHealthData> {
  Future<GarminHealthData?> getByDate(DateTime date) {
    return getByIndex(r'date', [date]);
  }

  GarminHealthData? getByDateSync(DateTime date) {
    return getByIndexSync(r'date', [date]);
  }

  Future<bool> deleteByDate(DateTime date) {
    return deleteByIndex(r'date', [date]);
  }

  bool deleteByDateSync(DateTime date) {
    return deleteByIndexSync(r'date', [date]);
  }

  Future<List<GarminHealthData?>> getAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex(r'date', values);
  }

  List<GarminHealthData?> getAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'date', values);
  }

  Future<int> deleteAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'date', values);
  }

  int deleteAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'date', values);
  }

  Future<Id> putByDate(GarminHealthData object) {
    return putByIndex(r'date', object);
  }

  Id putByDateSync(GarminHealthData object, {bool saveLinks = true}) {
    return putByIndexSync(r'date', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDate(List<GarminHealthData> objects) {
    return putAllByIndex(r'date', objects);
  }

  List<Id> putAllByDateSync(List<GarminHealthData> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'date', objects, saveLinks: saveLinks);
  }
}

extension GarminHealthDataQueryWhereSort
    on QueryBuilder<GarminHealthData, GarminHealthData, QWhere> {
  QueryBuilder<GarminHealthData, GarminHealthData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension GarminHealthDataQueryWhere
    on QueryBuilder<GarminHealthData, GarminHealthData, QWhereClause> {
  QueryBuilder<GarminHealthData, GarminHealthData, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterWhereClause> idBetween(
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterWhereClause>
      dateEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterWhereClause>
      dateNotEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterWhereClause>
      dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterWhereClause>
      dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterWhereClause>
      dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GarminHealthDataQueryFilter
    on QueryBuilder<GarminHealthData, GarminHealthData, QFilterCondition> {
  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      activeCaloriesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activeCalories',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      activeCaloriesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activeCalories',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      activeCaloriesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      activeCaloriesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      activeCaloriesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      activeCaloriesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      averageHeartRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageHeartRate',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      averageHeartRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageHeartRate',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      averageHeartRateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      averageStressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageStress',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      averageStressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageStress',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      averageStressEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageStress',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      averageStressGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageStress',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      averageStressLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageStress',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      averageStressBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageStress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      awakeningsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'awakenings',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      awakeningsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'awakenings',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      awakeningsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'awakenings',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      awakeningsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'awakenings',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      awakeningsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'awakenings',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      awakeningsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'awakenings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryAverageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bodyBatteryAverage',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryAverageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bodyBatteryAverage',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryAverageEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bodyBatteryAverage',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryAverageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bodyBatteryAverage',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryAverageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bodyBatteryAverage',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryAverageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bodyBatteryAverage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryMaxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bodyBatteryMax',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryMaxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bodyBatteryMax',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryMaxEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bodyBatteryMax',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryMaxGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bodyBatteryMax',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryMaxLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bodyBatteryMax',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryMaxBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bodyBatteryMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryMinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bodyBatteryMin',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryMinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bodyBatteryMin',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryMinEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bodyBatteryMin',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryMinGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bodyBatteryMin',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryMinLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bodyBatteryMin',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      bodyBatteryMinBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bodyBatteryMin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      deepSleepMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deepSleepMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      deepSleepMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deepSleepMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      deepSleepMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deepSleepMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      deepSleepMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deepSleepMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      deepSleepMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deepSleepMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      deepSleepMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deepSleepMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      distanceMetersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'distanceMeters',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      distanceMetersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'distanceMeters',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      distanceMetersEqualTo(
    double? value, {
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      distanceMetersGreaterThan(
    double? value, {
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      distanceMetersLessThan(
    double? value, {
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      distanceMetersBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedDistanceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedDistance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedDistanceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedDistance',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedDistanceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedDistance',
        value: '',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedDistanceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedDistance',
        value: '',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedSleepDurationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedSleepDuration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedSleepDurationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedSleepDuration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedSleepDurationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedSleepDuration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedSleepDurationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedSleepDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedSleepDurationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedSleepDuration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedSleepDurationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedSleepDuration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedSleepDurationContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedSleepDuration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedSleepDurationMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedSleepDuration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedSleepDurationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedSleepDuration',
        value: '',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      formattedSleepDurationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedSleepDuration',
        value: '',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      isHighRiskDayEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isHighRiskDay',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      lastSyncIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSync',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      lastSyncIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSync',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      lastSyncEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSync',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      lightSleepMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lightSleepMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      lightSleepMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lightSleepMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      lightSleepMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lightSleepMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      lightSleepMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lightSleepMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      lightSleepMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lightSleepMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      lightSleepMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lightSleepMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      maxHeartRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxHeartRate',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      maxHeartRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxHeartRate',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      maxHeartRateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      maxStressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxStress',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      maxStressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxStress',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      maxStressEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxStress',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      maxStressGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxStress',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      maxStressLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxStress',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      maxStressBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxStress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      minHeartRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minHeartRate',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      minHeartRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minHeartRate',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      minHeartRateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      minHeartRateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      minHeartRateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      minHeartRateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minHeartRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      moderateActivityMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moderateActivityMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      moderateActivityMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moderateActivityMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      moderateActivityMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moderateActivityMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      moderateActivityMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'moderateActivityMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      moderateActivityMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'moderateActivityMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      moderateActivityMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'moderateActivityMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      overallDayQualityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overallDayQuality',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      overallDayQualityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overallDayQuality',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      overallDayQualityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overallDayQuality',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      overallDayQualityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overallDayQuality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      rawDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rawData',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      rawDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rawData',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
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

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      rawDataContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      rawDataMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rawData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      rawDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawData',
        value: '',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      rawDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rawData',
        value: '',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      remSleepMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remSleepMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      remSleepMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remSleepMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      remSleepMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remSleepMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      remSleepMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remSleepMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      remSleepMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remSleepMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      remSleepMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remSleepMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      restMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'restMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      restMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'restMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      restMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      restMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'restMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      restMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'restMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      restMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'restMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      restingHeartRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'restingHeartRate',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      restingHeartRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'restingHeartRate',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      restingHeartRateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restingHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      restingHeartRateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'restingHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      restingHeartRateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'restingHeartRate',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      restingHeartRateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'restingHeartRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sleepDurationMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sleepDurationMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sleepDurationMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sleepDurationMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sleepDurationMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepDurationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sleepDurationMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepDurationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sleepDurationMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepDurationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sleepDurationMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepDurationMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sleepScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sleepScore',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sleepScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sleepScore',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sleepScoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepScore',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sleepScoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepScore',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sleepScoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepScore',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sleepScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sourceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      stepsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'steps',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      stepsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'steps',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      stepsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'steps',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      stepsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'steps',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      stepsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'steps',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      stepsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'steps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      vigorousActivityMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vigorousActivityMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      vigorousActivityMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vigorousActivityMinutes',
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      vigorousActivityMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vigorousActivityMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      vigorousActivityMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vigorousActivityMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      vigorousActivityMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vigorousActivityMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterFilterCondition>
      vigorousActivityMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vigorousActivityMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GarminHealthDataQueryObject
    on QueryBuilder<GarminHealthData, GarminHealthData, QFilterCondition> {}

extension GarminHealthDataQueryLinks
    on QueryBuilder<GarminHealthData, GarminHealthData, QFilterCondition> {}

extension GarminHealthDataQuerySortBy
    on QueryBuilder<GarminHealthData, GarminHealthData, QSortBy> {
  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByActiveCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeCalories', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByActiveCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeCalories', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByAverageHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageHeartRate', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByAverageHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageHeartRate', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByAverageStress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageStress', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByAverageStressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageStress', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByAwakenings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awakenings', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByAwakeningsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awakenings', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByBodyBatteryAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyBatteryAverage', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByBodyBatteryAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyBatteryAverage', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByBodyBatteryMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyBatteryMax', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByBodyBatteryMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyBatteryMax', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByBodyBatteryMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyBatteryMin', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByBodyBatteryMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyBatteryMin', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByDeepSleepMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deepSleepMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByDeepSleepMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deepSleepMinutes', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceMeters', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByDistanceMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceMeters', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByFormattedDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDistance', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByFormattedDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDistance', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByFormattedSleepDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedSleepDuration', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByFormattedSleepDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedSleepDuration', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByIsHighRiskDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHighRiskDay', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByIsHighRiskDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHighRiskDay', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByLastSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByLightSleepMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lightSleepMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByLightSleepMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lightSleepMinutes', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByMaxHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHeartRate', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByMaxHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHeartRate', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByMaxStress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStress', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByMaxStressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStress', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByMinHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minHeartRate', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByMinHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minHeartRate', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByModerateActivityMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moderateActivityMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByModerateActivityMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moderateActivityMinutes', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByOverallDayQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallDayQuality', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByOverallDayQualityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallDayQuality', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByRawData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawData', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByRawDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawData', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByRemSleepMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remSleepMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByRemSleepMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remSleepMinutes', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByRestMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByRestMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restMinutes', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByRestingHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restingHeartRate', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByRestingHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restingHeartRate', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortBySleepDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortBySleepDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortBySleepScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepScore', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortBySleepScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepScore', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy> sortBySteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'steps', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByStepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'steps', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByVigorousActivityMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vigorousActivityMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      sortByVigorousActivityMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vigorousActivityMinutes', Sort.desc);
    });
  }
}

extension GarminHealthDataQuerySortThenBy
    on QueryBuilder<GarminHealthData, GarminHealthData, QSortThenBy> {
  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByActiveCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeCalories', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByActiveCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeCalories', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByAverageHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageHeartRate', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByAverageHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageHeartRate', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByAverageStress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageStress', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByAverageStressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageStress', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByAwakenings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awakenings', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByAwakeningsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awakenings', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByBodyBatteryAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyBatteryAverage', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByBodyBatteryAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyBatteryAverage', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByBodyBatteryMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyBatteryMax', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByBodyBatteryMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyBatteryMax', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByBodyBatteryMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyBatteryMin', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByBodyBatteryMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bodyBatteryMin', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByDeepSleepMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deepSleepMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByDeepSleepMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deepSleepMinutes', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceMeters', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByDistanceMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceMeters', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByFormattedDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDistance', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByFormattedDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedDistance', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByFormattedSleepDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedSleepDuration', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByFormattedSleepDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedSleepDuration', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByIsHighRiskDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHighRiskDay', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByIsHighRiskDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHighRiskDay', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByLastSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByLightSleepMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lightSleepMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByLightSleepMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lightSleepMinutes', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByMaxHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHeartRate', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByMaxHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHeartRate', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByMaxStress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStress', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByMaxStressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStress', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByMinHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minHeartRate', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByMinHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minHeartRate', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByModerateActivityMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moderateActivityMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByModerateActivityMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moderateActivityMinutes', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByOverallDayQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallDayQuality', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByOverallDayQualityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallDayQuality', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByRawData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawData', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByRawDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawData', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByRemSleepMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remSleepMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByRemSleepMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remSleepMinutes', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByRestMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByRestMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restMinutes', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByRestingHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restingHeartRate', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByRestingHeartRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restingHeartRate', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenBySleepDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenBySleepDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenBySleepScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepScore', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenBySleepScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepScore', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy> thenBySteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'steps', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByStepsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'steps', Sort.desc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByVigorousActivityMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vigorousActivityMinutes', Sort.asc);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QAfterSortBy>
      thenByVigorousActivityMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vigorousActivityMinutes', Sort.desc);
    });
  }
}

extension GarminHealthDataQueryWhereDistinct
    on QueryBuilder<GarminHealthData, GarminHealthData, QDistinct> {
  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByActiveCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeCalories');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByAverageHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageHeartRate');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByAverageStress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageStress');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByAwakenings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'awakenings');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByBodyBatteryAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bodyBatteryAverage');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByBodyBatteryMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bodyBatteryMax');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByBodyBatteryMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bodyBatteryMin');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByDeepSleepMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deepSleepMinutes');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByDistanceMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distanceMeters');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByFormattedDistance({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedDistance',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByFormattedSleepDuration({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedSleepDuration',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByIsHighRiskDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isHighRiskDay');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSync');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByLightSleepMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lightSleepMinutes');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByMaxHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxHeartRate');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByMaxStress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxStress');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByMinHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minHeartRate');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByModerateActivityMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moderateActivityMinutes');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByOverallDayQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overallDayQuality');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct> distinctByRawData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rawData', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByRemSleepMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remSleepMinutes');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByRestMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restMinutes');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByRestingHeartRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restingHeartRate');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctBySleepDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepDurationMinutes');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctBySleepScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepScore');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct> distinctBySource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctBySteps() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'steps');
    });
  }

  QueryBuilder<GarminHealthData, GarminHealthData, QDistinct>
      distinctByVigorousActivityMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vigorousActivityMinutes');
    });
  }
}

extension GarminHealthDataQueryProperty
    on QueryBuilder<GarminHealthData, GarminHealthData, QQueryProperty> {
  QueryBuilder<GarminHealthData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      activeCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeCalories');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      averageHeartRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageHeartRate');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      averageStressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageStress');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations> awakeningsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'awakenings');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      bodyBatteryAverageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bodyBatteryAverage');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      bodyBatteryMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bodyBatteryMax');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      bodyBatteryMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bodyBatteryMin');
    });
  }

  QueryBuilder<GarminHealthData, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      deepSleepMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deepSleepMinutes');
    });
  }

  QueryBuilder<GarminHealthData, double?, QQueryOperations>
      distanceMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distanceMeters');
    });
  }

  QueryBuilder<GarminHealthData, String, QQueryOperations>
      formattedDistanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedDistance');
    });
  }

  QueryBuilder<GarminHealthData, String, QQueryOperations>
      formattedSleepDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedSleepDuration');
    });
  }

  QueryBuilder<GarminHealthData, bool, QQueryOperations>
      isHighRiskDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isHighRiskDay');
    });
  }

  QueryBuilder<GarminHealthData, DateTime?, QQueryOperations>
      lastSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSync');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      lightSleepMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lightSleepMinutes');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      maxHeartRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxHeartRate');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations> maxStressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxStress');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      minHeartRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minHeartRate');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      moderateActivityMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moderateActivityMinutes');
    });
  }

  QueryBuilder<GarminHealthData, int, QQueryOperations>
      overallDayQualityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overallDayQuality');
    });
  }

  QueryBuilder<GarminHealthData, String?, QQueryOperations> rawDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rawData');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      remSleepMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remSleepMinutes');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations> restMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restMinutes');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      restingHeartRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restingHeartRate');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      sleepDurationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepDurationMinutes');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations> sleepScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepScore');
    });
  }

  QueryBuilder<GarminHealthData, String, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations> stepsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'steps');
    });
  }

  QueryBuilder<GarminHealthData, int?, QQueryOperations>
      vigorousActivityMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vigorousActivityMinutes');
    });
  }
}
