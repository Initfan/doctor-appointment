import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Event extends StatelessWidget {
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    final shadcn = ShadTheme.of(context);
    return SizedBox(
      height: 120,
      width: double.maxFinite,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: index == 0 ? 15 : 0),
          child: Container(
            width: 300,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/images/virus.png',
                    fit: BoxFit.fitHeight,
                    height: double.maxFinite,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(
                        "Prevent the spread\nof COVID-19 Virus",
                        style: shadcn.textTheme.large,
                      ),
                      GestureDetector(
                        child: Row(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Find out now", style: shadcn.textTheme.small),
                            Icon(Icons.arrow_right_alt),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
