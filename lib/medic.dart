import 'package:flutter/material.dart';

class AddMedicationScreen extends StatefulWidget {
  @override
  _AddMedicationScreenState createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final _medicationNameController = TextEditingController();
  final _dosageController = TextEditingController();
  final _milligramController = TextEditingController();
  final _endDateController = TextEditingController();
  final _timeController = TextEditingController();
  String _recurrence = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medication'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _medicationNameController,
              decoration: InputDecoration(
                labelText: 'Medication Name',
                hintText: 'e.g. Risperdal',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _dosageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Dosage',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: DropdownButtonFormField(
                    value: _recurrence,
                    items: ['Daily', 'Weekly', 'Monthly'].map((recurrence) {
                      return DropdownMenuItem(
                        value: recurrence,
                        child: Text(recurrence),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _recurrence = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Recurrence',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _milligramController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Milligram',
                hintText: 'e.g. 4mg',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _endDateController,
              decoration: InputDecoration(
                labelText: 'End Date',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Time(s) for Medication',
                hintText: 'e.g. 3:36 pm',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add more time fields
                    },
                    child: Text('+ Add Time'),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle medication addition
                    },
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
