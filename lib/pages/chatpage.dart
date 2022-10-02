import 'package:dggcourses/models/mentor_model.dart';
import 'package:dggcourses/shared/theme.dart';
import 'package:dggcourses/widgets/headeroback.dart';
import 'package:dggcourses/widgets/mentorchat.dart';
import 'package:dggcourses/widgets/userchat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {

  MentorModel mentor;
  ChatPage(this.mentor);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController chatFromUser = TextEditingController(text: "");

  var fokus = false;
  var chats = [
    {
      "chat" : "pak shem, ingin bertanya, ada assets yg error pak.",
      "from" : "user"
    },
    {
      "chat": "coba tolong di screen shot dari error nya?",
      "from": "mentor",
    },
    {
      "chat": "Sebentar pak, akan saya kirimkan",
      "from": "user"
    },
  ];

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return ListView(
        children: [
          SizedBox(height: 106,),
          Column(
            children: chats.map((chat) => chat['from'] == "mentor" ? MentorChat(text: chat['chat'].toString(), img: widget.mentor.img) : UserChat(text: chat['chat'].toString()) ).toList(),
          ),
        ],
      );
    }

    Widget header() {
      return Column(
        children: [
          HeaderBackOnly(title: widget.mentor.name),
          Container(
            margin: EdgeInsets.only(top: 25),
            height: 1,
            color: Color(0xffEEEEEE),
          ),
        ],
      );
    }

    Widget chatSender() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            child: Row(
          children: [
            Expanded(
                child: Container(
              height: 45,
              margin: EdgeInsets.only(bottom: 16, left: 16),
              decoration: BoxDecoration(
                  color: Color(0xffEDEEF0),
                  borderRadius: BorderRadius.circular(10)),
              child: Focus(
                onFocusChange: (hasFocus) => {
                  if (hasFocus)
                    {
                      this.setState(() {
                        fokus = true;
                      })
                    }
                  else
                    {
                      this.setState(() {
                        fokus = false;
                      })
                    }
                },
                child: TextFormField(
                  controller: chatFromUser,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(14),
                      hintStyle: poppinsText.copyWith(
                          fontSize: 14, fontWeight: reguler, color: grey),
                      hintText: "Text to Shem Bizo"),
                ),
              ),
            )),
            Container(
              width: 45,
              height: 45,
              margin: EdgeInsets.only(bottom: 16, left: 10),
              decoration: BoxDecoration(
                  color: fokus ? primaryColor : Color(0xffEDEEF0),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    this.setState(() {
                      List<Map<String, String>> array = [];
                      for (var item in chats) {
                        array.add(item);
                      }
                      array.add({
                        "chat": chatFromUser.text,
                        "from": "user"
                      });

                      this.setState(() {
                        chats = array;
                      });

                      this.chatFromUser = TextEditingController(text: "");
                      FocusScope.of(context).unfocus();
                    });
                  },
                  child: Container(
                    width: 19,
                    height: 16,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(fokus
                                ? "assets/ic_send_active.png"
                                : "assets/ic_send_grey.png"))),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 24,
            )
          ],
        )),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Stack(
          children: [
            content(), 
            chatSender(),
            header(),
          ],
        ),
      ),
    );
  }
}
