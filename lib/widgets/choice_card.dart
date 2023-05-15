import "package:flutter/material.dart";
// this simple widget displays a card with a choice

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key? key, required this.choice}) : super(key: key);

  final String choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          choice,
          style: const TextStyle(fontSize: 24, height: 1.5),
        ),
      ),
    );
  }
}
