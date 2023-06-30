import 'package:flutter/material.dart';

import '../util.dart';

class EventCard extends StatelessWidget {
  final String title;
  final DateTime dateTime;
  final String venueName;
  final VoidCallback onTap;

  const EventCard({
    required this.title,
    required this.dateTime,
    required this.venueName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
               formatDateTime(dateTime),
                style:const  TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
         const     SizedBox(height: 4.0),
              Text(
                venueName,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
