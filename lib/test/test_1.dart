import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sample/contants/data_table_constants.dart';

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: _colGen(),
        rows: List<DataRow>.generate(
          numItems,
          (int index) => DataRow(
            // color: MaterialStateProperty.resolveWith<Color?>(
            //     (Set<MaterialState> states) {
            //   // All rows will have the same selected color.
            //   if (states.contains(MaterialState.selected)) {
            //     return Theme.of(context).colorScheme.primary.withOpacity(0.08);
            //   }
            //   // Even rows will have a grey color.
            //   if (index.isEven) {
            //     return Colors.grey.withOpacity(0.3);
            //   }
            //   return null; // Use default value for other states and odd rows.
            // }),
            cells: <DataCell>[
              DataCell(Text('Row $index')),
              DataCell(Text('Row $index')),
              DataCell(Text('Row $index')),
            ],
            selected: selected[index],
            // onSelectChanged: (bool? value) {
            //   setState(() {
            //     selected[index] = value!;
            //   });
            // },
          ),
        ),
      ),
    );
  }

  List<DataColumn> _colGen(
          //UserDataTableSource _src,
          ) =>
      <DataColumn>[
        const DataColumn(
          label: Text(DataTableConstants.colID),
          numeric: true,
          tooltip: DataTableConstants.colID,
          // onSort: (colIndex, asc) {
          //   //_sort<num>((user) => user.id, colIndex, asc, _src, _provider);
          // },
        ),
        const DataColumn(
          label: Text(DataTableConstants.colName),
          tooltip: DataTableConstants.colName,
          // onSort: (colIndex, asc) {
          //   //_sort<String>((user) => user.name, colIndex, asc, _src, _provider);
          // },
        ),
        const DataColumn(
          label: Text(DataTableConstants.colEmail),
          tooltip: DataTableConstants.colEmail,
          // onSort: (colIndex, asc) {
          //   //_sort<String>((user) => user.email, colIndex, asc, _src, _provider);
          // },
        ),
      ];
}

// class DataTableConstants {
//   DataTableConstants._();

//   static const String youtube = 'https://youtu.be/Tw9LSJCpQMs';

//   static const String website =
//       'https://flatteredwithflutter.com/using-paginateddatatable-in-flutter-web/';

//   static const String medium =
//       'https://medium.com/@aseemwangoo/flutter-web-and-paginateddatatable-3779da7683e';

//   static const String dtTitle = 'Hands on With DataTable';
//   static const String users = 'List of Users (Sort by Name, ID, Email)';

//   // COLUMNS
//   static const String colName = 'Name';
//   static const String colID = 'ID';
//   static const String colPhone = 'Phone';
//   static const String colEmail = 'Email';
//   static const String colWebsite = 'Website';
//   static const String otherDetails = 'Other Details';

//   // REFRESH TEXT
//   static const String refresh = '🔄🔄 Refreshed Successfully !!';

//   // FIELDS
//   static const String city = 'City';
//   static const String street = 'Street';
//   static const String suite = 'Suite';
//   static const String zipcode = 'ZipCode';
//   static const String coords = 'Coordinates';
// }

// ////////////////////////////////////////////////////////
// typedef OnRowSelect = void Function(int index);

// class UserDataTableSource extends DataTableSource {
//   UserDataTableSource({
//     required List<UserModel> userData,
//     required this.onRowSelect,
//   })  : _userData = userData,
//         assert(userData != null);

//   final List<UserModel> _userData;
//   final OnRowSelect onRowSelect;

//   @override
//   DataRow? getRow(int index) {
//     assert(index >= 0);

//     if (index >= _userData.length) {
//       return null;
//     }
//     final _user = _userData[index];

//     return DataRow.byIndex(
//       index: index, // DONT MISS THIS
//       cells: <DataCell>[
//         DataCell(Text('${_user.id}')),
//         DataCell(Text('${_user.name}')),
//         DataCell(Text('${_user.email}')),
//         DataCell(Text('${_user.phone}')),
//         DataCell(Text('${_user.website}')),
//         DataCell(
//           IconButton(
//             hoverColor: Colors.transparent,
//             splashColor: Colors.transparent,
//             icon: const Icon(Icons.details),
//             onPressed: () => onRowSelect(index),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get rowCount => _userData.length;

//   @override
//   int get selectedRowCount => 0;

//   /*
//    *
//    * Sorts this list according to the order specified by the [compare] function.

//     The [compare] function must act as a [Comparator].

//     List<String> numbers = ['two', 'three', 'four'];
// // Sort from shortest to longest.
//     numbers.sort((a, b) => a.length.compareTo(b.length));
//     print(numbers);  // [two, four, three]
//     The default List implementations use [Comparable.compare] if [compare] is omitted.

//     List<int> nums = [13, 2, -11];
//     nums.sort();
//     print(nums);  // [-11, 2, 13]
//    */
//   void sort<T>(Comparable<T> Function(UserModel d) getField, bool ascending) {
//     _userData.sort((a, b) {
//       final aValue = getField(a);
//       final bValue = getField(b);
//       return ascending
//           ? Comparable.compare(aValue, bValue)
//           : Comparable.compare(bValue, aValue);
//     });

//     notifyListeners();
//   }
// }

// ///////////////////////////////////////////////////////////////////
// ///List<UserModel> userModelFromJson(String str) =>
// List<UserModel> userModelFromJson(String str) =>
//     List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

// String userModelToJson(List<UserModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class UserModel {
//   UserModel({
//     this.id,
//     this.name,
//     this.username,
//     this.email,
//     this.address,
//     this.phone,
//     this.website,
//     this.company,
//   });

//   int? id;
//   String? name;
//   String? username;
//   String? email;
//   Address? address;
//   String? phone;
//   String? website;
//   Company? company;

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         id: json["id"],
//         name: json["name"],
//         username: json["username"],
//         email: json["email"],
//         address: Address.fromJson(json["address"]),
//         phone: json["phone"],
//         website: json["website"],
//         company: Company.fromJson(json["company"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "username": username,
//         "email": email,
//         "address": address?.toJson(),
//         "phone": phone,
//         "website": website,
//         "company": company?.toJson(),
//       };
// }

// class Address {
//   Address({
//     this.street,
//     this.suite,
//     this.city,
//     this.zipcode,
//     this.geo,
//   });

//   String? street;
//   String? suite;
//   String? city;
//   String? zipcode;
//   Geo? geo;

//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//         street: json["street"],
//         suite: json["suite"],
//         city: json["city"],
//         zipcode: json["zipcode"],
//         geo: Geo.fromJson(json["geo"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "street": street,
//         "suite": suite,
//         "city": city,
//         "zipcode": zipcode,
//         "geo": geo?.toJson(),
//       };
// }

// class Geo {
//   Geo({
//     this.lat,
//     this.lng,
//   });

//   String? lat;
//   String? lng;

//   factory Geo.fromJson(Map<String, dynamic> json) => Geo(
//         lat: json["lat"],
//         lng: json["lng"],
//       );

//   Map<String, dynamic> toJson() => {
//         "lat": lat,
//         "lng": lng,
//       };
// }

// class Company {
//   Company({
//     this.name,
//     this.catchPhrase,
//     this.bs,
//   });

//   String? name;
//   String? catchPhrase;
//   String? bs;

//   factory Company.fromJson(Map<String, dynamic> json) => Company(
//         name: json["name"],
//         catchPhrase: json["catchPhrase"],
//         bs: json["bs"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "catchPhrase": catchPhrase,
//         "bs": bs,
//       };
// }

