import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class Star {
  final Color color; // Color of the star
  bool isInUse; // Whether the star is in use or not

  Star({required this.color, this.isInUse = false});
}

class _SettingsScreenState extends State<SettingsScreen> {
  String language = 'English (UK)';
  String defaultCountry = 'India';
  int conversationsPerPage = 50;
  int sendCancellationPeriod = 5;
  bool hoverActionsEnabled = true;
  bool sendAndArchiveShown = true;
  String defaultTextStyle = 'Sans Serif';
  bool alwaysDisplayImages = true;

  void _handleSubmit() {
    // Logic to handle submission goes here.
    // For example, print the stars' statuses or send them to a server.
    for (var star in _stars) {
      print('Star color: ${star.color.toString()}, In use: ${star.isInUse}');
    }
    // Add any further action you want to perform on submission
  }

  final List<Star> _stars = [
    Star(color: Colors.yellow, isInUse: true), // Assuming yellow star is in use
    Star(color: Colors.red),
    Star(color: Colors.purple),
    Star(color: Colors.blue),
    Star(color: Colors.green),
    // Add more stars as needed
  ];
  Widget _buildDraggableStar(Star star) {
    return Draggable<Star>(
      data: star,
      childWhenDragging: Icon(Icons.star, color: Colors.grey),
      feedback:
          Icon(Icons.star, color: star.color.withOpacity(0.5), size: 48.0),
      child: Icon(Icons.star, color: star.isInUse ? star.color : Colors.grey),
    );
  }

  Widget _buildDragTarget() {
    return DragTarget<Star>(
      builder: (context, candidateData, rejectedData) {
        return Wrap(
          children: _stars.where((s) => s.isInUse).map((star) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(Icons.star, color: star.color),
            );
          }).toList(),
        );
      },
      onAccept: (star) {
        setState(() {
          star.isInUse = !star.isInUse;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello24.ai Flutter Developer - Assignment '),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                'Language: 	                                                          Gmail display language:'),
            trailing: DropdownButton(
              value: language,
              onChanged: (String? newValue) {
                setState(() {
                  language = newValue!;
                });
              },
              items: <String>[
                'Arabic (Standard)',
                'Arabic (Egyptian)',
                'Chinese (Mandarin)',
                'Chinese (Cantonese)',
                'English (UK)',
                'English (US)',
                'French (France)',
                'French (Canada)',
                'German (Germany)',
                'Hindi (India)'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          ListTile(
            title: Text(
                'Phone numbers:                                                  Default country code:'),
            trailing: DropdownButton(
              value: defaultCountry,
              onChanged: (String? newValue) {
                setState(() {
                  defaultCountry = newValue!;
                });
              },
              items: <String>[
                'India',
                'United States',
                'United Kingdom',
                'Canada',
                'Australia',
                'Germany',
                'France',
                'Italy',
                'Spain',
                'Brazil',
                'Russia',
                'China',
                'Japan',
                'South Korea',
                'Mexico',
                'Indonesia',
                'Netherlands',
                'Belgium'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          ListTile(
            title: Text(
                'Maximum page size:                                          Conversations Per Page:'),
            trailing: DropdownButton(
              value: conversationsPerPage,
              onChanged: (int? newValue) {
                setState(() {
                  conversationsPerPage = newValue!;
                });
              },
              items: <int>[10, 25, 50, 100]
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value conversations per page'),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('Undo Send:'),
            trailing: DropdownButton(
              value: sendCancellationPeriod,
              onChanged: (int? newValue) {
                setState(() {
                  sendCancellationPeriod = newValue!;
                });
              },
              items:
                  <int>[5, 10, 20, 30].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value seconds'),
                );
              }).toList(),
            ),
          ),

          ListTile(
            title: Text('Default text style:'),
            trailing: DropdownButton(
              value: defaultTextStyle,
              onChanged: (String? newValue) {
                setState(() {
                  defaultTextStyle = newValue!;
                });
              },
              items: <String>['Sans Serif', 'Serif', 'Monospace']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('This is what your body text will look like.'),
            subtitle: Text('Use the toolbar to format the text.'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.format_bold),
                  onPressed: () {
                    // Add your functionality for bold text formatting
                  },
                ),
                IconButton(
                  icon: Icon(Icons.format_italic),
                  onPressed: () {
                    // Add your functionality for italic text formatting
                  },
                ),
                IconButton(
                  icon: Icon(Icons.format_underline),
                  onPressed: () {
                    // Add your functionality for underline text formatting
                  },
                ),
                IconButton(
                  icon: Icon(Icons.format_clear),
                  onPressed: () {
                    // Add your functionality for clearing text formatting
                  },
                ),
              ],
            ),
          ),
          // Add a TextField for paragraph writing
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'This is what your body text will look like.',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SwitchListTile(
            title: Text('Images:'),
            subtitle: Text('Always display external images'),
            value: alwaysDisplayImages,
            onChanged: (bool newValue) {
              setState(() {
                alwaysDisplayImages = newValue;
              });
            },
          ),

          ListTile(
            title: Text('Stars'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Presets can be buttons or a dropdown that set predefined states
                Text('Presets: 1 star, 4 stars, all stars'),
                SizedBox(height: 8),
                Text('In use:'),
                _buildDragTarget(), // In use stars will be displayed here
                SizedBox(height: 8),
                Text('Not in use:'),
                Wrap(
                  children:
                      _stars.map((star) => _buildDraggableStar(star)).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            child: ElevatedButton(
              onPressed: _handleSubmit,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context)
                    .primaryColor, // Use the theme's primary color
                onPrimary: Colors.white, // Text color
              ),
            ),
          ),
// Add more settings widgets following the pattern above.
        ],
      ),
    );
  }
}
