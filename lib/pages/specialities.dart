import 'package:appointment/components/doctor/doctor_item.dart';
import 'package:appointment/components/home/searching.dart';
import 'package:appointment/pages/doctor.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Specialities extends StatelessWidget {
  const Specialities({super.key, required this.speciality});

  final String speciality;

  @override
  Widget build(BuildContext context) {
    final shadcn = ShadTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(speciality, style: shadcn.textTheme.h4),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Searching(hintText: 'Search doctor'),
                SizedBox(height: 15),
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ShadButton(child: Text("hello $index")),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoctorPage(speciality: 'Ear, Nose & Throat'),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DoctorItem(
                              image: 'assets/images/doctor-1.png',
                              name: 'Dr Patricia Ahoy',
                              price: 120000,
                              speciality: speciality,
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Text("4.5", style: shadcn.textTheme.muted),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
