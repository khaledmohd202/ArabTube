class NotificationModel {
  String? title;
  String? message;
  String? createdAt;
  dynamic recipientToken;
  int? id;
  int? tenantId;
  dynamic notes;
  dynamic createdDate;
  dynamic createBy;
  dynamic lastModifiedDate;
  dynamic lastModifiedBy;
  bool? isActive;
  bool? isDeleted;
  dynamic daleteDate;
  dynamic deletedBy;
  dynamic createdBy;
  dynamic modifiedBy;


  NotificationModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    createdAt = json['createdAt'];
    recipientToken = json['recipientToken'];
    id = json['id'];
    tenantId = json['tenantId'];
    notes = json['notes'];
    createdDate = json['createdDate'];
    createBy = json['createBy'];
    lastModifiedDate = json['lastModifiedDate'];
    lastModifiedBy = json['lastModifiedBy'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
    daleteDate = json['daleteDate'];
    deletedBy = json['deletedBy'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
  }

}