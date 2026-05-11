// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localUpdatedAtMeta = const VerificationMeta(
    'localUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> localUpdatedAt =
      GeneratedColumn<DateTime>(
        'local_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _firebaseUidMeta = const VerificationMeta(
    'firebaseUid',
  );
  @override
  late final GeneratedColumn<String> firebaseUid = GeneratedColumn<String>(
    'firebase_uid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    firebaseUid,
    email,
    displayName,
    role,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Profile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_updated_at')) {
      context.handle(
        _localUpdatedAtMeta,
        localUpdatedAt.isAcceptableOrUnknown(
          data['local_updated_at']!,
          _localUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('firebase_uid')) {
      context.handle(
        _firebaseUidMeta,
        firebaseUid.isAcceptableOrUnknown(
          data['firebase_uid']!,
          _firebaseUidMeta,
        ),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      localUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}local_updated_at'],
      ),
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      ),
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      firebaseUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_uid'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      ),
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }
}

class Profile extends DataClass implements Insertable<Profile> {
  final DateTime? localUpdatedAt;
  final DateTime? serverUpdatedAt;
  final String? syncState;
  final String? operationId;
  final bool isDeleted;
  final String id;
  final String? firebaseUid;
  final String? email;
  final String? displayName;
  final String? role;
  const Profile({
    this.localUpdatedAt,
    this.serverUpdatedAt,
    this.syncState,
    this.operationId,
    required this.isDeleted,
    required this.id,
    this.firebaseUid,
    this.email,
    this.displayName,
    this.role,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || localUpdatedAt != null) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    }
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    if (!nullToAbsent || syncState != null) {
      map['sync_state'] = Variable<String>(syncState);
    }
    if (!nullToAbsent || operationId != null) {
      map['operation_id'] = Variable<String>(operationId);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || firebaseUid != null) {
      map['firebase_uid'] = Variable<String>(firebaseUid);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || role != null) {
      map['role'] = Variable<String>(role);
    }
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      localUpdatedAt: localUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(localUpdatedAt),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      syncState: syncState == null && nullToAbsent
          ? const Value.absent()
          : Value(syncState),
      operationId: operationId == null && nullToAbsent
          ? const Value.absent()
          : Value(operationId),
      isDeleted: Value(isDeleted),
      id: Value(id),
      firebaseUid: firebaseUid == null && nullToAbsent
          ? const Value.absent()
          : Value(firebaseUid),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
    );
  }

  factory Profile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      localUpdatedAt: serializer.fromJson<DateTime?>(json['localUpdatedAt']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      syncState: serializer.fromJson<String?>(json['syncState']),
      operationId: serializer.fromJson<String?>(json['operationId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<String>(json['id']),
      firebaseUid: serializer.fromJson<String?>(json['firebaseUid']),
      email: serializer.fromJson<String?>(json['email']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      role: serializer.fromJson<String?>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localUpdatedAt': serializer.toJson<DateTime?>(localUpdatedAt),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'syncState': serializer.toJson<String?>(syncState),
      'operationId': serializer.toJson<String?>(operationId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<String>(id),
      'firebaseUid': serializer.toJson<String?>(firebaseUid),
      'email': serializer.toJson<String?>(email),
      'displayName': serializer.toJson<String?>(displayName),
      'role': serializer.toJson<String?>(role),
    };
  }

  Profile copyWith({
    Value<DateTime?> localUpdatedAt = const Value.absent(),
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    Value<String?> syncState = const Value.absent(),
    Value<String?> operationId = const Value.absent(),
    bool? isDeleted,
    String? id,
    Value<String?> firebaseUid = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> displayName = const Value.absent(),
    Value<String?> role = const Value.absent(),
  }) => Profile(
    localUpdatedAt: localUpdatedAt.present
        ? localUpdatedAt.value
        : this.localUpdatedAt,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    syncState: syncState.present ? syncState.value : this.syncState,
    operationId: operationId.present ? operationId.value : this.operationId,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    firebaseUid: firebaseUid.present ? firebaseUid.value : this.firebaseUid,
    email: email.present ? email.value : this.email,
    displayName: displayName.present ? displayName.value : this.displayName,
    role: role.present ? role.value : this.role,
  );
  Profile copyWithCompanion(ProfilesCompanion data) {
    return Profile(
      localUpdatedAt: data.localUpdatedAt.present
          ? data.localUpdatedAt.value
          : this.localUpdatedAt,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      firebaseUid: data.firebaseUid.present
          ? data.firebaseUid.value
          : this.firebaseUid,
      email: data.email.present ? data.email.value : this.email,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      role: data.role.present ? data.role.value : this.role,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    firebaseUid,
    email,
    displayName,
    role,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.localUpdatedAt == this.localUpdatedAt &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.syncState == this.syncState &&
          other.operationId == this.operationId &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.firebaseUid == this.firebaseUid &&
          other.email == this.email &&
          other.displayName == this.displayName &&
          other.role == this.role);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<DateTime?> localUpdatedAt;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String?> syncState;
  final Value<String?> operationId;
  final Value<bool> isDeleted;
  final Value<String> id;
  final Value<String?> firebaseUid;
  final Value<String?> email;
  final Value<String?> displayName;
  final Value<String?> role;
  final Value<int> rowid;
  const ProfilesCompanion({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.firebaseUid = const Value.absent(),
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.role = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String id,
    this.firebaseUid = const Value.absent(),
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.role = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Profile> custom({
    Expression<DateTime>? localUpdatedAt,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? syncState,
    Expression<String>? operationId,
    Expression<bool>? isDeleted,
    Expression<String>? id,
    Expression<String>? firebaseUid,
    Expression<String>? email,
    Expression<String>? displayName,
    Expression<String>? role,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (syncState != null) 'sync_state': syncState,
      if (operationId != null) 'operation_id': operationId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (firebaseUid != null) 'firebase_uid': firebaseUid,
      if (email != null) 'email': email,
      if (displayName != null) 'display_name': displayName,
      if (role != null) 'role': role,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProfilesCompanion copyWith({
    Value<DateTime?>? localUpdatedAt,
    Value<DateTime?>? serverUpdatedAt,
    Value<String?>? syncState,
    Value<String?>? operationId,
    Value<bool>? isDeleted,
    Value<String>? id,
    Value<String?>? firebaseUid,
    Value<String?>? email,
    Value<String?>? displayName,
    Value<String?>? role,
    Value<int>? rowid,
  }) {
    return ProfilesCompanion(
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      syncState: syncState ?? this.syncState,
      operationId: operationId ?? this.operationId,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      firebaseUid: firebaseUid ?? this.firebaseUid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      role: role ?? this.role,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (firebaseUid.present) {
      map['firebase_uid'] = Variable<String>(firebaseUid.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('role: $role, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BusinessesTable extends Businesses
    with TableInfo<$BusinessesTable, BusinessesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localUpdatedAtMeta = const VerificationMeta(
    'localUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> localUpdatedAt =
      GeneratedColumn<DateTime>(
        'local_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoUrlMeta = const VerificationMeta(
    'logoUrl',
  );
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
    'logo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    name,
    ownerId,
    description,
    logoUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'businesses';
  @override
  VerificationContext validateIntegrity(
    Insertable<BusinessesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_updated_at')) {
      context.handle(
        _localUpdatedAtMeta,
        localUpdatedAt.isAcceptableOrUnknown(
          data['local_updated_at']!,
          _localUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('logo_url')) {
      context.handle(
        _logoUrlMeta,
        logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessesData(
      localUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}local_updated_at'],
      ),
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      ),
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      logoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_url'],
      ),
    );
  }

  @override
  $BusinessesTable createAlias(String alias) {
    return $BusinessesTable(attachedDatabase, alias);
  }
}

class BusinessesData extends DataClass implements Insertable<BusinessesData> {
  final DateTime? localUpdatedAt;
  final DateTime? serverUpdatedAt;
  final String? syncState;
  final String? operationId;
  final bool isDeleted;
  final String id;
  final String name;
  final String? ownerId;
  final String? description;
  final String? logoUrl;
  const BusinessesData({
    this.localUpdatedAt,
    this.serverUpdatedAt,
    this.syncState,
    this.operationId,
    required this.isDeleted,
    required this.id,
    required this.name,
    this.ownerId,
    this.description,
    this.logoUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || localUpdatedAt != null) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    }
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    if (!nullToAbsent || syncState != null) {
      map['sync_state'] = Variable<String>(syncState);
    }
    if (!nullToAbsent || operationId != null) {
      map['operation_id'] = Variable<String>(operationId);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || ownerId != null) {
      map['owner_id'] = Variable<String>(ownerId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    return map;
  }

  BusinessesCompanion toCompanion(bool nullToAbsent) {
    return BusinessesCompanion(
      localUpdatedAt: localUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(localUpdatedAt),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      syncState: syncState == null && nullToAbsent
          ? const Value.absent()
          : Value(syncState),
      operationId: operationId == null && nullToAbsent
          ? const Value.absent()
          : Value(operationId),
      isDeleted: Value(isDeleted),
      id: Value(id),
      name: Value(name),
      ownerId: ownerId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
    );
  }

  factory BusinessesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessesData(
      localUpdatedAt: serializer.fromJson<DateTime?>(json['localUpdatedAt']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      syncState: serializer.fromJson<String?>(json['syncState']),
      operationId: serializer.fromJson<String?>(json['operationId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      ownerId: serializer.fromJson<String?>(json['ownerId']),
      description: serializer.fromJson<String?>(json['description']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localUpdatedAt': serializer.toJson<DateTime?>(localUpdatedAt),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'syncState': serializer.toJson<String?>(syncState),
      'operationId': serializer.toJson<String?>(operationId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'ownerId': serializer.toJson<String?>(ownerId),
      'description': serializer.toJson<String?>(description),
      'logoUrl': serializer.toJson<String?>(logoUrl),
    };
  }

  BusinessesData copyWith({
    Value<DateTime?> localUpdatedAt = const Value.absent(),
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    Value<String?> syncState = const Value.absent(),
    Value<String?> operationId = const Value.absent(),
    bool? isDeleted,
    String? id,
    String? name,
    Value<String?> ownerId = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> logoUrl = const Value.absent(),
  }) => BusinessesData(
    localUpdatedAt: localUpdatedAt.present
        ? localUpdatedAt.value
        : this.localUpdatedAt,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    syncState: syncState.present ? syncState.value : this.syncState,
    operationId: operationId.present ? operationId.value : this.operationId,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    name: name ?? this.name,
    ownerId: ownerId.present ? ownerId.value : this.ownerId,
    description: description.present ? description.value : this.description,
    logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
  );
  BusinessesData copyWithCompanion(BusinessesCompanion data) {
    return BusinessesData(
      localUpdatedAt: data.localUpdatedAt.present
          ? data.localUpdatedAt.value
          : this.localUpdatedAt,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      description: data.description.present
          ? data.description.value
          : this.description,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessesData(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ownerId: $ownerId, ')
          ..write('description: $description, ')
          ..write('logoUrl: $logoUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    name,
    ownerId,
    description,
    logoUrl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessesData &&
          other.localUpdatedAt == this.localUpdatedAt &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.syncState == this.syncState &&
          other.operationId == this.operationId &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.name == this.name &&
          other.ownerId == this.ownerId &&
          other.description == this.description &&
          other.logoUrl == this.logoUrl);
}

class BusinessesCompanion extends UpdateCompanion<BusinessesData> {
  final Value<DateTime?> localUpdatedAt;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String?> syncState;
  final Value<String?> operationId;
  final Value<bool> isDeleted;
  final Value<String> id;
  final Value<String> name;
  final Value<String?> ownerId;
  final Value<String?> description;
  final Value<String?> logoUrl;
  final Value<int> rowid;
  const BusinessesCompanion({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.description = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BusinessesCompanion.insert({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String id,
    required String name,
    this.ownerId = const Value.absent(),
    this.description = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<BusinessesData> custom({
    Expression<DateTime>? localUpdatedAt,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? syncState,
    Expression<String>? operationId,
    Expression<bool>? isDeleted,
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? ownerId,
    Expression<String>? description,
    Expression<String>? logoUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (syncState != null) 'sync_state': syncState,
      if (operationId != null) 'operation_id': operationId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ownerId != null) 'owner_id': ownerId,
      if (description != null) 'description': description,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BusinessesCompanion copyWith({
    Value<DateTime?>? localUpdatedAt,
    Value<DateTime?>? serverUpdatedAt,
    Value<String?>? syncState,
    Value<String?>? operationId,
    Value<bool>? isDeleted,
    Value<String>? id,
    Value<String>? name,
    Value<String?>? ownerId,
    Value<String?>? description,
    Value<String?>? logoUrl,
    Value<int>? rowid,
  }) {
    return BusinessesCompanion(
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      syncState: syncState ?? this.syncState,
      operationId: operationId ?? this.operationId,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      description: description ?? this.description,
      logoUrl: logoUrl ?? this.logoUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessesCompanion(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ownerId: $ownerId, ')
          ..write('description: $description, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgramsTable extends Programs with TableInfo<$ProgramsTable, Program> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgramsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localUpdatedAtMeta = const VerificationMeta(
    'localUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> localUpdatedAt =
      GeneratedColumn<DateTime>(
        'local_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessIdMeta = const VerificationMeta(
    'businessId',
  );
  @override
  late final GeneratedColumn<String> businessId = GeneratedColumn<String>(
    'business_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    businessId,
    name,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'programs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Program> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_updated_at')) {
      context.handle(
        _localUpdatedAtMeta,
        localUpdatedAt.isAcceptableOrUnknown(
          data['local_updated_at']!,
          _localUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('business_id')) {
      context.handle(
        _businessIdMeta,
        businessId.isAcceptableOrUnknown(data['business_id']!, _businessIdMeta),
      );
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Program map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Program(
      localUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}local_updated_at'],
      ),
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      ),
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      businessId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $ProgramsTable createAlias(String alias) {
    return $ProgramsTable(attachedDatabase, alias);
  }
}

class Program extends DataClass implements Insertable<Program> {
  final DateTime? localUpdatedAt;
  final DateTime? serverUpdatedAt;
  final String? syncState;
  final String? operationId;
  final bool isDeleted;
  final String id;
  final String businessId;
  final String name;
  final String? description;
  const Program({
    this.localUpdatedAt,
    this.serverUpdatedAt,
    this.syncState,
    this.operationId,
    required this.isDeleted,
    required this.id,
    required this.businessId,
    required this.name,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || localUpdatedAt != null) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    }
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    if (!nullToAbsent || syncState != null) {
      map['sync_state'] = Variable<String>(syncState);
    }
    if (!nullToAbsent || operationId != null) {
      map['operation_id'] = Variable<String>(operationId);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<String>(id);
    map['business_id'] = Variable<String>(businessId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  ProgramsCompanion toCompanion(bool nullToAbsent) {
    return ProgramsCompanion(
      localUpdatedAt: localUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(localUpdatedAt),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      syncState: syncState == null && nullToAbsent
          ? const Value.absent()
          : Value(syncState),
      operationId: operationId == null && nullToAbsent
          ? const Value.absent()
          : Value(operationId),
      isDeleted: Value(isDeleted),
      id: Value(id),
      businessId: Value(businessId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Program.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Program(
      localUpdatedAt: serializer.fromJson<DateTime?>(json['localUpdatedAt']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      syncState: serializer.fromJson<String?>(json['syncState']),
      operationId: serializer.fromJson<String?>(json['operationId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<String>(json['id']),
      businessId: serializer.fromJson<String>(json['businessId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localUpdatedAt': serializer.toJson<DateTime?>(localUpdatedAt),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'syncState': serializer.toJson<String?>(syncState),
      'operationId': serializer.toJson<String?>(operationId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<String>(id),
      'businessId': serializer.toJson<String>(businessId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  Program copyWith({
    Value<DateTime?> localUpdatedAt = const Value.absent(),
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    Value<String?> syncState = const Value.absent(),
    Value<String?> operationId = const Value.absent(),
    bool? isDeleted,
    String? id,
    String? businessId,
    String? name,
    Value<String?> description = const Value.absent(),
  }) => Program(
    localUpdatedAt: localUpdatedAt.present
        ? localUpdatedAt.value
        : this.localUpdatedAt,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    syncState: syncState.present ? syncState.value : this.syncState,
    operationId: operationId.present ? operationId.value : this.operationId,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    businessId: businessId ?? this.businessId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
  );
  Program copyWithCompanion(ProgramsCompanion data) {
    return Program(
      localUpdatedAt: data.localUpdatedAt.present
          ? data.localUpdatedAt.value
          : this.localUpdatedAt,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      businessId: data.businessId.present
          ? data.businessId.value
          : this.businessId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Program(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    businessId,
    name,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Program &&
          other.localUpdatedAt == this.localUpdatedAt &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.syncState == this.syncState &&
          other.operationId == this.operationId &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.businessId == this.businessId &&
          other.name == this.name &&
          other.description == this.description);
}

class ProgramsCompanion extends UpdateCompanion<Program> {
  final Value<DateTime?> localUpdatedAt;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String?> syncState;
  final Value<String?> operationId;
  final Value<bool> isDeleted;
  final Value<String> id;
  final Value<String> businessId;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> rowid;
  const ProgramsCompanion({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.businessId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgramsCompanion.insert({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String id,
    required String businessId,
    required String name,
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       businessId = Value(businessId),
       name = Value(name);
  static Insertable<Program> custom({
    Expression<DateTime>? localUpdatedAt,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? syncState,
    Expression<String>? operationId,
    Expression<bool>? isDeleted,
    Expression<String>? id,
    Expression<String>? businessId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (syncState != null) 'sync_state': syncState,
      if (operationId != null) 'operation_id': operationId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (businessId != null) 'business_id': businessId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgramsCompanion copyWith({
    Value<DateTime?>? localUpdatedAt,
    Value<DateTime?>? serverUpdatedAt,
    Value<String?>? syncState,
    Value<String?>? operationId,
    Value<bool>? isDeleted,
    Value<String>? id,
    Value<String>? businessId,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? rowid,
  }) {
    return ProgramsCompanion(
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      syncState: syncState ?? this.syncState,
      operationId: operationId ?? this.operationId,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      name: name ?? this.name,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<String>(businessId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgramsCompanion(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TiersTable extends Tiers with TableInfo<$TiersTable, Tier> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TiersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localUpdatedAtMeta = const VerificationMeta(
    'localUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> localUpdatedAt =
      GeneratedColumn<DateTime>(
        'local_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _programIdMeta = const VerificationMeta(
    'programId',
  );
  @override
  late final GeneratedColumn<String> programId = GeneratedColumn<String>(
    'program_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pointsRequiredMeta = const VerificationMeta(
    'pointsRequired',
  );
  @override
  late final GeneratedColumn<int> pointsRequired = GeneratedColumn<int>(
    'points_required',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _benefitsMeta = const VerificationMeta(
    'benefits',
  );
  @override
  late final GeneratedColumn<String> benefits = GeneratedColumn<String>(
    'benefits',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    programId,
    name,
    pointsRequired,
    benefits,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tiers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tier> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_updated_at')) {
      context.handle(
        _localUpdatedAtMeta,
        localUpdatedAt.isAcceptableOrUnknown(
          data['local_updated_at']!,
          _localUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('program_id')) {
      context.handle(
        _programIdMeta,
        programId.isAcceptableOrUnknown(data['program_id']!, _programIdMeta),
      );
    } else if (isInserting) {
      context.missing(_programIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('points_required')) {
      context.handle(
        _pointsRequiredMeta,
        pointsRequired.isAcceptableOrUnknown(
          data['points_required']!,
          _pointsRequiredMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pointsRequiredMeta);
    }
    if (data.containsKey('benefits')) {
      context.handle(
        _benefitsMeta,
        benefits.isAcceptableOrUnknown(data['benefits']!, _benefitsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tier map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tier(
      localUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}local_updated_at'],
      ),
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      ),
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      programId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}program_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      pointsRequired: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points_required'],
      )!,
      benefits: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}benefits'],
      ),
    );
  }

  @override
  $TiersTable createAlias(String alias) {
    return $TiersTable(attachedDatabase, alias);
  }
}

class Tier extends DataClass implements Insertable<Tier> {
  final DateTime? localUpdatedAt;
  final DateTime? serverUpdatedAt;
  final String? syncState;
  final String? operationId;
  final bool isDeleted;
  final String id;
  final String programId;
  final String name;
  final int pointsRequired;
  final String? benefits;
  const Tier({
    this.localUpdatedAt,
    this.serverUpdatedAt,
    this.syncState,
    this.operationId,
    required this.isDeleted,
    required this.id,
    required this.programId,
    required this.name,
    required this.pointsRequired,
    this.benefits,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || localUpdatedAt != null) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    }
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    if (!nullToAbsent || syncState != null) {
      map['sync_state'] = Variable<String>(syncState);
    }
    if (!nullToAbsent || operationId != null) {
      map['operation_id'] = Variable<String>(operationId);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<String>(id);
    map['program_id'] = Variable<String>(programId);
    map['name'] = Variable<String>(name);
    map['points_required'] = Variable<int>(pointsRequired);
    if (!nullToAbsent || benefits != null) {
      map['benefits'] = Variable<String>(benefits);
    }
    return map;
  }

  TiersCompanion toCompanion(bool nullToAbsent) {
    return TiersCompanion(
      localUpdatedAt: localUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(localUpdatedAt),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      syncState: syncState == null && nullToAbsent
          ? const Value.absent()
          : Value(syncState),
      operationId: operationId == null && nullToAbsent
          ? const Value.absent()
          : Value(operationId),
      isDeleted: Value(isDeleted),
      id: Value(id),
      programId: Value(programId),
      name: Value(name),
      pointsRequired: Value(pointsRequired),
      benefits: benefits == null && nullToAbsent
          ? const Value.absent()
          : Value(benefits),
    );
  }

  factory Tier.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tier(
      localUpdatedAt: serializer.fromJson<DateTime?>(json['localUpdatedAt']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      syncState: serializer.fromJson<String?>(json['syncState']),
      operationId: serializer.fromJson<String?>(json['operationId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<String>(json['id']),
      programId: serializer.fromJson<String>(json['programId']),
      name: serializer.fromJson<String>(json['name']),
      pointsRequired: serializer.fromJson<int>(json['pointsRequired']),
      benefits: serializer.fromJson<String?>(json['benefits']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localUpdatedAt': serializer.toJson<DateTime?>(localUpdatedAt),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'syncState': serializer.toJson<String?>(syncState),
      'operationId': serializer.toJson<String?>(operationId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<String>(id),
      'programId': serializer.toJson<String>(programId),
      'name': serializer.toJson<String>(name),
      'pointsRequired': serializer.toJson<int>(pointsRequired),
      'benefits': serializer.toJson<String?>(benefits),
    };
  }

  Tier copyWith({
    Value<DateTime?> localUpdatedAt = const Value.absent(),
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    Value<String?> syncState = const Value.absent(),
    Value<String?> operationId = const Value.absent(),
    bool? isDeleted,
    String? id,
    String? programId,
    String? name,
    int? pointsRequired,
    Value<String?> benefits = const Value.absent(),
  }) => Tier(
    localUpdatedAt: localUpdatedAt.present
        ? localUpdatedAt.value
        : this.localUpdatedAt,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    syncState: syncState.present ? syncState.value : this.syncState,
    operationId: operationId.present ? operationId.value : this.operationId,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    programId: programId ?? this.programId,
    name: name ?? this.name,
    pointsRequired: pointsRequired ?? this.pointsRequired,
    benefits: benefits.present ? benefits.value : this.benefits,
  );
  Tier copyWithCompanion(TiersCompanion data) {
    return Tier(
      localUpdatedAt: data.localUpdatedAt.present
          ? data.localUpdatedAt.value
          : this.localUpdatedAt,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      programId: data.programId.present ? data.programId.value : this.programId,
      name: data.name.present ? data.name.value : this.name,
      pointsRequired: data.pointsRequired.present
          ? data.pointsRequired.value
          : this.pointsRequired,
      benefits: data.benefits.present ? data.benefits.value : this.benefits,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tier(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('programId: $programId, ')
          ..write('name: $name, ')
          ..write('pointsRequired: $pointsRequired, ')
          ..write('benefits: $benefits')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    programId,
    name,
    pointsRequired,
    benefits,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tier &&
          other.localUpdatedAt == this.localUpdatedAt &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.syncState == this.syncState &&
          other.operationId == this.operationId &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.programId == this.programId &&
          other.name == this.name &&
          other.pointsRequired == this.pointsRequired &&
          other.benefits == this.benefits);
}

class TiersCompanion extends UpdateCompanion<Tier> {
  final Value<DateTime?> localUpdatedAt;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String?> syncState;
  final Value<String?> operationId;
  final Value<bool> isDeleted;
  final Value<String> id;
  final Value<String> programId;
  final Value<String> name;
  final Value<int> pointsRequired;
  final Value<String?> benefits;
  final Value<int> rowid;
  const TiersCompanion({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.programId = const Value.absent(),
    this.name = const Value.absent(),
    this.pointsRequired = const Value.absent(),
    this.benefits = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TiersCompanion.insert({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String id,
    required String programId,
    required String name,
    required int pointsRequired,
    this.benefits = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       programId = Value(programId),
       name = Value(name),
       pointsRequired = Value(pointsRequired);
  static Insertable<Tier> custom({
    Expression<DateTime>? localUpdatedAt,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? syncState,
    Expression<String>? operationId,
    Expression<bool>? isDeleted,
    Expression<String>? id,
    Expression<String>? programId,
    Expression<String>? name,
    Expression<int>? pointsRequired,
    Expression<String>? benefits,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (syncState != null) 'sync_state': syncState,
      if (operationId != null) 'operation_id': operationId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (programId != null) 'program_id': programId,
      if (name != null) 'name': name,
      if (pointsRequired != null) 'points_required': pointsRequired,
      if (benefits != null) 'benefits': benefits,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TiersCompanion copyWith({
    Value<DateTime?>? localUpdatedAt,
    Value<DateTime?>? serverUpdatedAt,
    Value<String?>? syncState,
    Value<String?>? operationId,
    Value<bool>? isDeleted,
    Value<String>? id,
    Value<String>? programId,
    Value<String>? name,
    Value<int>? pointsRequired,
    Value<String?>? benefits,
    Value<int>? rowid,
  }) {
    return TiersCompanion(
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      syncState: syncState ?? this.syncState,
      operationId: operationId ?? this.operationId,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      programId: programId ?? this.programId,
      name: name ?? this.name,
      pointsRequired: pointsRequired ?? this.pointsRequired,
      benefits: benefits ?? this.benefits,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (programId.present) {
      map['program_id'] = Variable<String>(programId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (pointsRequired.present) {
      map['points_required'] = Variable<int>(pointsRequired.value);
    }
    if (benefits.present) {
      map['benefits'] = Variable<String>(benefits.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TiersCompanion(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('programId: $programId, ')
          ..write('name: $name, ')
          ..write('pointsRequired: $pointsRequired, ')
          ..write('benefits: $benefits, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CardsTable extends Cards with TableInfo<$CardsTable, Card> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localUpdatedAtMeta = const VerificationMeta(
    'localUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> localUpdatedAt =
      GeneratedColumn<DateTime>(
        'local_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _programIdMeta = const VerificationMeta(
    'programId',
  );
  @override
  late final GeneratedColumn<String> programId = GeneratedColumn<String>(
    'program_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
    'points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _currentTierIdMeta = const VerificationMeta(
    'currentTierId',
  );
  @override
  late final GeneratedColumn<String> currentTierId = GeneratedColumn<String>(
    'current_tier_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    userId,
    programId,
    points,
    currentTierId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cards';
  @override
  VerificationContext validateIntegrity(
    Insertable<Card> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_updated_at')) {
      context.handle(
        _localUpdatedAtMeta,
        localUpdatedAt.isAcceptableOrUnknown(
          data['local_updated_at']!,
          _localUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('program_id')) {
      context.handle(
        _programIdMeta,
        programId.isAcceptableOrUnknown(data['program_id']!, _programIdMeta),
      );
    } else if (isInserting) {
      context.missing(_programIdMeta);
    }
    if (data.containsKey('points')) {
      context.handle(
        _pointsMeta,
        points.isAcceptableOrUnknown(data['points']!, _pointsMeta),
      );
    }
    if (data.containsKey('current_tier_id')) {
      context.handle(
        _currentTierIdMeta,
        currentTierId.isAcceptableOrUnknown(
          data['current_tier_id']!,
          _currentTierIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Card map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Card(
      localUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}local_updated_at'],
      ),
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      ),
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      programId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}program_id'],
      )!,
      points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points'],
      )!,
      currentTierId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_tier_id'],
      ),
    );
  }

  @override
  $CardsTable createAlias(String alias) {
    return $CardsTable(attachedDatabase, alias);
  }
}

class Card extends DataClass implements Insertable<Card> {
  final DateTime? localUpdatedAt;
  final DateTime? serverUpdatedAt;
  final String? syncState;
  final String? operationId;
  final bool isDeleted;
  final String id;
  final String userId;
  final String programId;
  final int points;
  final String? currentTierId;
  const Card({
    this.localUpdatedAt,
    this.serverUpdatedAt,
    this.syncState,
    this.operationId,
    required this.isDeleted,
    required this.id,
    required this.userId,
    required this.programId,
    required this.points,
    this.currentTierId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || localUpdatedAt != null) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    }
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    if (!nullToAbsent || syncState != null) {
      map['sync_state'] = Variable<String>(syncState);
    }
    if (!nullToAbsent || operationId != null) {
      map['operation_id'] = Variable<String>(operationId);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['program_id'] = Variable<String>(programId);
    map['points'] = Variable<int>(points);
    if (!nullToAbsent || currentTierId != null) {
      map['current_tier_id'] = Variable<String>(currentTierId);
    }
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      localUpdatedAt: localUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(localUpdatedAt),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      syncState: syncState == null && nullToAbsent
          ? const Value.absent()
          : Value(syncState),
      operationId: operationId == null && nullToAbsent
          ? const Value.absent()
          : Value(operationId),
      isDeleted: Value(isDeleted),
      id: Value(id),
      userId: Value(userId),
      programId: Value(programId),
      points: Value(points),
      currentTierId: currentTierId == null && nullToAbsent
          ? const Value.absent()
          : Value(currentTierId),
    );
  }

  factory Card.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Card(
      localUpdatedAt: serializer.fromJson<DateTime?>(json['localUpdatedAt']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      syncState: serializer.fromJson<String?>(json['syncState']),
      operationId: serializer.fromJson<String?>(json['operationId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      programId: serializer.fromJson<String>(json['programId']),
      points: serializer.fromJson<int>(json['points']),
      currentTierId: serializer.fromJson<String?>(json['currentTierId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localUpdatedAt': serializer.toJson<DateTime?>(localUpdatedAt),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'syncState': serializer.toJson<String?>(syncState),
      'operationId': serializer.toJson<String?>(operationId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'programId': serializer.toJson<String>(programId),
      'points': serializer.toJson<int>(points),
      'currentTierId': serializer.toJson<String?>(currentTierId),
    };
  }

  Card copyWith({
    Value<DateTime?> localUpdatedAt = const Value.absent(),
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    Value<String?> syncState = const Value.absent(),
    Value<String?> operationId = const Value.absent(),
    bool? isDeleted,
    String? id,
    String? userId,
    String? programId,
    int? points,
    Value<String?> currentTierId = const Value.absent(),
  }) => Card(
    localUpdatedAt: localUpdatedAt.present
        ? localUpdatedAt.value
        : this.localUpdatedAt,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    syncState: syncState.present ? syncState.value : this.syncState,
    operationId: operationId.present ? operationId.value : this.operationId,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    userId: userId ?? this.userId,
    programId: programId ?? this.programId,
    points: points ?? this.points,
    currentTierId: currentTierId.present
        ? currentTierId.value
        : this.currentTierId,
  );
  Card copyWithCompanion(CardsCompanion data) {
    return Card(
      localUpdatedAt: data.localUpdatedAt.present
          ? data.localUpdatedAt.value
          : this.localUpdatedAt,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      programId: data.programId.present ? data.programId.value : this.programId,
      points: data.points.present ? data.points.value : this.points,
      currentTierId: data.currentTierId.present
          ? data.currentTierId.value
          : this.currentTierId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Card(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('programId: $programId, ')
          ..write('points: $points, ')
          ..write('currentTierId: $currentTierId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    userId,
    programId,
    points,
    currentTierId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Card &&
          other.localUpdatedAt == this.localUpdatedAt &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.syncState == this.syncState &&
          other.operationId == this.operationId &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.programId == this.programId &&
          other.points == this.points &&
          other.currentTierId == this.currentTierId);
}

class CardsCompanion extends UpdateCompanion<Card> {
  final Value<DateTime?> localUpdatedAt;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String?> syncState;
  final Value<String?> operationId;
  final Value<bool> isDeleted;
  final Value<String> id;
  final Value<String> userId;
  final Value<String> programId;
  final Value<int> points;
  final Value<String?> currentTierId;
  final Value<int> rowid;
  const CardsCompanion({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.programId = const Value.absent(),
    this.points = const Value.absent(),
    this.currentTierId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardsCompanion.insert({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String id,
    required String userId,
    required String programId,
    this.points = const Value.absent(),
    this.currentTierId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       programId = Value(programId);
  static Insertable<Card> custom({
    Expression<DateTime>? localUpdatedAt,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? syncState,
    Expression<String>? operationId,
    Expression<bool>? isDeleted,
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? programId,
    Expression<int>? points,
    Expression<String>? currentTierId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (syncState != null) 'sync_state': syncState,
      if (operationId != null) 'operation_id': operationId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (programId != null) 'program_id': programId,
      if (points != null) 'points': points,
      if (currentTierId != null) 'current_tier_id': currentTierId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardsCompanion copyWith({
    Value<DateTime?>? localUpdatedAt,
    Value<DateTime?>? serverUpdatedAt,
    Value<String?>? syncState,
    Value<String?>? operationId,
    Value<bool>? isDeleted,
    Value<String>? id,
    Value<String>? userId,
    Value<String>? programId,
    Value<int>? points,
    Value<String?>? currentTierId,
    Value<int>? rowid,
  }) {
    return CardsCompanion(
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      syncState: syncState ?? this.syncState,
      operationId: operationId ?? this.operationId,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      programId: programId ?? this.programId,
      points: points ?? this.points,
      currentTierId: currentTierId ?? this.currentTierId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (programId.present) {
      map['program_id'] = Variable<String>(programId.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (currentTierId.present) {
      map['current_tier_id'] = Variable<String>(currentTierId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsCompanion(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('programId: $programId, ')
          ..write('points: $points, ')
          ..write('currentTierId: $currentTierId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CardActivitiesTable extends CardActivities
    with TableInfo<$CardActivitiesTable, CardActivity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardActivitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localUpdatedAtMeta = const VerificationMeta(
    'localUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> localUpdatedAt =
      GeneratedColumn<DateTime>(
        'local_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<String> cardId = GeneratedColumn<String>(
    'card_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pointsAddedMeta = const VerificationMeta(
    'pointsAdded',
  );
  @override
  late final GeneratedColumn<int> pointsAdded = GeneratedColumn<int>(
    'points_added',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    cardId,
    pointsAdded,
    description,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'card_activities';
  @override
  VerificationContext validateIntegrity(
    Insertable<CardActivity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_updated_at')) {
      context.handle(
        _localUpdatedAtMeta,
        localUpdatedAt.isAcceptableOrUnknown(
          data['local_updated_at']!,
          _localUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('card_id')) {
      context.handle(
        _cardIdMeta,
        cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('points_added')) {
      context.handle(
        _pointsAddedMeta,
        pointsAdded.isAcceptableOrUnknown(
          data['points_added']!,
          _pointsAddedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pointsAddedMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CardActivity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardActivity(
      localUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}local_updated_at'],
      ),
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      ),
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      cardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}card_id'],
      )!,
      pointsAdded: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points_added'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $CardActivitiesTable createAlias(String alias) {
    return $CardActivitiesTable(attachedDatabase, alias);
  }
}

class CardActivity extends DataClass implements Insertable<CardActivity> {
  final DateTime? localUpdatedAt;
  final DateTime? serverUpdatedAt;
  final String? syncState;
  final String? operationId;
  final bool isDeleted;
  final String id;
  final String cardId;
  final int pointsAdded;
  final String? description;
  final DateTime timestamp;
  const CardActivity({
    this.localUpdatedAt,
    this.serverUpdatedAt,
    this.syncState,
    this.operationId,
    required this.isDeleted,
    required this.id,
    required this.cardId,
    required this.pointsAdded,
    this.description,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || localUpdatedAt != null) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    }
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    if (!nullToAbsent || syncState != null) {
      map['sync_state'] = Variable<String>(syncState);
    }
    if (!nullToAbsent || operationId != null) {
      map['operation_id'] = Variable<String>(operationId);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<String>(id);
    map['card_id'] = Variable<String>(cardId);
    map['points_added'] = Variable<int>(pointsAdded);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  CardActivitiesCompanion toCompanion(bool nullToAbsent) {
    return CardActivitiesCompanion(
      localUpdatedAt: localUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(localUpdatedAt),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      syncState: syncState == null && nullToAbsent
          ? const Value.absent()
          : Value(syncState),
      operationId: operationId == null && nullToAbsent
          ? const Value.absent()
          : Value(operationId),
      isDeleted: Value(isDeleted),
      id: Value(id),
      cardId: Value(cardId),
      pointsAdded: Value(pointsAdded),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      timestamp: Value(timestamp),
    );
  }

  factory CardActivity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardActivity(
      localUpdatedAt: serializer.fromJson<DateTime?>(json['localUpdatedAt']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      syncState: serializer.fromJson<String?>(json['syncState']),
      operationId: serializer.fromJson<String?>(json['operationId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<String>(json['id']),
      cardId: serializer.fromJson<String>(json['cardId']),
      pointsAdded: serializer.fromJson<int>(json['pointsAdded']),
      description: serializer.fromJson<String?>(json['description']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localUpdatedAt': serializer.toJson<DateTime?>(localUpdatedAt),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'syncState': serializer.toJson<String?>(syncState),
      'operationId': serializer.toJson<String?>(operationId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<String>(id),
      'cardId': serializer.toJson<String>(cardId),
      'pointsAdded': serializer.toJson<int>(pointsAdded),
      'description': serializer.toJson<String?>(description),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  CardActivity copyWith({
    Value<DateTime?> localUpdatedAt = const Value.absent(),
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    Value<String?> syncState = const Value.absent(),
    Value<String?> operationId = const Value.absent(),
    bool? isDeleted,
    String? id,
    String? cardId,
    int? pointsAdded,
    Value<String?> description = const Value.absent(),
    DateTime? timestamp,
  }) => CardActivity(
    localUpdatedAt: localUpdatedAt.present
        ? localUpdatedAt.value
        : this.localUpdatedAt,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    syncState: syncState.present ? syncState.value : this.syncState,
    operationId: operationId.present ? operationId.value : this.operationId,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    cardId: cardId ?? this.cardId,
    pointsAdded: pointsAdded ?? this.pointsAdded,
    description: description.present ? description.value : this.description,
    timestamp: timestamp ?? this.timestamp,
  );
  CardActivity copyWithCompanion(CardActivitiesCompanion data) {
    return CardActivity(
      localUpdatedAt: data.localUpdatedAt.present
          ? data.localUpdatedAt.value
          : this.localUpdatedAt,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      pointsAdded: data.pointsAdded.present
          ? data.pointsAdded.value
          : this.pointsAdded,
      description: data.description.present
          ? data.description.value
          : this.description,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardActivity(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('pointsAdded: $pointsAdded, ')
          ..write('description: $description, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    cardId,
    pointsAdded,
    description,
    timestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardActivity &&
          other.localUpdatedAt == this.localUpdatedAt &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.syncState == this.syncState &&
          other.operationId == this.operationId &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.cardId == this.cardId &&
          other.pointsAdded == this.pointsAdded &&
          other.description == this.description &&
          other.timestamp == this.timestamp);
}

class CardActivitiesCompanion extends UpdateCompanion<CardActivity> {
  final Value<DateTime?> localUpdatedAt;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String?> syncState;
  final Value<String?> operationId;
  final Value<bool> isDeleted;
  final Value<String> id;
  final Value<String> cardId;
  final Value<int> pointsAdded;
  final Value<String?> description;
  final Value<DateTime> timestamp;
  final Value<int> rowid;
  const CardActivitiesCompanion({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.cardId = const Value.absent(),
    this.pointsAdded = const Value.absent(),
    this.description = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardActivitiesCompanion.insert({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String id,
    required String cardId,
    required int pointsAdded,
    this.description = const Value.absent(),
    required DateTime timestamp,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       cardId = Value(cardId),
       pointsAdded = Value(pointsAdded),
       timestamp = Value(timestamp);
  static Insertable<CardActivity> custom({
    Expression<DateTime>? localUpdatedAt,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? syncState,
    Expression<String>? operationId,
    Expression<bool>? isDeleted,
    Expression<String>? id,
    Expression<String>? cardId,
    Expression<int>? pointsAdded,
    Expression<String>? description,
    Expression<DateTime>? timestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (syncState != null) 'sync_state': syncState,
      if (operationId != null) 'operation_id': operationId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (cardId != null) 'card_id': cardId,
      if (pointsAdded != null) 'points_added': pointsAdded,
      if (description != null) 'description': description,
      if (timestamp != null) 'timestamp': timestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardActivitiesCompanion copyWith({
    Value<DateTime?>? localUpdatedAt,
    Value<DateTime?>? serverUpdatedAt,
    Value<String?>? syncState,
    Value<String?>? operationId,
    Value<bool>? isDeleted,
    Value<String>? id,
    Value<String>? cardId,
    Value<int>? pointsAdded,
    Value<String?>? description,
    Value<DateTime>? timestamp,
    Value<int>? rowid,
  }) {
    return CardActivitiesCompanion(
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      syncState: syncState ?? this.syncState,
      operationId: operationId ?? this.operationId,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      pointsAdded: pointsAdded ?? this.pointsAdded,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<String>(cardId.value);
    }
    if (pointsAdded.present) {
      map['points_added'] = Variable<int>(pointsAdded.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardActivitiesCompanion(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('cardId: $cardId, ')
          ..write('pointsAdded: $pointsAdded, ')
          ..write('description: $description, ')
          ..write('timestamp: $timestamp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QrScanHistoriesTable extends QrScanHistories
    with TableInfo<$QrScanHistoriesTable, QrScanHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QrScanHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localUpdatedAtMeta = const VerificationMeta(
    'localUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> localUpdatedAt =
      GeneratedColumn<DateTime>(
        'local_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _serverUpdatedAtMeta = const VerificationMeta(
    'serverUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> serverUpdatedAt =
      GeneratedColumn<DateTime>(
        'server_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operationIdMeta = const VerificationMeta(
    'operationId',
  );
  @override
  late final GeneratedColumn<String> operationId = GeneratedColumn<String>(
    'operation_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scannerIdMeta = const VerificationMeta(
    'scannerId',
  );
  @override
  late final GeneratedColumn<String> scannerId = GeneratedColumn<String>(
    'scanner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qrDataMeta = const VerificationMeta('qrData');
  @override
  late final GeneratedColumn<String> qrData = GeneratedColumn<String>(
    'qr_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scanTimeMeta = const VerificationMeta(
    'scanTime',
  );
  @override
  late final GeneratedColumn<DateTime> scanTime = GeneratedColumn<DateTime>(
    'scan_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    scannerId,
    qrData,
    scanTime,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'qr_scan_histories';
  @override
  VerificationContext validateIntegrity(
    Insertable<QrScanHistory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_updated_at')) {
      context.handle(
        _localUpdatedAtMeta,
        localUpdatedAt.isAcceptableOrUnknown(
          data['local_updated_at']!,
          _localUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('server_updated_at')) {
      context.handle(
        _serverUpdatedAtMeta,
        serverUpdatedAt.isAcceptableOrUnknown(
          data['server_updated_at']!,
          _serverUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    if (data.containsKey('operation_id')) {
      context.handle(
        _operationIdMeta,
        operationId.isAcceptableOrUnknown(
          data['operation_id']!,
          _operationIdMeta,
        ),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('scanner_id')) {
      context.handle(
        _scannerIdMeta,
        scannerId.isAcceptableOrUnknown(data['scanner_id']!, _scannerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_scannerIdMeta);
    }
    if (data.containsKey('qr_data')) {
      context.handle(
        _qrDataMeta,
        qrData.isAcceptableOrUnknown(data['qr_data']!, _qrDataMeta),
      );
    } else if (isInserting) {
      context.missing(_qrDataMeta);
    }
    if (data.containsKey('scan_time')) {
      context.handle(
        _scanTimeMeta,
        scanTime.isAcceptableOrUnknown(data['scan_time']!, _scanTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_scanTimeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QrScanHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QrScanHistory(
      localUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}local_updated_at'],
      ),
      serverUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}server_updated_at'],
      ),
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      ),
      operationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_id'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      scannerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scanner_id'],
      )!,
      qrData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}qr_data'],
      )!,
      scanTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scan_time'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $QrScanHistoriesTable createAlias(String alias) {
    return $QrScanHistoriesTable(attachedDatabase, alias);
  }
}

class QrScanHistory extends DataClass implements Insertable<QrScanHistory> {
  final DateTime? localUpdatedAt;
  final DateTime? serverUpdatedAt;
  final String? syncState;
  final String? operationId;
  final bool isDeleted;
  final String id;
  final String scannerId;
  final String qrData;
  final DateTime scanTime;
  final String status;
  const QrScanHistory({
    this.localUpdatedAt,
    this.serverUpdatedAt,
    this.syncState,
    this.operationId,
    required this.isDeleted,
    required this.id,
    required this.scannerId,
    required this.qrData,
    required this.scanTime,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || localUpdatedAt != null) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt);
    }
    if (!nullToAbsent || serverUpdatedAt != null) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt);
    }
    if (!nullToAbsent || syncState != null) {
      map['sync_state'] = Variable<String>(syncState);
    }
    if (!nullToAbsent || operationId != null) {
      map['operation_id'] = Variable<String>(operationId);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<String>(id);
    map['scanner_id'] = Variable<String>(scannerId);
    map['qr_data'] = Variable<String>(qrData);
    map['scan_time'] = Variable<DateTime>(scanTime);
    map['status'] = Variable<String>(status);
    return map;
  }

  QrScanHistoriesCompanion toCompanion(bool nullToAbsent) {
    return QrScanHistoriesCompanion(
      localUpdatedAt: localUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(localUpdatedAt),
      serverUpdatedAt: serverUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(serverUpdatedAt),
      syncState: syncState == null && nullToAbsent
          ? const Value.absent()
          : Value(syncState),
      operationId: operationId == null && nullToAbsent
          ? const Value.absent()
          : Value(operationId),
      isDeleted: Value(isDeleted),
      id: Value(id),
      scannerId: Value(scannerId),
      qrData: Value(qrData),
      scanTime: Value(scanTime),
      status: Value(status),
    );
  }

  factory QrScanHistory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QrScanHistory(
      localUpdatedAt: serializer.fromJson<DateTime?>(json['localUpdatedAt']),
      serverUpdatedAt: serializer.fromJson<DateTime?>(json['serverUpdatedAt']),
      syncState: serializer.fromJson<String?>(json['syncState']),
      operationId: serializer.fromJson<String?>(json['operationId']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<String>(json['id']),
      scannerId: serializer.fromJson<String>(json['scannerId']),
      qrData: serializer.fromJson<String>(json['qrData']),
      scanTime: serializer.fromJson<DateTime>(json['scanTime']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localUpdatedAt': serializer.toJson<DateTime?>(localUpdatedAt),
      'serverUpdatedAt': serializer.toJson<DateTime?>(serverUpdatedAt),
      'syncState': serializer.toJson<String?>(syncState),
      'operationId': serializer.toJson<String?>(operationId),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<String>(id),
      'scannerId': serializer.toJson<String>(scannerId),
      'qrData': serializer.toJson<String>(qrData),
      'scanTime': serializer.toJson<DateTime>(scanTime),
      'status': serializer.toJson<String>(status),
    };
  }

  QrScanHistory copyWith({
    Value<DateTime?> localUpdatedAt = const Value.absent(),
    Value<DateTime?> serverUpdatedAt = const Value.absent(),
    Value<String?> syncState = const Value.absent(),
    Value<String?> operationId = const Value.absent(),
    bool? isDeleted,
    String? id,
    String? scannerId,
    String? qrData,
    DateTime? scanTime,
    String? status,
  }) => QrScanHistory(
    localUpdatedAt: localUpdatedAt.present
        ? localUpdatedAt.value
        : this.localUpdatedAt,
    serverUpdatedAt: serverUpdatedAt.present
        ? serverUpdatedAt.value
        : this.serverUpdatedAt,
    syncState: syncState.present ? syncState.value : this.syncState,
    operationId: operationId.present ? operationId.value : this.operationId,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    scannerId: scannerId ?? this.scannerId,
    qrData: qrData ?? this.qrData,
    scanTime: scanTime ?? this.scanTime,
    status: status ?? this.status,
  );
  QrScanHistory copyWithCompanion(QrScanHistoriesCompanion data) {
    return QrScanHistory(
      localUpdatedAt: data.localUpdatedAt.present
          ? data.localUpdatedAt.value
          : this.localUpdatedAt,
      serverUpdatedAt: data.serverUpdatedAt.present
          ? data.serverUpdatedAt.value
          : this.serverUpdatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
      operationId: data.operationId.present
          ? data.operationId.value
          : this.operationId,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      scannerId: data.scannerId.present ? data.scannerId.value : this.scannerId,
      qrData: data.qrData.present ? data.qrData.value : this.qrData,
      scanTime: data.scanTime.present ? data.scanTime.value : this.scanTime,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QrScanHistory(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('scannerId: $scannerId, ')
          ..write('qrData: $qrData, ')
          ..write('scanTime: $scanTime, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    localUpdatedAt,
    serverUpdatedAt,
    syncState,
    operationId,
    isDeleted,
    id,
    scannerId,
    qrData,
    scanTime,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QrScanHistory &&
          other.localUpdatedAt == this.localUpdatedAt &&
          other.serverUpdatedAt == this.serverUpdatedAt &&
          other.syncState == this.syncState &&
          other.operationId == this.operationId &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.scannerId == this.scannerId &&
          other.qrData == this.qrData &&
          other.scanTime == this.scanTime &&
          other.status == this.status);
}

class QrScanHistoriesCompanion extends UpdateCompanion<QrScanHistory> {
  final Value<DateTime?> localUpdatedAt;
  final Value<DateTime?> serverUpdatedAt;
  final Value<String?> syncState;
  final Value<String?> operationId;
  final Value<bool> isDeleted;
  final Value<String> id;
  final Value<String> scannerId;
  final Value<String> qrData;
  final Value<DateTime> scanTime;
  final Value<String> status;
  final Value<int> rowid;
  const QrScanHistoriesCompanion({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.scannerId = const Value.absent(),
    this.qrData = const Value.absent(),
    this.scanTime = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QrScanHistoriesCompanion.insert({
    this.localUpdatedAt = const Value.absent(),
    this.serverUpdatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.operationId = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String id,
    required String scannerId,
    required String qrData,
    required DateTime scanTime,
    required String status,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       scannerId = Value(scannerId),
       qrData = Value(qrData),
       scanTime = Value(scanTime),
       status = Value(status);
  static Insertable<QrScanHistory> custom({
    Expression<DateTime>? localUpdatedAt,
    Expression<DateTime>? serverUpdatedAt,
    Expression<String>? syncState,
    Expression<String>? operationId,
    Expression<bool>? isDeleted,
    Expression<String>? id,
    Expression<String>? scannerId,
    Expression<String>? qrData,
    Expression<DateTime>? scanTime,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localUpdatedAt != null) 'local_updated_at': localUpdatedAt,
      if (serverUpdatedAt != null) 'server_updated_at': serverUpdatedAt,
      if (syncState != null) 'sync_state': syncState,
      if (operationId != null) 'operation_id': operationId,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (scannerId != null) 'scanner_id': scannerId,
      if (qrData != null) 'qr_data': qrData,
      if (scanTime != null) 'scan_time': scanTime,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QrScanHistoriesCompanion copyWith({
    Value<DateTime?>? localUpdatedAt,
    Value<DateTime?>? serverUpdatedAt,
    Value<String?>? syncState,
    Value<String?>? operationId,
    Value<bool>? isDeleted,
    Value<String>? id,
    Value<String>? scannerId,
    Value<String>? qrData,
    Value<DateTime>? scanTime,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return QrScanHistoriesCompanion(
      localUpdatedAt: localUpdatedAt ?? this.localUpdatedAt,
      serverUpdatedAt: serverUpdatedAt ?? this.serverUpdatedAt,
      syncState: syncState ?? this.syncState,
      operationId: operationId ?? this.operationId,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      scannerId: scannerId ?? this.scannerId,
      qrData: qrData ?? this.qrData,
      scanTime: scanTime ?? this.scanTime,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localUpdatedAt.present) {
      map['local_updated_at'] = Variable<DateTime>(localUpdatedAt.value);
    }
    if (serverUpdatedAt.present) {
      map['server_updated_at'] = Variable<DateTime>(serverUpdatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (operationId.present) {
      map['operation_id'] = Variable<String>(operationId.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (scannerId.present) {
      map['scanner_id'] = Variable<String>(scannerId.value);
    }
    if (qrData.present) {
      map['qr_data'] = Variable<String>(qrData.value);
    }
    if (scanTime.present) {
      map['scan_time'] = Variable<DateTime>(scanTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QrScanHistoriesCompanion(')
          ..write('localUpdatedAt: $localUpdatedAt, ')
          ..write('serverUpdatedAt: $serverUpdatedAt, ')
          ..write('syncState: $syncState, ')
          ..write('operationId: $operationId, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('scannerId: $scannerId, ')
          ..write('qrData: $qrData, ')
          ..write('scanTime: $scanTime, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueuesTable extends SyncQueues
    with TableInfo<$SyncQueuesTable, SyncQueue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _operationTypeMeta = const VerificationMeta(
    'operationType',
  );
  @override
  late final GeneratedColumn<String> operationType = GeneratedColumn<String>(
    'operation_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modelNameMeta = const VerificationMeta(
    'modelName',
  );
  @override
  late final GeneratedColumn<String> modelName = GeneratedColumn<String>(
    'model_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    operationType,
    modelName,
    entityId,
    payload,
    createdAt,
    retryCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queues';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueue> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('operation_type')) {
      context.handle(
        _operationTypeMeta,
        operationType.isAcceptableOrUnknown(
          data['operation_type']!,
          _operationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operationTypeMeta);
    }
    if (data.containsKey('model_name')) {
      context.handle(
        _modelNameMeta,
        modelName.isAcceptableOrUnknown(data['model_name']!, _modelNameMeta),
      );
    } else if (isInserting) {
      context.missing(_modelNameMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueue map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueue(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      operationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation_type'],
      )!,
      modelName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_name'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
    );
  }

  @override
  $SyncQueuesTable createAlias(String alias) {
    return $SyncQueuesTable(attachedDatabase, alias);
  }
}

class SyncQueue extends DataClass implements Insertable<SyncQueue> {
  final int id;
  final String operationType;
  final String modelName;
  final String entityId;
  final String payload;
  final DateTime createdAt;
  final int retryCount;
  const SyncQueue({
    required this.id,
    required this.operationType,
    required this.modelName,
    required this.entityId,
    required this.payload,
    required this.createdAt,
    required this.retryCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['operation_type'] = Variable<String>(operationType);
    map['model_name'] = Variable<String>(modelName);
    map['entity_id'] = Variable<String>(entityId);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['retry_count'] = Variable<int>(retryCount);
    return map;
  }

  SyncQueuesCompanion toCompanion(bool nullToAbsent) {
    return SyncQueuesCompanion(
      id: Value(id),
      operationType: Value(operationType),
      modelName: Value(modelName),
      entityId: Value(entityId),
      payload: Value(payload),
      createdAt: Value(createdAt),
      retryCount: Value(retryCount),
    );
  }

  factory SyncQueue.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueue(
      id: serializer.fromJson<int>(json['id']),
      operationType: serializer.fromJson<String>(json['operationType']),
      modelName: serializer.fromJson<String>(json['modelName']),
      entityId: serializer.fromJson<String>(json['entityId']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'operationType': serializer.toJson<String>(operationType),
      'modelName': serializer.toJson<String>(modelName),
      'entityId': serializer.toJson<String>(entityId),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'retryCount': serializer.toJson<int>(retryCount),
    };
  }

  SyncQueue copyWith({
    int? id,
    String? operationType,
    String? modelName,
    String? entityId,
    String? payload,
    DateTime? createdAt,
    int? retryCount,
  }) => SyncQueue(
    id: id ?? this.id,
    operationType: operationType ?? this.operationType,
    modelName: modelName ?? this.modelName,
    entityId: entityId ?? this.entityId,
    payload: payload ?? this.payload,
    createdAt: createdAt ?? this.createdAt,
    retryCount: retryCount ?? this.retryCount,
  );
  SyncQueue copyWithCompanion(SyncQueuesCompanion data) {
    return SyncQueue(
      id: data.id.present ? data.id.value : this.id,
      operationType: data.operationType.present
          ? data.operationType.value
          : this.operationType,
      modelName: data.modelName.present ? data.modelName.value : this.modelName,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueue(')
          ..write('id: $id, ')
          ..write('operationType: $operationType, ')
          ..write('modelName: $modelName, ')
          ..write('entityId: $entityId, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    operationType,
    modelName,
    entityId,
    payload,
    createdAt,
    retryCount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueue &&
          other.id == this.id &&
          other.operationType == this.operationType &&
          other.modelName == this.modelName &&
          other.entityId == this.entityId &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt &&
          other.retryCount == this.retryCount);
}

class SyncQueuesCompanion extends UpdateCompanion<SyncQueue> {
  final Value<int> id;
  final Value<String> operationType;
  final Value<String> modelName;
  final Value<String> entityId;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  final Value<int> retryCount;
  const SyncQueuesCompanion({
    this.id = const Value.absent(),
    this.operationType = const Value.absent(),
    this.modelName = const Value.absent(),
    this.entityId = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.retryCount = const Value.absent(),
  });
  SyncQueuesCompanion.insert({
    this.id = const Value.absent(),
    required String operationType,
    required String modelName,
    required String entityId,
    required String payload,
    required DateTime createdAt,
    this.retryCount = const Value.absent(),
  }) : operationType = Value(operationType),
       modelName = Value(modelName),
       entityId = Value(entityId),
       payload = Value(payload),
       createdAt = Value(createdAt);
  static Insertable<SyncQueue> custom({
    Expression<int>? id,
    Expression<String>? operationType,
    Expression<String>? modelName,
    Expression<String>? entityId,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<int>? retryCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (operationType != null) 'operation_type': operationType,
      if (modelName != null) 'model_name': modelName,
      if (entityId != null) 'entity_id': entityId,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (retryCount != null) 'retry_count': retryCount,
    });
  }

  SyncQueuesCompanion copyWith({
    Value<int>? id,
    Value<String>? operationType,
    Value<String>? modelName,
    Value<String>? entityId,
    Value<String>? payload,
    Value<DateTime>? createdAt,
    Value<int>? retryCount,
  }) {
    return SyncQueuesCompanion(
      id: id ?? this.id,
      operationType: operationType ?? this.operationType,
      modelName: modelName ?? this.modelName,
      entityId: entityId ?? this.entityId,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      retryCount: retryCount ?? this.retryCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (operationType.present) {
      map['operation_type'] = Variable<String>(operationType.value);
    }
    if (modelName.present) {
      map['model_name'] = Variable<String>(modelName.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueuesCompanion(')
          ..write('id: $id, ')
          ..write('operationType: $operationType, ')
          ..write('modelName: $modelName, ')
          ..write('entityId: $entityId, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount')
          ..write(')'))
        .toString();
  }
}

class $SyncMetadatasTable extends SyncMetadatas
    with TableInfo<$SyncMetadatasTable, SyncMetadata> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetadatasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _modelNameMeta = const VerificationMeta(
    'modelName',
  );
  @override
  late final GeneratedColumn<String> modelName = GeneratedColumn<String>(
    'model_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSyncedAtMeta = const VerificationMeta(
    'lastSyncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
    'last_synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [modelName, lastSyncedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_metadatas';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncMetadata> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('model_name')) {
      context.handle(
        _modelNameMeta,
        modelName.isAcceptableOrUnknown(data['model_name']!, _modelNameMeta),
      );
    } else if (isInserting) {
      context.missing(_modelNameMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
        _lastSyncedAtMeta,
        lastSyncedAt.isAcceptableOrUnknown(
          data['last_synced_at']!,
          _lastSyncedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastSyncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {modelName};
  @override
  SyncMetadata map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadata(
      modelName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_name'],
      )!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced_at'],
      )!,
    );
  }

  @override
  $SyncMetadatasTable createAlias(String alias) {
    return $SyncMetadatasTable(attachedDatabase, alias);
  }
}

class SyncMetadata extends DataClass implements Insertable<SyncMetadata> {
  final String modelName;
  final DateTime lastSyncedAt;
  const SyncMetadata({required this.modelName, required this.lastSyncedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['model_name'] = Variable<String>(modelName);
    map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    return map;
  }

  SyncMetadatasCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadatasCompanion(
      modelName: Value(modelName),
      lastSyncedAt: Value(lastSyncedAt),
    );
  }

  factory SyncMetadata.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadata(
      modelName: serializer.fromJson<String>(json['modelName']),
      lastSyncedAt: serializer.fromJson<DateTime>(json['lastSyncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'modelName': serializer.toJson<String>(modelName),
      'lastSyncedAt': serializer.toJson<DateTime>(lastSyncedAt),
    };
  }

  SyncMetadata copyWith({String? modelName, DateTime? lastSyncedAt}) =>
      SyncMetadata(
        modelName: modelName ?? this.modelName,
        lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      );
  SyncMetadata copyWithCompanion(SyncMetadatasCompanion data) {
    return SyncMetadata(
      modelName: data.modelName.present ? data.modelName.value : this.modelName,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadata(')
          ..write('modelName: $modelName, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(modelName, lastSyncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetadata &&
          other.modelName == this.modelName &&
          other.lastSyncedAt == this.lastSyncedAt);
}

class SyncMetadatasCompanion extends UpdateCompanion<SyncMetadata> {
  final Value<String> modelName;
  final Value<DateTime> lastSyncedAt;
  final Value<int> rowid;
  const SyncMetadatasCompanion({
    this.modelName = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetadatasCompanion.insert({
    required String modelName,
    required DateTime lastSyncedAt,
    this.rowid = const Value.absent(),
  }) : modelName = Value(modelName),
       lastSyncedAt = Value(lastSyncedAt);
  static Insertable<SyncMetadata> custom({
    Expression<String>? modelName,
    Expression<DateTime>? lastSyncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (modelName != null) 'model_name': modelName,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetadatasCompanion copyWith({
    Value<String>? modelName,
    Value<DateTime>? lastSyncedAt,
    Value<int>? rowid,
  }) {
    return SyncMetadatasCompanion(
      modelName: modelName ?? this.modelName,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (modelName.present) {
      map['model_name'] = Variable<String>(modelName.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadatasCompanion(')
          ..write('modelName: $modelName, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  late final $BusinessesTable businesses = $BusinessesTable(this);
  late final $ProgramsTable programs = $ProgramsTable(this);
  late final $TiersTable tiers = $TiersTable(this);
  late final $CardsTable cards = $CardsTable(this);
  late final $CardActivitiesTable cardActivities = $CardActivitiesTable(this);
  late final $QrScanHistoriesTable qrScanHistories = $QrScanHistoriesTable(
    this,
  );
  late final $SyncQueuesTable syncQueues = $SyncQueuesTable(this);
  late final $SyncMetadatasTable syncMetadatas = $SyncMetadatasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    profiles,
    businesses,
    programs,
    tiers,
    cards,
    cardActivities,
    qrScanHistories,
    syncQueues,
    syncMetadatas,
  ];
}

typedef $$ProfilesTableCreateCompanionBuilder =
    ProfilesCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      required String id,
      Value<String?> firebaseUid,
      Value<String?> email,
      Value<String?> displayName,
      Value<String?> role,
      Value<int> rowid,
    });
typedef $$ProfilesTableUpdateCompanionBuilder =
    ProfilesCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      Value<String> id,
      Value<String?> firebaseUid,
      Value<String?> email,
      Value<String?> displayName,
      Value<String?> role,
      Value<int> rowid,
    });

class $$ProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  GeneratedColumn<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);
}

class $$ProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTable,
          Profile,
          $$ProfilesTableFilterComposer,
          $$ProfilesTableOrderingComposer,
          $$ProfilesTableAnnotationComposer,
          $$ProfilesTableCreateCompanionBuilder,
          $$ProfilesTableUpdateCompanionBuilder,
          (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
          Profile,
          PrefetchHooks Function()
        > {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String?> firebaseUid = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> role = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfilesCompanion(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                firebaseUid: firebaseUid,
                email: email,
                displayName: displayName,
                role: role,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required String id,
                Value<String?> firebaseUid = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> role = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfilesCompanion.insert(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                firebaseUid: firebaseUid,
                email: email,
                displayName: displayName,
                role: role,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTable,
      Profile,
      $$ProfilesTableFilterComposer,
      $$ProfilesTableOrderingComposer,
      $$ProfilesTableAnnotationComposer,
      $$ProfilesTableCreateCompanionBuilder,
      $$ProfilesTableUpdateCompanionBuilder,
      (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
      Profile,
      PrefetchHooks Function()
    >;
typedef $$BusinessesTableCreateCompanionBuilder =
    BusinessesCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      required String id,
      required String name,
      Value<String?> ownerId,
      Value<String?> description,
      Value<String?> logoUrl,
      Value<int> rowid,
    });
typedef $$BusinessesTableUpdateCompanionBuilder =
    BusinessesCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      Value<String> id,
      Value<String> name,
      Value<String?> ownerId,
      Value<String?> description,
      Value<String?> logoUrl,
      Value<int> rowid,
    });

class $$BusinessesTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessesTable> {
  $$BusinessesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BusinessesTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessesTable> {
  $$BusinessesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoUrl => $composableBuilder(
    column: $table.logoUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BusinessesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessesTable> {
  $$BusinessesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  GeneratedColumn<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);
}

class $$BusinessesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusinessesTable,
          BusinessesData,
          $$BusinessesTableFilterComposer,
          $$BusinessesTableOrderingComposer,
          $$BusinessesTableAnnotationComposer,
          $$BusinessesTableCreateCompanionBuilder,
          $$BusinessesTableUpdateCompanionBuilder,
          (
            BusinessesData,
            BaseReferences<_$AppDatabase, $BusinessesTable, BusinessesData>,
          ),
          BusinessesData,
          PrefetchHooks Function()
        > {
  $$BusinessesTableTableManager(_$AppDatabase db, $BusinessesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> ownerId = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BusinessesCompanion(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                name: name,
                ownerId: ownerId,
                description: description,
                logoUrl: logoUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required String id,
                required String name,
                Value<String?> ownerId = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> logoUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BusinessesCompanion.insert(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                name: name,
                ownerId: ownerId,
                description: description,
                logoUrl: logoUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BusinessesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusinessesTable,
      BusinessesData,
      $$BusinessesTableFilterComposer,
      $$BusinessesTableOrderingComposer,
      $$BusinessesTableAnnotationComposer,
      $$BusinessesTableCreateCompanionBuilder,
      $$BusinessesTableUpdateCompanionBuilder,
      (
        BusinessesData,
        BaseReferences<_$AppDatabase, $BusinessesTable, BusinessesData>,
      ),
      BusinessesData,
      PrefetchHooks Function()
    >;
typedef $$ProgramsTableCreateCompanionBuilder =
    ProgramsCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      required String id,
      required String businessId,
      required String name,
      Value<String?> description,
      Value<int> rowid,
    });
typedef $$ProgramsTableUpdateCompanionBuilder =
    ProgramsCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      Value<String> id,
      Value<String> businessId,
      Value<String> name,
      Value<String?> description,
      Value<int> rowid,
    });

class $$ProgramsTableFilterComposer
    extends Composer<_$AppDatabase, $ProgramsTable> {
  $$ProgramsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessId => $composableBuilder(
    column: $table.businessId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProgramsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgramsTable> {
  $$ProgramsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessId => $composableBuilder(
    column: $table.businessId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProgramsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgramsTable> {
  $$ProgramsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  GeneratedColumn<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get businessId => $composableBuilder(
    column: $table.businessId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$ProgramsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgramsTable,
          Program,
          $$ProgramsTableFilterComposer,
          $$ProgramsTableOrderingComposer,
          $$ProgramsTableAnnotationComposer,
          $$ProgramsTableCreateCompanionBuilder,
          $$ProgramsTableUpdateCompanionBuilder,
          (Program, BaseReferences<_$AppDatabase, $ProgramsTable, Program>),
          Program,
          PrefetchHooks Function()
        > {
  $$ProgramsTableTableManager(_$AppDatabase db, $ProgramsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgramsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgramsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProgramsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> businessId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgramsCompanion(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                businessId: businessId,
                name: name,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required String id,
                required String businessId,
                required String name,
                Value<String?> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgramsCompanion.insert(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                businessId: businessId,
                name: name,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProgramsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgramsTable,
      Program,
      $$ProgramsTableFilterComposer,
      $$ProgramsTableOrderingComposer,
      $$ProgramsTableAnnotationComposer,
      $$ProgramsTableCreateCompanionBuilder,
      $$ProgramsTableUpdateCompanionBuilder,
      (Program, BaseReferences<_$AppDatabase, $ProgramsTable, Program>),
      Program,
      PrefetchHooks Function()
    >;
typedef $$TiersTableCreateCompanionBuilder =
    TiersCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      required String id,
      required String programId,
      required String name,
      required int pointsRequired,
      Value<String?> benefits,
      Value<int> rowid,
    });
typedef $$TiersTableUpdateCompanionBuilder =
    TiersCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      Value<String> id,
      Value<String> programId,
      Value<String> name,
      Value<int> pointsRequired,
      Value<String?> benefits,
      Value<int> rowid,
    });

class $$TiersTableFilterComposer extends Composer<_$AppDatabase, $TiersTable> {
  $$TiersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get programId => $composableBuilder(
    column: $table.programId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pointsRequired => $composableBuilder(
    column: $table.pointsRequired,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get benefits => $composableBuilder(
    column: $table.benefits,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TiersTableOrderingComposer
    extends Composer<_$AppDatabase, $TiersTable> {
  $$TiersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get programId => $composableBuilder(
    column: $table.programId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pointsRequired => $composableBuilder(
    column: $table.pointsRequired,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get benefits => $composableBuilder(
    column: $table.benefits,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TiersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TiersTable> {
  $$TiersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  GeneratedColumn<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get programId =>
      $composableBuilder(column: $table.programId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get pointsRequired => $composableBuilder(
    column: $table.pointsRequired,
    builder: (column) => column,
  );

  GeneratedColumn<String> get benefits =>
      $composableBuilder(column: $table.benefits, builder: (column) => column);
}

class $$TiersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TiersTable,
          Tier,
          $$TiersTableFilterComposer,
          $$TiersTableOrderingComposer,
          $$TiersTableAnnotationComposer,
          $$TiersTableCreateCompanionBuilder,
          $$TiersTableUpdateCompanionBuilder,
          (Tier, BaseReferences<_$AppDatabase, $TiersTable, Tier>),
          Tier,
          PrefetchHooks Function()
        > {
  $$TiersTableTableManager(_$AppDatabase db, $TiersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TiersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TiersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TiersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> programId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> pointsRequired = const Value.absent(),
                Value<String?> benefits = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TiersCompanion(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                programId: programId,
                name: name,
                pointsRequired: pointsRequired,
                benefits: benefits,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required String id,
                required String programId,
                required String name,
                required int pointsRequired,
                Value<String?> benefits = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TiersCompanion.insert(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                programId: programId,
                name: name,
                pointsRequired: pointsRequired,
                benefits: benefits,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TiersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TiersTable,
      Tier,
      $$TiersTableFilterComposer,
      $$TiersTableOrderingComposer,
      $$TiersTableAnnotationComposer,
      $$TiersTableCreateCompanionBuilder,
      $$TiersTableUpdateCompanionBuilder,
      (Tier, BaseReferences<_$AppDatabase, $TiersTable, Tier>),
      Tier,
      PrefetchHooks Function()
    >;
typedef $$CardsTableCreateCompanionBuilder =
    CardsCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      required String id,
      required String userId,
      required String programId,
      Value<int> points,
      Value<String?> currentTierId,
      Value<int> rowid,
    });
typedef $$CardsTableUpdateCompanionBuilder =
    CardsCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      Value<String> id,
      Value<String> userId,
      Value<String> programId,
      Value<int> points,
      Value<String?> currentTierId,
      Value<int> rowid,
    });

class $$CardsTableFilterComposer extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get programId => $composableBuilder(
    column: $table.programId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentTierId => $composableBuilder(
    column: $table.currentTierId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CardsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get programId => $composableBuilder(
    column: $table.programId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentTierId => $composableBuilder(
    column: $table.currentTierId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  GeneratedColumn<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get programId =>
      $composableBuilder(column: $table.programId, builder: (column) => column);

  GeneratedColumn<int> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);

  GeneratedColumn<String> get currentTierId => $composableBuilder(
    column: $table.currentTierId,
    builder: (column) => column,
  );
}

class $$CardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CardsTable,
          Card,
          $$CardsTableFilterComposer,
          $$CardsTableOrderingComposer,
          $$CardsTableAnnotationComposer,
          $$CardsTableCreateCompanionBuilder,
          $$CardsTableUpdateCompanionBuilder,
          (Card, BaseReferences<_$AppDatabase, $CardsTable, Card>),
          Card,
          PrefetchHooks Function()
        > {
  $$CardsTableTableManager(_$AppDatabase db, $CardsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> programId = const Value.absent(),
                Value<int> points = const Value.absent(),
                Value<String?> currentTierId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardsCompanion(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                userId: userId,
                programId: programId,
                points: points,
                currentTierId: currentTierId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required String id,
                required String userId,
                required String programId,
                Value<int> points = const Value.absent(),
                Value<String?> currentTierId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardsCompanion.insert(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                userId: userId,
                programId: programId,
                points: points,
                currentTierId: currentTierId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CardsTable,
      Card,
      $$CardsTableFilterComposer,
      $$CardsTableOrderingComposer,
      $$CardsTableAnnotationComposer,
      $$CardsTableCreateCompanionBuilder,
      $$CardsTableUpdateCompanionBuilder,
      (Card, BaseReferences<_$AppDatabase, $CardsTable, Card>),
      Card,
      PrefetchHooks Function()
    >;
typedef $$CardActivitiesTableCreateCompanionBuilder =
    CardActivitiesCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      required String id,
      required String cardId,
      required int pointsAdded,
      Value<String?> description,
      required DateTime timestamp,
      Value<int> rowid,
    });
typedef $$CardActivitiesTableUpdateCompanionBuilder =
    CardActivitiesCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      Value<String> id,
      Value<String> cardId,
      Value<int> pointsAdded,
      Value<String?> description,
      Value<DateTime> timestamp,
      Value<int> rowid,
    });

class $$CardActivitiesTableFilterComposer
    extends Composer<_$AppDatabase, $CardActivitiesTable> {
  $$CardActivitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cardId => $composableBuilder(
    column: $table.cardId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pointsAdded => $composableBuilder(
    column: $table.pointsAdded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CardActivitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $CardActivitiesTable> {
  $$CardActivitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cardId => $composableBuilder(
    column: $table.cardId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pointsAdded => $composableBuilder(
    column: $table.pointsAdded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CardActivitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardActivitiesTable> {
  $$CardActivitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  GeneratedColumn<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cardId =>
      $composableBuilder(column: $table.cardId, builder: (column) => column);

  GeneratedColumn<int> get pointsAdded => $composableBuilder(
    column: $table.pointsAdded,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$CardActivitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CardActivitiesTable,
          CardActivity,
          $$CardActivitiesTableFilterComposer,
          $$CardActivitiesTableOrderingComposer,
          $$CardActivitiesTableAnnotationComposer,
          $$CardActivitiesTableCreateCompanionBuilder,
          $$CardActivitiesTableUpdateCompanionBuilder,
          (
            CardActivity,
            BaseReferences<_$AppDatabase, $CardActivitiesTable, CardActivity>,
          ),
          CardActivity,
          PrefetchHooks Function()
        > {
  $$CardActivitiesTableTableManager(
    _$AppDatabase db,
    $CardActivitiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardActivitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardActivitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardActivitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> cardId = const Value.absent(),
                Value<int> pointsAdded = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CardActivitiesCompanion(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                cardId: cardId,
                pointsAdded: pointsAdded,
                description: description,
                timestamp: timestamp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required String id,
                required String cardId,
                required int pointsAdded,
                Value<String?> description = const Value.absent(),
                required DateTime timestamp,
                Value<int> rowid = const Value.absent(),
              }) => CardActivitiesCompanion.insert(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                cardId: cardId,
                pointsAdded: pointsAdded,
                description: description,
                timestamp: timestamp,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CardActivitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CardActivitiesTable,
      CardActivity,
      $$CardActivitiesTableFilterComposer,
      $$CardActivitiesTableOrderingComposer,
      $$CardActivitiesTableAnnotationComposer,
      $$CardActivitiesTableCreateCompanionBuilder,
      $$CardActivitiesTableUpdateCompanionBuilder,
      (
        CardActivity,
        BaseReferences<_$AppDatabase, $CardActivitiesTable, CardActivity>,
      ),
      CardActivity,
      PrefetchHooks Function()
    >;
typedef $$QrScanHistoriesTableCreateCompanionBuilder =
    QrScanHistoriesCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      required String id,
      required String scannerId,
      required String qrData,
      required DateTime scanTime,
      required String status,
      Value<int> rowid,
    });
typedef $$QrScanHistoriesTableUpdateCompanionBuilder =
    QrScanHistoriesCompanion Function({
      Value<DateTime?> localUpdatedAt,
      Value<DateTime?> serverUpdatedAt,
      Value<String?> syncState,
      Value<String?> operationId,
      Value<bool> isDeleted,
      Value<String> id,
      Value<String> scannerId,
      Value<String> qrData,
      Value<DateTime> scanTime,
      Value<String> status,
      Value<int> rowid,
    });

class $$QrScanHistoriesTableFilterComposer
    extends Composer<_$AppDatabase, $QrScanHistoriesTable> {
  $$QrScanHistoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scannerId => $composableBuilder(
    column: $table.scannerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get qrData => $composableBuilder(
    column: $table.qrData,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scanTime => $composableBuilder(
    column: $table.scanTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QrScanHistoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $QrScanHistoriesTable> {
  $$QrScanHistoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scannerId => $composableBuilder(
    column: $table.scannerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get qrData => $composableBuilder(
    column: $table.qrData,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scanTime => $composableBuilder(
    column: $table.scanTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QrScanHistoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $QrScanHistoriesTable> {
  $$QrScanHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get localUpdatedAt => $composableBuilder(
    column: $table.localUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get serverUpdatedAt => $composableBuilder(
    column: $table.serverUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  GeneratedColumn<String> get operationId => $composableBuilder(
    column: $table.operationId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get scannerId =>
      $composableBuilder(column: $table.scannerId, builder: (column) => column);

  GeneratedColumn<String> get qrData =>
      $composableBuilder(column: $table.qrData, builder: (column) => column);

  GeneratedColumn<DateTime> get scanTime =>
      $composableBuilder(column: $table.scanTime, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$QrScanHistoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QrScanHistoriesTable,
          QrScanHistory,
          $$QrScanHistoriesTableFilterComposer,
          $$QrScanHistoriesTableOrderingComposer,
          $$QrScanHistoriesTableAnnotationComposer,
          $$QrScanHistoriesTableCreateCompanionBuilder,
          $$QrScanHistoriesTableUpdateCompanionBuilder,
          (
            QrScanHistory,
            BaseReferences<_$AppDatabase, $QrScanHistoriesTable, QrScanHistory>,
          ),
          QrScanHistory,
          PrefetchHooks Function()
        > {
  $$QrScanHistoriesTableTableManager(
    _$AppDatabase db,
    $QrScanHistoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QrScanHistoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QrScanHistoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QrScanHistoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> scannerId = const Value.absent(),
                Value<String> qrData = const Value.absent(),
                Value<DateTime> scanTime = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QrScanHistoriesCompanion(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                scannerId: scannerId,
                qrData: qrData,
                scanTime: scanTime,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime?> localUpdatedAt = const Value.absent(),
                Value<DateTime?> serverUpdatedAt = const Value.absent(),
                Value<String?> syncState = const Value.absent(),
                Value<String?> operationId = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required String id,
                required String scannerId,
                required String qrData,
                required DateTime scanTime,
                required String status,
                Value<int> rowid = const Value.absent(),
              }) => QrScanHistoriesCompanion.insert(
                localUpdatedAt: localUpdatedAt,
                serverUpdatedAt: serverUpdatedAt,
                syncState: syncState,
                operationId: operationId,
                isDeleted: isDeleted,
                id: id,
                scannerId: scannerId,
                qrData: qrData,
                scanTime: scanTime,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QrScanHistoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QrScanHistoriesTable,
      QrScanHistory,
      $$QrScanHistoriesTableFilterComposer,
      $$QrScanHistoriesTableOrderingComposer,
      $$QrScanHistoriesTableAnnotationComposer,
      $$QrScanHistoriesTableCreateCompanionBuilder,
      $$QrScanHistoriesTableUpdateCompanionBuilder,
      (
        QrScanHistory,
        BaseReferences<_$AppDatabase, $QrScanHistoriesTable, QrScanHistory>,
      ),
      QrScanHistory,
      PrefetchHooks Function()
    >;
typedef $$SyncQueuesTableCreateCompanionBuilder =
    SyncQueuesCompanion Function({
      Value<int> id,
      required String operationType,
      required String modelName,
      required String entityId,
      required String payload,
      required DateTime createdAt,
      Value<int> retryCount,
    });
typedef $$SyncQueuesTableUpdateCompanionBuilder =
    SyncQueuesCompanion Function({
      Value<int> id,
      Value<String> operationType,
      Value<String> modelName,
      Value<String> entityId,
      Value<String> payload,
      Value<DateTime> createdAt,
      Value<int> retryCount,
    });

class $$SyncQueuesTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueuesTable> {
  $$SyncQueuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelName => $composableBuilder(
    column: $table.modelName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueuesTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueuesTable> {
  $$SyncQueuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelName => $composableBuilder(
    column: $table.modelName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueuesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueuesTable> {
  $$SyncQueuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get modelName =>
      $composableBuilder(column: $table.modelName, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );
}

class $$SyncQueuesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueuesTable,
          SyncQueue,
          $$SyncQueuesTableFilterComposer,
          $$SyncQueuesTableOrderingComposer,
          $$SyncQueuesTableAnnotationComposer,
          $$SyncQueuesTableCreateCompanionBuilder,
          $$SyncQueuesTableUpdateCompanionBuilder,
          (
            SyncQueue,
            BaseReferences<_$AppDatabase, $SyncQueuesTable, SyncQueue>,
          ),
          SyncQueue,
          PrefetchHooks Function()
        > {
  $$SyncQueuesTableTableManager(_$AppDatabase db, $SyncQueuesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueuesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> operationType = const Value.absent(),
                Value<String> modelName = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
              }) => SyncQueuesCompanion(
                id: id,
                operationType: operationType,
                modelName: modelName,
                entityId: entityId,
                payload: payload,
                createdAt: createdAt,
                retryCount: retryCount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String operationType,
                required String modelName,
                required String entityId,
                required String payload,
                required DateTime createdAt,
                Value<int> retryCount = const Value.absent(),
              }) => SyncQueuesCompanion.insert(
                id: id,
                operationType: operationType,
                modelName: modelName,
                entityId: entityId,
                payload: payload,
                createdAt: createdAt,
                retryCount: retryCount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueuesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueuesTable,
      SyncQueue,
      $$SyncQueuesTableFilterComposer,
      $$SyncQueuesTableOrderingComposer,
      $$SyncQueuesTableAnnotationComposer,
      $$SyncQueuesTableCreateCompanionBuilder,
      $$SyncQueuesTableUpdateCompanionBuilder,
      (SyncQueue, BaseReferences<_$AppDatabase, $SyncQueuesTable, SyncQueue>),
      SyncQueue,
      PrefetchHooks Function()
    >;
typedef $$SyncMetadatasTableCreateCompanionBuilder =
    SyncMetadatasCompanion Function({
      required String modelName,
      required DateTime lastSyncedAt,
      Value<int> rowid,
    });
typedef $$SyncMetadatasTableUpdateCompanionBuilder =
    SyncMetadatasCompanion Function({
      Value<String> modelName,
      Value<DateTime> lastSyncedAt,
      Value<int> rowid,
    });

class $$SyncMetadatasTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetadatasTable> {
  $$SyncMetadatasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get modelName => $composableBuilder(
    column: $table.modelName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncMetadatasTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetadatasTable> {
  $$SyncMetadatasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get modelName => $composableBuilder(
    column: $table.modelName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncMetadatasTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetadatasTable> {
  $$SyncMetadatasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get modelName =>
      $composableBuilder(column: $table.modelName, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => column,
  );
}

class $$SyncMetadatasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncMetadatasTable,
          SyncMetadata,
          $$SyncMetadatasTableFilterComposer,
          $$SyncMetadatasTableOrderingComposer,
          $$SyncMetadatasTableAnnotationComposer,
          $$SyncMetadatasTableCreateCompanionBuilder,
          $$SyncMetadatasTableUpdateCompanionBuilder,
          (
            SyncMetadata,
            BaseReferences<_$AppDatabase, $SyncMetadatasTable, SyncMetadata>,
          ),
          SyncMetadata,
          PrefetchHooks Function()
        > {
  $$SyncMetadatasTableTableManager(_$AppDatabase db, $SyncMetadatasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetadatasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetadatasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetadatasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> modelName = const Value.absent(),
                Value<DateTime> lastSyncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadatasCompanion(
                modelName: modelName,
                lastSyncedAt: lastSyncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String modelName,
                required DateTime lastSyncedAt,
                Value<int> rowid = const Value.absent(),
              }) => SyncMetadatasCompanion.insert(
                modelName: modelName,
                lastSyncedAt: lastSyncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncMetadatasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncMetadatasTable,
      SyncMetadata,
      $$SyncMetadatasTableFilterComposer,
      $$SyncMetadatasTableOrderingComposer,
      $$SyncMetadatasTableAnnotationComposer,
      $$SyncMetadatasTableCreateCompanionBuilder,
      $$SyncMetadatasTableUpdateCompanionBuilder,
      (
        SyncMetadata,
        BaseReferences<_$AppDatabase, $SyncMetadatasTable, SyncMetadata>,
      ),
      SyncMetadata,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
  $$BusinessesTableTableManager get businesses =>
      $$BusinessesTableTableManager(_db, _db.businesses);
  $$ProgramsTableTableManager get programs =>
      $$ProgramsTableTableManager(_db, _db.programs);
  $$TiersTableTableManager get tiers =>
      $$TiersTableTableManager(_db, _db.tiers);
  $$CardsTableTableManager get cards =>
      $$CardsTableTableManager(_db, _db.cards);
  $$CardActivitiesTableTableManager get cardActivities =>
      $$CardActivitiesTableTableManager(_db, _db.cardActivities);
  $$QrScanHistoriesTableTableManager get qrScanHistories =>
      $$QrScanHistoriesTableTableManager(_db, _db.qrScanHistories);
  $$SyncQueuesTableTableManager get syncQueues =>
      $$SyncQueuesTableTableManager(_db, _db.syncQueues);
  $$SyncMetadatasTableTableManager get syncMetadatas =>
      $$SyncMetadatasTableTableManager(_db, _db.syncMetadatas);
}
