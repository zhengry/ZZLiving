import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: ListView(
        children: <Widget>[
          _userAvatar(context),
          _orderPart(context),
          _listItem(context, Icon(Icons.card_giftcard), '我的优惠券'),
          _listItem(context, Icon(Icons.mail), '我的消息'),
          _listItem(context, Icon(Icons.contact_phone), '联系客服')
        ],
      ),
    );
  }

  Widget _userAvatar(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 10, color: Colors.black12))),
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Image.network(
                'https://c-ssl.duitang.com/uploads/item/201702/21/20170221003606_HG3xS.thumb.700_0.jpeg',
                fit: BoxFit.fitWidth),
            Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(75)),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://c-ssl.duitang.com/uploads/item/201301/14/20130114012513_fw8GW.thumb.700_0.jpeg',
                          scale: 0.5)),
                )),
          ]),
        ));
  }

  Widget _orderPart(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 10, color: Colors.black12))),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.list),
            title: Text('我的订单'),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          Row(
            children: <Widget>[
              _orderItem(context, Icons.nature, '待发货'),
              _orderItem(context, Icons.card_travel, '待收货'),
              _orderItem(context, Icons.receipt, '已签收'),
              _orderItem(context, Icons.backup, '售后'),
            ],
          )
        ],
      ),
    );
  }

  Widget _orderItem(BuildContext context, IconData icon, String title) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black45,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black45),
          ),
        ],
      ),
    );
  }

  Widget _listItem(BuildContext context, Icon icon, String title) {
    return Column(
        children: <Widget>[
          ListTile(
            leading: icon,
            title: Text(title),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider()
        ],
      );
  }
}
