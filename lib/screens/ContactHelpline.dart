import 'package:covid/providers/contactProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactHelpline extends StatefulWidget {
  @override
  _ContactHelplineState createState() => _ContactHelplineState();
}

class _ContactHelplineState extends State<ContactHelpline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Helpline"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<ContactProvider>(
          create: (context) => ContactProvider(),
          child: Consumer<ContactProvider>(
            builder: (context, provider, child) {
              if (provider.myData == null) {
                provider.getData(context);
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                      columns: [
                        DataColumn(label: Text('State',style: TextStyle(fontWeight: FontWeight.bold),), tooltip: 'State name'),
                        DataColumn(
                            label: Text('Number',style: TextStyle(fontWeight: FontWeight.bold),), tooltip: 'MobileNumber')
                      ],
                      rows: provider.myData.data.contacts.regional.map((data) =>
                          DataRow(cells: [
                            DataCell(Text(data.loc)),
                            DataCell(Text(data.number))
                          ])).toList()),
                ),
              );
            },
          )),
    );
  }
}

//  child: SizedBox(
//         width: double.infinity,
//         child: DataTable(columns: [
//           DataColumn(
//             label: Text(
//               'State',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           DataColumn(
//             label: Text(
//               'Number',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         ], rows: [
//           DataRow(
//             cells: <DataCell>[
//               DataCell(Text('Sarah')),
//               DataCell(Text('199999999999')),
//             ],
//           ),
//           DataRow(
//             cells: <DataCell>[
//               DataCell(Text('Janine')),
//               DataCell(Text('43')),
//             ],
//           ),
//         ]),
//       ),
