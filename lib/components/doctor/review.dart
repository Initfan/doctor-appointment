import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:timeago/timeago.dart' as timeago;

class DoctorReview extends StatelessWidget {
  const DoctorReview({
    super.key,
    required this.image,
    required this.name,
    required this.rating,
    required this.review,
    required this.date,
  });

  final String image;
  final String name;
  final int rating;
  final String review;
  final DateTime date;

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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: shadcn.textTheme.large),
                  Text(timeago.format(date), style: shadcn.textTheme.muted),
                ],
              ),
              SizedBox(
                height: 20,
                child: Row(
                  spacing: 10,
                  children: [
                    ListView.builder(
                      itemCount: rating,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          Icon(Icons.star, color: Colors.amber),
                    ),
                    Text(
                      '$rating',
                      style: shadcn.textTheme.muted.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text(review, style: shadcn.textTheme.muted),
            ],
          ),
        ),
      ],
    );
  }
}
