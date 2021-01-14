import 'package:covid/models/HospitalModel.dart';
import 'package:covid/providers/HospitalProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HospitalScreen extends StatefulWidget {
  @override
  _HospitalScreenState createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  HospitalProvider hospitalProvider = HospitalProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            context: context, 
            builder: (context){
              return Container(
              
                height: 300,
                 decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DecoratedTextField(placeholder: "State Name",),
              DecoratedTextField(placeholder: "Type",),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                color: Colors.blue,
                onPressed: (){},
                child: Text("Filter",style:TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.bold
                )),
                )
            ],
          ),
        ),
              );
            });
        },
        child: Icon(Icons.sort),
      ),
      appBar: AppBar(
        title: GestureDetector(onTap: () {}, child: Text("Hospitals & Beds")),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<HospitalProvider>(
          create: (context) => HospitalProvider(),
          child: Consumer<HospitalProvider>(
            builder: (context, provider, child) {
              if (provider.hospitalData == null) {
                provider.getHospitalData(context);
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              provider.hospitalData.data.regional.add(Regional(
                state: "Total",
                ruralBeds: provider.getTotal()[0],
                ruralHospitals: provider.getTotal()[1],
                urbanHospitals: provider.getTotal()[2],
                urbanBeds: provider.getTotal()[3],
                totalHospitals: provider.getTotal()[4],
                totalBeds: provider.getTotal()[5],
              ));

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DataTable(
                          columns: [
                            // DataColumn(label: Text('Date',style: TextStyle(fontWeight: FontWeight.bold),), tooltip: 'Date'),
                            DataColumn(
                                label: Text(
                                  'State',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                tooltip: 'Title'),
                            DataColumn(
                                label: Text(
                                  'Rural Hospitals',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                tooltip: 'Link'),
                            DataColumn(
                                label: Text(
                                  'Rural Beds',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                tooltip: 'Link'),
                            DataColumn(
                                label: Text(
                                  'Urban Hospitals',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                tooltip: 'Link'),
                            DataColumn(
                                label: Text(
                                  'Urban Beds',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                tooltip: 'Link'),
                            DataColumn(
                                label: Text(
                                  'Total Hospitals',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                tooltip: 'Link'),
                            DataColumn(
                                label: Text(
                                  'Total Beds',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                tooltip: 'Link'),
                          ],
                          rows: provider.hospitalData.data.regional
                              .map((data) => DataRow(cells: [
                                    // DataCell(Text(data.title.split(pattern))),
                                    DataCell(Text(data.state)),
                                    DataCell(Text('${data.ruralHospitals}')),
                                    DataCell(Text('${data.ruralBeds}')),
                                    DataCell(Text('${data.urbanHospitals}')),
                                    DataCell(Text('${data.urbanBeds}')),
                                    DataCell(Text('${data.totalHospitals}')),
                                    DataCell(Text('${data.totalBeds}')),
                                  ]))
                              .toList()),
                      Row(
                        children: [],
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}


class DecoratedTextField extends StatefulWidget {
  String placeholder;
  DecoratedTextField({
    this.placeholder
  });
  @override
  _DecoratedTextFieldState createState() => _DecoratedTextFieldState();
}

class _DecoratedTextFieldState extends State<DecoratedTextField> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
        child: TextField(
          decoration: InputDecoration.collapsed(
            hintText:widget.placeholder,
          ),
        ));
  }
}

