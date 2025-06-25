import 'package:appointment/components/home/event.dart';
import 'package:appointment/components/home/header.dart';
import 'package:appointment/components/home/searching.dart';
import 'package:appointment/components/home/service_list.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
