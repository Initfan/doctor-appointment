import 'package:appointment/components/home/service.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: SERVICE_ITEM.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        mainAxisExtent: 180,
      ),
      itemBuilder: (context, index) {
        var item = SERVICE_ITEM[index];
        return Service(
          icon: item['icon'] ?? '',
          title: item['title'] ?? '',
          description: item['description'] ?? '',
          colors: item['colors'],
        );
      },
    );
  }
}
