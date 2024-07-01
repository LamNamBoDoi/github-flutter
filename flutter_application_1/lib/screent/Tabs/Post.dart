import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/CommentData.dart';
import 'package:flutter_application_1/data/PostData.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

enum Reaction { like, love, wow, haha, sad, angry, none }

class FriendPost extends StatefulWidget {
  FriendPost(
      {required this.postData,
      required this.comments,
      this.myPost,
      this.like,
      this.watchPost});

  final PostData postData;
  final List<CommentElement> comments;
  final bool? myPost;
  final int? like;
  final bool? watchPost;
  @override
  State<FriendPost> createState() => _PostState();
}

class _PostState extends State<FriendPost> {
  Reaction _reaction = Reaction.none;

  bool _reactionView = false;
  bool _commentsView = false;
  final List<ReactionElement> reactions = [
    ReactionElement(
        Reaction.like,
        Image.asset(
          'assets/like.gif',
          fit: BoxFit.cover,
        )),
    ReactionElement(
        Reaction.love,
        Image.asset(
          'assets/love.gif',
          fit: BoxFit.cover,
        )),
    ReactionElement(
        Reaction.haha,
        Image.asset(
          'assets/haha.gif',
          fit: BoxFit.cover,
        )),
    ReactionElement(
        Reaction.wow,
        Image.asset(
          'assets/wow.gif',
          fit: BoxFit.cover,
        )),
    ReactionElement(
        Reaction.sad,
        Image.asset(
          'assets/sad.gif',
          fit: BoxFit.cover,
        )),
    ReactionElement(
        Reaction.angry,
        Image.asset(
          'assets/angry.gif',
          fit: BoxFit.cover,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 1,
        ),
        const SizedBox(
          height: 5,
        ),
        // Head post
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 50,
              child: Row(
                children: [
                  // avatar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.postData.avatar,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 200,
                        height: widget.watchPost == true ? 18 : 35,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: widget.postData.text1,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          TextSpan(
                            text: ' ' + widget.postData.text2 + ' ',
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: widget.postData.text3,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                          if (widget.watchPost == true)
                            const TextSpan(
                              text: ' . ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                          if (widget.watchPost == true)
                            const TextSpan(
                              text: 'Follow',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: Colors.blue),
                            ),
                        ])),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 200,
                        height: 15,
                        child: Row(
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: widget.postData.textTime + ' . ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: Colors.black),
                              ),
                              if (widget.watchPost == null)
                                TextSpan(
                                  text: widget.postData.textAddress + ' . ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                      color: Colors.black),
                                ),
                            ])),
                            if (widget.watchPost == null)
                              Image.asset(
                                widget.postData.iconStatus,
                                color: Colors.grey,
                                width: 12,
                                height: 12,
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 270,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: widget.watchPost == true
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.more_horiz,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          : Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 10,
        ),

        // Caption
        Container(
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: widget.myPost == true ? 70 : 20,
          width: MediaQuery.of(context).size.width,
          child: Text(
            widget.postData.caption,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
        // Body post
        Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      widget.postData.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (widget.watchPost == true)
                    SizedBox(
                      height: 15,
                    ),
                  if (widget.watchPost == true)
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)),
                            child: Transform.rotate(
                              angle: -30 * 3.14 / 180,
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 35,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                              width: 315,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.asset(
                                        'assets/onepiece.jpg',
                                        fit: BoxFit.cover,
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                  ),
                                  Text(
                                      'No one has ever become poor by giving .')
                                ],
                              )),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // bottom post
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 130,
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    if (_reactionView) {
                                      _reactionView = false;
                                    } else {
                                      if (_reaction == Reaction.none) {
                                        _reaction = Reaction.like;
                                      } else {
                                        _reaction = Reaction.none;
                                      }
                                    }

                                    setState(() {});
                                  },
                                  onLongPress: () {
                                    setState(() {
                                      _reactionView = true;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    child: getReactionIcon(_reaction),
                                  ),
                                ),
                              ),

                              // Comment button
                              if (!_reactionView)
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _commentsView = !_commentsView;
                                    });
                                  },
                                  child: Container(
                                    child: Image.asset(
                                      'assets/chat.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              if (!_reactionView)
                                Container(
                                  child: Image.asset(
                                    'assets/messengerwhite.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                            ],
                          ),
                        ),

                        //Emoji
                        Container(
                          padding: EdgeInsets.only(left: 2),
                          height: 14,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Stack(children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 11),
                                        child: Center(
                                          child: Image.asset(
                                            'assets/heart.png',
                                            height: 12,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                width: 1, color: Colors.white)),
                                        child: Image.asset(
                                          'assets/likefacebook.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  if (widget.myPost == null &&
                                      widget.watchPost == null)
                                    if (_reaction != Reaction.none)
                                      const Text(
                                        'You, ',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      )
                                    else
                                      const Text(
                                        'Liked by ',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                  if (widget.myPost == null &&
                                      widget.watchPost == null)
                                    Text(
                                      widget.postData.textLikeBy,
                                      style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    )
                                  else
                                    Text(
                                      widget.like != null
                                          ? widget.like.toString()
                                          : '0',
                                      style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  widget.postData.textComment + ' Comments',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            // Live, eye
            if (widget.watchPost == true)
              Positioned(
                top: 15,
                left: 15,
                width: 125,
                height: 25,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(3)),
                        child: const Center(
                          child: Text(
                            'LIVE',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(3)),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.visibility,
                                size: 18,
                                color: Colors.white,
                              ),
                              Text(
                                ' 8.3K',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Emoji
            Positioned(
              bottom: widget.watchPost == true ? 50 : 40,
              left: 30,
              width: 192,
              height: 30,
              child: (_reactionView)
                  ? Container(
                      height: 30,
                      width: 240,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: reactions.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 15 + index * 10,
                              child: FadeInAnimation(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _reaction = reactions[index].reaction;
                                      _reactionView = false;
                                    });
                                  },
                                  child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      height: 30,
                                      width: 30,
                                      child: reactions[index].image),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),

        // comment
        if (_commentsView == true)
          Container(
            width: MediaQuery.of(context).size.width - 20,
            height: 180,
            //color: Colors.grey,
            child: Column(
              children: [
                // Comments others
                Container(
                  height: 140,
                  //color: Colors.green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: widget.comments.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Avatar comment
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        widget.comments[index].avatar,
                                        fit: BoxFit.cover,
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    // Name comment
                                    Container(
                                      height: 60,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(4),
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFDDDDDD),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget.comments[index].name,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  widget
                                                      .comments[index].comment,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  widget.comments[index].time,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xFF555555)),
                                                ),
                                                const Text(
                                                  'Like',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xFF555555)),
                                                ),
                                                const Text(
                                                  'Reply',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xFF555555)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),

                // My comments
                Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/anhnen.jpg',
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        ),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          height: 26,
                          decoration: BoxDecoration(
                              color: Color(0xFFDDDDDD),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                            decoration: const InputDecoration(
                                hintText: 'Write a comment..',
                                hintStyle: TextStyle(
                                    color: Color(0xFF555555),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                                border: InputBorder.none,
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.tag_faces_outlined,
                                      size: 15,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ],
    );
  }

  Image getReactionIcon(Reaction r) {
    switch (r) {
      case Reaction.like:
        return Image.asset(
          'assets/like_fill.png',
          color: Color(0xFF384CFF),
          fit: BoxFit.cover,
        );
      case Reaction.love:
        return Image.asset(
          'assets/heart.png',
          fit: BoxFit.cover,
        );
      case Reaction.haha:
        return Image.asset(
          'assets/hahafacebook.png',
          fit: BoxFit.cover,
        );
      case Reaction.wow:
        return Image.asset(
          'assets/surprisedfacebook.png',
          fit: BoxFit.cover,
        );
      case Reaction.sad:
        return Image.asset(
          'assets/sadfacebook.png',
          fit: BoxFit.cover,
        );
      case Reaction.angry:
        return Image.asset(
          'assets/angryfacebook.png',
          fit: BoxFit.cover,
        );
      default:
        return Image.asset(
          'assets/like.png',
          fit: BoxFit.cover,
        );
    }
  }
}

class ReactionElement {
  final Reaction reaction;
  final Image image;

  ReactionElement(this.reaction, this.image);
}
