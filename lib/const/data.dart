import 'dart:ui';

import 'package:support_flutter/utils/icons/sign_up_icons_icons.dart';

const servers = {
  'prod_server': {
    'protocol': 'https',
    'host': 'api.donggurami.net',
    'port': '',
  },
  'test_server': {
    'protocol': 'http',
    'host': '43.203.31.200',
    'port': '8080',
  },
};
const SERVER = 'test_server';
final protocol = servers[SERVER]!['protocol'];
final host = servers[SERVER]!['host'];
final port = servers[SERVER]!['port'];

const accessTokenKey = 'access_token';
const refreshTokenKey = 'refresh_token';

const dormTypes = [
  (label: '고운학사 A동', icon: SignUpIcons.ic_dorm),
  (label: '고운학사 B동', icon: SignUpIcons.ic_dorm),
  (label: '고운학사 C동', icon: SignUpIcons.ic_dorm),
  (label: '글로벌 경상관 11층', icon: SignUpIcons.ic_dorm),
  (label: '글로벌 경상관 12층', icon: SignUpIcons.ic_dorm),
  (label: '글로벌 경상관 13층', icon: SignUpIcons.ic_dorm),
  (label: '글로벌 경상관 14층', icon: SignUpIcons.ic_dorm),
];

const genders = [
  (label: '남성', icon: SignUpIcons.ic_male),
  (label: '여성', icon: SignUpIcons.ic_female),
];

const colors = [
  Color(0xFFFF63AF),
  Color(0xFF6D9CE8),
  Color(0xFF63FFFC),
  Color(0xFFC14FEA),
  Color(0xFFFFA12D),
  // Copilor 생성
  Color(0xFF4CAF50),
  Color(0xFFFFEB3B),
  Color(0xFFFF5722),
  Color(0xFF9C27B0),
  Color(0xFF3F51B5),
];

const mainColor = Color(0xFFFFFFFF);
const accentColor = Color(0xFFF49446);
