import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// MyApp类
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 图片widget  imageSection
    Widget imageSection = new Image.asset(
      'images/kobe.png',
      height: 240.0,
      //告诉框架，图像应该尽可能小，但覆盖整个渲染框
      fit: BoxFit.cover,
    );
    // 标题widget  titleSection
    Widget titleSection = new Container(
      // 四周填充32个像素
      padding: const EdgeInsets.all(32),
      // 行布局 
      child: Row(
        children: <Widget>[
          // 行布局中第一列占用很大的空间所以用到expand
          Expanded(
            // 两行列布局到文本
            child: Column(
              // 设置文字左对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // title 1
                // 容器：当需要用到填充、边距时，widget需要放在容器中 
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Oeschinen Lake Campground',style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // title 2
                Text('Kandersteg, Switzerland',style: TextStyle(color: Colors.grey[500]),),
              ],
            ),
          ),
          // start布局
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          // 如果text不设置颜色，默认为红色
          Text('41'),
        ],
      ),
    );
    // 按钮widget  buttonSection
    // 封装一个方法：图标、文字组合为列布局widget
    Column buildButtonColumn(IconData icon,String label){
      // 整体颜色与主题色一致
      Color color = Theme.of(context).primaryColor;
      // 返回一个列布局: 图标、文字
      return new Column(
        // 设置按钮文字居中
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        // 两个子widget（icon 和 text）
        children: <Widget>[
          // 图标
          new Icon(icon,color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                color: color,
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    }
    Widget buttonSection = new Container(
      child: Row(
        // 等分
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // 三个列布局的子widget
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
    // 文本widget  textSection
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: new ListView(
          children: <Widget>[
            // 图片widget  imageSection
            imageSection,
            // 标题widget  titleSection
            titleSection,
            // 按钮widget  buttonSection
            buttonSection,
            // 文本widget  textSection
            textSection,
          ],
        ),
      ),
    );
  }
}
