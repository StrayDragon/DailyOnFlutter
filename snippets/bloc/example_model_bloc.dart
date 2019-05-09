import 'dart:math';

import 'package:bloc/bloc.dart';

import '../dao_and_model_example.dart';
import './bloc.dart';

class ExampleModelBloc extends Bloc<ExampleModelEvent, ExampleModelState> {
  ExampleModelDao _modelDao = ExampleModelDao();

  @override
  ExampleModelState get initialState => ExampleModelLoading();

  @override
  Stream<ExampleModelState> mapEventToState(
    ExampleModelEvent event,
  ) async* {
    if (event is LoadExampleModel) {
      yield ExampleModelLoading();
      yield* _reloadExampleModels();
    } else if (event is AddExampleModel) {
      await _modelDao
          .insert(RandomExampleModelGenerator.getRandomExampleModel());
      yield* _reloadExampleModels();
    } else if (event is UpdateWithRandomExampleModel) {
      final newExampleModel =
          RandomExampleModelGenerator.getRandomExampleModel();
      newExampleModel.id = event.updatedModel.id;
      await _modelDao.update(newExampleModel);
      yield* _reloadExampleModels();
    } else if (event is DeleteExampleModel) {
      await _modelDao.delete(event.model);
      yield* _reloadExampleModels();
    }
  }

  Stream<ExampleModelState> _reloadExampleModels() async* {
    final model = await _modelDao.getAllExampleModels();
    yield ExampleModelLoaded(model);
  }
}

class RandomExampleModelGenerator {
  static final _models = [
    ExampleModel(),
    ExampleModel(),
    ExampleModel(),
    ExampleModel(),
    ExampleModel(),
    ExampleModel(),
  ];

  static ExampleModel getRandomExampleModel() {
    return _models[Random().nextInt(_models.length)];
  }
}
