import 'package:flutter/material.dart';

import '../models/news_post.dart';

class NewsItem extends StatelessWidget {
  final NewsPost newsPost;

  NewsItem(this.newsPost);

  Widget _buildAvatarWithNameRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          radius: 18,
          backgroundColor: Color(0xFFE74249),
          child: CircleAvatar(
            radius: 16,
            backgroundImage: newsPost.photoId==null //Т.к. с api приходит json с null-ами для всех аватаров, берется id фотографии поста (просто чтобы показать работу)
            ? NetworkImage('https://image.shutterstock.com/image-vector/profile-placeholder-image-gray-silhouette-600w-1153673752.jpg')
            : NetworkImage('https://thumbs.dreamstime.com/z/darjeeling-image-beautiful-tea-garden-105271801.jpg'),
          ),
        ),
        Padding(
          padding:EdgeInsets.only(
            top: 9,
            left: 18
          ),
          child: Text(
            '${newsPost.user.firstName} ${newsPost.user.lastName}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
          ),
          ),
        )
    ],
    );
  }

  Widget _buildNewsCaption() {
    var captionText = newsPost.caption == null ? ' ' :'${newsPost.caption}';
    return Container(
      padding: EdgeInsets.only(
        top: 5,
        left: 14,
        bottom: 5),
      height: 93,
      child: FittedBox(
        alignment: Alignment.topLeft,
        fit: BoxFit.scaleDown,
        child: Text(
          '$captionText',
          style: TextStyle(
            color: Color(0xFF4D545C),
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
  Widget _buildBottomBar() {
  return Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16),
          width: 17,
          height: 15,
          child: Image.asset('assets/images/like.png', fit: BoxFit.fill)
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            '28',
            style: TextStyle(
              color: Color(0xFFD1414F),
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          )
        ),
        Container(
          margin: EdgeInsets.only(left: 26),
          width: 18,
          height: 15,
          child: Image.asset('assets/images/comment.png', fit: BoxFit.fill)),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            '28',
            style: TextStyle(
              color: Color(0xFFCED0D5),
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          )
        )

      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
          topRight: Radius.circular(4),
          bottomLeft: Radius.circular(4)
        )
      ),
      margin: EdgeInsets.only(left: 17,right: 17,bottom: 20),
      elevation: 5,
      child: Container(
        width: 328,
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          _buildAvatarWithNameRow(),
          _buildNewsCaption(),
          _buildBottomBar(),
        ],
        ),
      ),
    );
  }
}