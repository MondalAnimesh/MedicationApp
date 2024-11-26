import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<MedicationHistoryEntry> _historyEntries = [
    MedicationHistoryEntry(
      date: DateTime(2023, 11, 25),
      medicationName: 'Biogesic',
      time: const TimeOfDay(hour: 15, minute: 36),
      status: MedicationStatus.Skipped,
    ),
    MedicationHistoryEntry(
      date: DateTime(2023, 11, 25),
      medicationName: 'Biogesic',
      time: const TimeOfDay(hour: 15, minute: 36),
      status: MedicationStatus.Skipped,
    ),
    MedicationHistoryEntry(
      date: DateTime(2023, 11, 25),
      medicationName: 'Biogesic',
      time: const TimeOfDay(hour: 15, minute: 36),
      status: MedicationStatus.Skipped,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _historyEntries.length,
                itemBuilder: (context, index) {
                  final entry = _historyEntries[index];
                  return HistoryEntryCard(
                    date: entry.date,
                    medicationName: entry.medicationName,
                    time: entry.time,
                    status: entry.status,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicationHistoryEntry {
  final DateTime date;
  final String medicationName;
  final TimeOfDay time;
  final MedicationStatus status;

  MedicationHistoryEntry({
    required this.date,
    required this.medicationName,
    required this.time,
    required this.status,
  });
}

enum MedicationStatus {
  Taken,
  Skipped,
  Missed,
}

class HistoryEntryCard extends StatelessWidget {
  final DateTime date;
  final String medicationName;
  final TimeOfDay time;
  final MedicationStatus status;

  const HistoryEntryCard({
    super.key,
    required this.date,
    required this.medicationName,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(medicationName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_formatDate(date)),
            Text('Skipped at ${_formatTime(time)}'),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('EEEE, MMMM d').format(date);
  }

  String _formatTime(TimeOfDay time) {
    return DateFormat('h:mm a')
        .format(DateTime(0, 0, 0, time.hour, time.minute));
  }
}
