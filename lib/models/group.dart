import 'package:farmer_group_management/models/at_date.dart';
import 'package:farmer_group_management/models/user.dart';

class Group {
  int? id;
  User? createdBy;
  User? updatedBy;
  String? name;
  String? profileIcon;
  int? status;
  bool active = false;//custom value
  AtDate? createdAt;
  AtDate? updatedAt;
  AtDate? deletedAt;

  Group(
      {this.id,
        this.createdBy,
        this.updatedBy,
        this.name,
        this.profileIcon,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'] != null
        ? User.fromJson(json['created_by'])
        : null;
    updatedBy = json['updated_by'] != null
        ? User.fromJson(json['updated_by'])
        : null;
    name = json['name'];
    profileIcon = json['profile_icon'];
    status = json['status'];
    active = json['status'] == 1;
    createdAt = json['created_at'] != null
        ? AtDate.fromJson(json['created_at'])
        : null;
    updatedAt = json['updated_at'] != null
        ? AtDate.fromJson(json['updated_at'])
        : null;
    deletedAt = json['deleted_at'] != null
        ? AtDate.fromJson(json['deleted_at'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (createdBy != null) {
      data['created_by'] = createdBy!.toJson();
    }
    if (updatedBy != null) {
      data['updated_by'] = updatedBy!.toJson();
    }
    data['name'] = name;
    data['profile_icon'] = profileIcon;
    data['status'] = status;
    if (createdAt != null) {
      data['created_at'] = createdAt!.toJson();
    }
    if (updatedAt != null) {
      data['updated_at'] = updatedAt!.toJson();
    }
    if (deletedAt != null) {
      data['deleted_at'] = deletedAt!.toJson();
    }
    return data;
  }
}

