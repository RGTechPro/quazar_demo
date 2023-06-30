import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quazar_demo/model/event.dart';

final dio = Dio();

final eventServiceProvider = Provider((ref) => EventServiceImpl());

abstract class EventService {
  Future getAllEvents({required int pageno});
}

class EventServiceImpl extends EventService {
  // final _client = Client();
  String clientId = 'MzQ2MDU5NjV8MTY4ODA2NjI1OC41NzUzMTg4';
  String clientSecret =
      '3374ffe9de3646cca8606540025e319a35bfd52d903dd55f1c39d1b318521322';
  String baseUrl = "https://api.seatgeek.com/2/events";

  @override
  Future<EventData> getAllEvents({required int pageno}) async {

    String url =
        "$baseUrl?client_id=$clientId&client_secret=$clientSecret&page=$pageno&per_page=15";
    Response response;
    response = await dio.get(url);
    print(response.data.toString());
    final data = response.data;
    return EventData.fromJson(data);
  }
}
