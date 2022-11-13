import 'dart:convert';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample/data/users.dart';
import 'package:sample/model/user_model.dart';
import 'package:sample/page/excel/util_excel.dart';

class ExcelSample1 extends StatefulWidget {
  const ExcelSample1({super.key});

  @override
  State<ExcelSample1> createState() => _ExcelSample1State();
}

class _ExcelSample1State extends State<ExcelSample1> {
  static const int rows = 10000;
  Duration? executionTime;

  void exportToExcelOrj() {
    final stopwatch = Stopwatch()..start();

    final excel = Excel.createExcel();
    final Sheet sheet = excel[excel.getDefaultSheet()!];

    for (var row = 0; row < rows; row++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: row))
          .value = 'FLUTTER';

      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: row))
          .value = 'is';

      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: row))
          .value = "Google's";

      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: row))
          .value = "UI";

      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: row))
          .value = "toolkit";
    }

    excel.save(fileName: "MyData.xlsx");
    setState(() {
      executionTime = stopwatch.elapsed;
    });
  }

  Future<void> exportToExcel() async {
    //ExcelUtil.exportExcel("test_", 4, 3);
    // List<User> userList = allUsers;
    Map<String, dynamic> data = await takeJson();

    ExcelUtil.exportExcelFromJson(data);
  }

  Future<Map<String, dynamic>> takeJson() async {
    String jsonString = await rootBundle.loadString('data/userss.json');
    final Map<String, dynamic> jsonResponse = json.decode(jsonString);
    debugPrint("jsonResponse is ${jsonResponse.keys.first}");

    // List<dynamic> a = jsonResponse['data'];
    // //debugPrint("length: ${a.length}     ");
    // Map<String, dynamic> b = a[0];
    // b.forEach((key, value) {
    //   debugPrint("key: $key    value:$value");
    // });
    return jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              '$rows rows to Excel',
              style: TextStyle(fontSize: 40),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Export to Excel'),
              onPressed: exportToExcel,
            ),
          ),
          if (executionTime != null)
            Center(
              //child: Text(executionTime.toString()),
              child: Text("test"),
            )
          else if (1 == 1)
            Center(
              //child: Text(executionTime.toString()),
              child: Text("test"),
            )
        ],
      ),
    );
  }
}
