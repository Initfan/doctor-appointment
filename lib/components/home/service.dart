import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

List<Map<String, dynamic>> SERVICE_ITEM = [
  {
    "icon": "assets/images/appointment.png",
    "title": "Book an\nAppointment",
    "description": "Find a Doctor or Specialist",
    "colors": Colors.blue.shade800,
  },
  {
    "icon": "assets/images/scan.png",
    "title": "Appointment\nWith QR",
    "description": "Queuing without the hustle",
    "colors": Colors.green.shade800,
  },
  {
    "icon": "assets/images/message.png",
    "title": "Request\nConsultation",
    "description": "Talk to specialist",
    "colors": Colors.orange.shade900,
  },
  {
    "icon": "assets/images/pharmacy.png",
    "title": "Locate a Pharmacy",
    "description": "Purchase Medicines",
  },
];

class Service extends StatelessWidget {
  Service({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.colors,
  });

  final String icon;
  Color? colors;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final shadcn = ShadTheme.of(context);
    return Container(
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
    );
  }
}
