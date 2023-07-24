import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../components/base_screen.dart';

class ScheduleServiceDateScreen extends StatefulWidget {
  @override
  _ScheduleServiceDateScreenState createState() =>
      _ScheduleServiceDateScreenState();
}

class _ScheduleServiceDateScreenState extends State<ScheduleServiceDateScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Selecione o dia e hora',
      child: Column(
        children: [
          const Text('Selecione a data para seu agendamento'),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(top: 20),
            child: const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profissional: Nathan',
                    ),
                    Text('Serviço: Corte + Barba'),
                  ],
                ),
              ],
            ),
          ),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarFormat: _calendarFormat,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Mês',
              CalendarFormat.week: 'Semana'
            },
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.

              // Using `isSameDay` is recommended to disregard
              // the time-part of compared DateTime objects.
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                print(selectedDay);
                print(focusedDay);
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          const Divider(),
          const Text('Selecione um horário:'),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 70,
                childAspectRatio: 1.7,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  alignment: Alignment.center,
                  child: const Text('07:00'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  alignment: Alignment.center,
                  child: const Text('07:00'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  alignment: Alignment.center,
                  child: const Text('07:00'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  alignment: Alignment.center,
                  child: const Text('07:00'),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  alignment: Alignment.center,
                  child: const Text('07:00'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
