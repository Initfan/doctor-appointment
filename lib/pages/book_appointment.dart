import 'package:appointment/components/home/searching.dart';
import 'package:appointment/pages/specialities.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    final shadcn = ShadTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Book an Appointment', style: shadcn.textTheme.h4),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text("Medical Specialities", style: shadcn.textTheme.h4),
                Text(
                  "Wide selection of doctor's specialities",
                  style: shadcn.textTheme.muted,
                ),
                SizedBox(height: 10),
                Searching(),
                SizedBox(height: 15),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Specialities(speciality: 'Ear, Nose & Throat'),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      leading: Image.asset('assets/images/ear.png'),
                      title: Text(
                        'Ear, Nose & Throat',
                        style: shadcn.textTheme.large,
                      ),
                      subtitle: Text(
                        "Wide selection of doctor's specialities",
                        style: shadcn.textTheme.muted.copyWith(fontSize: 12),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "See More",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
