import 'package:flutter/material.dart';
import '../../model/event.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  EventDetailsScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FutureBuilder(
                    future: Future.wait(
                      event.performers!
                          .map(
                            (performer) => precacheImage(
                              NetworkImage(performer.image ?? ''),
                              context,
                            ),
                          )
                          .toList(),
                    ),
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 200,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Container(
                          height: 200,
                          child: const Center(
                            child: Text('Error loading images.'),
                          ),
                        );
                      } else {
                        return Image.network(
                          event.performers![0].images!.huge ?? '',
                          height: 200,
                          fit: BoxFit.cover,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title ?? '',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                   const     Text(
                          'Performers:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: event.performers!
                              .map(
                                (performer) => Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      performer.image ?? '',
                                    ),
                                    radius: 24,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 16),
                    const    Text(
                          'Date & Time:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          event.datetimeLocal?.toString() ?? '',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                    const    Text(
                          'Venue:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          event.venue?.name ?? '',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
