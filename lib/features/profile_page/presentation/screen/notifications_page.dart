import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/local_data/session_management.dart';
import '../../../../core/utility/colors_data.dart';
import '../../../../core/utility/theme.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late Future<Map<String, dynamic>> notificationsFuture;
  int currentPage = 1;
  int totalPages = 1;

  @override
  void initState() {
    super.initState();
    notificationsFuture = fetchNotifications(pageNumber: currentPage);
  }

  Future<void> markAsRead(int id) async {
    final url = Uri.parse(
        'https://alafein.azurewebsites.net/api/v1/NotificationHistory/ToggleRead');

    final response = await http.patch(
      url,
      headers: {
        "Content-Type": "application/json-patch+json",
        "Authorization": "Bearer ${SessionManagement.getUserToken()}"
      },
      body: jsonEncode({"id": id}),
    );

    if (response.statusCode == 200) {
      setState(() {
        notificationsFuture = fetchNotifications(pageNumber: currentPage);
      });
    } else {
      throw Exception('Failed to mark notification as read');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: notificationsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final data = snapshot.data!['Data'];
                  totalPages = (snapshot.data!['PgTotal'] / 10).ceil();

                  if (data == null || data is! List) {
                    return Center(
                        child: const Text('No notifications found').tr());
                  }

                  final List notifications = data;

                  if (notifications.isEmpty) {
                    return Center(
                      child: const Text('No notifications found').tr(),
                    );
                  }

                  return ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final notification = notifications[index];
                      return Card(
                        elevation: 0,
                        color: Colors.white,
                        // Remove the shadow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(
                              color: kDividerColor, width: 1.0),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          title: Text(
                            notification['Title'] ?? 'No Title',
                            style: personalInfoTextStyle,
                          ),
                          subtitle: Text(notification['Body'] ?? 'No Body'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // if (!notification['IsRead'])
                              //   const Icon(Icons.circle, color: Colors.blue, size: 10),
                              IconButton(
                                icon: const Icon(Icons.check_circle),
                                color: notification['IsRead']
                                    ? Colors.green
                                    : Colors.grey,
                                onPressed: () {
                                  if (!notification['IsRead']) {
                                    markAsRead(notification['Id']);
                                  }
                                },
                              ),
                            ],
                          ),
                          onTap: () {
                            markAsRead(notification['Id']);
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                      child: const Text('No notifications found').tr());
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: currentPage > 1 ? _prevPage : null,
                  child: const Text(
                    'Previous',
                    style: personalInfoTextStyle,
                  ).tr(),
                ),
                Text(
                  'Page $currentPage of $totalPages',
                  style: personalInfoTextStyle,
                ),
                TextButton(
                  onPressed: currentPage < totalPages ? _nextPage : null,
                  child: const Text(
                    'Next',
                    style: personalInfoTextStyle,
                  ).tr(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> fetchNotifications(
      {int pageNumber = 1, int pageSize = 10}) async {
    final url = Uri.parse(
        'https://alafein.azurewebsites.net/api/v1/NotificationHistory/GetPagination');

    final response = await http.get(
      url.replace(queryParameters: {
        'PageNumber': pageNumber.toString(),
        'PageSize': pageSize.toString(),
      }),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${SessionManagement.getUserToken()}"
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print("notification data $data ");
      return data;
    } else {
      throw Exception('No Notification yet');
    }
  }

  void _nextPage() {
    setState(() {
      currentPage++;
      notificationsFuture = fetchNotifications(pageNumber: currentPage);
    });
  }

  void _prevPage() {
    setState(() {
      currentPage--;
      notificationsFuture = fetchNotifications(pageNumber: currentPage);
    });
  }
}
