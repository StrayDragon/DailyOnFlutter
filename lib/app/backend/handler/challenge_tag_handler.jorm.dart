// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_tag_handler.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ChallengeTagHandler implements Bean<ChallengeTag> {
  final id = IntField('id');
  final groupId = IntField('group_id');
  final name = StrField('name');
  Map<String, Field> _fields;

  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        groupId.name: groupId,
        name.name: name,
      };

  ChallengeTag fromMap(Map map) {
    ChallengeTag model = ChallengeTag();
    model.id = adapter.parseValue(map['id']);
    model.groupId = adapter.parseValue(map['group_id']);
    model.name = adapter.parseValue(map['name']);

    return model;
  }

  List<SetColumn> toSetColumns(ChallengeTag model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      ret.add(groupId.set(model.groupId));
      ret.add(name.set(model.name));
    } else if (only != null) {
      if (model.id != null) {
        if (only.contains(id.name)) ret.add(id.set(model.id));
      }
      if (only.contains(groupId.name)) ret.add(groupId.set(model.groupId));
      if (only.contains(name.name)) ret.add(name.set(model.name));
    } else
    /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.groupId != null) {
        ret.add(groupId.set(model.groupId));
      }
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, autoIncrement: true, isNullable: false);
    st.addInt(groupId.name,
        foreignTable: challengeGroupBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    st.addStr(name.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(ChallengeTag model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.insert(insert);
    if (cascade) {
      // ignore: unused_local_variable
      ChallengeTag newModel;
    }
    return retId;
  }

  Future<void> insertMany(List<ChallengeTag> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(ChallengeTag model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      // ignore: unused_local_variable
      ChallengeTag newModel;
    }
    return retId;
  }

  Future<void> upsertMany(List<ChallengeTag> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(ChallengeTag model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<ChallengeTag> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(this.id.eq(model.id));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<ChallengeTag> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(int id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<ChallengeTag> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<List<ChallengeTag>> findByChallengeGroup(int groupId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.groupId.eq(groupId));
    return findMany(find);
  }

  Future<List<ChallengeTag>> findByChallengeGroupList(
      List<ChallengeGroup> models,
      {bool preload = false,
      bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (ChallengeGroup model in models) {
      find.or(this.groupId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByChallengeGroup(int groupId) async {
    final Remove rm = remover.where(this.groupId.eq(groupId));
    return await adapter.remove(rm);
  }

  void associateChallengeGroup(ChallengeTag child, ChallengeGroup parent) {
    child.groupId = parent.id;
  }

  ChallengeGroupHandler get challengeGroupBean;
}
