import 'package:appointment/components/doctor/card.dart';
import 'package:appointment/components/doctor/review.dart';
import 'package:appointment/components/doctor/location.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:appointment/pages/make_appointment.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key, required this.speciality});

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              child: ShadButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MakeAppointment()),
                ),
                backgroundColor: Colors.blueAccent,
                child: Text(
                  'Make Appointment',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ShadButton.secondary(
              onPressed: () {},
              child: Icon(Icons.chat_bubble_outline),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DoctorCard(
                  image: 'assets/images/doctor-1.png',
                  name: 'Dr Patricia Ahoy',
                  price: 120000,
                  speciality: speciality,
                ),
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 5,
                              children: [
                                Icon(
                                  Icons.home_work_outlined,
                                  size: 30,
                                  color: Colors.redAccent,
                                ),
                                Text('Hospital', style: shadcn.textTheme.muted),
                              ],
                            ),
                            Text('RS. Hermina'),
                          ],
                        ),
                      ),
                      ShadSeparator.vertical(
                        thickness: 2,
                        margin: EdgeInsets.symmetric(vertical: 10),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 5,
                              children: [
                                Icon(
                                  Icons.schedule,
                                  size: 30,
                                  color: Colors.blueAccent,
                                ),
                                Text(
                                  'Working Hour',
                                  style: shadcn.textTheme.muted,
                                ),
                              ],
                            ),
                            Text('07.00 - 18.00'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text("Biography", style: shadcn.textTheme.large),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                      style: shadcn.textTheme.muted,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text("Work Location", style: shadcn.textTheme.large),
                    Text(
                      'Cemp. Putih Tim., Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta',
                      style: shadcn.textTheme.muted,
                    ),
                    DoctorLocation(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Rating (3)", style: shadcn.textTheme.large),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text("4.5", style: shadcn.textTheme.muted),
                      ],
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: DoctorReview(
                        image: 'assets/images/doctor-2.png',
                        name: 'Max',
                        date: DateTime.now(),
                        rating: 4,
                        review:
                            "Lorem Ipsum is simply dummy text simply dummy text simply dummy text",
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
