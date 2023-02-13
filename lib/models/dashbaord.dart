class Dashboard {
  List<ChartsForLineAndBar>? chartsForLineAndBar;
  List<DashboardWidgetCards>? dashboardWidgetCards;
  List<ProductVariety>? productVariety;
  String? totalProductVariety;
  String? totalFarmSize;
  String? totalExpectedHarvest;
  String? totalNeedFertilizer;
  String? totalFarms;
  List<Data>? data;
  List<Regions>? regions;

  Dashboard(
      {this.chartsForLineAndBar,
        this.dashboardWidgetCards,
        this.productVariety,
        this.totalProductVariety,
        this.totalFarmSize,
        this.totalExpectedHarvest,
        this.totalNeedFertilizer,
        this.totalFarms,
        this.data,
        this.regions});

  Dashboard.fromJson(Map<String, dynamic> json) {
    if (json['chartsForLineAndBar'] != null) {
      chartsForLineAndBar = <ChartsForLineAndBar>[];
      json['chartsForLineAndBar'].forEach((v) {
        chartsForLineAndBar!.add(ChartsForLineAndBar.fromJson(v));
      });
    }
    if (json['dashboardWidgetCards'] != null) {
      dashboardWidgetCards = <DashboardWidgetCards>[];
      json['dashboardWidgetCards'].forEach((v) {
        dashboardWidgetCards!.add(DashboardWidgetCards.fromJson(v));
      });
    }
    if (json['productVariety'] != null) {
      productVariety = <ProductVariety>[];
      json['productVariety'].forEach((v) {
        productVariety!.add(ProductVariety.fromJson(v));
      });
    }
    totalProductVariety = json['totalProductVariety'];
    totalFarmSize = json['totalFarmSize'];
    totalExpectedHarvest = json['totalExpectedHarvest'];
    totalNeedFertilizer = json['totalNeedFertilizer'];
    totalFarms = json['totalFarms'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    if (json['regions'] != null) {
      regions = <Regions>[];
      json['regions'].forEach((v) {
        regions!.add(Regions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chartsForLineAndBar != null) {
      data['chartsForLineAndBar'] =
          chartsForLineAndBar!.map((v) => v.toJson()).toList();
    }
    if (dashboardWidgetCards != null) {
      data['dashboardWidgetCards'] =
          dashboardWidgetCards!.map((v) => v.toJson()).toList();
    }
    if (productVariety != null) {
      data['productVariety'] =
          productVariety!.map((v) => v.toJson()).toList();
    }
    data['totalProductVariety'] = totalProductVariety;
    data['totalFarmSize'] = totalFarmSize;
    data['totalExpectedHarvest'] = totalExpectedHarvest;
    data['totalNeedFertilizer'] = totalNeedFertilizer;
    data['totalFarms'] = totalFarms;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (regions != null) {
      data['regions'] = regions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChartsForLineAndBar {
  String? title;
  String? type;
  List<ChartData>? chartData;

  ChartsForLineAndBar({this.title, this.type, this.chartData});

  ChartsForLineAndBar.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    if (json['chartData'] != null) {
      chartData = <ChartData>[];
      json['chartData'].forEach((v) {
        chartData!.add(ChartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    if (chartData != null) {
      data['chartData'] = chartData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChartData {
  String? label;
  int? value;

  ChartData({this.label, this.value});

  ChartData.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    return data;
  }
}

class DashboardWidgetCards {
  String? title;
  String? subtitle;
  String? subtotal;
  String? percentage;

  DashboardWidgetCards(
      {this.title, this.subtitle, this.subtotal, this.percentage});

  DashboardWidgetCards.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    subtotal = json['subtotal'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['subtotal'] = subtotal;
    data['percentage'] = percentage;
    return data;
  }
}

class ProductVariety {
  String? name;

  ProductVariety({this.name});

  ProductVariety.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
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
  String? prepareDate;
  String? plantationDate;
  String? fertilizerImplementationDate;
  String? harvestDate;
  int? expectedHarvest;
  int? harvest;
  int? isHaveIrrigationSystem;
  int? isFirstTime;
  int? isHavingAgricultureSkills;
  int? isNeedsLoan;
  int? isAlreadyHaveLoan;
  int? isHaveDisasterHistory;
  int? isUsingFertilizer;
  String? lastSeedTypeUsed;
  int? status;
  AtDate? createdAt;
  AtDate? updatedAt;
  AtDate? deletedAt;
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
        this.prepareDate,
        this.plantationDate,
        this.fertilizerImplementationDate,
        this.harvestDate,
        this.expectedHarvest,
        this.harvest,
        this.isHaveIrrigationSystem,
        this.isFirstTime,
        this.isHavingAgricultureSkills,
        this.isNeedsLoan,
        this.isAlreadyHaveLoan,
        this.isHaveDisasterHistory,
        this.isUsingFertilizer,
        this.lastSeedTypeUsed,
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
    prepareDate = json['prepare_date'];
    plantationDate = json['plantation_date'];
    fertilizerImplementationDate = json['fertilizer_implementation_date'];
    harvestDate = json['harvest_date'];
    expectedHarvest = json['expected_harvest'];
    harvest = json['harvest'];
    isHaveIrrigationSystem = json['is_have_irrigation_system'];
    isFirstTime = json['is_first_time'];
    isHavingAgricultureSkills = json['is_having_agriculture_skills'];
    isNeedsLoan = json['is_needs_loan'];
    isAlreadyHaveLoan = json['is_already_have_loan'];
    isHaveDisasterHistory = json['is_have_disaster_history'];
    isUsingFertilizer = json['is_using_fertilizer'];
    lastSeedTypeUsed = json['last_seed_type_used'];
    status = json['status'];
    createdAt = json['created_at'] != null
        ? AtDate.fromJson(json['created_at'])
        : null;
    updatedAt = json['updated_at'] != null
        ? AtDate.fromJson(json['updated_at'])
        : null;
    deletedAt = json['deleted_at'] != null
        ? AtDate.fromJson(json['deleted_at'])
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
    data['prepare_date'] = prepareDate;
    data['plantation_date'] = plantationDate;
    data['fertilizer_implementation_date'] = fertilizerImplementationDate;
    data['harvest_date'] = harvestDate;
    data['expected_harvest'] = expectedHarvest;
    data['harvest'] = harvest;
    data['is_have_irrigation_system'] = isHaveIrrigationSystem;
    data['is_first_time'] = isFirstTime;
    data['is_having_agriculture_skills'] = isHavingAgricultureSkills;
    data['is_needs_loan'] = isNeedsLoan;
    data['is_already_have_loan'] = isAlreadyHaveLoan;
    data['is_have_disaster_history'] = isHaveDisasterHistory;
    data['is_using_fertilizer'] = isUsingFertilizer;
    data['last_seed_type_used'] = lastSeedTypeUsed;
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

class AtDate {
  String? date;
  String? readable;
  String? monthYear;
  String? time;
  String? second;
  String? diff;
  String? dateTime;

  AtDate(
      {this.date,
        this.readable,
        this.monthYear,
        this.time,
        this.second,
        this.diff,
        this.dateTime});

  AtDate.fromJson(Map<String, dynamic> json) {
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
