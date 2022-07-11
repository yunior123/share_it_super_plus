import 'dart:convert';

class ShareData {
  final String subject;
  final String text;
  final String path;
  final String mimeType;
  ShareData({
    required this.subject,
    required this.text,
    required this.path,
    required this.mimeType,
  });

  factory ShareData.fromJson(String source) =>
      ShareData.fromMap(json.decode(source));

  factory ShareData.fromMap(Map<String, dynamic> map) {
    return ShareData(
      subject: map['subject'] ?? '',
      text: map['text'] ?? '',
      path: map['path'] ?? '',
      mimeType: map['mimeType'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'subject': subject});
    result.addAll({'text': text});
    result.addAll({'path': path});
    result.addAll({'mimeType': mimeType});

    return result;
  }
}
