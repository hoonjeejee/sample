import 'package:flutter/material.dart';
import 'package:sample/page/data_table/page_data_table_sample_3.dart';

class InternalWidget extends StatelessWidget {
  const InternalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedTable(
      actions: <IconButton>[
        IconButton(
          splashColor: Colors.red,
          icon: const Icon(Icons.refresh),
          onPressed: () {
            // _provider.fetchData();
            // _showSBar(context, DataTableConstants.refresh);
          },
        ),
        IconButton(
          splashColor: Colors.black,
          icon: const Icon(Icons.refresh),
          onPressed: () {
            // _provider.fetchData();
            // _showSBar(context, DataTableConstants.refresh);
          },
        ),
      ],
      // dataColumns: _colGen(_dtSource, _provider),
      // header: const Text(DataTableConstants.users),
      // onRowChanged: (index) => _provider.rowsPerPage = index,
      // rowsPerPage: _provider.rowsPerPage,
      showActions: true,
      // source: _dtSource,
      // sortColumnIndex: _provider.sortColumnIndex,
      // sortColumnAsc: _provider.sortAscending,
    );
  }
}
