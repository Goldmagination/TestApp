import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//widget for the landscape mode
class LandScapeView extends StatefulWidget {
  final List<dynamic> jsonData;
  LandScapeView(this.jsonData);

  @override
  _LandScapeViewState createState() => _LandScapeViewState();
}

class _LandScapeViewState extends State<LandScapeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          sortAscending: true,
          columns: <DataColumn>[
            DataColumn(
              label: Text("Name"),
              numeric: false,
              tooltip: "To display first name of the Name",
            ),
            DataColumn(
              label: Text("E-mail addresses"),
              numeric: false,
              tooltip: "To display last name of the Name",
            ),
            DataColumn(
              label: Text("Telefon"),
              numeric: false,
              tooltip: "To display last name of the Name",
            ),
            DataColumn(
              label: Text("Addresses"),
              numeric: false,
              tooltip: "To display last name of the Name",
            ),
          ],
          rows: _jsonDataToRows()),
    );
  }

  List<DataRow> _jsonDataToRows() {
    return widget
        .jsonData //generate dynamic table rows from using our loaded data.
        ?.map(
          (name) => DataRow(
            cells: [
              DataCell(
                Row(
                  children: [
                    Icon(
                      Icons.contact_page,
                      color: Color.fromRGBO(35, 152, 94, 0.8),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${name['name']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Row(children: [
                  Icon(
                    Icons.mail,
                    color: Color.fromRGBO(35, 152, 94, 0.8),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('${name['privateEmail']}')
                ]),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Row(children: [
                  Icon(
                    Icons.phone,
                    color: Color.fromRGBO(35, 152, 94, 0.8),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('${name['mobilePhone']}')
                ]),
                showEditIcon: false,
                placeholder: false,
              ),
              DataCell(
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('${name['city']}'),
                  Text('${name['street']}')
                ]),
                showEditIcon: false,
                placeholder: false,
              ),
            ],
          ),
        )
        ?.toList();
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    super.initState();
  }
}
