import 'package:flutter/material.dart';

class DeviceDetailsScreen extends StatelessWidget {
  final int deviceId;
  final String status;

  const DeviceDetailsScreen(
      {super.key, required this.deviceId, required this.status});
  String getDescription(int deviceId) {
    String description = "";
    if (deviceId == 1) {
      description =
          "This device is attached on the right arm. It weighs 800g and its battery capacity is 10years. we are tracking its activities.";
    } else if (deviceId == 2) {
      description =
          "This device is attached on the leftt arm. It weighs 800g and its battery capacity is 10years. we are tracking its activities.";
    } else if (deviceId == 3) {
      description =
          "This device is attached on the right leg. It weighs 1kg and its battery capacity is 10years. we are tracking its activities.";
    } else if (deviceId == 4) {
      description =
          "This device is attached on the left leg. It weighs 1kg and its battery capacity is 10years. we are tracking its activities.";
    }
    return description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Device $deviceId Details',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor:
              Theme.of(context).primaryColor, // Set the background color
          iconTheme: const IconThemeData(
              color: Colors.white), // Set the color of the back icon
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.access_alarm_outlined),
                  title: Text(
                    'ABOUT THE DEVICE',
                    style: TextStyle(),
                  ),
                  subtitle: Text(getDescription(deviceId)),
                ),
                status == "Active"
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              'STATUS',
                              style: TextStyle(),
                            ),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: Text(status),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                        ],
                      )
                    : Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            //show alert dialog that the alert has been sent
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Alert Sent',
                                      style: TextStyle(color: Colors.indigo),
                                    ),
                                    content: const Text(
                                        'An alert has been sent to the device'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.red, // Set button color to red
                          ),
                          child: const Text(
                            'SEND AN ALERT',
                            style: TextStyle(),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ));
  }
}
