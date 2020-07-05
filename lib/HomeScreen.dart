import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

//List<Application> apps = await DeviceApps.getInstalledApplications();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  TabController _controller;
  static List apps;
  static int apptotal;
  @override
  void initState() {
    super.initState();
    _controller= new TabController(length: 5,vsync: this);
    apps=new List();
    apptotal=0;
  }

  Future <void> getApps () async
  {
    List _apps = await DeviceApps.getInstalledApplications(
        includeAppIcons: true);
    setState(() {
      apps = _apps;
      apptotal= _apps.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    getApps();
    double _screenwidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          elevation: 0,
          title : Text('Sharer'),
          backgroundColor: Colors.blue[600],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: Column(
          children: <Widget>[
            Flexible(
              fit:FlexFit.tight,
              flex: 1,
              child: Container(
                  width: _screenwidth,
                  color: Colors.lightBlue,
                  child: TabBar(
                    controller: _controller,
                      tabs: [
                        Tab(
                          text: 'Apps',
                    ),
                        Tab(
                      text: 'Images',
                    ),
                        Tab(
                          text: 'Videos',
                        ),
                        Tab(
                          text: 'Docs',
                        ),
                        Tab(
                          text: 'Storage',
                        ),
                    ])
          ),
          ),
            Flexible(
            fit:FlexFit.tight,
              flex: 9,
              child: Container(
                child: TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          Application app=apps[index];
                          return Column(
                            children: <Widget>[
                              ListTile(
                                leading:Image.memory(app is ApplicationWithIcon ? app.icon : null),
                                title:Text("${app.appName}"),
                                subtitle: Text('Version: ${app.versionName}\n'),
                            ),
                              Divider(height: 7,color: Colors.black,thickness: 1,)
                          ],
                          );
                        },
                        shrinkWrap: true,
                        itemCount: apptotal,
                      ),
                    ),
                    Card(),
                    Card(),
                    Card(),
                    Card(),
                  ],
                ),
                ),
              ),
            SizedBox(height: 20,),
            Flexible(
            flex: 1,
            fit: FlexFit.tight,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              FloatingActionButton.extended(
                onPressed: () {},
                heroTag: 'send',
                label: Text('Send '),
                icon: Icon(Icons.file_upload, color: Colors.white,),
              ),
              FloatingActionButton.extended(
                onPressed: () {},
                heroTag: 'receive',
                label: Text('Receive'),
                icon:Icon(Icons.file_download,color: Colors.white,),
              ),
            ],
          ),
        ),
          ],
        ),
      ),
      ),
    );
  }
}



