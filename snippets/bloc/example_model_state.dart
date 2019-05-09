import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../dao_and_model_example.dart';

@immutable
abstract class ExampleModelState extends Equatable {
  ExampleModelState([List props = const []]) : super(props);
}

class ExampleModelLoading extends ExampleModelState {}

class ExampleModelLoaded extends ExampleModelState {
  final List<ExampleModel> models;
  ExampleModelLoaded(this.models) : super(models);
}
