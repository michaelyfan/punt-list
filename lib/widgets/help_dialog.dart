import 'package:flutter/material.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('How PuntList Works'),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _HelpSection(
              icon: Icons.check,
              title: 'Check Off Items',
              body:
                  "Tap the checkbox to mark items as complete. They'll be crossed out and move to the bottom of the list.",
            ),
            SizedBox(height: 16),
            _HelpSection(
              icon: Icons.arrow_forward,
              title: 'Move Items Between Lists',
              body:
                  'Tap the blue arrow button to instantly send an item to another list. Perfect for "punting" tasks to a different category!',
            ),
            SizedBox(height: 16),
            _HelpSection(
              icon: Icons.settings,
              title: 'Configure Destinations',
              body:
                  'In Move Settings, choose where each list\'s arrow sends items. For example, set your "Today" list to move items to "Later".',
            ),
            SizedBox(height: 16),
            _TipBox(),
          ],
        ),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it!'),
          ),
        ),
      ],
    );
  }
}

class _HelpSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const _HelpSection({
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 8),
            Text(title, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        const SizedBox(height: 4),
        Text(body, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _TipBox extends StatelessWidget {
  const _TipBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodySmall,
          children: const [
            TextSpan(
              text: 'Tip: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text:
                  'PuntList is great for GTD-style workflows, where you can quickly defer tasks between lists like "Inbox", "Today", "This Week", and "Someday".',
            ),
          ],
        ),
      ),
    );
  }
}
