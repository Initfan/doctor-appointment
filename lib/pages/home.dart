import 'package:appointment/components/home/event.dart';
import 'package:appointment/components/home/header.dart';
import 'package:appointment/components/home/searching.dart';
import 'package:appointment/components/home/service_list.dart';
import 'package:appointment/utils/supabase.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User user;

  @override
  void initState() {
    super.initState();
    setState(() => user = supabase.auth.currentUser!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    Header(user: user),
                    Searching(),
                    ServiceList(),
                  ],
                ),
              ),
              Event(),
            ],
          ),
        ),
      ),
    );
  }
}
