import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: PieChart(),
    );
  }
}

class PieChart extends StatefulWidget {
  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late List<_ElectronicData> _electronicProducts;
  late LabelIntersectAction _labelIntersectAction;
  late String _selectedItem;

  List<String>? _labelIntersectActionMode;

  @override
  void initState() {
    _selectedItem = 'shift';
    _electronicProducts = _buildChartData();
    _labelIntersectAction = LabelIntersectAction.shift;
    _labelIntersectActionMode = <String>['shift', 'none', 'hide'].toList();
    super.initState();
  }

  List<_ElectronicData> _buildChartData() {
    return [
      _ElectronicData('Smartphones', 150),
      _ElectronicData('Laptops', 145),
      _ElectronicData('Tablets', 140),
      _ElectronicData('Smartwatches', 138),
      _ElectronicData('Headphones', 135),
      _ElectronicData('Smart Home Devices', 133),
      _ElectronicData('TVs', 130),
      _ElectronicData('Gaming Consoles', 128),
      _ElectronicData('Monitors', 125),
      _ElectronicData('Printers', 123),
      _ElectronicData('Cameras', 120),
      _ElectronicData('Routers', 118),
      _ElectronicData('External Storage', 115),
      _ElectronicData('Projectors', 113),
      _ElectronicData('VR Headsets', 110),
      _ElectronicData('Microphones', 108),
      _ElectronicData('Webcams', 105),
      _ElectronicData('Smart Glasses', 103),
      _ElectronicData('Fitness Trackers', 100),
      _ElectronicData('Bluetooth Speakers', 98),
      _ElectronicData('E-readers', 95),
      _ElectronicData('Network Switches', 93),
      _ElectronicData('Docking Stations', 90),
      _ElectronicData('Power Banks', 88),
      _ElectronicData('Smart Thermostats', 85),
      _ElectronicData('Surge Protectors', 83),
      _ElectronicData('Home Security Cameras', 80),
      _ElectronicData('Smart Plugs', 78),
      _ElectronicData('Electronic Keyboards', 75),
      _ElectronicData('Digital Picture Frames', 73),
      _ElectronicData('Satellite Radios', 70),
      _ElectronicData('Car Dash Cameras', 68),
      _ElectronicData('Digital Pianos', 65),
      _ElectronicData('Smart Doorbells', 63),
      _ElectronicData('Weather Stations', 60),
      _ElectronicData('Robotic Vacuums', 58),
      _ElectronicData('Home Audio Systems', 55),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              setState(() {
                _scaffoldKey.currentState?.openEndDrawer();
              });
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: _buildForm(),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: _buildCircularChart(),
          ),
        ],
      ),
    );
  }

  /// Builds the circular chart with data labels and
  /// custom connector line settings.
  Widget _buildCircularChart() {
    return SfCircularChart(
      series: <CircularSeries>[
        PieSeries<_ElectronicData, String>(
          dataSource: _electronicProducts,
          xValueMapper: (_ElectronicData data, int index) => data.x,
          yValueMapper: (_ElectronicData data, int index) => data.y,
          dataLabelMapper: (_ElectronicData data, int index) =>
              '${data.x}: ${data.y}',
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            margin: EdgeInsets.zero,
            labelPosition: ChartDataLabelPosition.outside,
            connectorLineSettings: const ConnectorLineSettings(
              type: ConnectorType.curve,
              length: '20%',
            ),
            labelIntersectAction: _labelIntersectAction,
          ),
        ),
      ],
    );
  }

  /// Method to build the form with text and dropdown.
  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                flex: 7,
                child: Text(
                  "Label intersect action",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: DropdownButton<String>(
                    focusColor: Colors.transparent,
                    underline: Container(
                      color: const Color(0xFFBDBDBD),
                      height: 1,
                    ),
                    value: _selectedItem,
                    items: _labelIntersectActionMode!.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: const TextStyle(color: Colors.black)),
                      );
                    }).toList(),
                    onChanged: (dynamic value) {
                      _updateLabelIntersectAction(value.toString());
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Method to update the change in label intersect action.
  void _updateLabelIntersectAction(String item) {
    setState(() {
      _selectedItem = item;
      switch (_selectedItem) {
        case 'shift':
          _labelIntersectAction = LabelIntersectAction.shift;
          break;
        case 'hide':
          _labelIntersectAction = LabelIntersectAction.hide;
          break;
        case 'none':
        default:
          _labelIntersectAction =
              LabelIntersectAction.none; // Optional default case.
      }
    });
  }
}

class _ElectronicData {
  _ElectronicData(this.x, this.y);
  String x;
  int y;
}
