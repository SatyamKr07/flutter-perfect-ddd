import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../application/fly_with_flutter/fly_with_flutter_cubit.dart';
import '../../../../domain/models/fly_with_flutter/tutorial_step.dart';

class TutorialStepWidget extends StatelessWidget {
  final TutorialStep step;

  const TutorialStepWidget({Key? key, required this.step}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            step.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(
            step.description,
            style: TextStyle(color: Colors.grey[600]),
          ),
          childrenPadding: EdgeInsets.all(16),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (step.link != null)
              ElevatedButton.icon(
                icon: Icon(Icons.link),
                label: Text('Learn More'),
                onPressed: () {
                  // TODO: Implement link opening functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Mark as completed'),
                    value: step.isCompleted,
                    onChanged: (bool? value) {
                      context
                          .read<FlyWithFlutterCubit>()
                          .toggleStepCompletion(step.id, value ?? false);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIconButton(
                  icon: Icons.thumb_up,
                  label: '${step.likes} likes',
                  onPressed: () {
                    context.read<FlyWithFlutterCubit>().incrementLikes(step.id);
                  },
                ),
                _buildIconButton(
                  icon: Icons.comment,
                  label: '${step.comments.length} comments',
                  onPressed: () {
                    // TODO: Implement comment functionality
                  },
                ),
              ],
            ),
            if (step.subSteps.isNotEmpty) ...[
              SizedBox(height: 16),
              Text(
                'Sub-steps:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ...step.subSteps.map((subStep) => Padding(
                    padding: EdgeInsets.only(left: 16, top: 8),
                    child: TutorialStepWidget(step: subStep),
                  )),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
          color: Colors.blue[700],
        ),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}