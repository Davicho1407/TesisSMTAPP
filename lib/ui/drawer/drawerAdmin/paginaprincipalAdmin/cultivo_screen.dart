import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CultivosScreen extends StatefulWidget {
  static Widget create(BuildContext context) => CultivosScreen();

  const CultivosScreen({super.key});

  @override
  State<CultivosScreen> createState() => _CultivosScreenState();
}

class _CultivosScreenState extends State<CultivosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        elevation: 0.0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: (() {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/drawerAdmin');
          }),
        ),
        title: Text(
          'Cultivos',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _CuerpoCultivo(),
    );
  }
}

class _CuerpoCultivo extends StatefulWidget {
  @override
  State<_CuerpoCultivo> createState() => _CuerpoCultivoState();
}

class _CuerpoCultivoState extends State<_CuerpoCultivo> {
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(children: [
      Container(
        padding: EdgeInsets.all(16),
        child: DropdownButtonFormField<String>(
          dropdownColor: Colors.cyan.shade50,
          borderRadius: BorderRadius.circular(20),
          icon: Icon(Icons.local_florist_rounded),
          decoration: InputDecoration(
              labelText: 'Seleccione un cultivo',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          value: _selectedValue,
          items: [
            DropdownMenuItem(
              child: Text('Trigo'),
              value: 'trigo',
            ),
            DropdownMenuItem(
              child: Text('Cebada'),
              value: 'cebada',
            ),
            DropdownMenuItem(
              child: Text('Alrveja'),
              value: 'arveja',
            ),
            DropdownMenuItem(
              child: Text('Cebolla'),
              value: 'cebolla',
            ),
            DropdownMenuItem(
              child: Text('Papa'),
              value: 'papa',
            ),
            DropdownMenuItem(
              child: Text('Quinua'),
              value: 'quinua',
            ),
            DropdownMenuItem(
              child: Text('Haba'),
              value: 'haba',
            ),
            DropdownMenuItem(
              child: Text('Frijol'),
              value: 'frijol',
            ),
            DropdownMenuItem(
              child: Text('Maiz'),
              value: 'maiz',
            ),
          ],
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
          },
        ),
      ),
      if (_selectedValue == 'trigo')
        Container(
            child: Stack(children: <Widget>[
          Container(
            transform: Matrix4.translationValues(10, 20, 0),
            width: 350,
            child: Text(
              'Planta de hojas verdes y espigas de flores que producen granos de trigo',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 60, 0),
            width: 350,
            child: Text(
              'Sin embargo, el trigo es una planta tolerante a las condiciones adversas y puede crecer en una amplia gama de temperaturas y humedades, siempre y cuando no estén en los extremos. Por ello, te mostramos los siguientes valores de los factores ambientales que deben tener los terrenos para realizar su cultivo: ',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
              transform: Matrix4.translationValues(0, 170, 0),
              child: Stack(children: <Widget>[
                DataTable(
                  columnSpacing: 15,
                  columns: [
                    DataColumn(
                      label: Text('Rango',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Temperatura',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Humedad',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('pH',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Rango optimo'),
                        ),
                        DataCell(
                          Text('17ºC - 22ºC'),
                        ),
                        DataCell(
                          Text('22% - 29%'),
                        ),
                        DataCell(
                          Text('6 - 7,5'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('12ºC - 16ºC'),
                        ),
                        DataCell(
                          Text('14% -21%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular +'),
                        ),
                        DataCell(
                          Text('23ºC - 30ºC'),
                        ),
                        DataCell(
                          Text('30% - 38%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ])),
          Container(
              width: 200,
              height: 150,
              transform: Matrix4.translationValues(80, 400, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/img/trigo.jpg'),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ])),
        ])),
      if (_selectedValue == 'cebada')
        Container(
            child: Stack(children: <Widget>[
          Container(
            transform: Matrix4.translationValues(10, 20, 0),
            width: 350,
            child: Text(
              'Es una fuente importante de alimento para los humanos y los animales, y se utiliza en la producción de cerveza, alimentos para animales, alimentos para el ganado y como fuente de almidón y fibra. La cebada es un cultivo resistente a las condiciones adversas y puede crecer en una amplia gama de climas y suelos, pero prefiere suelos bien drenados y climas frescos y húmedos. ',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 160, 0),
            width: 350,
            child: Text(
              'Además, la cebada es un cultivo eficiente en el uso de agua y nutrientes y es una planta importante en la agricultura sostenible.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
              transform: Matrix4.translationValues(0, 220, 0),
              child: Stack(children: <Widget>[
                DataTable(
                  columnSpacing: 15,
                  columns: [
                    DataColumn(
                      label: Text('Rango',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Temperatura',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Humedad',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('pH',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Rango optimo'),
                        ),
                        DataCell(
                          Text('17ºC - 22ºC'),
                        ),
                        DataCell(
                          Text('22% - 29%'),
                        ),
                        DataCell(
                          Text('6 - 7,5'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('12ºC - 16ºC'),
                        ),
                        DataCell(
                          Text('14% -21%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular +'),
                        ),
                        DataCell(
                          Text('23ºC - 30ºC'),
                        ),
                        DataCell(
                          Text('30% - 38%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ])),
          Container(
              width: 200,
              height: 150,
              transform: Matrix4.translationValues(90, 430, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/img/cebada.jpg'),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ])),
        ])),
      if (_selectedValue == 'arveja')
        Container(
            child: Stack(children: <Widget>[
          Container(
            transform: Matrix4.translationValues(10, 20, 0),
            width: 350,
            child: Text(
              'Son una fuente importante de proteínas, carbohidratos, vitaminas y minerales esenciales para la alimentación humana. Las alverjas se cultivan en una amplia gama de climas y suelos, pero prefieren un clima cálido y húmedo con suelos fértiles y bien drenados',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 120, 0),
            width: 350,
            child: Text(
              'Las alverjas son un cultivo resistente y pueden ser una fuente importante de ingresos para los agricultores en las áreas rurales.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
              transform: Matrix4.translationValues(0, 170, 0),
              child: Stack(children: <Widget>[
                DataTable(
                  columnSpacing: 15,
                  columns: [
                    DataColumn(
                      label: Text('Rango',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Temperatura',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Humedad',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('pH',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Rango optimo'),
                        ),
                        DataCell(
                          Text('15ºC - 19ºC'),
                        ),
                        DataCell(
                          Text('30% - 36%'),
                        ),
                        DataCell(
                          Text('6 – 7'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('10ºC - 14ºC'),
                        ),
                        DataCell(
                          Text('24% - 29%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular +'),
                        ),
                        DataCell(
                          Text('20ºC - 25ºC'),
                        ),
                        DataCell(
                          Text('37% - 44%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ])),
          Container(
              width: 200,
              height: 150,
              transform: Matrix4.translationValues(90, 390, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/img/arveja.jpg'),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ])),
        ])),
      if (_selectedValue == 'cebolla')
        Container(
            child: Stack(children: <Widget>[
          Container(
            transform: Matrix4.translationValues(10, 20, 0),
            width: 350,
            child: Text(
              'Es una fuente importante de vitaminas, minerales y compuestos antioxidantes, y se cultiva en una amplia gama de climas y suelos.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 85, 0),
            width: 350,
            child: Text(
              'La cebolla es un cultivo de bajo mantenimiento y puede ser una buena opción para la agricultura sostenible.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
              transform: Matrix4.translationValues(0, 140, 0),
              child: Stack(children: <Widget>[
                DataTable(
                  columnSpacing: 15,
                  columns: [
                    DataColumn(
                      label: Text('Rango',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Temperatura',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Humedad',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('pH',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Rango optimo'),
                        ),
                        DataCell(
                          Text('15ºC - 19ºC'),
                        ),
                        DataCell(
                          Text('20% - 25%'),
                        ),
                        DataCell(
                          Text('6 – 7'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('8ºC - 15ºC'),
                        ),
                        DataCell(
                          Text('15% - 19%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular +'),
                        ),
                        DataCell(
                          Text('26ºC - 32ºC'),
                        ),
                        DataCell(
                          Text('26% - 30%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ])),
          Container(
              width: 250,
              height: 200,
              transform: Matrix4.translationValues(70, 380, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/img/cebolla.jpg'),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ])),
        ])),
      if (_selectedValue == 'papa')
        Container(
            child: Stack(children: <Widget>[
          Container(
            transform: Matrix4.translationValues(10, 20, 0),
            width: 350,
            child: Text(
              'La papa es un cultivo resistente a las condiciones adversas y puede crecer en una amplia gama de climas y suelos, pero prefiere suelos fértiles y climas frescos y húmedos.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 110, 0),
            width: 350,
            child: Text(
              'La papa es un cultivo de bajo mantenimiento y es una fuente importante de ingresos para los agricultores en las áreas rurales. ',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
              transform: Matrix4.translationValues(0, 170, 0),
              child: Stack(children: <Widget>[
                DataTable(
                  columnSpacing: 15,
                  columns: [
                    DataColumn(
                      label: Text('Rango',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Temperatura',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Humedad',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('pH',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Rango optimo'),
                        ),
                        DataCell(
                          Text('20ºC - 25ºC'),
                        ),
                        DataCell(
                          Text('20% - 26%'),
                        ),
                        DataCell(
                          Text('5,5 – 7 '),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('15ºC - 19ºC'),
                        ),
                        DataCell(
                          Text('12% - 19%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular +'),
                        ),
                        DataCell(
                          Text('26ºC - 30ºC'),
                        ),
                        DataCell(
                          Text('27% - 34%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ])),
          Container(
              width: 200,
              height: 150,
              transform: Matrix4.translationValues(90, 400, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/img/papa.jpeg'),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ])),
        ])),
      if (_selectedValue == 'quinua')
        Container(
            child: Stack(children: <Widget>[
          Container(
            transform: Matrix4.translationValues(10, 20, 0),
            width: 350,
            child: Text(
              ' Las habas se cultivan en una amplia gama de climas y suelos, pero prefieren un clima cálido y húmedo con suelos fértiles y bien drenados.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 90, 0),
            width: 350,
            child: Text(
              'Las habas también son una fuente importante de forraje para los animales y se utilizan en la producción de alimentos para animales.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
              transform: Matrix4.translationValues(0, 170, 0),
              child: Stack(children: <Widget>[
                DataTable(
                  columnSpacing: 15,
                  columns: [
                    DataColumn(
                      label: Text('Rango',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Temperatura',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Humedad',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('pH',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Rango optimo'),
                        ),
                        DataCell(
                          Text('15ºC - 20ºC'),
                        ),
                        DataCell(
                          Text('34% - 40%'),
                        ),
                        DataCell(
                          Text('6 – 8'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('8ºC - 14ºC'),
                        ),
                        DataCell(
                          Text('24% - 33%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular +'),
                        ),
                        DataCell(
                          Text('21ºC - 28ºC'),
                        ),
                        DataCell(
                          Text('41% - 48%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ])),
          Container(
              width: 250,
              height: 200,
              transform: Matrix4.translationValues(70, 380, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/img/quinua.jpg'),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ])),
        ])),
      if (_selectedValue == 'haba')
        Container(
            child: Stack(children: <Widget>[
          Container(
            transform: Matrix4.translationValues(10, 20, 0),
            width: 350,
            child: Text(
              'La quinua es un cultivo resistente a las condiciones adversas y puede crecer en una amplia gama de climas y suelos, pero prefiere suelos bien drenados y climas frescos y húmedos. ',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 90, 0),
            width: 350,
            child: Text(
              'La quinua es un cultivo eficiente en el uso de agua y nutrientes y es una planta importante en la agricultura sostenible.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
              transform: Matrix4.translationValues(0, 170, 0),
              child: Stack(children: <Widget>[
                DataTable(
                  columnSpacing: 15,
                  columns: [
                    DataColumn(
                      label: Text('Rango',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Temperatura',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Humedad',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('pH',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Rango optimo'),
                        ),
                        DataCell(
                          Text('16ºC - 23ºC'),
                        ),
                        DataCell(
                          Text('27% - 34%'),
                        ),
                        DataCell(
                          Text('6,3 – 7,3'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('18ºC - 15ºC'),
                        ),
                        DataCell(
                          Text('18% - 26%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular +'),
                        ),
                        DataCell(
                          Text('24ºC - 30ºC'),
                        ),
                        DataCell(
                          Text('35% - 40%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ])),
          Container(
              width: 230,
              height: 170,
              transform: Matrix4.translationValues(85, 400, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/img/haba.jpeg'),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ])),
        ])),
      if (_selectedValue == 'frijol')
        Container(
            child: Stack(children: <Widget>[
          Container(
            transform: Matrix4.translationValues(10, 20, 0),
            width: 350,
            child: Text(
              ' El frijol es un cultivo resistente y puede crecer en una amplia gama de climas y suelos, pero prefiere un clima cálido y húmedo con suelos fértiles y bien drenados. Además, el frijol es un cultivo importante en la agricultura sostenible y puede ser una fuente importante de ingresos para los agricultores en las áreas rurales. En la alimentación humana, el frijol se utiliza',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
              transform: Matrix4.translationValues(0, 170, 0),
              child: Stack(children: <Widget>[
                DataTable(
                  columnSpacing: 10,
                  columns: [
                    DataColumn(
                      label: Text('Rango',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Temperatura',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Humedad',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('pH',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Rango optimo'),
                        ),
                        DataCell(
                          Text('17ºC - 23ºC'),
                        ),
                        DataCell(
                          Text('34% - 40%'),
                        ),
                        DataCell(
                          Text('6,5 – 7,5'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('12ºC - 16ºC'),
                        ),
                        DataCell(
                          Text('24% - 33%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular +'),
                        ),
                        DataCell(
                          Text('24ºC - 28ºC'),
                        ),
                        DataCell(
                          Text('29% - 34%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ])),
          Container(
              width: 230,
              height: 180,
              transform: Matrix4.translationValues(75, 400, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/img/frijol.jpg'),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ])),
        ])),
      if (_selectedValue == 'maiz')
        Container(
            child: Stack(children: <Widget>[
          Container(
            transform: Matrix4.translationValues(10, 20, 0),
            width: 350,
            child: Text(
              'El maíz es un cultivo resistente y puede crecer en una amplia gama de climas y suelos, pero prefiere un clima cálido y húmedo con suelos fértiles y bien drenados. La cosecha se realiza cuando las mazorcas están maduras y los granos están completamente desarrollados.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 130, 0),
            width: 350,
            child: Text(
              'Es importante tener en cuenta que el cultivo de maíz requiere una planificación cuidadosa y un monitoreo constante para garantizar una cosecha exitosa.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
              transform: Matrix4.translationValues(0, 190, 0),
              child: Stack(children: <Widget>[
                DataTable(
                  columnSpacing: 15,
                  columns: [
                    DataColumn(
                      label: Text('Rango',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Temperatura',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('Humedad',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    DataColumn(
                      label: Text('pH',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Rango optimo'),
                        ),
                        DataCell(
                          Text('18ºC - 25ºC'),
                        ),
                        DataCell(
                          Text('21% - 28%'),
                        ),
                        DataCell(
                          Text('6 – 7,5'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('12ºC - 17ºC'),
                        ),
                        DataCell(
                          Text('12% - 20%'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular +'),
                        ),
                        DataCell(
                          Text('26ºC - 32ºC'),
                        ),
                        DataCell(
                          Text('29% - 34'),
                        ),
                        DataCell(
                          Text(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ])),
          Container(
              width: 230,
              height: 180,
              transform: Matrix4.translationValues(75, 400, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/img/maiz.jpg'),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(5, 5),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ])),
        ])),
    ]));
  }
}
