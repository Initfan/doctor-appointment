import 'package:appointment/pages/calendar.dart';
import 'package:appointment/pages/home.dart';
import 'package:appointment/utils/supabase.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  late User user;

  @override
  void initState() {
    super.initState();
    setState(() => user = supabase.auth.currentUser!);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        // body: [HomePage(user: user), CalendarPage()][currentIndex],
        body: SafeArea(
          child: TabBarView(
            children: [
              HomePage(user: user),
              CalendarPage(),
              CalendarPage(),
              CalendarPage(),
              CalendarPage(),
            ],
          ),
        ),
        bottomNavigationBar: TabBar(
          dividerColor: Colors.transparent,
          // controller: _controller,
          tabs: [
            Tab(icon: Image.asset('assets/images/home-icon.png')),
            Tab(icon: Image.asset('assets/images/calendar-icon.png')),
            Tab(icon: Image.asset('assets/images/history-icon.png')),
            Tab(icon: Image.asset('assets/images/chat-icon.png')),
            Tab(icon: Image.asset('assets/images/account-icon.png')),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: 0,
        //   fixedColor: ShadTheme.of(context).colorScheme.mutedForeground,
        //   onTap: (int index) => setState(() => currentIndex = index),
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Image.asset('assets/images/home-icon.png'),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Image.asset('assets/images/calendar-icon.png'),
        //       label: 'Calendar',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Image.asset('assets/images/history-icon.png'),
        //       label: 'History',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Image.asset('assets/images/chat-icon.png'),
        //       label: 'Chat',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Image.asset('assets/images/account-icon.png'),
        //       label: 'Account',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
