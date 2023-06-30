import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quazar_demo/view/event_details/event_details_view.dart';
import 'package:quazar_demo/widget/error_widget.dart';
import 'package:quazar_demo/widget/event_card.dart';

import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  ScrollController _scrollController = ScrollController();
  final homeViewFutureProvider = FutureProvider.family(
      (ref, WidgetRef _ref) async =>
          ref.watch(homeViewModelProvider).getAllEvents(ref: _ref));
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final events = ref.watch(homeViewFutureProvider(ref));
      return Scaffold(
        body: events.when(
            data: (data) => ListView.builder(
                controller: _scrollController,
                itemCount: data.events!.length,
                itemBuilder: (context, index) {
                  _scrollController.addListener(() {
                    if (_scrollController.position.maxScrollExtent ==
                        _scrollController.position.pixels) {
                      print('hrbbhbhbu');
                      ref.watch(homeViewModelProvider).pageno++;
                    }
                  });

                  return EventCard(
                      title: data.events![index].title!,
                      dateTime: data.events![index].datetimeLocal.toString(),
                      venueName: data.events![index].venue!.name!,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventDetailsScreen(
                                    event: data.events![index])));
                      });
                }),
            error: (error, trace) => EventError(
                errorMessage: error.toString(),
                onRetry: () => ref.refresh(homeViewFutureProvider(ref))),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      );
    });
  }
}
