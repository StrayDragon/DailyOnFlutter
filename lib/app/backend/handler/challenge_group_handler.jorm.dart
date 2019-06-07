// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_group_handler.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ChallengeGroupHandler implements Bean<ChallengeGroup> {
  final id = IntField('id');
  final title = StrField('title');
  final isFinished = BoolField('is_finished');
  final colorValue = IntField('color_value');
  final startTime = DateTimeField('start_time');
  final endTime = DateTimeField('end_time');
  final limitedTime = IntField('limited_time');
  Map<String, Field> _fields;

  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        title.name: title,
        isFinished.name: isFinished,
        colorValue.name: colorValue,
        startTime.name: startTime,
        endTime.name: endTime,
        limitedTime.name: limitedTime,
      };

  ChallengeGroup fromMap(Map map) {
    ChallengeGroup model = ChallengeGroup();
    model.id = adapter.parseValue(map['id']);
    model.title = adapter.parseValue(map['title']);
    model.isFinished = adapter.parseValue(map['is_finished']);
    model.colorValue = adapter.parseValue(map['color_value']);
    model.startTime = adapter.parseValue(map['start_time']);
    model.endTime = adapter.parseValue(map['end_time']);
    model.limitedTime = adapter.parseValue(map['limited_time']);

    return model;
  }

  List<SetColumn> toSetColumns(ChallengeGroup model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      ret.add(title.set(model.title));
      ret.add(isFinished.set(model.isFinished));
      ret.add(colorValue.set(model.colorValue));
      ret.add(startTime.set(model.startTime));
      ret.add(endTime.set(model.endTime));
      ret.add(limitedTime.set(model.limitedTime));
    } else if (only != null) {
      if (model.id != null) {
        if (only.contains(id.name)) ret.add(id.set(model.id));
      }
      if (only.contains(title.name)) ret.add(title.set(model.title));
      if (only.contains(isFinished.name))
        ret.add(isFinished.set(model.isFinished));
      if (only.contains(colorValue.name))
        ret.add(colorValue.set(model.colorValue));
      if (only.contains(startTime.name))
        ret.add(startTime.set(model.startTime));
      if (only.contains(endTime.name)) ret.add(endTime.set(model.endTime));
      if (only.contains(limitedTime.name))
        ret.add(limitedTime.set(model.limitedTime));
    } else
    /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.title != null) {
        ret.add(title.set(model.title));
      }
      if (model.isFinished != null) {
        ret.add(isFinished.set(model.isFinished));
      }
      if (model.colorValue != null) {
        ret.add(colorValue.set(model.colorValue));
      }
      if (model.startTime != null) {
        ret.add(startTime.set(model.startTime));
      }
      if (model.endTime != null) {
        ret.add(endTime.set(model.endTime));
      }
      if (model.limitedTime != null) {
        ret.add(limitedTime.set(model.limitedTime));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, autoIncrement: true, isNullable: false);
    st.addStr(title.name, isNullable: false);
    st.addBool(isFinished.name, isNullable: false);
    st.addInt(colorValue.name, isNullable: true);
    st.addDateTime(startTime.name, isNullable: true);
    st.addDateTime(endTime.name, isNullable: true);
    st.addInt(limitedTime.name, isNullable: true);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(ChallengeGroup model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.insert(insert);
    if (cascade) {
      ChallengeGroup newModel;
      if (model.challengeItems != null) {
        newModel ??= await find(retId);
        model.challengeItems.forEach(
            (x) => challengeItemBean.associateChallengeGroup(x, newModel));
        for (final child in model.challengeItems) {
          await challengeItemBean.insert(child, cascade: cascade);
        }
      }
      if (model.tags != null) {
        newModel ??= await find(retId);
        model.tags.forEach(
            (x) => challengeTagBean.associateChallengeGroup(x, newModel));
        for (final child in model.tags) {
          await challengeTagBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<ChallengeGroup> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(insert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = models
          .map((model) =>
              toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
          .toList();
      final InsertMany insert = inserters.addAll(data);
      await adapter.insertMany(insert);
      return;
    }
  }

  Future<dynamic> upsert(ChallengeGroup model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      ChallengeGroup newModel;
      if (model.challengeItems != null) {
        newModel ??= await find(retId);
        model.challengeItems.forEach(
            (x) => challengeItemBean.associateChallengeGroup(x, newModel));
        for (final child in model.challengeItems) {
          await challengeItemBean.upsert(child, cascade: cascade);
        }
      }
      if (model.tags != null) {
        newModel ??= await find(retId);
        model.tags.forEach(
            (x) => challengeTagBean.associateChallengeGroup(x, newModel));
        for (final child in model.tags) {
          await challengeTagBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<ChallengeGroup> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(upsert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
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
  }

  Future<int> update(ChallengeGroup model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      ChallengeGroup newModel;
      if (model.challengeItems != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.challengeItems.forEach(
              (x) => challengeItemBean.associateChallengeGroup(x, newModel));
        }
        for (final child in model.challengeItems) {
          await challengeItemBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
      if (model.tags != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.tags.forEach(
              (x) => challengeTagBean.associateChallengeGroup(x, newModel));
        }
        for (final child in model.tags) {
          await challengeTagBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<ChallengeGroup> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(update(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
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
  }

  Future<ChallengeGroup> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final ChallengeGroup model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(int id, {bool cascade = false}) async {
    if (cascade) {
      final ChallengeGroup newModel = await find(id);
      if (newModel != null) {
        await challengeItemBean.removeByChallengeGroup(newModel.id);
        await challengeTagBean.removeByChallengeGroup(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<ChallengeGroup> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<ChallengeGroup> preload(ChallengeGroup model,
      {bool cascade = false}) async {
    model.challengeItems = await challengeItemBean
        .findByChallengeGroup(model.id, preload: cascade, cascade: cascade);
    model.tags = await challengeTagBean.findByChallengeGroup(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<ChallengeGroup>> preloadAll(List<ChallengeGroup> models,
      {bool cascade = false}) async {
    models.forEach((ChallengeGroup model) => model.challengeItems ??= []);
    await OneToXHelper.preloadAll<ChallengeGroup, ChallengeItem>(
        models,
        (ChallengeGroup model) => [model.id],
        challengeItemBean.findByChallengeGroupList,
        (ChallengeItem model) => [model.groupId],
        (ChallengeGroup model, ChallengeItem child) =>
            model.challengeItems = List.from(model.challengeItems)..add(child),
        cascade: cascade);
    models.forEach((ChallengeGroup model) => model.tags ??= []);
    await OneToXHelper.preloadAll<ChallengeGroup, ChallengeTag>(
        models,
        (ChallengeGroup model) => [model.id],
        challengeTagBean.findByChallengeGroupList,
        (ChallengeTag model) => [model.groupId],
        (ChallengeGroup model, ChallengeTag child) =>
            model.tags = List.from(model.tags)..add(child),
        cascade: cascade);
    return models;
  }

  ChallengeItemHandler get challengeItemBean;

  ChallengeTagHandler get challengeTagBean;
}
