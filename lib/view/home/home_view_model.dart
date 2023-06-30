import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/event.dart';
import '../../service/event_service.dart';

final homeViewModelProvider = StateProvider((ref) => HomeViewModel());

class HomeViewModel {
  int pageno = 1;
  bool isFetching = false;
  EventData allEvents = EventData(events: []);
  Future<EventData> getAllEvents({required WidgetRef ref}) async {
    try {
      return await ref.read(eventServiceProvider).getAllEvents(pageno: pageno);
    } on SocketException catch (_) {
      rethrow;
    } on TimeoutException catch (e) {

      rethrow;
    }
  }

  addNewEvents(EventData newEvents) {
    if (pageno == newEvents.meta!.page) {
      allEvents.events!.addAll(newEvents.events!);
      allEvents.events!.add(Event(title: 'loading'));
    }
  }
}
