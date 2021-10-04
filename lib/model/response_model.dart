class ResponseModel {
  late String message;
  late bool success;
  late Data data;

  ResponseModel(
      {required this.message, required this.success, required this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['success'] = success;
    data['data'] = this.data.toJson();
    return data;
  }
}

class Data {
  late String name;
  late String address;
  late Null position;
  late String note;
  late Userr user;
  late Branch branch;
  late int id;
  late int createDate;
  late int updateDate;
  late int auditingStatus;
  late int dateOfBirth;
  late String cityName;
  late int numberOfUnits;
  late Null expiredDate;
  late int courseStatus;
  late int courseType;
  late int transactionDetailType;
  late int classId;
  late String mobile;
  late String avatar;
  late Null branchName;
  late int branchId;
  late int clothesNumber;
  late double transactionAmount;
  late String fixedEras;
  late String parentName;
  late Classs classs;
  late City city;

  Data(
      {required this.name,
      required this.address,
      required this.position,
      required this.note,
      required this.user,
      required this.branch,
      required this.id,
      required this.createDate,
      required this.updateDate,
      required this.auditingStatus,
      required this.dateOfBirth,
      required this.cityName,
      required this.numberOfUnits,
      required this.expiredDate,
      required this.courseStatus,
      required this.courseType,
      required this.transactionDetailType,
      required this.classId,
      required this.mobile,
      required this.avatar,
      required this.branchName,
      required this.branchId,
      required this.clothesNumber,
      required this.transactionAmount,
      required this.fixedEras,
      required this.parentName,
      required this.classs,
      required this.city});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    position = json['position'];
    note = json['note'];
    user = (json['user'] != null ? Userr.fromJson(json['user']) : null)!;
    branch = (json['branch'] != null ? Branch.fromJson(json['branch']) : null)!;
    id = json['id'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    auditingStatus = json['auditing_status'];
    dateOfBirth = json['date_of_birth'];
    cityName = json['city_name'];
    numberOfUnits = json['number_of_units'];
    expiredDate = json['expired_date'];
    courseStatus = json['course_status'];
    courseType = json['course_type'];
    transactionDetailType = json['transaction_detail_type'];
    classId = json['class_id'];
    mobile = json['mobile'];
    avatar = json['avatar'];
    branchName = json['branch_name'];
    branchId = json['branch_id'];
    clothesNumber = json['clothes_number'];
    transactionAmount = json['transaction_amount'];
    fixedEras = json['fixed_eras'];
    parentName = json['parent_name'];
    classs = (json['class'] != null ? Classs.fromJson(json['class']) : null)!;
    city = (json['city'] != null ? City.fromJson(json['city']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['address'] = address;
    data['position'] = position;
    data['note'] = note;
    data['user'] = user.toJson();
    data['branch'] = branch.toJson();
    data['id'] = id;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['auditing_status'] = auditingStatus;
    data['date_of_birth'] = dateOfBirth;
    data['city_name'] = cityName;
    data['number_of_units'] = numberOfUnits;
    data['expired_date'] = expiredDate;
    data['course_status'] = courseStatus;
    data['course_type'] = courseType;
    data['transaction_detail_type'] = transactionDetailType;
    data['class_id'] = classId;
    data['mobile'] = mobile;
    data['avatar'] = avatar;
    data['branch_name'] = branchName;
    data['branch_id'] = branchId;
    data['clothes_number'] = clothesNumber;
    data['transaction_amount'] = transactionAmount;
    data['fixed_eras'] = fixedEras;
    data['parent_name'] = parentName;
    data['class'] = classs.toJson();
    data['city'] = city.toJson();
    return data;
  }
}

class Userr {
  late Null roles;
  late Null avatar;
  late Null manager;
  late Null players;
  late String name;
  late String mobile;
  late City city;
  late String address;
  late Null points;
  late Null branch;
  late int id;
  late Null createDate;
  late Null updateDate;
  late Null auditingStatus;
  late String userName;
  late String userType;
  late Null branchId;
  late Null academyId;
  late Null levelId;
  late Null latestLoginAt;
  late Null dateOfBirth;

  Userr(
      {this.roles,
      this.avatar,
      this.manager,
      this.players,
      required this.name,
      required this.mobile,
      required this.city,
      required this.address,
      this.points,
      this.branch,
      required this.id,
      this.createDate,
      this.updateDate,
      this.auditingStatus,
      required this.userName,
      required this.userType,
      this.branchId,
      this.academyId,
      this.levelId,
      this.latestLoginAt,
      this.dateOfBirth});

  Userr.fromJson(Map<String, dynamic> json) {
    roles = json['roles'];
    avatar = json['avatar'];
    manager = json['manager'];
    players = json['players'];
    name = json['name'];
    mobile = json['mobile'];
    city = (json['city'] != null ? City.fromJson(json['city']) : null)!;
    address = json['address'];
    points = json['points'];
    branch = json['branch'];
    id = json['id'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    auditingStatus = json['auditing_status'];
    userName = json['user_name'];
    userType = json['user_type'];
    branchId = json['branch_id'];
    academyId = json['academy_id'];
    levelId = json['level_id'];
    latestLoginAt = json['latest_login_at'];
    dateOfBirth = json['date_of_birth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['roles'] = roles;
    data['avatar'] = avatar;
    data['manager'] = manager;
    data['players'] = players;
    data['name'] = name;
    data['mobile'] = mobile;
    data['city'] = city.toJson();
    data['address'] = address;
    data['points'] = points;
    data['branch'] = branch;
    data['id'] = id;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['auditing_status'] = auditingStatus;
    data['user_name'] = userName;
    data['user_type'] = userType;
    data['branch_id'] = branchId;
    data['academy_id'] = academyId;
    data['level_id'] = levelId;
    data['latest_login_at'] = latestLoginAt;
    data['date_of_birth'] = dateOfBirth;
    return data;
  }
}

class City {
  late String id;
  late String name;

  City({required this.id, required this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Branch {
  late Null name;
  late Null description;
  late Null address;
  late Null city;
  late Null academy;
  late Null managers;
  late Null latitude;
  late Null longitude;
  late int id;
  late Null createDate;
  late Null updateDate;
  late Null auditingStatus;
  late Null distanceInMeter;
  late Null numberOfTrialPlayers;

  Branch(
      {this.name,
      this.description,
      this.address,
      this.city,
      this.academy,
      this.managers,
      this.latitude,
      this.longitude,
      required this.id,
      this.createDate,
      this.updateDate,
      this.auditingStatus,
      this.distanceInMeter,
      this.numberOfTrialPlayers});

  Branch.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    address = json['address'];
    city = json['city'];
    academy = json['academy'];
    managers = json['managers'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    id = json['id'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    auditingStatus = json['auditing_status'];
    distanceInMeter = json['distance_in_meter'];
    numberOfTrialPlayers = json['number_of_trial_players'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    data['address'] = address;
    data['city'] = city;
    data['academy'] = academy;
    data['managers'] = managers;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['id'] = id;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['auditing_status'] = auditingStatus;
    data['distance_in_meter'] = distanceInMeter;
    data['number_of_trial_players'] = numberOfTrialPlayers;
    return data;
  }
}

class Classs {
  late String name;
  late String description;
  late Null index;
  late Null populations;
  late Null managers;
  late Null branch;
  late int id;
  late Null createDate;
  late Null updateDate;
  late Null auditingStatus;
  late int branchId;
  late Null courseFee;
  late Null numberOfPlayers;

  Classs(
      {required this.name,
      required this.description,
      this.index,
      this.populations,
      this.managers,
      this.branch,
      required this.id,
      this.createDate,
      this.updateDate,
      this.auditingStatus,
      required this.branchId,
      this.courseFee,
      this.numberOfPlayers});

  Classs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    index = json['index'];
    populations = json['populations'];
    managers = json['managers'];
    branch = json['branch'];
    id = json['id'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    auditingStatus = json['auditing_status'];
    branchId = json['branch_id'];
    courseFee = json['course_fee'];
    numberOfPlayers = json['number_of_players'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    data['index'] = index;
    data['populations'] = populations;
    data['managers'] = managers;
    data['branch'] = branch;
    data['id'] = id;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['auditing_status'] = auditingStatus;
    data['branch_id'] = branchId;
    data['course_fee'] = courseFee;
    data['number_of_players'] = numberOfPlayers;
    return data;
  }
}
