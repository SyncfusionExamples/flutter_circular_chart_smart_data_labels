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
  late List<_ChartSampleData> _electronicProducts;

  @override
  void initState() {
    _electronicProducts = _buildChartData();
    _labelIntersectAction = LabelIntersectAction.shift;
    super.initState();
  }

  List<_ChartSampleData> _buildChartData() {
    return [
      _ChartSampleData('Smartphones', 150),
      _ChartSampleData('Laptops', 145),
      _ChartSampleData('Tablets', 140),
      _ChartSampleData('Smartwatches', 138),
      _ChartSampleData('Headphones', 135),
      _ChartSampleData('Smart Home Devices', 133),
      _ChartSampleData('TVs', 130),
      _ChartSampleData('Gaming Consoles', 128),
      _ChartSampleData('Monitors', 125),
      _ChartSampleData('Printers', 123),
      _ChartSampleData('Cameras', 120),
      _ChartSampleData('Routers', 118),
      _ChartSampleData('External Storage', 115),
      _ChartSampleData('Projectors', 113),
      _ChartSampleData('VR Headsets', 110),
      _ChartSampleData('Microphones', 108),
      _ChartSampleData('Webcams', 105),
      _ChartSampleData('Smart Glasses', 103),
      _ChartSampleData('Fitness Trackers', 100),
      _ChartSampleData('Bluetooth Speakers', 98),
      _ChartSampleData('E-readers', 95),
      _ChartSampleData('Network Switches', 93),
      _ChartSampleData('Docking Stations', 90),
      _ChartSampleData('Power Banks', 88),
      _ChartSampleData('Smart Thermostats', 85),
      _ChartSampleData('Surge Protectors', 83),
      _ChartSampleData('Home Security Cameras', 80),
      _ChartSampleData('Smart Plugs', 78),
      _ChartSampleData('Electronic Keyboards', 75),
      _ChartSampleData('Digital Picture Frames', 73),
      _ChartSampleData('Satellite Radios', 70),
      _ChartSampleData('Car Dash Cameras', 68),
      _ChartSampleData('Digital Pianos', 65),
      _ChartSampleData('Smart Doorbells', 63),
      _ChartSampleData('Weather Stations', 60),
      _ChartSampleData('Robotic Vacuums', 58),
      _ChartSampleData('Home Audio Systems', 55),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: _buildCircularChartWithLabels(),
          ),
          _buildLabelControlButtons(),
        ],
      ),
    );
  }

  /// Builds the circular chart with data labels and custom connector line settings.
  Widget _buildCircularChartWithLabels() {
    return SfCircularChart(
      series: <CircularSeries>[
        PieSeries<_ChartSampleData, String>(
          dataSource: _electronicProducts,
          xValueMapper: (_ChartSampleData data, int index) => data.x,
          yValueMapper: (_ChartSampleData data, int index) => data.y,
          dataLabelMapper: (_ChartSampleData data, int index) =>
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

  /// Builds the buttons to control label intersection behavior (Shift, Hide, None).
  Widget _buildLabelControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LabelIntersectAction",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
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
    );
  }
}

class _ChartSampleData {
  _ChartSampleData(this.x, this.y);
  String x;
  int y;
}
