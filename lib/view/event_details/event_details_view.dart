import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../../model/event.dart';
import '../../util.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  EventDetailsScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xFFFFFFFF),
            Color.fromARGB(255, 199, 213, 236),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Color(0xff343D8D), //change your color here
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Event Details',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24.0,
              color: Color(0xff343D8D),
              fontFamily: 'Poppins',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                   child: ClipRRect(
                   borderRadius: BorderRadius.circular(8.0),
                   child: Image.network(
                     event.performers![0].images!.huge ?? '',
                     height: screenHeight * 0.3, // Adjust the height as needed
                     fit: BoxFit.cover,
                   ),
                 ),
                 ),

                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 28.0,
                            color: Color(0xff343D8D),
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "🎯 Type: ",
                                          style: TextStyle(
                                            color: Color(0xff343D8D),
                                            fontSize: 21.0,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            event.type!.capitalize() ?? '',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff343D8D),
                                              fontSize: 20.0,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        const Text(
                                          "🌍 Venue: ",
                                          style: TextStyle(
                                            color: Color(0xff343D8D),
                                            fontSize: 21.0,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${event.venue!.name!}, ${event.venue!.city!}, ${event.venue!.country!}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff343D8D),
                                              fontSize: 21.0,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 194, 202, 245),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(.01),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${formatTime(event.datetimeLocal)} \u23F0",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      formatDate(event.datetimeLocal),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                   const      Padding(
                           padding:  EdgeInsets.only(top:15),
                           child: Text(
                                'Performers',
                                style:  TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 21.0,
                                  color: Color(0xff343D8D),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                         ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: event.performers!
                              .map(
                                (performer) => Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          performer.image ?? '',
                                        ),
                                        radius: 24,
                                      ),
                                      const SizedBox(width: 8),
                                      Tooltip(
                                        message: performer.name ?? '',
                                        child: Text(
                                          performer.name ?? '',
                                          style: const TextStyle(
                                            // fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                            color: Color(0xff343D8D),
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            html.window.open(event.url!, "_blank");
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 194, 202, 245),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            elevation: MaterialStateProperty.all<double>(0.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Buy Ticket',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 21.0,
                                color: Color(0xff343D8D),
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
