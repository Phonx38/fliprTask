import 'package:covid/providers/chartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart Boi"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<ChartProvider>(
          create: (context) => ChartProvider(),
          child: Consumer<ChartProvider>(
            builder: (context, provider, child) {
              if (provider.sampledData == null &&
                  provider.confirmedData == null) {
                provider.getSampledData(context);
                provider.getConfirmedData(context);
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          
              return Column(
                children: [
              
                  // new DropdownButton<String>(
                  //   items: provider.sampledData.data.map((hey) {
                  //     return new DropdownMenuItem<String>(
                  //       value: value,
                  //       child: new Text(hey[index].),
                  //     );
                  //   }).toList(),
                  //   onChanged: (_) {},
                  // )
                ],
              );
            },
          )),
    );
  }
}
