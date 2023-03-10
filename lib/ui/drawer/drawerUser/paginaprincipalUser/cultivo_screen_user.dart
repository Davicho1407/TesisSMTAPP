import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CultivosScreenUser extends StatefulWidget {
  static Widget create(BuildContext context) => CultivosScreenUser();

  const CultivosScreenUser({super.key});

  @override
  State<CultivosScreenUser> createState() => _CultivosScreenUserState();
}

class _CultivosScreenUserState extends State<CultivosScreenUser> {
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
            Navigator.pushNamed(context, '/drawerUser');
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
              'Sin embargo, el trigo es una planta tolerante a las condiciones adversas y puede crecer en una amplia gama de temperaturas y humedades, siempre y cuando no est??n en los extremos. Por ello, te mostramos los siguientes valores de los factores ambientales que deben tener los terrenos para realizar su cultivo: ',
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
                          Text('17??C - 22??C'),
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
                          Text('12??C - 16??C'),
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
                          Text('23??C - 30??C'),
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
              'Es una fuente importante de alimento para los humanos y los animales, y se utiliza en la producci??n de cerveza, alimentos para animales, alimentos para el ganado y como fuente de almid??n y fibra. La cebada es un cultivo resistente a las condiciones adversas y puede crecer en una amplia gama de climas y suelos, pero prefiere suelos bien drenados y climas frescos y h??medos. ',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 160, 0),
            width: 350,
            child: Text(
              'Adem??s, la cebada es un cultivo eficiente en el uso de agua y nutrientes y es una planta importante en la agricultura sostenible.',
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
                          Text('17??C - 22??C'),
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
                          Text('12??C - 16??C'),
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
                          Text('23??C - 30??C'),
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
              'Son una fuente importante de prote??nas, carbohidratos, vitaminas y minerales esenciales para la alimentaci??n humana. Las alverjas se cultivan en una amplia gama de climas y suelos, pero prefieren un clima c??lido y h??medo con suelos f??rtiles y bien drenados',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 120, 0),
            width: 350,
            child: Text(
              'Las alverjas son un cultivo resistente y pueden ser una fuente importante de ingresos para los agricultores en las ??reas rurales.',
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
                          Text('15??C - 19??C'),
                        ),
                        DataCell(
                          Text('30% - 36%'),
                        ),
                        DataCell(
                          Text('6 ??? 7'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('10??C - 14??C'),
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
                          Text('20??C - 25??C'),
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
              'La cebolla es un cultivo de bajo mantenimiento y puede ser una buena opci??n para la agricultura sostenible.',
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
                          Text('15??C - 19??C'),
                        ),
                        DataCell(
                          Text('20% - 25%'),
                        ),
                        DataCell(
                          Text('6 ??? 7'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('8??C - 15??C'),
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
                          Text('26??C - 32??C'),
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
              'La papa es un cultivo resistente a las condiciones adversas y puede crecer en una amplia gama de climas y suelos, pero prefiere suelos f??rtiles y climas frescos y h??medos.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 110, 0),
            width: 350,
            child: Text(
              'La papa es un cultivo de bajo mantenimiento y es una fuente importante de ingresos para los agricultores en las ??reas rurales. ',
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
                          Text('20??C - 25??C'),
                        ),
                        DataCell(
                          Text('20% - 26%'),
                        ),
                        DataCell(
                          Text('5,5 ??? 7 '),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('15??C - 19??C'),
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
                          Text('26??C - 30??C'),
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
              ' Las habas se cultivan en una amplia gama de climas y suelos, pero prefieren un clima c??lido y h??medo con suelos f??rtiles y bien drenados.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 90, 0),
            width: 350,
            child: Text(
              'Las habas tambi??n son una fuente importante de forraje para los animales y se utilizan en la producci??n de alimentos para animales.',
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
                          Text('15??C - 20??C'),
                        ),
                        DataCell(
                          Text('34% - 40%'),
                        ),
                        DataCell(
                          Text('6 ??? 8'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('8??C - 14??C'),
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
                          Text('21??C - 28??C'),
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
              'La quinua es un cultivo resistente a las condiciones adversas y puede crecer en una amplia gama de climas y suelos, pero prefiere suelos bien drenados y climas frescos y h??medos. ',
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
                          Text('16??C - 23??C'),
                        ),
                        DataCell(
                          Text('27% - 34%'),
                        ),
                        DataCell(
                          Text('6,3 ??? 7,3'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('18??C - 15??C'),
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
                          Text('24??C - 30??C'),
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
              ' El frijol es un cultivo resistente y puede crecer en una amplia gama de climas y suelos, pero prefiere un clima c??lido y h??medo con suelos f??rtiles y bien drenados. Adem??s, el frijol es un cultivo importante en la agricultura sostenible y puede ser una fuente importante de ingresos para los agricultores en las ??reas rurales. En la alimentaci??n humana, el frijol se utiliza',
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
                          Text('17??C - 23??C'),
                        ),
                        DataCell(
                          Text('34% - 40%'),
                        ),
                        DataCell(
                          Text('6,5 ??? 7,5'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('12??C - 16??C'),
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
                          Text('24??C - 28??C'),
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
              'El ma??z es un cultivo resistente y puede crecer en una amplia gama de climas y suelos, pero prefiere un clima c??lido y h??medo con suelos f??rtiles y bien drenados. La cosecha se realiza cuando las mazorcas est??n maduras y los granos est??n completamente desarrollados.',
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            transform: Matrix4.translationValues(10, 130, 0),
            width: 350,
            child: Text(
              'Es importante tener en cuenta que el cultivo de ma??z requiere una planificaci??n cuidadosa y un monitoreo constante para garantizar una cosecha exitosa.',
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
                          Text('18??C - 25??C'),
                        ),
                        DataCell(
                          Text('21% - 28%'),
                        ),
                        DataCell(
                          Text('6 ??? 7,5'),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text('Regular -'),
                        ),
                        DataCell(
                          Text('12??C - 17??C'),
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
                          Text('26??C - 32??C'),
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
