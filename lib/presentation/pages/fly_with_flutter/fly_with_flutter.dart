import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/fly_with_flutter/fly_with_flutter_cubit.dart';
import '../../../infrastructure/repositories_impl/fly_with_flutter/tutorial_repository.dart';
import 'widgets/edit_tutorial_page.dart';
import 'widgets/tutorial_step_widget.dart';

class FlyWithFlutter extends StatelessWidget {
  const FlyWithFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlyWithFlutterCubit(TutorialRepository())..loadTutorialData(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Fly with Flutter'),
              elevation: 0,
              backgroundColor: Colors.blue[700],
            ),
            body: BlocBuilder<FlyWithFlutterCubit, FlyWithFlutterState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.error != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 60, color: Colors.red),
                        SizedBox(height: 16),
                        Text(
                          'Error: ${state.error}',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue[700]!, Colors.blue[100]!],
                      ),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: state.tutorialSteps.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: TutorialStepWidget(
                              step: state.tutorialSteps[index]),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            floatingActionButton: FloatingActionButton(
              heroTag: 'editTutorialFAB',
              onPressed: () {
                final cubit = context.read<FlyWithFlutterCubit>();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: cubit,
                      child: EditTutorialPage(),
                    ),
                  ),
                );
              },
              child: Icon(Icons.edit),
              backgroundColor: Colors.blue[700],
            ),
          );
        }
      ),
    );
  }
}