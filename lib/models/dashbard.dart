class Dashboard {
  List<Regions>? regions;
  Charts? charts;
  ProductVariety? productVariety;
  int? totalProductVariety;
  int? totalFarmSize;
  int? totalExpectedHarvest;
  int? totalNeedLoan;
  int? totalNeedFertilizer;
  int? totalFarms;
  int? firstTime;
  List<Data>? data;

  Dashboard(
      {this.regions,
        this.charts,
        this.productVariety,
        this.totalProductVariety,
        this.totalFarmSize,
        this.totalExpectedHarvest,
        this.totalNeedLoan,
        this.totalNeedFertilizer,
        this.totalFarms,
        this.firstTime,
        this.data});

  Dashboard.fromJson(Map<String, dynamic> json) {
    if (json['regions'] != null) {
      regions = <Regions>[];
      json['regions'].forEach((v) {
        regions!.add(Regions.fromJson(v));
      });
    }
    charts =
    json['charts'] != null ? Charts.fromJson(json['charts']) : null;
    productVariety = json['productVariety'] != null
        ? ProductVariety.fromJson(json['productVariety'])
        : null;
    totalProductVariety = json['totalProductVariety'];
    totalFarmSize = json['totalFarmSize'];
    totalExpectedHarvest = json['totalExpectedHarvest'];
    totalNeedLoan = json['totalNeedLoan'];
    totalNeedFertilizer = json['totalNeedFertilizer'];
    totalFarms = json['totalFarms'];
    firstTime = json['firstTime'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (regions != null) {
      data['regions'] = regions!.map((v) => v.toJson()).toList();
    }
    if (charts != null) {
      data['charts'] = charts!.toJson();
    }
    if (productVariety != null) {
      data['productVariety'] = productVariety!.toJson();
    }
    data['totalProductVariety'] = totalProductVariety;
    data['totalFarmSize'] = totalFarmSize;
    data['totalExpectedHarvest'] = totalExpectedHarvest;
    data['totalNeedLoan'] = totalNeedLoan;
    data['totalNeedFertilizer'] = totalNeedFertilizer;
    data['totalFarms'] = totalFarms;
    data['firstTime'] = firstTime;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Regions {
  String? region;

  Regions({this.region});

  Regions.fromJson(Map<String, dynamic> json) {
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['region'] = region;
    return data;
  }
}

class Charts {
  List<HarvestExpectationChart>? harvestExpectationChart;

  Charts({this.harvestExpectationChart});

  Charts.fromJson(Map<String, dynamic> json) {
    if (json['harvest_expectation_chart'] != null) {
      harvestExpectationChart = <HarvestExpectationChart>[];
      json['harvest_expectation_chart'].forEach((v) {
        harvestExpectationChart!.add(HarvestExpectationChart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (harvestExpectationChart != null) {
      data['harvest_expectation_chart'] =
          harvestExpectationChart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HarvestExpectationChart {
  String? date;
  int? total;

  HarvestExpectationChart({this.date, this.total});

  HarvestExpectationChart.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['total'] = total;
    return data;
  }
}

class ProductVariety {
  String? s0;
  String? s1;
  String? s5;
  String? s6;

  ProductVariety({this.s0, this.s1, this.s5, this.s6});

  ProductVariety.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s5 = json['5'];
    s6 = json['6'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['0'] = s0;
    data['1'] = s1;
    data['5'] = s5;
    data['6'] = s6;
    return data;
  }
}

class Data {
  int? regionsId;
  String? region;
  int? farmSize;
  int? farmsId;
  int? id;
  int? farmerId;
  int? farmId;
  int? productId;
  int? expectedHarvest;
  String? prepareDate;
  String? plantationDate;
  String? harvestDate;
  int? haveIrrigationSystem;
  int? isFirstTime;
  int? havingAgricultureSkills;
  int? needsLoan;
  int? alreadyHaveLoan;
  int? haveDisasterHistory;
  int? usingManure;
  String? seedType;
  int? status;
  CreatedAt? createdAt;
  CreatedAt? updatedAt;
  CreatedAt? deletedAt;
  String? productName;

  Data(
      {this.regionsId,
        this.region,
        this.farmSize,
        this.farmsId,
        this.id,
        this.farmerId,
        this.farmId,
        this.productId,
        this.expectedHarvest,
        this.prepareDate,
        this.plantationDate,
        this.harvestDate,
        this.haveIrrigationSystem,
        this.isFirstTime,
        this.havingAgricultureSkills,
        this.needsLoan,
        this.alreadyHaveLoan,
        this.haveDisasterHistory,
        this.usingManure,
        this.seedType,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.productName});

  Data.fromJson(Map<String, dynamic> json) {
    regionsId = json['regions_id'];
    region = json['region'];
    farmSize = json['farm_size'];
    farmsId = json['farms_id'];
    id = json['id'];
    farmerId = json['farmer_id'];
    farmId = json['farm_id'];
    productId = json['product_id'];
    expectedHarvest = json['expected_harvest'];
    prepareDate = json['prepare_date'];
    plantationDate = json['plantation_date'];
    harvestDate = json['harvest_date'];
    haveIrrigationSystem = json['have_irrigation_system'];
    isFirstTime = json['is_first_time'];
    havingAgricultureSkills = json['having_agriculture_skills'];
    needsLoan = json['needs_loan'];
    alreadyHaveLoan = json['already_have_loan'];
    haveDisasterHistory = json['have_disaster_history'];
    usingManure = json['using_manure'];
    seedType = json['seed_type'];
    status = json['status'];
    createdAt = json['created_at'] != null
        ? CreatedAt.fromJson(json['created_at'])
        : null;
    updatedAt = json['updated_at'] != null
        ? CreatedAt.fromJson(json['updated_at'])
        : null;
    deletedAt = json['deleted_at'] != null
        ? CreatedAt.fromJson(json['deleted_at'])
        : null;
    productName = json['product_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['regions_id'] = regionsId;
    data['region'] = region;
    data['farm_size'] = farmSize;
    data['farms_id'] = farmsId;
    data['id'] = id;
    data['farmer_id'] = farmerId;
    data['farm_id'] = farmId;
    data['product_id'] = productId;
    data['expected_harvest'] = expectedHarvest;
    data['prepare_date'] = prepareDate;
    data['plantation_date'] = plantationDate;
    data['harvest_date'] = harvestDate;
    data['have_irrigation_system'] = haveIrrigationSystem;
    data['is_first_time'] = isFirstTime;
    data['having_agriculture_skills'] = havingAgricultureSkills;
    data['needs_loan'] = needsLoan;
    data['already_have_loan'] = alreadyHaveLoan;
    data['have_disaster_history'] = haveDisasterHistory;
    data['using_manure'] = usingManure;
    data['seed_type'] = seedType;
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
    data['product_name'] = productName;
    return data;
  }
}

class CreatedAt {
  String? date;
  String? readable;
  String? monthYear;
  String? time;
  String? second;
  String? diff;
  String? dateTime;

  CreatedAt(
      {this.date,
        this.readable,
        this.monthYear,
        this.time,
        this.second,
        this.diff,
        this.dateTime});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    readable = json['readable'];
    monthYear = json['month_year'];
    time = json['time'];
    second = json['second'];
    diff = json['diff'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['readable'] = readable;
    data['month_year'] = monthYear;
    data['time'] = time;
    data['second'] = second;
    data['diff'] = diff;
    data['date_time'] = dateTime;
    return data;
  }
}
