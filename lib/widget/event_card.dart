import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import '../model/event.dart';
import '../util.dart';

class EventCard extends StatelessWidget {
  final String title;
  final DateTime dateTime;
  final String venueName;
  final List<Performer> performers;
  final VoidCallback onTap;
  final String city;
  final String country;

  const EventCard({
    required this.title,
    required this.dateTime,
    required this.venueName,
    required this.performers,
    required this.onTap,
    required this.city,
    required this.country
  });

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      theme: ExpandableThemeData(hasIcon: false),
      expanded: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFFFFFF),
                Color.fromARGB(255, 204, 214, 231),
              ],
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey.withOpacity(.01)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(0, .5),
                spreadRadius: .1,
                blurRadius: 3,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🌍 Venue: $venueName, $city, $country',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Performers',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Color(0xff343D8D),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: performers
                          .map(
                            (performer) => _buildPerformerWidget(performer),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: onTap,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 194, 202, 245),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(0.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'More Details',
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
        ),
      ),
      collapsed: SizedBox(),
      header: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          // onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFFFFFF),
                  Color.fromARGB(255, 204, 214, 231),
                ],
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey.withOpacity(.01)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(0, .5),
                  spreadRadius: .1,
                  blurRadius: 3,
                ),
              ],
            ),
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(performers.isNotEmpty
                          ? performers[0].image ?? ''
                          : ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                    width:
                        8.0), // Add some spacing between the photo and the other content
                Container(
                  width: 1.0,
                  color: Colors.grey
                      .withOpacity(0.5), // Add a small vertical thin line color
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffECEEF9),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.01)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${formatTime(dateTime)} \u23F0",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    formatDate(dateTime),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                              width:
                                  14.0), // Add spacing between the date-time column and the title
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19.0,
                                    color: Color(0xff343D8D),
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Row(
                                  children: [
                                    const Text(
                                      "🌍 Venue: ",
                                      style: TextStyle(
                                        color: Color(0xff343D8D),
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        venueName,
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16.0,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
           const     Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Color(0xff343D8D),
                  size: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPerformerWidget(Performer performer) {
    return Tooltip(
      message: performer.name ?? '',
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: CircleAvatar(
          backgroundImage: NetworkImage(performer.image ?? ''),
          radius: 24,
        ),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
