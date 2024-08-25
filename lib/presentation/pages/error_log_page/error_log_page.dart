import 'package:flutter/material.dart';

import '../../../app_core/errors/app_error.dart';

class ErrorLogPage extends StatelessWidget {
  final List<AppError> errors;
  final List<String> listHighlightKeywords = [
    'error',
    'warning',
    'critical',
    'impl'
  ]; // Add your keywords here

  ErrorLogPage({Key? key, required this.errors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Error Log')),
      body: ListView.separated(
        itemCount: errors.length,
        itemBuilder: (context, index) {
          final error = errors[index];
          return ListTile(
            title: Text(
              error.code ?? "",
              style: TextStyle(fontSize: 12),
            ),
            // subtitle: _buildHighlightedText(error.message),
            subtitle: Text(error.message),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }

  Widget _buildHighlightedText(String message) {
    List<TextSpan> spans = [];
    String lowercaseMessage = message.toLowerCase();
    if (lowercaseMessage.contains("impl")) {
      spans.add(TextSpan(
        text: lowercaseMessage + ' ',
        style: TextStyle(
          backgroundColor: Colors.yellow,
          fontWeight: FontWeight.bold,
        ),
      ));
    } else {
      spans.add(TextSpan(text: lowercaseMessage + ' '));
    }

    for (String word in message.split(' ')) {
      if (listHighlightKeywords.contains(word.toLowerCase())) {
        spans.add(TextSpan(
          text: word + ' ',
          style: TextStyle(
            backgroundColor: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ));
      } else {
        spans.add(TextSpan(text: word + ' '));
      }
    }

    return RichText(
      text: TextSpan(
        // style: DefaultTextStyle.of(context).style,
        children: spans,
      ),
    );
  }
}
