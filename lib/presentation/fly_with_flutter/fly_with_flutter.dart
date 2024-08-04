import 'package:flutter/material.dart';

import '../../domain/core/models/fly_with_flutter/tutorial_step.dart';

class FlyWithFlutter extends StatefulWidget {
  const FlyWithFlutter({Key? key}) : super(key: key);

  @override
  _FlyWithFlutterState createState() => _FlyWithFlutterState();
}

class _FlyWithFlutterState extends State<FlyWithFlutter> {
  List<TutorialStep> tutorialSteps = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTutorialData();
  }

  Future<void> _loadTutorialData() async {
    try {
      final data = await TutorialData.fetchTutorialData();
      setState(() {
        tutorialSteps = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading tutorial data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fly with Flutter'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: tutorialSteps.length,
              itemBuilder: (context, index) {
                return _buildTutorialStep(tutorialSteps[index]);
              },
            ),
    );
  }

  Widget _buildTutorialStep(TutorialStep step) {
    return ExpansionTile(
      title: Text(step.title),
      subtitle: Text(step.description),
      children: [
        if (step.link != null)
          ListTile(
            title: Text('Learn more'),
            trailing: Icon(Icons.link),
            onTap: () {
              // TODO: Implement link opening functionality
            },
          ),
        CheckboxListTile(
          title: Text('Mark as completed'),
          value: step.isCompleted,
          onChanged: (bool? value) {
            setState(() {
              step.isCompleted = value ?? false;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {
                setState(() {
                  step.likes++;
                });
              },
            ),
            Text('${step.likes} likes'),
            IconButton(
              icon: Icon(Icons.comment),
              onPressed: () {
                // TODO: Implement comment functionality
              },
            ),
            Text('${step.comments.length} comments'),
          ],
        ),
        ...step.subSteps.map((subStep) => _buildTutorialStep(subStep)),
      ],
    );
  }
}