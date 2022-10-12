import 'package:covid_19_tracker/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WordStatsScreen extends StatefulWidget {
  const WordStatsScreen({Key? key}) : super(key: key);

  @override
  State<WordStatsScreen> createState() => _WordStatsScreenState();
}

class _WordStatsScreenState extends State<WordStatsScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  final colorList = <Color>[
    Color(0xff4285f4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    height = MediaQuery.of(context).size.height;
    width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height:height*0.1 ,
                ),

                PieChart(
                    dataMap:{
                      "Total":20,
                      "Recovered":15,
                      "Deaths":5,
                    },
                chartRadius: width/3.2,
                  legendOptions: LegendOptions(
                    legendPosition: LegendPosition.left
                  ),
                  animationDuration: Duration(milliseconds: 1200),
                  chartType: ChartType.ring,
                  colorList: colorList,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: height*0.06),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
                      child: Column(
                        children: [
                          ReuseableRow(title: 'Total',value:'200',),
                          ReuseableRow(title: 'Total',value:'200',),
                          ReuseableRow(title: 'Total',value:'200',),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff1aa260),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text('Track Countries'),
                  ),
                ),
              ],
            ),
          ) ),
    );
  }
}
class ReuseableRow extends StatelessWidget {
  String title,value;
  ReuseableRow({Key? key, required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Divider(

        ),
      ],
    );
  }
}
