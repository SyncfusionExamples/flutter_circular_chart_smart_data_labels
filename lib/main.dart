import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {

late LabelIntersectAction _labelIntersectAction;

  @override
  void initState() {
    _labelIntersectAction = LabelIntersectAction.shift;
    super.initState();
  }

  List<ChartData> data = [
    ChartData('Smartphones', 150),
    ChartData('Laptops', 145),
    ChartData('Tablets', 140),
    ChartData('Smartwatches', 138),
    ChartData('Headphones', 135),
    ChartData('Smart Home Devices', 133),
    ChartData('TVs', 130),
    ChartData('Gaming Consoles', 128),
    ChartData('Monitors', 125),
    ChartData('Printers', 123),
    ChartData('Cameras', 120),
    ChartData('Routers', 118),
    ChartData('External Storage', 115),
    ChartData('Projectors', 113),
    ChartData('VR Headsets', 110),
    ChartData('Microphones', 108),
    ChartData('Webcams', 105),
    ChartData('Smart Glasses', 103),
    ChartData('Fitness Trackers', 100),
    ChartData('Bluetooth Speakers', 98),
    ChartData('E-readers', 95),
    ChartData('Network Switches', 93),
    ChartData('Docking Stations', 90),
    ChartData('Power Banks', 88),
    ChartData('Smart Thermostats', 85),
    ChartData('Surge Protectors', 83),
    ChartData('Home Security Cameras', 80),
    ChartData('Smart Plugs', 78),
    ChartData('Electronic Keyboards', 75),
    ChartData('Digital Picture Frames', 73),
    ChartData('Satellite Radios', 70),
    ChartData('Car Dash Cameras', 68),
    ChartData('Digital Pianos', 65),
    ChartData('Smart Doorbells', 63),
    ChartData('Weather Stations', 60),
    ChartData('Robotic Vacuums', 58),
    ChartData('Home Audio Systems', 55),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: SfCircularChart(
              series: <CircularSeries>[
                PieSeries<ChartData, String>(
                  dataSource: data,
                  xValueMapper: (ChartData data, int index) => data.x,
                  yValueMapper: (ChartData data, int index) => data.y,
                  dataLabelMapper: (ChartData data, int index) =>
                      '${data.x}: ${data.y}',
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    margin: EdgeInsets.zero,
                    labelPosition: ChartDataLabelPosition.outside,
                    connectorLineSettings: const ConnectorLineSettings(
                        type: ConnectorType.curve, length: '20%'),
                    labelIntersectAction: _labelIntersectAction,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _labelIntersectAction = LabelIntersectAction.shift;
                        });
                      },
                      child: const Text('Shift'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _labelIntersectAction = LabelIntersectAction.hide;
                        });
                      },
                      child: const Text('Hide'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _labelIntersectAction = LabelIntersectAction.none;
                        });
                      },
                      child: const Text('None'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class ChartData {
  ChartData(this.x, this.y);
  String x;
  int y;
}


