import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = '';
  String _temperature = '';
  String _weatherCondition = '';

  void _fetchWeather() {
    // Simulate a weather fetch
    setState(() {
      _cityName = _cityController.text;
      _temperature = '25°C'; // Placeholder temperature
      _weatherCondition = 'Sunny'; // Placeholder weather condition
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 32),
            Text(
              _cityName.isNotEmpty ? 'City: $_cityName' : 'City: N/A',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              _temperature.isNotEmpty ? 'Temperature: $_temperature' : 'Temperature: N/A',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              _weatherCondition.isNotEmpty
                  ? 'Condition: $_weatherCondition'
                  : 'Condition: N/A',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
