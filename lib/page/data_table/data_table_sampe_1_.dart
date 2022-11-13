import 'package:flutter/material.dart';
import 'package:sample/data/users.dart';
import 'package:sample/model/user_model.dart';

class PageData1 extends StatefulWidget {
  const PageData1({super.key});

  @override
  State<PageData1> createState() => _PageData1State();
}

class _PageData1State extends State<PageData1> {
  late List<User> users;

  @override
  void initState() {
    super.initState();
    users = allUsers;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildDataTable(),
    );
  }

  Widget buildDataTable() {
    final columns = ["ID", "NAME", "EMAIL", "Hobby"];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.userId, user.userName, user.email, user.hobby];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
}
