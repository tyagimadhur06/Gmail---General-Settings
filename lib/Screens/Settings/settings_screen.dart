
import 'package:flutter/material.dart';
import 'package:gmail_assignment/Screens/Settings/widgets/draggable_star_widget.dart';
import 'package:gmail_assignment/Screens/Settings/widgets/language_selector_widget.dart';
import 'package:gmail_assignment/Screens/Settings/widgets/phone_number_selector.dart';
import 'package:gmail_assignment/Screens/Settings/widgets/text_editor_widget.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
          bottom: const TabBar(
              labelColor: Colors.blue,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(
                  text: 'General',
                ),
                Tab(
                  text: 'Chat And Meet',
                ),
                Tab(
                  text: 'Themes',
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            GeneralSettings(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}

class GeneralSettings extends StatefulWidget {
  @override
  _GeneralSettings createState() => _GeneralSettings();
}

class _GeneralSettings extends State<GeneralSettings> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                const Flexible(
                  child: Text(
                    'Language:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                Column(children: [
                  const Text(
                    'Gmail display Language:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Show all language options',
                    style: TextStyle(color: Colors.blueAccent),
                  )
                ]),
                const SizedBox(width: 5),
                LanguageSelector(),
              ],
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
            Row(
              children: [
                const Flexible(
                  child: Text(
                    'Phone Number:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 2),
                const Text(
                  'Default country code:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                PhoneNumberSelector(),
              ],
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(children: [
                    Text(
                      'Default text style:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '(Use the \'Remove formatting\' button on the toolbar to reset the default text style)')
                  ]),
                ),
                SizedBox(width: 2),
                TextEditor(),
              ],
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stars:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Drag the stars between the lists.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          'The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.'),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            'Presets:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '1 star',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('2 Star',
                              style: TextStyle(color: Colors.blueAccent)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('3 star',
                              style: TextStyle(color: Colors.blueAccent)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'In use:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          DraggableStars(),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start, children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    'Signature:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('(appended at the end of all outgoing messages)')
                ]),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  ),
                  hintText: 'Enter your signature'
                ),
              ))
            ])
          ],
        ),
      ),
    ]);
  }
}







