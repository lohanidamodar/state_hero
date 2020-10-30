class Question {
  List<String> options;
  String id;
  String question;
  String answer;
  String categoryId;

  Question(
      {this.options, this.id, this.question, this.answer, this.categoryId});

  Question.fromJson(Map<String, dynamic> json) {
    options = json['options'].cast<String>();
    id = json['_id'];
    question = json['question'];
    answer = json['answer'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['options'] = this.options;
    data['_id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['categoryId'] = this.categoryId;
    return data;
  }
}
