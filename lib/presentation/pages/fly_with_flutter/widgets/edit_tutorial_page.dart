import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/fly_with_flutter/fly_with_flutter_cubit.dart';
import '../../../../domain/models/fly_with_flutter/tutorial_step.dart';

class EditTutorialPage extends StatefulWidget {
  @override
  _EditTutorialPageState createState() => _EditTutorialPageState();
}

class _EditTutorialPageState extends State<EditTutorialPage> {
  TutorialStep? selectedStep;
  TutorialStep? selectedSubStep;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _linkController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _linkController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  void _updateControllers(TutorialStep step) {
    _titleController.text = step.title;
    _descriptionController.text = step.description;
    _linkController.text = step.link ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Tutorial'),
        backgroundColor: Colors.blue[700],
      ),
      body: BlocConsumer<FlyWithFlutterCubit, FlyWithFlutterState>(
        listener: (context, state) {
          // Update selectedStep and selectedSubStep when the state changes
          if (selectedStep != null) {
            selectedStep = state.tutorialSteps.firstWhere(
              (step) => step.id == selectedStep!.id,
              orElse: () => selectedStep!,
            );
          }
          if (selectedSubStep != null && selectedStep != null) {
            selectedSubStep = selectedStep!.subSteps.firstWhere(
              (subStep) => subStep.id == selectedSubStep!.id,
              orElse: () => selectedSubStep!,
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select Step:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                DropdownButton<TutorialStep>(
                  isExpanded: true,
                  value: selectedStep,
                  items: state.tutorialSteps.map((step) {
                    return DropdownMenuItem(
                      value: step,
                      child: Text(step.title),
                    );
                  }).toList(),
                  onChanged: (TutorialStep? value) {
                    setState(() {
                      selectedStep = value;
                      selectedSubStep = null;
                      if (value != null) _updateControllers(value);
                    });
                  },
                ),
                SizedBox(height: 16),
                if (selectedStep != null && selectedStep!.subSteps.isNotEmpty) ...[
                  Text('Select Sub-step:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  DropdownButton<TutorialStep>(
                    isExpanded: true,
                    value: selectedSubStep,
                    items: selectedStep!.subSteps.map((subStep) {
                      return DropdownMenuItem(
                        value: subStep,
                        child: Text(subStep.title),
                      );
                    }).toList(),
                    onChanged: (TutorialStep? value) {
                      setState(() {
                        selectedSubStep = value;
                        if (value != null) _updateControllers(value);
                      });
                    },
                  ),
                  SizedBox(height: 16),
                ],
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _linkController,
                  decoration: InputDecoration(labelText: 'Link (optional)'),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _saveChanges(context),
                      child: Text('Save Changes'),
                    ),
                    ElevatedButton(
                      onPressed: () => _addNewStep(context),
                      child: Text('Add New Step'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'editTutorialFAB',
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.check),
        backgroundColor: Colors.blue[700],
      ),
    );
  }

  void _saveChanges(BuildContext context) {
    final cubit = context.read<FlyWithFlutterCubit>();
    final updatedStep = (selectedSubStep ?? selectedStep)?.copyWith(
      title: _titleController.text,
      description: _descriptionController.text,
      link: _linkController.text.isNotEmpty ? _linkController.text : null,
    );

    if (updatedStep != null) {
      cubit.updateStep(updatedStep);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Changes saved successfully')),
      );
      // Update the selected step or sub-step with the new values
      setState(() {
        if (selectedSubStep != null) {
          selectedSubStep = updatedStep;
        } else {
          selectedStep = updatedStep;
        }
      });
    }
  }

  void _addNewStep(BuildContext context) {
    final cubit = context.read<FlyWithFlutterCubit>();
    final newStep = TutorialStep(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      description: _descriptionController.text,
      link: _linkController.text.isNotEmpty ? _linkController.text : null,
    );

    if (selectedSubStep != null) {
      cubit.addStep(newStep, selectedStep!.id);
    } else if (selectedStep != null) {
      cubit.addStep(newStep, selectedStep!.id);
    } else {
      cubit.addStep(newStep, null);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('New step added successfully')),
    );

    // Clear the text fields after adding a new step
    _titleController.clear();
    _descriptionController.clear();
    _linkController.clear();
  }
}