
class ComplaintModel {
  final String name;
  final String mobile;
  final String problemType;
  final String problemDescription;
//
  final String condition;

  ComplaintModel({
    required this.name,
    required this.mobile,
    required this.problemType,
    required this.problemDescription,
    required this.condition,

  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobile': mobile,
      'problemType': problemType,
      'problemDescription': problemDescription,
      'condition' : condition
    };
  }
}