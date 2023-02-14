import 'dart:developer';

import 'package:farmer_group_management/components/counter_card.dart';
import 'package:farmer_group_management/components/dashboard_card.dart';
import 'package:farmer_group_management/controllers/pages/dashboard/dashboard_page_controller.dart';
import 'package:farmer_group_management/models/dashbaord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';



class DashboardPage extends GetView<DashboardPageController> {
  const DashboardPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final dashboard = controller.dashboard.value;
      return Scaffold(
        body: controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      //height: 120,
                      child: Card(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.selectedRegion.value} region summary',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${dashboard.totalFarmSize.toString()} Acre",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      PopupMenuButton<String>(
                                        constraints: BoxConstraints(maxHeight: 300),
                                        //color: Theme.of(context).cardColor,
                                        elevation: 6,
                                        position: PopupMenuPosition.under,
                                        //initialValue: selectedMenu,
                                        // Callback that sets the selected popup menu item.
                                        child: OutlinedButton.icon(
                                            onPressed: null,
                                            icon:
                                                const Icon(FeatherIcons.chevronDown),
                                            label: Text(controller.selectedRegion.value)),
                                        onSelected: (productName) {
                                          controller.onSelectRegion(productName);
                                        },
                                        itemBuilder: (BuildContext context) {

                                          return List<PopupMenuEntry<String>>.generate(dashboard.regions?.length??0, (index) {
                                            final region = dashboard.regions![index];
                                            return PopupMenuItem(value:region.region??"",child: Text(region.region??""));
                                          });

                                        },
                                      ),
                                      const SizedBox(width: 10),
                                      PopupMenuButton<String>(
                                        constraints: const BoxConstraints(maxHeight: 300),
                                        //color: Theme.of(context).cardColor,
                                        elevation: 6,
                                        position: PopupMenuPosition.under,
                                        //initialValue: selectedMenu,
                                        // Callback that sets the selected popup menu item.
                                        child: OutlinedButton.icon(
                                            onPressed: null,
                                            icon:
                                            const Icon(FeatherIcons.chevronDown),
                                            label: Text(controller.selectedProduct.value)),
                                        onSelected: (productName) {
                                          controller.onSelectProduct(productName);
                                        },
                                        itemBuilder: (BuildContext context) {

                                          return List<PopupMenuEntry<String>>.generate(dashboard.productVariety?.length??0, (index) {
                                            final product = dashboard.productVariety![index];
                                            return PopupMenuItem(value:product.name??"",child: Text(product.name??""));
                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CounterCard(
                                    title: "Total Farms Size",
                                    total: dashboard.totalFarmSize.toString(),
                                  ),
                                  CounterCard(
                                    title: "Total Farms",
                                    total: dashboard.totalFarms.toString(),
                                  ),
                                  CounterCard(
                                    title: "Product variation",
                                    total: dashboard.totalProductVariety
                                        .toString(),
                                  ),
                                  CounterCard(
                                    title: "Needs Fertilizer",
                                    total: dashboard.totalNeedFertilizer
                                        .toString(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Wrap(
                        children: List<Widget>.generate(
                            dashboard.dashboardWidgetCards?.length ?? 0,
                            (index) {
                      final cardInfo = dashboard.dashboardWidgetCards![index];
                      return DashboardCard(
                        title: cardInfo.title ?? "",
                        subtitle: cardInfo.subtitle ?? "",
                        subtotal: cardInfo.subtotal ?? "",
                        percentage: cardInfo.percentage ?? "",
                      );
                    })),
                    Column(
                      children: List.generate(
                          dashboard.chartsForLineAndBar?.length ?? 0, (index) {
                        final chartsForLineAndBar =
                            dashboard.chartsForLineAndBar![index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: SfCartesianChart(
                            isTransposed: chartsForLineAndBar.type == "Line"?false:true,
                            primaryXAxis: CategoryAxis(),
                            title: ChartTitle( text: chartsForLineAndBar.title ?? ""),
                            legend: Legend(isVisible: false),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            series: <ChartSeries<ChartData, String>>[
                              chartsForLineAndBar.type == "Line" ?
                              LineSeries<ChartData, String>( dataSource: chartsForLineAndBar.chartData ??
                                    <ChartData>[ChartData(label: "", value: 0)],
                                xValueMapper: (ChartData chartData, _) => chartData.label,
                                yValueMapper: (ChartData chartData, _) => chartData.value,
                                name: 'Harvest',
                                // Enable data label
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true),
                              ):BarSeries<ChartData, String>(
                                dataSource: chartsForLineAndBar.chartData ??
                                    <ChartData>[ChartData(label: "", value: 0)],
                                xValueMapper: (ChartData chartData, _) => chartData.label,
                                yValueMapper: (ChartData chartData, _) => chartData.value,
                                name: 'Harvest',
                                // Enable data label
                                dataLabelSettings: const DataLabelSettings(isVisible: true),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
