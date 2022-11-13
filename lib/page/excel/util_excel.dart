import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:sample/model/user_model.dart';

class ExcelUtil {
  static void exportExcel(
    String fileName,
    int rowCount,
    int columnCount,
  ) {
    final excel = Excel.createExcel();
    final Sheet sheet = excel[excel.getDefaultSheet()!];

    for (var row = 0; row < rowCount; row++) {
      for (var column = 0; column < columnCount; column++) {
        _buildCell(sheet, column, row, "1");
      }
    }

    excel.save(fileName: "$fileName.xlsx");
  }

  static void _buildCell(
      Sheet sheet, int columnIdx, int rowIdx, String pValue) {
    sheet
        .cell(CellIndex.indexByColumnRow(
            columnIndex: columnIdx, rowIndex: rowIdx))
        .value = pValue;
  }

  static void exportExcelFromJson(Map<String, dynamic> jsonResponse) {
    final excel = Excel.createExcel();
    final Sheet sheet = excel[excel.getDefaultSheet()!];

    String topKey = jsonResponse.keys.first;
    List<dynamic> list = jsonResponse[topKey];
    late Map<String, dynamic> element;
    late List<String> subList;
    for (var row = 0; row < list.length; row++) {
      element = list[row];
      subList = element.keys.toList();
      for (var column = 0; column < subList.length; column++) {
        _buildCell2(sheet, column, row, element[column]);
      }
    }

    excel.save(fileName: "a.xlsx");
  }

  static void _buildCell2(
      Sheet sheet, int rowIdx, int columnIdx, String pValue) {
    sheet
        .cell(CellIndex.indexByColumnRow(
            columnIndex: columnIdx, rowIndex: rowIdx))
        .value = pValue;
  }
}
