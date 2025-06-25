import 'package:appointment/components/home/service.dart';
import 'package:appointment/pages/book_appointment.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatelessWidget {
  ServiceList({super.key});

  final List<Map<String, dynamic>> serviceItem = [
    {
      "icon": "assets/images/appointment.png",
      "title": "Book an\nAppointment",
      "description": "Find a Doctor or Specialist",
      "colors": Colors.blue.shade800,
      "link": BookAppointment(),
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

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: serviceItem.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        mainAxisExtent: 180,
      ),
      itemBuilder: (context, index) {
        var item = serviceItem[index];
        return Service(
          link: item['link'] ?? Placeholder(),
          icon: item['icon'] ?? '',
          title: item['title'] ?? '',
          description: item['description'] ?? '',
          colors: item['colors'],
        );
      },
    );
  }
}
