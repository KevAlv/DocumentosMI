import 'package:flutter/material.dart';
import 'package:ml_kit/model/Fojas.dart';
import 'package:ml_kit/services/database_services.dart';

class Prueba extends StatefulWidget {
  Prueba({Key key}) : super(key: key);
  
  @override
  _PruebaState createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
List<Foja> _fojas;

  @override
    void initState() {
    super.initState();
    _fojas = [];
    _getEmployees();
  }



    _getEmployees() {
    Services.getFojas().then((employees) {
      setState(() {
        _fojas = employees;
      });
      print("Length ${employees.length}");
    });
  }

  SingleChildScrollView _dataBody() {
    // Both Vertical and Horozontal Scrollview for the DataTable to
    // scroll both Vertical and Horizontal...
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('Nro'),
            ),
            DataColumn(
              label: Text('Image'),
            ),
            DataColumn(
              label: Text('Contenido'),
            ),
            // Lets add one more column to show a delete button
        
          ],
          rows: _fojas
              .map(
                (employee) => DataRow(cells: [
                  DataCell(
                    Text(employee.nro.toString()),
                  ),
                  DataCell(
                    Image.network('http://192.168.0.15/my_store/uploads/'+employee.image)
                    // Text(
                    //   employee.image.length.toString(),
                    // ),
                  ),
                        DataCell(
                    
                    Text(
                      employee.contenido,
                    ),
                  ),
          
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
    @override
  Widget build(BuildContext context) {
 return Scaffold(
     body: _dataBody(),
    );
  }
}