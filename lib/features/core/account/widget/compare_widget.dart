import 'package:flutter/material.dart';
import 'package:nam_training/features/core/booking%20manager/widget/event.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/text.dart';
import 'package:table_calendar/table_calendar.dart';

class CompareWidget extends StatefulWidget {
  const CompareWidget({Key? key}) : super(key: key);

  @override
  _CompareWidgetState createState() => _CompareWidgetState();
}

class _CompareWidgetState extends State<CompareWidget> {
  String compare = 'Hình ảnh';
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
      backgroundColor: backgroundLogin,
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
        title: const Text(
          'So sánh tiến tiến trình',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CHỌN THÔNG SỐ',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8e8e8e)),
                  ),
                  Container(
                    height: 56,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.only(top: 8, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chiều cao',
                          style: text15xp4w,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  const Text(
                    'CHỌN HÌNH THỨC SO SÁNH',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8e8e8e)),
                  ),
                  Container(
                    height: 56,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.only(top: 8, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Colors.white,
                      ),
                      child: DropdownButton<String>(
                          isExpanded: true,
                          value: compare,
                          itemHeight: 60,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            size: 25,
                          ),
                          iconSize: 42,
                          underline: SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              compare = newValue!;
                            });
                          },
                          items: <String>['Hình ảnh', 'Theo ngày']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList()),
                    ),
                  ),
                  compare == 'Hình ảnh'
                      ? Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 7,
                            mainAxisSpacing: 25,
                            childAspectRatio: 0.9 / 1,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const ImageItem(
                                image: imagePortrait1,
                                day: '02/12/2010',
                              ),
                              const ImageItem(
                                image: imagePortrait2,
                                day: '02/12/2011',
                              ),
                              const ImageItem(
                                image: imagePortrait3,
                                day: '02/12/2011',
                              ),
                              const ImageItem(
                                image: imagePortrait4,
                                day: '02/12/2010',
                              ),
                              const ImageItem(
                                image: imagePortrait1,
                                day: '02/12/2010',
                              ),
                              const ImageItem(
                                image: imagePortrait2,
                                day: '02/12/2011',
                              ),
                            ],
                          ),
                        )
                      : Container(
                          child: InkWell(
                            // ignore: unnecessary_lambdas
                            onTap: () {
                              _dayPicker();
                            },
                            child: Text(
                              'Chọn ngày',
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                        )
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: mainGradiant,
                    boxShadow: [shadowMain]),
                child: const Center(
                  child: Text(
                    'So sánh',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  final String day;
  final String image;
  const ImageItem({Key? key, required this.day, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Container(
              height: 103,
              width: 103,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff39C541)),
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        Text(
          day,
          style: text13xp4w,
        )
      ],
    );
  }
}
