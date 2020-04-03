import 'dart:convert';

import 'package:google_place/src/models/debug_log.dart';
import 'package:google_place/src/search/result.dart';

class TextSearchResult {
  final String status;
  final List<String> htmlAttributions;
  final String nextPageToken;
  final DebugLog debugLog;
  final List<Result> results;

  TextSearchResult({
    this.status,
    this.htmlAttributions,
    this.nextPageToken,
    this.debugLog,
    this.results,
  });

  factory TextSearchResult.fromJson(Map<String, dynamic> json) {
    return TextSearchResult(
      status: json['status'],
      htmlAttributions: json['html_attributions'] != null
          ? (json['html_attributions'] as List<dynamic>).cast<String>()
          : null,
      nextPageToken: json['next_page_token'],
      debugLog: json['debug_log'] != null
          ? DebugLog.fromJson(json['debug_log'])
          : null,
      results: json['results'] != null
          ? json['results']
              .map<Result>((json) => Result.fromJson(json))
              .toList()
          : null,
    );
  }

  static TextSearchResult parseTextSearchResult(String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();
    return TextSearchResult.fromJson(parsed);
  }
}
