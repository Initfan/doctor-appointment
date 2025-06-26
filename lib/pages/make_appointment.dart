import 'package:appointment/pages/payment_appointment.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MakeAppointment extends StatefulWidget {
  const MakeAppointment({super.key});

  @override
  State<MakeAppointment> createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String? selectedTime;

  String choosenDate() =>
      "${DateFormat.EEEE().format(selectedDate)}, ${selectedDate.day} ${DateFormat.MMMM().format(selectedDate)} ${selectedDate.year}";

  @override
  Widget build(BuildContext context) {
    final shadcn = ShadTheme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Make Appointment", style: shadcn.textTheme.h4),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: ShadButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentAppointment()),
          ),
          backgroundColor: Colors.blueAccent,
          child: Text('Confirm', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  "Select your visit date & Time",
                  style: shadcn.textTheme.h4,
                ),
                Text(
                  "You can choose the date and time from the available doctor's schedule.",
                  style: shadcn.textTheme.muted,
                ),
                SizedBox(height: 20),
                Text(
                  "Choose ${choosenDate()}",
                  style: shadcn.textTheme.h4.copyWith(
                    color: shadcn.colorScheme.mutedForeground,
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      DateTime day = DateTime.now().add(Duration(days: index));
                      return GestureDetector(
                        onTap: () {
                          print(day);
                          setState(() {
                            selectedDate = day;
                          });
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color:
                                  day.day == selectedDate.day &&
                                      day.month == selectedDate.month &&
                                      day.year == selectedDate.year
                                  ? Colors.blueAccent
                                  : shadcn.colorScheme.border,
                            ),
                            color:
                                day.day == selectedDate.day &&
                                    day.month == selectedDate.month &&
                                    day.year == selectedDate.year
                                ? Colors.blueAccent
                                : shadcn.colorScheme.background,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: 100,
                          margin: EdgeInsets.only(right: index == 6 ? 0 : 10),
                          child: Column(
                            spacing: 5,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(DateFormat.E().format(day)),
                              Text(
                                day.day.toString(),
                                style: shadcn.textTheme.h3,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Choose ${selectedTime ?? "Time"}",
                  style: shadcn.textTheme.h4.copyWith(
                    color: shadcn.colorScheme.mutedForeground,
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      String time = "${index + 8} AM";
                      return GestureDetector(
                        onTap: () => setState(() {
                          selectedTime = time;
                        }),
                        behavior: HitTestBehavior.opaque,
                        child: Padding(
                          padding: EdgeInsets.only(right: index == 9 ? 0 : 10),
                          child: ShadButton.outline(
                            child: Text(time, style: shadcn.textTheme.muted),
                          ),
                        ),
                      );
                    },
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
