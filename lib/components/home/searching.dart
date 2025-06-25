import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Searching extends StatelessWidget {
  const Searching({super.key, this.hintText});

  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final shadcn = ShadTheme.of(context);
    return SizedBox(
      height: 50,
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: shadcn.colorScheme.mutedForeground,
                ),
                hintStyle: shadcn.textTheme.muted,
                hintText: hintText ?? 'symptoms, diseases...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: shadcn.colorScheme.mutedForeground,
                  ),
                ),
              ),
            ),
          ),
          ShadButton(
            height: double.maxFinite,
            backgroundColor: Colors.blueAccent.shade200,
            child: Icon(Icons.filter_alt, color: shadcn.colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
