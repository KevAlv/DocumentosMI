import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:ml_kit/common/Texform_widget.dart';
import 'package:ml_kit/services/upload_image_service.dart';

class PhotoPicker extends StatefulWidget {
  PhotoPicker({Key key}) : super(key: key);

  @override
  _PhotoPickerState createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
  File _image;
  final controlerc1 = TextEditingController();
  final controlerc2 = TextEditingController();
  var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//NOTIFICACIONES-------------------------------------------------

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      print('notification payload: ' + payload);
    }

    await Navigator.push(
      context,
      MaterialPageRoute(),
    );
  }

  Future sleep() {
    return new Future.delayed(const Duration(seconds: 6), () => "4");
  }

  Future<void> _showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description');

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await sleep();
    String trendingNewsId = '5';
    await flutterLocalNotificationsPlugin.show(0, 'Se actualizo tu caso',
        'Se agrego un documento', platformChannelSpecifics,
        payload: trendingNewsId);
  }

  @override
  initState() {
    super.initState();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  //FIN DE NOTIFICACIONES-----------------------------------------------------------------
  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    controlerc1.dispose();
    controlerc2.dispose();
    super.dispose();
  }

  Widget rowWidgetFilter() {
    return Center(
        child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Id Documento'),
            Text('Cod Expediente '),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: cajita(controlerc1),
            ),
            Expanded(
              child: cajita(controlerc2),
            ),
          ],
        ),
      ],
    ));
  }

  Future getImage() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    } catch (e) {
      print('No cargo la galeria');
    }
  }

  Future getImageCamera() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        print('imagen cargada correcta');
        _image = image;
      });
    } catch (e) {
      print('no cargo la camara');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tomar Foto"),
      ),
      body: ListView(
        children: <Widget>[
          rowWidgetFilter(),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: GestureDetector(
                // onDoubleTap: getImageCamera,
                onTap: getImage,
                child: _image == null
                    ? new Column(children: <Widget>[
                        Image.asset(
                          'assets/folderwithdocuments_120818.png',
                          height: 300,
                        )
                      ])
                    : Image.file(_image),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FloatingActionButton.extended(
                backgroundColor: Colors.red,
                onPressed: () {
                  setState(() {
                      _image=null;
                  });
                  
                },
                tooltip: 'Escoge una imagen',
                label: Text('Cancelar'),
                icon: Icon(
                  Icons.cancel,
                 
                ),
              ),
              FloatingActionButton.extended(
                onPressed: 
                 (){
                   _showNotification();
                   upload(_image, int.parse(controlerc1.text),int.parse(controlerc2.text));
                   
                 }
                ,
                tooltip: 'Escoge una imagen',
                label: Text('Aprobar'),
                icon: Icon(Icons.check),
              ),
            ],
          )
        ],
      ),
    );
  }
}
