// lib/presentation/widgets/dev_error_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/app_core/my_enums/my_enums.dart';
import '../../env.dart';
import '../../app_core/errors/app_error.dart';

class DevErrorButton extends StatefulWidget {
  final List<AppError> errors;
  final VoidCallback onTap;

  const DevErrorButton({Key? key, required this.errors, required this.onTap})
      : super(key: key);

  @override
  _DevErrorButtonState createState() => _DevErrorButtonState();
}

class _DevErrorButtonState extends State<DevErrorButton> {
  Offset _offset = Offset(20, 20);

  @override
  Widget build(BuildContext context) {
    if (Env.getEnv != EnumEnv.dev && widget.errors.isEmpty) {
      return SizedBox.shrink();
    }

    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Draggable(
        feedback: _buildButton(),
        childWhenDragging: SizedBox.shrink(),
        onDragEnd: (details) {
          setState(() {
            _offset = details.offset;
          });
        },
        child: _buildButton(),
      ),
    );
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        // width: 60,
        // height: 60,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${widget.errors.length}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
