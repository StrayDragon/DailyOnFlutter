import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../dao_and_model_example.dart';

@immutable
abstract class ExampleModelEvent extends Equatable {
  ExampleModelEvent([List props = const []]) : super(props);
}

class LoadExampleModel extends ExampleModelEvent {}

class AddExampleModel extends ExampleModelEvent {}

class UpdateWithRandomExampleModel extends ExampleModelEvent {
  final ExampleModel updatedModel;

  UpdateWithRandomExampleModel(this.updatedModel) : super([updatedModel]);
}

class DeleteExampleModel extends ExampleModelEvent {
  final ExampleModel model;

  DeleteExampleModel(this.model) : super([model]);
}
