class ContentGemini {
  final List<Content> contents;

  ContentGemini({required this.contents});

  ContentGemini.withText(String text)
      : contents = [
    Content(
      parts: [Part(text: text)],
    )
  ];

  factory ContentGemini.fromApi(Map<String, dynamic> json) {
    final candidate = json['candidates'][0];
    final contentJson = candidate['content'];
    final parts = (contentJson['parts'] as List)
        .map((e) => Part.fromJson(e))
        .toList();
    return ContentGemini(
      contents: [Content(parts: parts)],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contents': contents.map((content) => content.toJson()).toList(),
    };
  }
}

class Content {
  final List<Part> parts;

  Content({required this.parts});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      parts: (json['parts'] as List)
          .map((item) => Part.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'parts': parts.map((part) => part.toJson()).toList(),
    };
  }
}

class Part {
  final String text;

  Part({required this.text});

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
    };
  }
}
