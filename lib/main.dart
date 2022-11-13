import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/page/data_table/data_table_sampe_1_.dart';
import 'package:sample/page/data_table/page_data_table_sample_1.dart';
import 'package:sample/page/data_table/page_data_table_sample_2.dart';
import 'package:sample/page/data_table/page_data_table_sample_3.dart';
import 'package:sample/page/data_table/page_data_table_sample_4.dart';
import 'package:sample/page/excel/excel_sample_1.dart';
import 'package:sample/test/test_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          //    _sampleDataTabel(),
          _sampleExcel(),
        ]),
      ),
    );
  }

  Widget _sampleExcel() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => Get.to(() => const ExcelSample1()),
                child: const Text("excel_sample_1")),
            const SizedBox(width: 15),
          ],
        ),
      ],
    );
  }

  Widget _sampleDataTabel() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => Get.to(() => const PageData1()),
                child: const Text("data_table_1")),
            const SizedBox(width: 15),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => Get.to(() => const DataTableSample1()),
                child: const Text("page_table_1")),
            const SizedBox(width: 15),
            ElevatedButton(
                onPressed: () => Get.to(() => const DataTableDemo()),
                child: const Text("page_table_2")),
            const SizedBox(width: 15),
            ElevatedButton(
                onPressed: () => Get.to(() => const CustomPaginatedTable()),
                child: const Text("page_table_3")),
            const SizedBox(width: 15),
            ElevatedButton(
                onPressed: () => Get.to(() => const InternalWidget()),
                child: const Text("page_table_4")),
            const SizedBox(width: 15),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Get.to(() => const Test1()),
                child: const Text("Test1")),
            const SizedBox(width: 15),
          ],
        )
      ],
    );
  }
}
