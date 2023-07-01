import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quazar_demo/model/event.dart';
import 'package:quazar_demo/view/event_details/event_details_view.dart';
import 'package:quazar_demo/widget/error_widget.dart';
import 'package:quazar_demo/widget/event_card.dart';

import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final homeViewFutureProvider = FutureProvider.family(
      (ref, WidgetRef _ref) async =>
          ref.watch(homeViewModelProvider).getAllEvents(ref: _ref));
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var newEvents = ref.watch(homeViewFutureProvider(ref));

      return Scaffold(
        backgroundColor:const Color.fromARGB(255, 245, 245, 243),
        body: Column(
          children: [
           const Text(
              'EVENTS 🎉',
              style:  TextStyle(
                  color: Color(0xff343D8D),
                  fontSize: 25.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: newEvents.when(
                  data: (data) {
                    ref.read(homeViewModelProvider).addNewEvents(data);
                    EventData allEvents =
                        ref.read(homeViewModelProvider).allEvents;

                    return ListView.builder(
                        controller: _scrollController,
                        itemCount: allEvents.events!.length,
                        itemBuilder: (context, index) {
                          _scrollController.addListener(() async {
                            if (!ref.watch(homeViewModelProvider).isFetching &&
                                _scrollController.position.maxScrollExtent ==
                                    _scrollController.position.pixels) {
                              ref.read(homeViewModelProvider).isFetching = true;
                              ref.watch(homeViewModelProvider).pageno++;
                              await ref.refresh(homeViewFutureProvider(ref));

                              ref.read(homeViewModelProvider).isFetching =
                                  false;
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                ref
                                    .read(homeViewModelProvider)
                                    .allEvents
                                    .events!
                                    .removeWhere((element) =>
                                        element.title == 'loading');
                              });
                            }
                          });
                          if (allEvents.events![index].title == 'loading') {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                         
                            return EventCard(
                                title: allEvents.events![index].title!,
                                dateTime:
                                    allEvents.events![index].datetimeLocal!,
                                venueName:
                                    allEvents.events![index].venue!.name!,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EventDetailsScreen(
                                                  event: allEvents
                                                      .events![index])));
                                });
                          }
                        });
                  },
                  error: (error, trace) => EventError(
                      errorMessage: error.toString(),
                      onRetry: () => ref.refresh(homeViewFutureProvider(ref))),
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
