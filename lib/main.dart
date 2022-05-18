import 'package:flutter/material.dart';

import 'apiservices.dart';
import 'dataclass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Service serviceAPI = Service();
  late Future<List<cData>> listData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coba API 1",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Coba API 1"),
        ),
        body: Container(
            child: FutureBuilder<List<cData>>(
                future: listData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<cData> isiData = snapshot.data!;
                    return ListView.builder(
                      itemCount: isiData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(isiData[index].cnama),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(isiData[index].cavatar),
                            ),
                            subtitle: Text(isiData[index].cpekerjaan),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                })),
      ),
    );
  }
}
