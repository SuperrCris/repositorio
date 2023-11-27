
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CamaraPantalla extends StatefulWidget {

  const CamaraPantalla({
    Key? key,
  }) : super(key: key);

  @override
  State<CamaraPantalla> createState() => _CamaraPantallaEstado();
}



enum EstadoWidget {INACTIVO,CARGANDO,ACTIVO,ERROR}

class _CamaraPantallaEstado extends State <CamaraPantalla> {
EstadoWidget _estadoWidget = EstadoWidget.INACTIVO;
List<CameraDescription> _camaras = List.empty();
late CameraController _controladorcamaras;
@override
void initState(){
super.initState();
inicializarCamara();
}

  @override
  Widget build(BuildContext context) {
switch(_estadoWidget){
case EstadoWidget.INACTIVO:
case EstadoWidget.CARGANDO:
return _scaffold(context ,Center(child: CircularProgressIndicator(),));
case EstadoWidget.ERROR:
return _scaffold(context, Text("Error"));
case EstadoWidget.ACTIVO:
return _scaffold(context, CameraPreview(_controladorcamaras));
}

}
Widget _scaffold(BuildContext context, Widget body){
return Scaffold(
body: body,
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
floatingActionButton: FloatingActionButton(
  onPressed: () async {
XFile archivo = await _controladorcamaras.takePicture();
Navigator.pop(context,archivo.path);
  },child: Icon(Icons.camera),

),

);

}

inicializarCamara() async {
_estadoWidget = EstadoWidget.CARGANDO;
if (mounted)setState(() {});

_camaras = await availableCameras();
_controladorcamaras = CameraController(_camaras[0], ResolutionPreset.veryHigh);
await _controladorcamaras.initialize();
if (_controladorcamaras.value.hasError){
_estadoWidget = EstadoWidget.ERROR;
if (mounted) setState(() {});
}else{
  _estadoWidget = EstadoWidget.ACTIVO;
  if (mounted) setState(() {});
}

}
}


