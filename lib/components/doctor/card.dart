import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.speciality,
    required this.price,
  });

  final String image;
  final String name;
  final String speciality;
  final int price;

  @override
  Widget build(BuildContext context) {
    final ShadThemeData shadcn = ShadTheme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.blue.shade800,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Image.asset(image),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            Text(name, style: shadcn.textTheme.large),
            Text(
              speciality,
              style: shadcn.textTheme.muted.copyWith(fontSize: 12),
            ),
            Text('IDR $price', style: shadcn.textTheme.large),
          ],
        ),
      ],
    );
  }
}
