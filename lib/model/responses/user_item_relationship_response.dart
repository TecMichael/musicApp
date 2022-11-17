class CheckUserItemRelationshipResponse {
  bool? error;
  String? relationship;

  CheckUserItemRelationshipResponse({this.error, this.relationship});

  CheckUserItemRelationshipResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    relationship = json['relationship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['relationship'] = this.relationship;
    return data;
  }
}
