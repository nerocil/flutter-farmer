import 'dart:developer';

import 'package:farmer_group_management/components/counter_card.dart';
import 'package:farmer_group_management/components/dashboard_card.dart';
import 'package:farmer_group_management/controllers/dashboard/dashaboard_controller.dart';
import 'package:farmer_group_management/models/dashbard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class DashboardPage extends GetView<DashboardController> {
  DashboardPage({Key? key}) : super(key: key);

  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final dashboard = controller.dashboard.value;
        return Scaffold(
          body: controller.loading.value ? const Center(child: CircularProgressIndicator()):SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  //height: 120,
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Arush region summary',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text("${dashboard.totalFarmSize.toString()} Acre",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleSmall,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  PopupMenuButton<String>(
                                    //initialValue: selectedMenu,
                                    // Callback that sets the selected popup menu item.
                                    child: OutlinedButton.icon(onPressed: () {},
                                        icon: Icon(FeatherIcons.chevronDown),
                                        label: Text("Region")),
                                    onSelected: (item) {},
                                    itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: " SampleItem.itemOne",
                                        child: Text('Item 1'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  PopupMenuButton<String>(
                                    //initialValue: selectedMenu,
                                    // Callback that sets the selected popup menu item.
                                    child: OutlinedButton.icon(onPressed: () {},
                                        icon: Icon(FeatherIcons.chevronDown),
                                        label: Text("Product")),
                                    onSelected: (item) {},
                                    itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: " SampleItem.itemOne",
                                        child: Text('Item 1'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CounterCard(title:"Total Farms", total:dashboard.totalFarms.toString(),),
                              CounterCard(title:"Expected harvest", total:dashboard.totalExpectedHarvest.toString(),),
                              CounterCard(title:"Product variation", total:dashboard.totalProductVariety.toString(),),
                              CounterCard(title:"Loan needed", total:dashboard.totalNeedLoan.toString(),),
                            ],)
                        ],
                      ),
                    ),
                  ),),
                Wrap(children: [

                  DashboardCard(
                      title: "Fertilizer",
                      subtitle: "Who need fertilizer",
                      total: dashboard.totalNeedLoan.toString(), subtotal: "100",),
                ],),

                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(text: 'Expected harvest'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<HarvestExpectationChart, String>>[
                        LineSeries<HarvestExpectationChart, String>(
                            dataSource: dashboard.charts?.harvestExpectationChart??<HarvestExpectationChart>[ HarvestExpectationChart(date:"", total:0)],
                            xValueMapper: (HarvestExpectationChart harvest, _) => harvest.date,
                            yValueMapper: (HarvestExpectationChart harvest, _) => harvest.total,
                            name: 'Harvest',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true))
                      ]),
                ),

                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(text: 'Half yearly sales analysis'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<_SalesData, String>>[
                        BarSeries<_SalesData, String>(
                            dataSource: data,
                            xValueMapper: (_SalesData sales, _) => sales.year,
                            yValueMapper: (_SalesData sales, _) => sales.sales,
                            name: 'Sales',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true))
                      ]),
                ),


              ],
            ),
          ),
        );
      }
    );
  }
}
