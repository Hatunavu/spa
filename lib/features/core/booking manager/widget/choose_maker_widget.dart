import 'package:flutter/material.dart';
import 'package:nam_training/features/core/booking%20manager/widget/booker_infor_widget.dart';
import 'package:nam_training/features/core/booking%20manager/widget/event.dart';
import 'package:nam_training/features/core/booking%20manager/widget/maker_card.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/text.dart';
import 'package:table_calendar/table_calendar.dart';

class ChooseMakerWidget extends StatefulWidget {
  final String titleApbar;
  const ChooseMakerWidget({Key? key, required this.titleApbar})
      : super(key: key);

  @override
  _ChooseMakerWidgetState createState() => _ChooseMakerWidgetState();
}

class _ChooseMakerWidgetState extends State<ChooseMakerWidget> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  // ignore: always_declare_return_types
  _dayPicker() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 421,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TableCalendar(
                  focusedDay: selectedDay,
                  firstDay: DateTime(1990),
                  lastDay: DateTime(2050),
                  calendarFormat: format,
                  onFormatChanged: (CalendarFormat _format) {
                    setState(() {
                      format = _format;
                    });
                  },
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  daysOfWeekVisible: true,
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    setState(() {
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                    });
                  },
                  selectedDayPredicate: (DateTime date) {
                    return isSameDay(selectedDay, date);
                  },

                  // eventLoader: _getEventsfromDay,
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: true,
                    selectedDecoration: BoxDecoration(
                      gradient: mainGradiant,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: const TextStyle(color: Colors.white),
                    todayDecoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    todayTextStyle: TextStyle(color: primaryColor),
                    defaultDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 44,
                          width: 166,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: const Color(0xffE1DDF5)),
                          child: Center(
                            child: Text(
                              'Hủy',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 44,
                        width: 166,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            gradient: mainGradiant),
                        child: const Center(
                          child: Text(
                            'Xác nhận',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.titleApbar,
          style: const TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        height: 60,
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookerInforWidget()));
            },
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                  gradient: mainGradiant,
                  borderRadius: BorderRadius.circular(23.5)),
              child: const Center(
                  child: Text(
                'Tiếp tục',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )),
            ),
          ),
        ),
      ),
      backgroundColor: backgroundLogin,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 13, left: 16, bottom: 8),
              child: Text(
                'Chọn người làm',
                style: text17xp6w,
              ),
            ),
            Container(
              height: 133,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const MakerCard(
                    choose: true,
                    did: false,
                    name: 'Spa tự chọn cho bạn',
                    image: imagePortrait1,
                  ),
                  const MakerCard(
                    choose: false,
                    did: true,
                    image: imagePortrait2,
                    name: 'Trần An Dương',
                  ),
                  const MakerCard(
                    choose: false,
                    did: true,
                    name: 'Trần An Dương',
                    image: imagePortrait3,
                  ),
                  const MakerCard(
                    choose: false,
                    did: false,
                    name: 'Hoàng Văn Bảo',
                    image: imagePortrait4,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 12),
              height: 120,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chọn ngày',
                          style: text17xp6w,
                        ),
                        InkWell(
                          // ignore: unnecessary_lambdas
                          onTap: () {
                            _dayPicker();
                          },
                          child: Text(
                            'Chọn ngày khác',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 52,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const DayCard(
                          week: 'Hôm nay',
                          month: '14/11',
                          choose: true,
                        ),
                        const DayCard(
                          week: 'Thứ 6',
                          month: '15/11',
                          choose: false,
                        ),
                        const DayCard(
                          week: 'Thứ 7',
                          month: '15/11',
                          choose: false,
                        ),
                        const DayCard(
                          week: 'Chủ nhật',
                          month: '15/11',
                          choose: false,
                        ),
                        const DayCard(
                          week: 'Thứ 2',
                          month: '15/11',
                          choose: false,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
              margin: const EdgeInsets.only(bottom: 10),
              height: 300,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chọn giờ',
                    style: text17xp6w,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 4,
                      childAspectRatio: 2.05,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 9,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                        const HourCard(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DayCard extends StatelessWidget {
  final String week;
  final String month;
  final bool choose;
  const DayCard(
      {Key? key, required this.week, required this.month, required this.choose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 68,
      decoration: BoxDecoration(
          color: choose ? null : const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(8),
          gradient: choose ? mainGradiant : null),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            week,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: choose ? Colors.white : const Color(0xff616161)),
          ),
          Text(
            month,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: choose ? Colors.white : const Color(0xff616161)),
          )
        ],
      ),
    );
  }
}

class HourCard extends StatelessWidget {
  const HourCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 41,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Color(0xffF6F6F6)),
      child: Center(
        child: Text(
          '08:00',
          style: text15xp4w,
        ),
      ),
    );
  }
}
