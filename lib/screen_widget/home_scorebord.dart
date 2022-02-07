import 'package:flutter/material.dart';
import 'package:setes_mobile/module/simple.dart';
import 'package:setes_mobile/screen/scorebord.dart';
import 'package:setes_mobile/widget/scorebord_timer.dart';

class HomeScorebord extends StatelessWidget {
  final List bookings;
  const HomeScorebord(this.bookings, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size scr = getScreen(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffFE8260), Color(0xff7249FB)],
        ),
      ),
      width: scr.width,
      height: scr.height,
      child: Column(
        children: [
          Container(
            height: scr.width,
            width: scr.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/scoreBordBg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 28,
                        color: Colors.white70,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          "Score Board",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                          "Setes Match Scoar Board",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white70,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Positioned(
                  top: -scr.width,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Container(
                      margin: EdgeInsets.only(top: 65),
                      child: ClipRRect(
                        // clipBehavior: Clip.,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: scr.width * .5),
                              Container(
                                constraints: BoxConstraints(
                                    minHeight:
                                        scr.height - (scr.width * .5 + 90)),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    topRight: Radius.circular(35),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: scr.width * .05,
                                        vertical: 15,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    "My Location",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black54,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 18,
                                                    color: Colors.black54,
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "Today",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black87,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.search_sharp,
                                            size: 40,
                                            color: Color(0xff0E6E9D),
                                          )
                                        ],
                                      ),
                                    ),
                                    for (var i = 0; i < bookings.length; i++)
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ScoreBordScreen(bookings[i]),
                                            ),
                                          );
                                        },
                                        child: EachScore(bookings[i]),
                                      ),
                                    if (bookings.length == 0)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "No Match",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    SizedBox(height: 100),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EachScore extends StatelessWidget {
  final Map booking;
  const EachScore(this.booking, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            top: 0,
            left: 30,
            right: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                color: Colors.red,
                gradient: LinearGradient(colors: [
                  Color(0xffCE5859), //FC652E
                  Color(0xffEF8464),
                ]),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 30,
                    color: Colors.black12,
                  ),
                ],
              ),
              height: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              booking['slot'] == null
                                  ? "Unnamed"
                                  : booking['slot']["truf_name"] ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              booking['slot'] == null
                                  ? ''
                                  : booking['slot']["ground"] ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  findWInner(booking),
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ScoreBoradTimer(booking)
                              ],
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  "Red",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Blue",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        booking['goals']['r'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        booking['goals']['b'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 0,
            width: 60,
            bottom: 45,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                gradient: LinearGradient(
                  colors: [Color(0xffFC652E), Color(0xffF9BE08)],
                ),
              ),
              child: const Text(
                "RED\nTEAM",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Positioned(
            top: 25,
            right: 0,
            width: 60,
            bottom: 45,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                gradient: LinearGradient(
                  colors: [Color(0xff3B4EFC), Color(0xffB409F8)],
                ),
              ),
              child: const Text(
                "BLUE\nTEAM",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
