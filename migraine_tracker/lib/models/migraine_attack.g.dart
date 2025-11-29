// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migraine_attack.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMigraineAttackCollection on Isar {
  IsarCollection<MigraineAttack> get migraineAttacks => this.collection();
}

const MigraineAttackSchema = CollectionSchema(
  name: r'MigraineAttack',
  id: -7464277013737216228,
  properties: {
    r'durationMinutes': PropertySchema(
      id: 0,
      name: r'durationMinutes',
      type: IsarType.long,
    ),
    r'endTime': PropertySchema(
      id: 1,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'intensity': PropertySchema(
      id: 2,
      name: r'intensity',
      type: IsarType.long,
    ),
    r'intensityAfter2h': PropertySchema(
      id: 3,
      name: r'intensityAfter2h',
      type: IsarType.long,
    ),
    r'intensityAfter4h': PropertySchema(
      id: 4,
      name: r'intensityAfter4h',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 5,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isUnilateral': PropertySchema(
      id: 6,
      name: r'isUnilateral',
      type: IsarType.bool,
    ),
    r'location': PropertySchema(
      id: 7,
      name: r'location',
      type: IsarType.string,
    ),
    r'medicationDosages': PropertySchema(
      id: 8,
      name: r'medicationDosages',
      type: IsarType.longList,
    ),
    r'medicationRoutes': PropertySchema(
      id: 9,
      name: r'medicationRoutes',
      type: IsarType.stringList,
    ),
    r'medicationTimes': PropertySchema(
      id: 10,
      name: r'medicationTimes',
      type: IsarType.dateTimeList,
    ),
    r'medications': PropertySchema(
      id: 11,
      name: r'medications',
      type: IsarType.stringList,
    ),
    r'minutesBeforeRescue': PropertySchema(
      id: 12,
      name: r'minutesBeforeRescue',
      type: IsarType.long,
    ),
    r'needRescueMedication': PropertySchema(
      id: 13,
      name: r'needRescueMedication',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 14,
      name: r'notes',
      type: IsarType.string,
    ),
    r'overallEffectiveness': PropertySchema(
      id: 15,
      name: r'overallEffectiveness',
      type: IsarType.long,
    ),
    r'painType': PropertySchema(
      id: 16,
      name: r'painType',
      type: IsarType.string,
    ),
    r'rescueMedicationDosage': PropertySchema(
      id: 17,
      name: r'rescueMedicationDosage',
      type: IsarType.long,
    ),
    r'rescueMedicationName': PropertySchema(
      id: 18,
      name: r'rescueMedicationName',
      type: IsarType.string,
    ),
    r'rescueMedicationTime': PropertySchema(
      id: 19,
      name: r'rescueMedicationTime',
      type: IsarType.dateTime,
    ),
    r'sideEffects': PropertySchema(
      id: 20,
      name: r'sideEffects',
      type: IsarType.stringList,
    ),
    r'startTime': PropertySchema(
      id: 21,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'symptoms': PropertySchema(
      id: 22,
      name: r'symptoms',
      type: IsarType.stringList,
    )
  },
  estimateSize: _migraineAttackEstimateSize,
  serialize: _migraineAttackSerialize,
  deserialize: _migraineAttackDeserialize,
  deserializeProp: _migraineAttackDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _migraineAttackGetId,
  getLinks: _migraineAttackGetLinks,
  attach: _migraineAttackAttach,
  version: '3.1.0+1',
);

int _migraineAttackEstimateSize(
  MigraineAttack object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.location.length * 3;
  bytesCount += 3 + object.medicationDosages.length * 8;
  bytesCount += 3 + object.medicationRoutes.length * 3;
  {
    for (var i = 0; i < object.medicationRoutes.length; i++) {
      final value = object.medicationRoutes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.medicationTimes.length * 8;
  bytesCount += 3 + object.medications.length * 3;
  {
    for (var i = 0; i < object.medications.length; i++) {
      final value = object.medications[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.painType.length * 3;
  {
    final value = object.rescueMedicationName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sideEffects.length * 3;
  {
    for (var i = 0; i < object.sideEffects.length; i++) {
      final value = object.sideEffects[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.symptoms.length * 3;
  {
    for (var i = 0; i < object.symptoms.length; i++) {
      final value = object.symptoms[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _migraineAttackSerialize(
  MigraineAttack object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.durationMinutes);
  writer.writeDateTime(offsets[1], object.endTime);
  writer.writeLong(offsets[2], object.intensity);
  writer.writeLong(offsets[3], object.intensityAfter2h);
  writer.writeLong(offsets[4], object.intensityAfter4h);
  writer.writeBool(offsets[5], object.isActive);
  writer.writeBool(offsets[6], object.isUnilateral);
  writer.writeString(offsets[7], object.location);
  writer.writeLongList(offsets[8], object.medicationDosages);
  writer.writeStringList(offsets[9], object.medicationRoutes);
  writer.writeDateTimeList(offsets[10], object.medicationTimes);
  writer.writeStringList(offsets[11], object.medications);
  writer.writeLong(offsets[12], object.minutesBeforeRescue);
  writer.writeBool(offsets[13], object.needRescueMedication);
  writer.writeString(offsets[14], object.notes);
  writer.writeLong(offsets[15], object.overallEffectiveness);
  writer.writeString(offsets[16], object.painType);
  writer.writeLong(offsets[17], object.rescueMedicationDosage);
  writer.writeString(offsets[18], object.rescueMedicationName);
  writer.writeDateTime(offsets[19], object.rescueMedicationTime);
  writer.writeStringList(offsets[20], object.sideEffects);
  writer.writeDateTime(offsets[21], object.startTime);
  writer.writeStringList(offsets[22], object.symptoms);
}

MigraineAttack _migraineAttackDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MigraineAttack();
  object.endTime = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.intensity = reader.readLong(offsets[2]);
  object.intensityAfter2h = reader.readLongOrNull(offsets[3]);
  object.intensityAfter4h = reader.readLongOrNull(offsets[4]);
  object.isUnilateral = reader.readBool(offsets[6]);
  object.location = reader.readString(offsets[7]);
  object.medicationDosages = reader.readLongList(offsets[8]) ?? [];
  object.medicationRoutes = reader.readStringList(offsets[9]) ?? [];
  object.medicationTimes = reader.readDateTimeList(offsets[10]) ?? [];
  object.medications = reader.readStringList(offsets[11]) ?? [];
  object.minutesBeforeRescue = reader.readLongOrNull(offsets[12]);
  object.needRescueMedication = reader.readBool(offsets[13]);
  object.notes = reader.readStringOrNull(offsets[14]);
  object.overallEffectiveness = reader.readLongOrNull(offsets[15]);
  object.painType = reader.readString(offsets[16]);
  object.rescueMedicationDosage = reader.readLongOrNull(offsets[17]);
  object.rescueMedicationName = reader.readStringOrNull(offsets[18]);
  object.rescueMedicationTime = reader.readDateTimeOrNull(offsets[19]);
  object.sideEffects = reader.readStringList(offsets[20]) ?? [];
  object.startTime = reader.readDateTime(offsets[21]);
  object.symptoms = reader.readStringList(offsets[22]) ?? [];
  return object;
}

P _migraineAttackDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLongList(offset) ?? []) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    case 10:
      return (reader.readDateTimeList(offset) ?? []) as P;
    case 11:
      return (reader.readStringList(offset) ?? []) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 20:
      return (reader.readStringList(offset) ?? []) as P;
    case 21:
      return (reader.readDateTime(offset)) as P;
    case 22:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _migraineAttackGetId(MigraineAttack object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _migraineAttackGetLinks(MigraineAttack object) {
  return [];
}

void _migraineAttackAttach(
    IsarCollection<dynamic> col, Id id, MigraineAttack object) {
  object.id = id;
}

extension MigraineAttackQueryWhereSort
    on QueryBuilder<MigraineAttack, MigraineAttack, QWhere> {
  QueryBuilder<MigraineAttack, MigraineAttack, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MigraineAttackQueryWhere
    on QueryBuilder<MigraineAttack, MigraineAttack, QWhereClause> {
  QueryBuilder<MigraineAttack, MigraineAttack, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterWhereClause> idBetween(
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
}

extension MigraineAttackQueryFilter
    on QueryBuilder<MigraineAttack, MigraineAttack, QFilterCondition> {
  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      durationMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationMinutes',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      durationMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationMinutes',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      durationMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      durationMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      durationMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      durationMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      endTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
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

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
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

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intensity',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intensity',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intensity',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intensity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityAfter2hIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'intensityAfter2h',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityAfter2hIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'intensityAfter2h',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityAfter2hEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intensityAfter2h',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityAfter2hGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intensityAfter2h',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityAfter2hLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intensityAfter2h',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityAfter2hBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intensityAfter2h',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityAfter4hIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'intensityAfter4h',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityAfter4hIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'intensityAfter4h',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityAfter4hEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intensityAfter4h',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityAfter4hGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intensityAfter4h',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityAfter4hLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intensityAfter4h',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      intensityAfter4hBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intensityAfter4h',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      isUnilateralEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUnilateral',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      locationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      locationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      locationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      locationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      locationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationDosagesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicationDosages',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationDosagesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medicationDosages',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationDosagesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medicationDosages',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationDosagesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medicationDosages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationDosagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationDosages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationDosagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationDosages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationDosagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationDosages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationDosagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationDosages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationDosagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationDosages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationDosagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationDosages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicationRoutes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medicationRoutes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medicationRoutes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medicationRoutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medicationRoutes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medicationRoutes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medicationRoutes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medicationRoutes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicationRoutes',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medicationRoutes',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationRoutes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationRoutes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationRoutes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationRoutes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationRoutes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationRoutesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationRoutes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationTimesElementEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicationTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationTimesElementGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medicationTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationTimesElementLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medicationTimes',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationTimesElementBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medicationTimes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationTimesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationTimes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationTimesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationTimes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationTimesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationTimes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationTimesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationTimes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationTimesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationTimes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationTimesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medicationTimes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medications',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medications',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medications',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medications',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medications',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medications',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medications',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medications',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medications',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      medicationsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'medications',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      minutesBeforeRescueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minutesBeforeRescue',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      minutesBeforeRescueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minutesBeforeRescue',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      minutesBeforeRescueEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minutesBeforeRescue',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      minutesBeforeRescueGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minutesBeforeRescue',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      minutesBeforeRescueLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minutesBeforeRescue',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      minutesBeforeRescueBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minutesBeforeRescue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      needRescueMedicationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needRescueMedication',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      overallEffectivenessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'overallEffectiveness',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      overallEffectivenessIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'overallEffectiveness',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      overallEffectivenessEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overallEffectiveness',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      overallEffectivenessGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overallEffectiveness',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      overallEffectivenessLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overallEffectiveness',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      overallEffectivenessBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overallEffectiveness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      painTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'painType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      painTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'painType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      painTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'painType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      painTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'painType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      painTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'painType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      painTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'painType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      painTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'painType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      painTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'painType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      painTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'painType',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      painTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'painType',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationDosageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rescueMedicationDosage',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationDosageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rescueMedicationDosage',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationDosageEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rescueMedicationDosage',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationDosageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rescueMedicationDosage',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationDosageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rescueMedicationDosage',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationDosageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rescueMedicationDosage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rescueMedicationName',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rescueMedicationName',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rescueMedicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rescueMedicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rescueMedicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rescueMedicationName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rescueMedicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rescueMedicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rescueMedicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rescueMedicationName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rescueMedicationName',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rescueMedicationName',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rescueMedicationTime',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rescueMedicationTime',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rescueMedicationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rescueMedicationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rescueMedicationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      rescueMedicationTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rescueMedicationTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sideEffects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sideEffects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sideEffects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sideEffects',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sideEffects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sideEffects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sideEffects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sideEffects',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sideEffects',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sideEffects',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sideEffects',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sideEffects',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sideEffects',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sideEffects',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sideEffects',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      sideEffectsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sideEffects',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symptoms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'symptoms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'symptoms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'symptoms',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'symptoms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'symptoms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symptoms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symptoms',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symptoms',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symptoms',
        value: '',
      ));
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symptoms',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symptoms',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symptoms',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symptoms',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symptoms',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterFilterCondition>
      symptomsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'symptoms',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension MigraineAttackQueryObject
    on QueryBuilder<MigraineAttack, MigraineAttack, QFilterCondition> {}

extension MigraineAttackQueryLinks
    on QueryBuilder<MigraineAttack, MigraineAttack, QFilterCondition> {}

extension MigraineAttackQuerySortBy
    on QueryBuilder<MigraineAttack, MigraineAttack, QSortBy> {
  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> sortByIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensity', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensity', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByIntensityAfter2h() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityAfter2h', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByIntensityAfter2hDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityAfter2h', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByIntensityAfter4h() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityAfter4h', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByIntensityAfter4hDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityAfter4h', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByIsUnilateral() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnilateral', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByIsUnilateralDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnilateral', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByMinutesBeforeRescue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutesBeforeRescue', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByMinutesBeforeRescueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutesBeforeRescue', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByNeedRescueMedication() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needRescueMedication', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByNeedRescueMedicationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needRescueMedication', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByOverallEffectiveness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallEffectiveness', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByOverallEffectivenessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallEffectiveness', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> sortByPainType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painType', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByPainTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painType', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByRescueMedicationDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rescueMedicationDosage', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByRescueMedicationDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rescueMedicationDosage', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByRescueMedicationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rescueMedicationName', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByRescueMedicationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rescueMedicationName', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByRescueMedicationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rescueMedicationTime', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByRescueMedicationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rescueMedicationTime', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }
}

extension MigraineAttackQuerySortThenBy
    on QueryBuilder<MigraineAttack, MigraineAttack, QSortThenBy> {
  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMinutes', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> thenByIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensity', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensity', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByIntensityAfter2h() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityAfter2h', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByIntensityAfter2hDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityAfter2h', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByIntensityAfter4h() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityAfter4h', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByIntensityAfter4hDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensityAfter4h', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByIsUnilateral() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnilateral', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByIsUnilateralDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnilateral', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByMinutesBeforeRescue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutesBeforeRescue', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByMinutesBeforeRescueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minutesBeforeRescue', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByNeedRescueMedication() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needRescueMedication', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByNeedRescueMedicationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needRescueMedication', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByOverallEffectiveness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallEffectiveness', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByOverallEffectivenessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallEffectiveness', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> thenByPainType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painType', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByPainTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'painType', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByRescueMedicationDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rescueMedicationDosage', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByRescueMedicationDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rescueMedicationDosage', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByRescueMedicationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rescueMedicationName', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByRescueMedicationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rescueMedicationName', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByRescueMedicationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rescueMedicationTime', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByRescueMedicationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rescueMedicationTime', Sort.desc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QAfterSortBy>
      thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }
}

extension MigraineAttackQueryWhereDistinct
    on QueryBuilder<MigraineAttack, MigraineAttack, QDistinct> {
  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationMinutes');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intensity');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByIntensityAfter2h() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intensityAfter2h');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByIntensityAfter4h() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intensityAfter4h');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByIsUnilateral() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUnilateral');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByMedicationDosages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medicationDosages');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByMedicationRoutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medicationRoutes');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByMedicationTimes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medicationTimes');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByMedications() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medications');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByMinutesBeforeRescue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minutesBeforeRescue');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByNeedRescueMedication() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needRescueMedication');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByOverallEffectiveness() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overallEffectiveness');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct> distinctByPainType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'painType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByRescueMedicationDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rescueMedicationDosage');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByRescueMedicationName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rescueMedicationName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByRescueMedicationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rescueMedicationTime');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctBySideEffects() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sideEffects');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct>
      distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<MigraineAttack, MigraineAttack, QDistinct> distinctBySymptoms() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'symptoms');
    });
  }
}

extension MigraineAttackQueryProperty
    on QueryBuilder<MigraineAttack, MigraineAttack, QQueryProperty> {
  QueryBuilder<MigraineAttack, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MigraineAttack, int?, QQueryOperations>
      durationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationMinutes');
    });
  }

  QueryBuilder<MigraineAttack, DateTime?, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<MigraineAttack, int, QQueryOperations> intensityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intensity');
    });
  }

  QueryBuilder<MigraineAttack, int?, QQueryOperations>
      intensityAfter2hProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intensityAfter2h');
    });
  }

  QueryBuilder<MigraineAttack, int?, QQueryOperations>
      intensityAfter4hProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intensityAfter4h');
    });
  }

  QueryBuilder<MigraineAttack, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<MigraineAttack, bool, QQueryOperations> isUnilateralProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUnilateral');
    });
  }

  QueryBuilder<MigraineAttack, String, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<MigraineAttack, List<int>, QQueryOperations>
      medicationDosagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicationDosages');
    });
  }

  QueryBuilder<MigraineAttack, List<String>, QQueryOperations>
      medicationRoutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicationRoutes');
    });
  }

  QueryBuilder<MigraineAttack, List<DateTime>, QQueryOperations>
      medicationTimesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicationTimes');
    });
  }

  QueryBuilder<MigraineAttack, List<String>, QQueryOperations>
      medicationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medications');
    });
  }

  QueryBuilder<MigraineAttack, int?, QQueryOperations>
      minutesBeforeRescueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minutesBeforeRescue');
    });
  }

  QueryBuilder<MigraineAttack, bool, QQueryOperations>
      needRescueMedicationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needRescueMedication');
    });
  }

  QueryBuilder<MigraineAttack, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<MigraineAttack, int?, QQueryOperations>
      overallEffectivenessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overallEffectiveness');
    });
  }

  QueryBuilder<MigraineAttack, String, QQueryOperations> painTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'painType');
    });
  }

  QueryBuilder<MigraineAttack, int?, QQueryOperations>
      rescueMedicationDosageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rescueMedicationDosage');
    });
  }

  QueryBuilder<MigraineAttack, String?, QQueryOperations>
      rescueMedicationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rescueMedicationName');
    });
  }

  QueryBuilder<MigraineAttack, DateTime?, QQueryOperations>
      rescueMedicationTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rescueMedicationTime');
    });
  }

  QueryBuilder<MigraineAttack, List<String>, QQueryOperations>
      sideEffectsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sideEffects');
    });
  }

  QueryBuilder<MigraineAttack, DateTime, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<MigraineAttack, List<String>, QQueryOperations>
      symptomsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'symptoms');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDailyLogCollection on Isar {
  IsarCollection<DailyLog> get dailyLogs => this.collection();
}

const DailyLogSchema = CollectionSchema(
  name: r'DailyLog',
  id: -3995615497450705259,
  properties: {
    r'activityDuration': PropertySchema(
      id: 0,
      name: r'activityDuration',
      type: IsarType.long,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'foodTriggers': PropertySchema(
      id: 2,
      name: r'foodTriggers',
      type: IsarType.stringList,
    ),
    r'generalWellbeing': PropertySchema(
      id: 3,
      name: r'generalWellbeing',
      type: IsarType.long,
    ),
    r'hadAlcohol': PropertySchema(
      id: 4,
      name: r'hadAlcohol',
      type: IsarType.bool,
    ),
    r'hadCaffeine': PropertySchema(
      id: 5,
      name: r'hadCaffeine',
      type: IsarType.bool,
    ),
    r'hadMigraine': PropertySchema(
      id: 6,
      name: r'hadMigraine',
      type: IsarType.bool,
    ),
    r'humidity': PropertySchema(
      id: 7,
      name: r'humidity',
      type: IsarType.double,
    ),
    r'migraineAttackId': PropertySchema(
      id: 8,
      name: r'migraineAttackId',
      type: IsarType.long,
    ),
    r'notes': PropertySchema(
      id: 9,
      name: r'notes',
      type: IsarType.string,
    ),
    r'physicalActivity': PropertySchema(
      id: 10,
      name: r'physicalActivity',
      type: IsarType.string,
    ),
    r'pressure': PropertySchema(
      id: 11,
      name: r'pressure',
      type: IsarType.double,
    ),
    r'skippedMeal': PropertySchema(
      id: 12,
      name: r'skippedMeal',
      type: IsarType.bool,
    ),
    r'sleepHours': PropertySchema(
      id: 13,
      name: r'sleepHours',
      type: IsarType.double,
    ),
    r'sleepQuality': PropertySchema(
      id: 14,
      name: r'sleepQuality',
      type: IsarType.long,
    ),
    r'stressLevel': PropertySchema(
      id: 15,
      name: r'stressLevel',
      type: IsarType.long,
    ),
    r'temperature': PropertySchema(
      id: 16,
      name: r'temperature',
      type: IsarType.double,
    ),
    r'waterGlasses': PropertySchema(
      id: 17,
      name: r'waterGlasses',
      type: IsarType.long,
    )
  },
  estimateSize: _dailyLogEstimateSize,
  serialize: _dailyLogSerialize,
  deserialize: _dailyLogDeserialize,
  deserializeProp: _dailyLogDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dailyLogGetId,
  getLinks: _dailyLogGetLinks,
  attach: _dailyLogAttach,
  version: '3.1.0+1',
);

int _dailyLogEstimateSize(
  DailyLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.foodTriggers.length * 3;
  {
    for (var i = 0; i < object.foodTriggers.length; i++) {
      final value = object.foodTriggers[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.physicalActivity;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dailyLogSerialize(
  DailyLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.activityDuration);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeStringList(offsets[2], object.foodTriggers);
  writer.writeLong(offsets[3], object.generalWellbeing);
  writer.writeBool(offsets[4], object.hadAlcohol);
  writer.writeBool(offsets[5], object.hadCaffeine);
  writer.writeBool(offsets[6], object.hadMigraine);
  writer.writeDouble(offsets[7], object.humidity);
  writer.writeLong(offsets[8], object.migraineAttackId);
  writer.writeString(offsets[9], object.notes);
  writer.writeString(offsets[10], object.physicalActivity);
  writer.writeDouble(offsets[11], object.pressure);
  writer.writeBool(offsets[12], object.skippedMeal);
  writer.writeDouble(offsets[13], object.sleepHours);
  writer.writeLong(offsets[14], object.sleepQuality);
  writer.writeLong(offsets[15], object.stressLevel);
  writer.writeDouble(offsets[16], object.temperature);
  writer.writeLong(offsets[17], object.waterGlasses);
}

DailyLog _dailyLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyLog();
  object.activityDuration = reader.readLongOrNull(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.foodTriggers = reader.readStringList(offsets[2]) ?? [];
  object.generalWellbeing = reader.readLongOrNull(offsets[3]);
  object.hadAlcohol = reader.readBool(offsets[4]);
  object.hadCaffeine = reader.readBool(offsets[5]);
  object.hadMigraine = reader.readBool(offsets[6]);
  object.humidity = reader.readDoubleOrNull(offsets[7]);
  object.id = id;
  object.migraineAttackId = reader.readLongOrNull(offsets[8]);
  object.notes = reader.readStringOrNull(offsets[9]);
  object.physicalActivity = reader.readStringOrNull(offsets[10]);
  object.pressure = reader.readDoubleOrNull(offsets[11]);
  object.skippedMeal = reader.readBool(offsets[12]);
  object.sleepHours = reader.readDoubleOrNull(offsets[13]);
  object.sleepQuality = reader.readLongOrNull(offsets[14]);
  object.stressLevel = reader.readLongOrNull(offsets[15]);
  object.temperature = reader.readDoubleOrNull(offsets[16]);
  object.waterGlasses = reader.readLongOrNull(offsets[17]);
  return object;
}

P _dailyLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dailyLogGetId(DailyLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailyLogGetLinks(DailyLog object) {
  return [];
}

void _dailyLogAttach(IsarCollection<dynamic> col, Id id, DailyLog object) {
  object.id = id;
}

extension DailyLogQueryWhereSort on QueryBuilder<DailyLog, DailyLog, QWhere> {
  QueryBuilder<DailyLog, DailyLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DailyLogQueryWhere on QueryBuilder<DailyLog, DailyLog, QWhereClause> {
  QueryBuilder<DailyLog, DailyLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DailyLog, DailyLog, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterWhereClause> idBetween(
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
}

extension DailyLogQueryFilter
    on QueryBuilder<DailyLog, DailyLog, QFilterCondition> {
  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      activityDurationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activityDuration',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      activityDurationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activityDuration',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      activityDurationEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activityDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      activityDurationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activityDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      activityDurationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activityDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      activityDurationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activityDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodTriggers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodTriggers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodTriggers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodTriggers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foodTriggers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foodTriggers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foodTriggers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foodTriggers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodTriggers',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foodTriggers',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTriggers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTriggers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTriggers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTriggers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTriggers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      foodTriggersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foodTriggers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      generalWellbeingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generalWellbeing',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      generalWellbeingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generalWellbeing',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      generalWellbeingEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generalWellbeing',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      generalWellbeingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generalWellbeing',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      generalWellbeingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generalWellbeing',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      generalWellbeingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generalWellbeing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> hadAlcoholEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadAlcohol',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> hadCaffeineEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadCaffeine',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> hadMigraineEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadMigraine',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> humidityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'humidity',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> humidityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'humidity',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> humidityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'humidity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> humidityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'humidity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> humidityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'humidity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> humidityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'humidity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      migraineAttackIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'migraineAttackId',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      migraineAttackIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'migraineAttackId',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      migraineAttackIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'migraineAttackId',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      migraineAttackIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'migraineAttackId',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      migraineAttackIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'migraineAttackId',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      migraineAttackIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'migraineAttackId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      physicalActivityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'physicalActivity',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      physicalActivityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'physicalActivity',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      physicalActivityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'physicalActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      physicalActivityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'physicalActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      physicalActivityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'physicalActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      physicalActivityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'physicalActivity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      physicalActivityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'physicalActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      physicalActivityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'physicalActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      physicalActivityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'physicalActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      physicalActivityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'physicalActivity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      physicalActivityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'physicalActivity',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      physicalActivityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'physicalActivity',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> pressureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pressure',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> pressureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pressure',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> pressureEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> pressureGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> pressureLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pressure',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> pressureBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pressure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> skippedMealEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skippedMeal',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> sleepHoursIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sleepHours',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      sleepHoursIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sleepHours',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> sleepHoursEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> sleepHoursGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> sleepHoursLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> sleepHoursBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> sleepQualityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sleepQuality',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      sleepQualityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sleepQuality',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> sleepQualityEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sleepQuality',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      sleepQualityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sleepQuality',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> sleepQualityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sleepQuality',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> sleepQualityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sleepQuality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> stressLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stressLevel',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      stressLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stressLevel',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> stressLevelEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stressLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      stressLevelGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stressLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> stressLevelLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stressLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> stressLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stressLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> temperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperature',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      temperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperature',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> temperatureEqualTo(
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

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
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

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> temperatureLessThan(
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

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> temperatureBetween(
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

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> waterGlassesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'waterGlasses',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      waterGlassesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'waterGlasses',
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> waterGlassesEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waterGlasses',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition>
      waterGlassesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waterGlasses',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> waterGlassesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waterGlasses',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterFilterCondition> waterGlassesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waterGlasses',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyLogQueryObject
    on QueryBuilder<DailyLog, DailyLog, QFilterCondition> {}

extension DailyLogQueryLinks
    on QueryBuilder<DailyLog, DailyLog, QFilterCondition> {}

extension DailyLogQuerySortBy on QueryBuilder<DailyLog, DailyLog, QSortBy> {
  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByActivityDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityDuration', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByActivityDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityDuration', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByGeneralWellbeing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalWellbeing', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByGeneralWellbeingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalWellbeing', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByHadAlcohol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadAlcohol', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByHadAlcoholDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadAlcohol', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByHadCaffeine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadCaffeine', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByHadCaffeineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadCaffeine', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByHadMigraine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadMigraine', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByHadMigraineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadMigraine', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByHumidity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humidity', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByHumidityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humidity', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByMigraineAttackId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'migraineAttackId', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByMigraineAttackIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'migraineAttackId', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByPhysicalActivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'physicalActivity', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByPhysicalActivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'physicalActivity', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByPressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressure', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByPressureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressure', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortBySkippedMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skippedMeal', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortBySkippedMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skippedMeal', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortBySleepHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepHours', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortBySleepHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepHours', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortBySleepQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepQuality', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortBySleepQualityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepQuality', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByStressLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stressLevel', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByStressLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stressLevel', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByWaterGlasses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterGlasses', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> sortByWaterGlassesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterGlasses', Sort.desc);
    });
  }
}

extension DailyLogQuerySortThenBy
    on QueryBuilder<DailyLog, DailyLog, QSortThenBy> {
  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByActivityDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityDuration', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByActivityDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityDuration', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByGeneralWellbeing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalWellbeing', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByGeneralWellbeingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalWellbeing', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByHadAlcohol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadAlcohol', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByHadAlcoholDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadAlcohol', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByHadCaffeine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadCaffeine', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByHadCaffeineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadCaffeine', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByHadMigraine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadMigraine', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByHadMigraineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadMigraine', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByHumidity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humidity', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByHumidityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'humidity', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByMigraineAttackId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'migraineAttackId', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByMigraineAttackIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'migraineAttackId', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByPhysicalActivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'physicalActivity', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByPhysicalActivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'physicalActivity', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByPressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressure', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByPressureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pressure', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenBySkippedMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skippedMeal', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenBySkippedMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skippedMeal', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenBySleepHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepHours', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenBySleepHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepHours', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenBySleepQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepQuality', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenBySleepQualityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sleepQuality', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByStressLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stressLevel', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByStressLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stressLevel', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByWaterGlasses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterGlasses', Sort.asc);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QAfterSortBy> thenByWaterGlassesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterGlasses', Sort.desc);
    });
  }
}

extension DailyLogQueryWhereDistinct
    on QueryBuilder<DailyLog, DailyLog, QDistinct> {
  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByActivityDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activityDuration');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByFoodTriggers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodTriggers');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByGeneralWellbeing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generalWellbeing');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByHadAlcohol() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadAlcohol');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByHadCaffeine() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadCaffeine');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByHadMigraine() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadMigraine');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByHumidity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'humidity');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByMigraineAttackId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'migraineAttackId');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByPhysicalActivity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'physicalActivity',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByPressure() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pressure');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctBySkippedMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skippedMeal');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctBySleepHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepHours');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctBySleepQuality() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sleepQuality');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByStressLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stressLevel');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature');
    });
  }

  QueryBuilder<DailyLog, DailyLog, QDistinct> distinctByWaterGlasses() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waterGlasses');
    });
  }
}

extension DailyLogQueryProperty
    on QueryBuilder<DailyLog, DailyLog, QQueryProperty> {
  QueryBuilder<DailyLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyLog, int?, QQueryOperations> activityDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityDuration');
    });
  }

  QueryBuilder<DailyLog, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<DailyLog, List<String>, QQueryOperations>
      foodTriggersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodTriggers');
    });
  }

  QueryBuilder<DailyLog, int?, QQueryOperations> generalWellbeingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generalWellbeing');
    });
  }

  QueryBuilder<DailyLog, bool, QQueryOperations> hadAlcoholProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadAlcohol');
    });
  }

  QueryBuilder<DailyLog, bool, QQueryOperations> hadCaffeineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadCaffeine');
    });
  }

  QueryBuilder<DailyLog, bool, QQueryOperations> hadMigraineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadMigraine');
    });
  }

  QueryBuilder<DailyLog, double?, QQueryOperations> humidityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'humidity');
    });
  }

  QueryBuilder<DailyLog, int?, QQueryOperations> migraineAttackIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'migraineAttackId');
    });
  }

  QueryBuilder<DailyLog, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<DailyLog, String?, QQueryOperations> physicalActivityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'physicalActivity');
    });
  }

  QueryBuilder<DailyLog, double?, QQueryOperations> pressureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pressure');
    });
  }

  QueryBuilder<DailyLog, bool, QQueryOperations> skippedMealProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skippedMeal');
    });
  }

  QueryBuilder<DailyLog, double?, QQueryOperations> sleepHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepHours');
    });
  }

  QueryBuilder<DailyLog, int?, QQueryOperations> sleepQualityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sleepQuality');
    });
  }

  QueryBuilder<DailyLog, int?, QQueryOperations> stressLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stressLevel');
    });
  }

  QueryBuilder<DailyLog, double?, QQueryOperations> temperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature');
    });
  }

  QueryBuilder<DailyLog, int?, QQueryOperations> waterGlassesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waterGlasses');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMedicationCollection on Isar {
  IsarCollection<Medication> get medications => this.collection();
}

const MedicationSchema = CollectionSchema(
  name: r'Medication',
  id: -2541039227040579663,
  properties: {
    r'averageEffectiveness': PropertySchema(
      id: 0,
      name: r'averageEffectiveness',
      type: IsarType.double,
    ),
    r'dosage': PropertySchema(
      id: 1,
      name: r'dosage',
      type: IsarType.string,
    ),
    r'isCustom': PropertySchema(
      id: 2,
      name: r'isCustom',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'route': PropertySchema(
      id: 4,
      name: r'route',
      type: IsarType.string,
    ),
    r'timesUsed': PropertySchema(
      id: 5,
      name: r'timesUsed',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 6,
      name: r'type',
      type: IsarType.string,
    ),
    r'unit': PropertySchema(
      id: 7,
      name: r'unit',
      type: IsarType.string,
    )
  },
  estimateSize: _medicationEstimateSize,
  serialize: _medicationSerialize,
  deserialize: _medicationDeserialize,
  deserializeProp: _medicationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _medicationGetId,
  getLinks: _medicationGetLinks,
  attach: _medicationAttach,
  version: '3.1.0+1',
);

int _medicationEstimateSize(
  Medication object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dosage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.route;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.type.length * 3;
  {
    final value = object.unit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _medicationSerialize(
  Medication object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.averageEffectiveness);
  writer.writeString(offsets[1], object.dosage);
  writer.writeBool(offsets[2], object.isCustom);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.route);
  writer.writeLong(offsets[5], object.timesUsed);
  writer.writeString(offsets[6], object.type);
  writer.writeString(offsets[7], object.unit);
}

Medication _medicationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Medication();
  object.averageEffectiveness = reader.readDoubleOrNull(offsets[0]);
  object.dosage = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.isCustom = reader.readBool(offsets[2]);
  object.name = reader.readString(offsets[3]);
  object.route = reader.readStringOrNull(offsets[4]);
  object.timesUsed = reader.readLong(offsets[5]);
  object.type = reader.readString(offsets[6]);
  object.unit = reader.readStringOrNull(offsets[7]);
  return object;
}

P _medicationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _medicationGetId(Medication object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _medicationGetLinks(Medication object) {
  return [];
}

void _medicationAttach(IsarCollection<dynamic> col, Id id, Medication object) {
  object.id = id;
}

extension MedicationQueryWhereSort
    on QueryBuilder<Medication, Medication, QWhere> {
  QueryBuilder<Medication, Medication, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MedicationQueryWhere
    on QueryBuilder<Medication, Medication, QWhereClause> {
  QueryBuilder<Medication, Medication, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Medication, Medication, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Medication, Medication, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Medication, Medication, QAfterWhereClause> idBetween(
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
}

extension MedicationQueryFilter
    on QueryBuilder<Medication, Medication, QFilterCondition> {
  QueryBuilder<Medication, Medication, QAfterFilterCondition>
      averageEffectivenessIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageEffectiveness',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition>
      averageEffectivenessIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageEffectiveness',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition>
      averageEffectivenessEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageEffectiveness',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition>
      averageEffectivenessGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageEffectiveness',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition>
      averageEffectivenessLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageEffectiveness',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition>
      averageEffectivenessBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageEffectiveness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> dosageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dosage',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition>
      dosageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dosage',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> dosageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> dosageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> dosageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> dosageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dosage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> dosageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> dosageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> dosageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dosage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> dosageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dosage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> dosageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosage',
        value: '',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition>
      dosageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dosage',
        value: '',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Medication, Medication, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Medication, Medication, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Medication, Medication, QAfterFilterCondition> isCustomEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCustom',
        value: value,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Medication, Medication, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Medication, Medication, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Medication, Medication, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Medication, Medication, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Medication, Medication, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Medication, Medication, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> routeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'route',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> routeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'route',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> routeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'route',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> routeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'route',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> routeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'route',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> routeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'route',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> routeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'route',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> routeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'route',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> routeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'route',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> routeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'route',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> routeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'route',
        value: '',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition>
      routeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'route',
        value: '',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> timesUsedEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timesUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition>
      timesUsedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timesUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> timesUsedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timesUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> timesUsedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timesUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> unitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> unitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> unitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> unitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> unitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> unitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> unitContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> unitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<Medication, Medication, QAfterFilterCondition> unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension MedicationQueryObject
    on QueryBuilder<Medication, Medication, QFilterCondition> {}

extension MedicationQueryLinks
    on QueryBuilder<Medication, Medication, QFilterCondition> {}

extension MedicationQuerySortBy
    on QueryBuilder<Medication, Medication, QSortBy> {
  QueryBuilder<Medication, Medication, QAfterSortBy>
      sortByAverageEffectiveness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageEffectiveness', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy>
      sortByAverageEffectivenessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageEffectiveness', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByIsCustom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustom', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByIsCustomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustom', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByRoute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'route', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByRouteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'route', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByTimesUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesUsed', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByTimesUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesUsed', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension MedicationQuerySortThenBy
    on QueryBuilder<Medication, Medication, QSortThenBy> {
  QueryBuilder<Medication, Medication, QAfterSortBy>
      thenByAverageEffectiveness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageEffectiveness', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy>
      thenByAverageEffectivenessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageEffectiveness', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByDosage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByDosageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosage', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByIsCustom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustom', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByIsCustomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustom', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByRoute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'route', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByRouteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'route', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByTimesUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesUsed', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByTimesUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timesUsed', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<Medication, Medication, QAfterSortBy> thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension MedicationQueryWhereDistinct
    on QueryBuilder<Medication, Medication, QDistinct> {
  QueryBuilder<Medication, Medication, QDistinct>
      distinctByAverageEffectiveness() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageEffectiveness');
    });
  }

  QueryBuilder<Medication, Medication, QDistinct> distinctByDosage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Medication, Medication, QDistinct> distinctByIsCustom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCustom');
    });
  }

  QueryBuilder<Medication, Medication, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Medication, Medication, QDistinct> distinctByRoute(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'route', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Medication, Medication, QDistinct> distinctByTimesUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timesUsed');
    });
  }

  QueryBuilder<Medication, Medication, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Medication, Medication, QDistinct> distinctByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }
}

extension MedicationQueryProperty
    on QueryBuilder<Medication, Medication, QQueryProperty> {
  QueryBuilder<Medication, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Medication, double?, QQueryOperations>
      averageEffectivenessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageEffectiveness');
    });
  }

  QueryBuilder<Medication, String?, QQueryOperations> dosageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosage');
    });
  }

  QueryBuilder<Medication, bool, QQueryOperations> isCustomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCustom');
    });
  }

  QueryBuilder<Medication, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Medication, String?, QQueryOperations> routeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'route');
    });
  }

  QueryBuilder<Medication, int, QQueryOperations> timesUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timesUsed');
    });
  }

  QueryBuilder<Medication, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<Medication, String?, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInjectionRecordCollection on Isar {
  IsarCollection<InjectionRecord> get injectionRecords => this.collection();
}

const InjectionRecordSchema = CollectionSchema(
  name: r'InjectionRecord',
  id: -5279008503113970231,
  properties: {
    r'cycleNumber': PropertySchema(
      id: 0,
      name: r'cycleNumber',
      type: IsarType.long,
    ),
    r'injectionDate': PropertySchema(
      id: 1,
      name: r'injectionDate',
      type: IsarType.dateTime,
    ),
    r'medicationName': PropertySchema(
      id: 2,
      name: r'medicationName',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 3,
      name: r'notes',
      type: IsarType.string,
    ),
    r'sideEffects': PropertySchema(
      id: 4,
      name: r'sideEffects',
      type: IsarType.stringList,
    ),
    r'sideEffectsSeverity': PropertySchema(
      id: 5,
      name: r'sideEffectsSeverity',
      type: IsarType.long,
    )
  },
  estimateSize: _injectionRecordEstimateSize,
  serialize: _injectionRecordSerialize,
  deserialize: _injectionRecordDeserialize,
  deserializeProp: _injectionRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _injectionRecordGetId,
  getLinks: _injectionRecordGetLinks,
  attach: _injectionRecordAttach,
  version: '3.1.0+1',
);

int _injectionRecordEstimateSize(
  InjectionRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.medicationName.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sideEffects.length * 3;
  {
    for (var i = 0; i < object.sideEffects.length; i++) {
      final value = object.sideEffects[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _injectionRecordSerialize(
  InjectionRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cycleNumber);
  writer.writeDateTime(offsets[1], object.injectionDate);
  writer.writeString(offsets[2], object.medicationName);
  writer.writeString(offsets[3], object.notes);
  writer.writeStringList(offsets[4], object.sideEffects);
  writer.writeLong(offsets[5], object.sideEffectsSeverity);
}

InjectionRecord _injectionRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InjectionRecord();
  object.cycleNumber = reader.readLong(offsets[0]);
  object.id = id;
  object.injectionDate = reader.readDateTime(offsets[1]);
  object.medicationName = reader.readString(offsets[2]);
  object.notes = reader.readStringOrNull(offsets[3]);
  object.sideEffects = reader.readStringList(offsets[4]) ?? [];
  object.sideEffectsSeverity = reader.readLongOrNull(offsets[5]);
  return object;
}

P _injectionRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _injectionRecordGetId(InjectionRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _injectionRecordGetLinks(InjectionRecord object) {
  return [];
}

void _injectionRecordAttach(
    IsarCollection<dynamic> col, Id id, InjectionRecord object) {
  object.id = id;
}

extension InjectionRecordQueryWhereSort
    on QueryBuilder<InjectionRecord, InjectionRecord, QWhere> {
  QueryBuilder<InjectionRecord, InjectionRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InjectionRecordQueryWhere
    on QueryBuilder<InjectionRecord, InjectionRecord, QWhereClause> {
  QueryBuilder<InjectionRecord, InjectionRecord, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterWhereClause>
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

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterWhereClause> idBetween(
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
}

extension InjectionRecordQueryFilter
    on QueryBuilder<InjectionRecord, InjectionRecord, QFilterCondition> {
  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      cycleNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cycleNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      cycleNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cycleNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      cycleNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cycleNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      cycleNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cycleNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
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

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
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

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
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

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      injectionDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'injectionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      injectionDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'injectionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      injectionDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'injectionDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      injectionDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'injectionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      medicationNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      medicationNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      medicationNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      medicationNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medicationName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      medicationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      medicationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      medicationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      medicationNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medicationName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      medicationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicationName',
        value: '',
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      medicationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medicationName',
        value: '',
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sideEffects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sideEffects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sideEffects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sideEffects',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sideEffects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sideEffects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sideEffects',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sideEffects',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sideEffects',
        value: '',
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sideEffects',
        value: '',
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sideEffects',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sideEffects',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sideEffects',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sideEffects',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sideEffects',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sideEffects',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsSeverityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sideEffectsSeverity',
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsSeverityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sideEffectsSeverity',
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsSeverityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sideEffectsSeverity',
        value: value,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsSeverityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sideEffectsSeverity',
        value: value,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsSeverityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sideEffectsSeverity',
        value: value,
      ));
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterFilterCondition>
      sideEffectsSeverityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sideEffectsSeverity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InjectionRecordQueryObject
    on QueryBuilder<InjectionRecord, InjectionRecord, QFilterCondition> {}

extension InjectionRecordQueryLinks
    on QueryBuilder<InjectionRecord, InjectionRecord, QFilterCondition> {}

extension InjectionRecordQuerySortBy
    on QueryBuilder<InjectionRecord, InjectionRecord, QSortBy> {
  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      sortByCycleNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cycleNumber', Sort.asc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      sortByCycleNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cycleNumber', Sort.desc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      sortByInjectionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'injectionDate', Sort.asc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      sortByInjectionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'injectionDate', Sort.desc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      sortByMedicationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationName', Sort.asc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      sortByMedicationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationName', Sort.desc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      sortBySideEffectsSeverity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sideEffectsSeverity', Sort.asc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      sortBySideEffectsSeverityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sideEffectsSeverity', Sort.desc);
    });
  }
}

extension InjectionRecordQuerySortThenBy
    on QueryBuilder<InjectionRecord, InjectionRecord, QSortThenBy> {
  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      thenByCycleNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cycleNumber', Sort.asc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      thenByCycleNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cycleNumber', Sort.desc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      thenByInjectionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'injectionDate', Sort.asc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      thenByInjectionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'injectionDate', Sort.desc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      thenByMedicationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationName', Sort.asc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      thenByMedicationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicationName', Sort.desc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      thenBySideEffectsSeverity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sideEffectsSeverity', Sort.asc);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QAfterSortBy>
      thenBySideEffectsSeverityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sideEffectsSeverity', Sort.desc);
    });
  }
}

extension InjectionRecordQueryWhereDistinct
    on QueryBuilder<InjectionRecord, InjectionRecord, QDistinct> {
  QueryBuilder<InjectionRecord, InjectionRecord, QDistinct>
      distinctByCycleNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cycleNumber');
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QDistinct>
      distinctByInjectionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'injectionDate');
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QDistinct>
      distinctByMedicationName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medicationName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QDistinct>
      distinctBySideEffects() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sideEffects');
    });
  }

  QueryBuilder<InjectionRecord, InjectionRecord, QDistinct>
      distinctBySideEffectsSeverity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sideEffectsSeverity');
    });
  }
}

extension InjectionRecordQueryProperty
    on QueryBuilder<InjectionRecord, InjectionRecord, QQueryProperty> {
  QueryBuilder<InjectionRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InjectionRecord, int, QQueryOperations> cycleNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cycleNumber');
    });
  }

  QueryBuilder<InjectionRecord, DateTime, QQueryOperations>
      injectionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'injectionDate');
    });
  }

  QueryBuilder<InjectionRecord, String, QQueryOperations>
      medicationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicationName');
    });
  }

  QueryBuilder<InjectionRecord, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<InjectionRecord, List<String>, QQueryOperations>
      sideEffectsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sideEffects');
    });
  }

  QueryBuilder<InjectionRecord, int?, QQueryOperations>
      sideEffectsSeverityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sideEffectsSeverity');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserProfileCollection on Isar {
  IsarCollection<UserProfile> get userProfiles => this.collection();
}

const UserProfileSchema = CollectionSchema(
  name: r'UserProfile',
  id: 4738427352541298891,
  properties: {
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.long,
    ),
    r'baselineAttacksPerMonth': PropertySchema(
      id: 1,
      name: r'baselineAttacksPerMonth',
      type: IsarType.double,
    ),
    r'baselineAvgIntensity': PropertySchema(
      id: 2,
      name: r'baselineAvgIntensity',
      type: IsarType.double,
    ),
    r'city': PropertySchema(
      id: 3,
      name: r'city',
      type: IsarType.string,
    ),
    r'country': PropertySchema(
      id: 4,
      name: r'country',
      type: IsarType.string,
    ),
    r'darkMode': PropertySchema(
      id: 5,
      name: r'darkMode',
      type: IsarType.bool,
    ),
    r'enableNotifications': PropertySchema(
      id: 6,
      name: r'enableNotifications',
      type: IsarType.bool,
    ),
    r'enableWeatherData': PropertySchema(
      id: 7,
      name: r'enableWeatherData',
      type: IsarType.bool,
    ),
    r'gender': PropertySchema(
      id: 8,
      name: r'gender',
      type: IsarType.string,
    ),
    r'hasPreventiveTreatment': PropertySchema(
      id: 9,
      name: r'hasPreventiveTreatment',
      type: IsarType.bool,
    ),
    r'injectionFrequencyDays': PropertySchema(
      id: 10,
      name: r'injectionFrequencyDays',
      type: IsarType.long,
    ),
    r'language': PropertySchema(
      id: 11,
      name: r'language',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 12,
      name: r'name',
      type: IsarType.string,
    ),
    r'preventiveMedicationName': PropertySchema(
      id: 13,
      name: r'preventiveMedicationName',
      type: IsarType.string,
    ),
    r'targetAttacksPerMonth': PropertySchema(
      id: 14,
      name: r'targetAttacksPerMonth',
      type: IsarType.long,
    ),
    r'targetMaxIntensity': PropertySchema(
      id: 15,
      name: r'targetMaxIntensity',
      type: IsarType.long,
    ),
    r'treatmentStartDate': PropertySchema(
      id: 16,
      name: r'treatmentStartDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _userProfileEstimateSize,
  serialize: _userProfileSerialize,
  deserialize: _userProfileDeserialize,
  deserializeProp: _userProfileDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userProfileGetId,
  getLinks: _userProfileGetLinks,
  attach: _userProfileAttach,
  version: '3.1.0+1',
);

int _userProfileEstimateSize(
  UserProfile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.city;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.country;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gender;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.language.length * 3;
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.preventiveMedicationName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userProfileSerialize(
  UserProfile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.age);
  writer.writeDouble(offsets[1], object.baselineAttacksPerMonth);
  writer.writeDouble(offsets[2], object.baselineAvgIntensity);
  writer.writeString(offsets[3], object.city);
  writer.writeString(offsets[4], object.country);
  writer.writeBool(offsets[5], object.darkMode);
  writer.writeBool(offsets[6], object.enableNotifications);
  writer.writeBool(offsets[7], object.enableWeatherData);
  writer.writeString(offsets[8], object.gender);
  writer.writeBool(offsets[9], object.hasPreventiveTreatment);
  writer.writeLong(offsets[10], object.injectionFrequencyDays);
  writer.writeString(offsets[11], object.language);
  writer.writeString(offsets[12], object.name);
  writer.writeString(offsets[13], object.preventiveMedicationName);
  writer.writeLong(offsets[14], object.targetAttacksPerMonth);
  writer.writeLong(offsets[15], object.targetMaxIntensity);
  writer.writeDateTime(offsets[16], object.treatmentStartDate);
}

UserProfile _userProfileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserProfile();
  object.age = reader.readLongOrNull(offsets[0]);
  object.baselineAttacksPerMonth = reader.readDoubleOrNull(offsets[1]);
  object.baselineAvgIntensity = reader.readDoubleOrNull(offsets[2]);
  object.city = reader.readStringOrNull(offsets[3]);
  object.country = reader.readStringOrNull(offsets[4]);
  object.darkMode = reader.readBool(offsets[5]);
  object.enableNotifications = reader.readBool(offsets[6]);
  object.enableWeatherData = reader.readBool(offsets[7]);
  object.gender = reader.readStringOrNull(offsets[8]);
  object.hasPreventiveTreatment = reader.readBool(offsets[9]);
  object.id = id;
  object.injectionFrequencyDays = reader.readLongOrNull(offsets[10]);
  object.language = reader.readString(offsets[11]);
  object.name = reader.readString(offsets[12]);
  object.preventiveMedicationName = reader.readStringOrNull(offsets[13]);
  object.targetAttacksPerMonth = reader.readLong(offsets[14]);
  object.targetMaxIntensity = reader.readLong(offsets[15]);
  object.treatmentStartDate = reader.readDateTimeOrNull(offsets[16]);
  return object;
}

P _userProfileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userProfileGetId(UserProfile object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userProfileGetLinks(UserProfile object) {
  return [];
}

void _userProfileAttach(
    IsarCollection<dynamic> col, Id id, UserProfile object) {
  object.id = id;
}

extension UserProfileQueryWhereSort
    on QueryBuilder<UserProfile, UserProfile, QWhere> {
  QueryBuilder<UserProfile, UserProfile, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserProfileQueryWhere
    on QueryBuilder<UserProfile, UserProfile, QWhereClause> {
  QueryBuilder<UserProfile, UserProfile, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<UserProfile, UserProfile, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterWhereClause> idBetween(
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
}

extension UserProfileQueryFilter
    on QueryBuilder<UserProfile, UserProfile, QFilterCondition> {
  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> ageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> ageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> ageEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> ageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> ageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> ageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      baselineAttacksPerMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baselineAttacksPerMonth',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      baselineAttacksPerMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baselineAttacksPerMonth',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      baselineAttacksPerMonthEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baselineAttacksPerMonth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      baselineAttacksPerMonthGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baselineAttacksPerMonth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      baselineAttacksPerMonthLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baselineAttacksPerMonth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      baselineAttacksPerMonthBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baselineAttacksPerMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      baselineAvgIntensityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baselineAvgIntensity',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      baselineAvgIntensityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baselineAvgIntensity',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      baselineAvgIntensityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baselineAvgIntensity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      baselineAvgIntensityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baselineAvgIntensity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      baselineAvgIntensityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baselineAvgIntensity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      baselineAvgIntensityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baselineAvgIntensity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> cityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> cityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> cityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> cityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> cityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'city',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> cityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> cityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> cityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> cityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'city',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      countryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      countryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> countryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      countryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> countryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> countryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'country',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      countryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> countryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> countryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> countryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'country',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      countryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      countryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> darkModeEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'darkMode',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      enableNotificationsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableNotifications',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      enableWeatherDataEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enableWeatherData',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> genderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      genderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> genderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> genderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> genderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> genderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      hasPreventiveTreatmentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasPreventiveTreatment',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      injectionFrequencyDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'injectionFrequencyDays',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      injectionFrequencyDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'injectionFrequencyDays',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      injectionFrequencyDaysEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'injectionFrequencyDays',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      injectionFrequencyDaysGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'injectionFrequencyDays',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      injectionFrequencyDaysLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'injectionFrequencyDays',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      injectionFrequencyDaysBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'injectionFrequencyDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> languageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      languageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      languageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> languageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      languageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> languageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'language',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      preventiveMedicationNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'preventiveMedicationName',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      preventiveMedicationNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'preventiveMedicationName',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      preventiveMedicationNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preventiveMedicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      preventiveMedicationNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preventiveMedicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      preventiveMedicationNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preventiveMedicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      preventiveMedicationNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preventiveMedicationName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      preventiveMedicationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preventiveMedicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      preventiveMedicationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preventiveMedicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      preventiveMedicationNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preventiveMedicationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      preventiveMedicationNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preventiveMedicationName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      preventiveMedicationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preventiveMedicationName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      preventiveMedicationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preventiveMedicationName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      targetAttacksPerMonthEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetAttacksPerMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      targetAttacksPerMonthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetAttacksPerMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      targetAttacksPerMonthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetAttacksPerMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      targetAttacksPerMonthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetAttacksPerMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      targetMaxIntensityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetMaxIntensity',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      targetMaxIntensityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetMaxIntensity',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      targetMaxIntensityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetMaxIntensity',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      targetMaxIntensityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetMaxIntensity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      treatmentStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'treatmentStartDate',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      treatmentStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'treatmentStartDate',
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      treatmentStartDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'treatmentStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      treatmentStartDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'treatmentStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      treatmentStartDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'treatmentStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterFilterCondition>
      treatmentStartDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'treatmentStartDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserProfileQueryObject
    on QueryBuilder<UserProfile, UserProfile, QFilterCondition> {}

extension UserProfileQueryLinks
    on QueryBuilder<UserProfile, UserProfile, QFilterCondition> {}

extension UserProfileQuerySortBy
    on QueryBuilder<UserProfile, UserProfile, QSortBy> {
  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByBaselineAttacksPerMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineAttacksPerMonth', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByBaselineAttacksPerMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineAttacksPerMonth', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByBaselineAvgIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineAvgIntensity', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByBaselineAvgIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineAvgIntensity', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByEnableNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableNotifications', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByEnableNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableNotifications', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByEnableWeatherData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableWeatherData', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByEnableWeatherDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableWeatherData', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByHasPreventiveTreatment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPreventiveTreatment', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByHasPreventiveTreatmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPreventiveTreatment', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByInjectionFrequencyDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'injectionFrequencyDays', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByInjectionFrequencyDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'injectionFrequencyDays', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByPreventiveMedicationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preventiveMedicationName', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByPreventiveMedicationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preventiveMedicationName', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByTargetAttacksPerMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetAttacksPerMonth', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByTargetAttacksPerMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetAttacksPerMonth', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByTargetMaxIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMaxIntensity', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByTargetMaxIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMaxIntensity', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByTreatmentStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'treatmentStartDate', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      sortByTreatmentStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'treatmentStartDate', Sort.desc);
    });
  }
}

extension UserProfileQuerySortThenBy
    on QueryBuilder<UserProfile, UserProfile, QSortThenBy> {
  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByBaselineAttacksPerMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineAttacksPerMonth', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByBaselineAttacksPerMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineAttacksPerMonth', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByBaselineAvgIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineAvgIntensity', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByBaselineAvgIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineAvgIntensity', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByEnableNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableNotifications', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByEnableNotificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableNotifications', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByEnableWeatherData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableWeatherData', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByEnableWeatherDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enableWeatherData', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByHasPreventiveTreatment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPreventiveTreatment', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByHasPreventiveTreatmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPreventiveTreatment', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByInjectionFrequencyDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'injectionFrequencyDays', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByInjectionFrequencyDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'injectionFrequencyDays', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByPreventiveMedicationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preventiveMedicationName', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByPreventiveMedicationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preventiveMedicationName', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByTargetAttacksPerMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetAttacksPerMonth', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByTargetAttacksPerMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetAttacksPerMonth', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByTargetMaxIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMaxIntensity', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByTargetMaxIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetMaxIntensity', Sort.desc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByTreatmentStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'treatmentStartDate', Sort.asc);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QAfterSortBy>
      thenByTreatmentStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'treatmentStartDate', Sort.desc);
    });
  }
}

extension UserProfileQueryWhereDistinct
    on QueryBuilder<UserProfile, UserProfile, QDistinct> {
  QueryBuilder<UserProfile, UserProfile, QDistinct> distinctByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age');
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct>
      distinctByBaselineAttacksPerMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baselineAttacksPerMonth');
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct>
      distinctByBaselineAvgIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baselineAvgIntensity');
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct> distinctByCity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct> distinctByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'country', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct> distinctByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'darkMode');
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct>
      distinctByEnableNotifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableNotifications');
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct>
      distinctByEnableWeatherData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enableWeatherData');
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct> distinctByGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct>
      distinctByHasPreventiveTreatment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasPreventiveTreatment');
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct>
      distinctByInjectionFrequencyDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'injectionFrequencyDays');
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct> distinctByLanguage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct>
      distinctByPreventiveMedicationName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preventiveMedicationName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct>
      distinctByTargetAttacksPerMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetAttacksPerMonth');
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct>
      distinctByTargetMaxIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetMaxIntensity');
    });
  }

  QueryBuilder<UserProfile, UserProfile, QDistinct>
      distinctByTreatmentStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'treatmentStartDate');
    });
  }
}

extension UserProfileQueryProperty
    on QueryBuilder<UserProfile, UserProfile, QQueryProperty> {
  QueryBuilder<UserProfile, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserProfile, int?, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<UserProfile, double?, QQueryOperations>
      baselineAttacksPerMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baselineAttacksPerMonth');
    });
  }

  QueryBuilder<UserProfile, double?, QQueryOperations>
      baselineAvgIntensityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baselineAvgIntensity');
    });
  }

  QueryBuilder<UserProfile, String?, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<UserProfile, String?, QQueryOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'country');
    });
  }

  QueryBuilder<UserProfile, bool, QQueryOperations> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'darkMode');
    });
  }

  QueryBuilder<UserProfile, bool, QQueryOperations>
      enableNotificationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableNotifications');
    });
  }

  QueryBuilder<UserProfile, bool, QQueryOperations>
      enableWeatherDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enableWeatherData');
    });
  }

  QueryBuilder<UserProfile, String?, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<UserProfile, bool, QQueryOperations>
      hasPreventiveTreatmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasPreventiveTreatment');
    });
  }

  QueryBuilder<UserProfile, int?, QQueryOperations>
      injectionFrequencyDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'injectionFrequencyDays');
    });
  }

  QueryBuilder<UserProfile, String, QQueryOperations> languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<UserProfile, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<UserProfile, String?, QQueryOperations>
      preventiveMedicationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preventiveMedicationName');
    });
  }

  QueryBuilder<UserProfile, int, QQueryOperations>
      targetAttacksPerMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetAttacksPerMonth');
    });
  }

  QueryBuilder<UserProfile, int, QQueryOperations>
      targetMaxIntensityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetMaxIntensity');
    });
  }

  QueryBuilder<UserProfile, DateTime?, QQueryOperations>
      treatmentStartDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'treatmentStartDate');
    });
  }
}
