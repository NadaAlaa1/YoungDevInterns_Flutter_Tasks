import 'package:flutter/material.dart';
import 'package:flutter_calculator/imports.dart';
import 'package:flutter_calculator/model/historyitem.dart';
import 'package:hive/hive.dart';

class History extends StatelessWidget {
  History({super.key});
  final List<HistoryItem> result = Hive.box<HistoryItem>('history')
      .values
      .toList()
      .reversed
      .toList()
      .cast<HistoryItem>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        context,
        'History',
        Icons.auto_delete_outlined,
        () {
          Navigator.pop(context);
          Hive.box<HistoryItem>('history').clear();
        },
      ),
      body: result.isEmpty
          ? Center(
              child: Text(
                'There is no history',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 18.0),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(3.0),
              itemCount: result.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 10),
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: 12,
                  ),
                  title: Text(
                    result[i].title,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06),
                  ),
                  subtitle: Text(
                    result[i].subtitle,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04),
                  ),
                );
              },
            ),
    );
  }
}
