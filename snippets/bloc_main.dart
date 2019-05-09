import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'bloc/example_model_bloc.dart';
import 'dao_and_model_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: ExampleModelBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          accentColor: Colors.redAccent,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ExampleModelBloc _eampleModelBloc;

  @override
  void initState() {
    super.initState();

    _eampleModelBloc = BlocProvider.of<ExampleModelBloc>(context);

    _eampleModelBloc.dispatch(LoadExampleModel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExampleModel app'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _eampleModelBloc.dispatch(AddExampleModel());
        },
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder(
      bloc: _eampleModelBloc,
      builder: (BuildContext context, ExampleModelState state) {
        if (state is ExampleModelLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ExampleModelLoaded) {
          return ListView.builder(
            itemCount: state.models.length,
            itemBuilder: (context, index) {
              final displayedExampleModel = state.models[index];
              return ListTile(
                title: Text("displayedExampleModel.name"),
                subtitle: Text('Sooo sour!'),
                trailing: _buildUpdateDeleteButtons(displayedExampleModel),
              );
            },
          );
        }
      },
    );
  }

  Row _buildUpdateDeleteButtons(ExampleModel displayedExampleModel) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            _eampleModelBloc
                .dispatch(UpdateWithRandomExampleModel(displayedExampleModel));
          },
        ),
        IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () {
            _eampleModelBloc
                .dispatch(DeleteExampleModel(displayedExampleModel));
          },
        ),
      ],
    );
  }
}
