import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _sliderValue = 0.0;
  String _selectedRadio = 'Option 1';
  late TabController _tabController;

  // Sample data for DataTable
  final List<Map<String, dynamic>> _data = [
    {'name': 'John', 'age': 25, 'city': 'New York'},
    {'name': 'Jane', 'age': 30, 'city': 'London'},
    {'name': 'Bob', 'age': 35, 'city': 'Paris'},
  ];

  // Sample network images
  final List<String> networkImages = [
    'https://picsum.photos/id/1001/500/300',
    'https://picsum.photos/id/1002/500/300',
    'https://picsum.photos/id/1003/500/300',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets Demo'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
            Tab(icon: Icon(Icons.person), text: 'Profile'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('assets/images/headers.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'App Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/house.png',
                width: 24,
                height: 24,
              ),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/setting.png',
                width: 24,
                height: 24,
              ),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(),
            // Gallery section in drawer
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Gallery',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        'assets/images/gallery_${index + 1}.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // First Tab - Images and Controls
          SingleChildScrollView(
            child: Column(
              children: [
                // Hero widget with CachedNetworkImage
                Hero(
                  tag: 'imageHero',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(
                            imageUrl: networkImages[0],
                          ),
                        ),
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: networkImages[0],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Image grid with CachedNetworkImage
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: networkImages.length,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: networkImages[index],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    );
                  },
                ),
                // Radio Buttons
                Column(
                  children: ['Option 1', 'Option 2', 'Option 3'].map((option) {
                    return RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      groupValue: _selectedRadio,
                      onChanged: (value) {
                        setState(() => _selectedRadio = value!);
                      },
                    );
                  }).toList(),
                ),
                // Slider
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Slider(
                        value: _sliderValue,
                        min: 0,
                        max: 100,
                        divisions: 10,
                        label: _sliderValue.round().toString(),
                        onChanged: (value) {
                          setState(() => _sliderValue = value);
                        },
                      ),
                      Text('Value: ${_sliderValue.round()}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Second Tab - DataTable
          SingleChildScrollView(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Age')),
                DataColumn(label: Text('City')),
              ],
              rows: _data.map((item) {
                return DataRow(cells: [
                  DataCell(Text(item['name'])),
                  DataCell(Text(item['age'].toString())),
                  DataCell(Text(item['city'])),
                ]);
              }).toList(),
            ),
          ),
          // Third Tab
          const Center(child: Text('Profile Tab')),
        ],
      ),
    );
  }
}

// Detail screen for Hero animation
class DetailScreen extends StatelessWidget {
  final String imageUrl;

  const DetailScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
