import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class APIConnect {
  logIn(String username, String password) async {
    var url = Uri(
      scheme: 'https',
      host: 'aodapi.eralpsoftware.net',
      path: '/login/apply',
    );

    var response = await http.post(
      url,
      body: jsonEncode(
        {
          "username": username,
          "password": password,
        },
      ),
      headers: {
        "content-type": "application/json",
        "token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IkJldHVsIENhbGlrIiwiaWQiOjUzLCJpYXQiOjE2MTQ4Nzc0NDMsImV4cCI6MTYxNDk0OTQ0M30.r38cPHBb3-M6r9mB_6WMQhXAIKJMjs7k1XKrtFe2Tp0",
      },
    );

    SharedPreferences.setMockInitialValues({});
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      sharedPreferences.setString(
        "token",
        jsonData["token"],
      );
    } else {
      throw Exception("Error");
    }
  }
}
