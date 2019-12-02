import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provide/provide.dart';
import 'package:zz_living/models/goods_detail_model.dart';
import 'package:zz_living/provides/goods_detail_provide.dart';

class GoodsDetailWeb extends StatelessWidget {
  const GoodsDetailWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var goodsDetail = Provide.value<GoodsDetailProvide>(context)
        .goodsDetail
        .goodInfo
        .goodsDetail;
    var comments =
        Provide.value<GoodsDetailProvide>(context).goodsDetail.goodComments;
    var isLeft = Provide.value<GoodsDetailProvide>(context).isLeft;
    if (isLeft) {
      //详情web页面
      return Container(child: Html(data: goodsDetail));
    } else {
      return _commentListView(comments);
    }
  }

// 评论列表
  Widget _commentListView(List<GoodCommentsListBean> comments) {
    if (comments.length == 0) {
      return Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.topCenter,
        child: Text('暂无评论'),
      );
    }
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return _commentItem(comments[index]);
      },
    );
  }

// 每条评论
  Widget _commentItem(GoodCommentsListBean comment) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(comment.userName),
              SizedBox(width: 20),
              Text('回复：${comment.discussTime}')
            ],
          ),
          Text(comment.comments),
          Divider(),
        ],
      ),
    );
  }
}
