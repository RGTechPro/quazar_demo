import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/event.dart';
import '../../service/event_service.dart';

final homeViewModelProvider = StateProvider((ref) => HomeViewModel());

class HomeViewModel {
  int pageno = 1;
  Future<EventData> getAllEvents(
      {required WidgetRef ref}) async {
    try {
      return await ref.read(eventServiceProvider).getAllEvents(pageno: pageno);
    } on SocketException catch (_) {
      //    showDialogFlash(title: noConnection, content: noConnectionMessage);
      rethrow;
    } on TimeoutException catch (e) {
      // showDialogFlash(title: noConnection, content: timeout);
      rethrow;
    }
  }
}
