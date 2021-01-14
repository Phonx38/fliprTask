import 'package:covid/providers/notificationProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid/extensions/mapIndexed.dart';


class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications Advisory"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<NotificationProvider>(
          create: (context) => NotificationProvider(),
          child: Consumer<NotificationProvider>(
            builder: (context, provider, child) {
              if (provider.notificationData == null) {
                provider.getNotificationData(context);
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                          columns: [
                            // DataColumn(label: Text('Date',style: TextStyle(fontWeight: FontWeight.bold),), tooltip: 'Date'),
                            DataColumn(label: Text('Title',style: TextStyle(fontWeight: FontWeight.bold),), tooltip: 'Title'),
                            DataColumn(
                                label: Text('Link',style: TextStyle(fontWeight: FontWeight.bold),), tooltip: 'Link')
                          ],
                          rows: provider.notificationData.data.notifications.mapIndexed((data,i) =>
                              
                              DataRow(cells: [
                                // DataCell(Text(data.title.split(pattern))),
                                DataCell(Text(i == 0 ? data.title : data.title.substring(0,10))),
                                DataCell(Text(data.link))
                              ])).toList()
                              
                              ),
                         
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
 
}