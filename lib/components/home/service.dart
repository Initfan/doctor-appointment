import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Service extends StatelessWidget {
  const Service({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.link,
    this.colors,
  });

  final String icon;
  final Widget link;
  final Color? colors;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final shadcn = ShadTheme.of(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => link),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colors ?? shadcn.colorScheme.accent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          spacing: 10,
          children: [
            Image.asset(icon),
            Text(title, style: shadcn.textTheme.large),
            Text(description, style: shadcn.textTheme.muted),
          ],
        ),
      ),
    );
  }
}
