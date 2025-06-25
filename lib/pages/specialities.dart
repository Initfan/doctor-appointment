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
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DoctorPage(speciality: 'Ear, Nose & Throat'),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      leading: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade800,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Image.asset('assets/images/doctor-1.png'),
                      ),
                      title: Text(
                        'Dr. Patricia Ahoy',
                        style: shadcn.textTheme.large,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ear, Nose & Throat",
                            style: shadcn.textTheme.muted.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Text('IDR 120.000', style: shadcn.textTheme.large),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
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
