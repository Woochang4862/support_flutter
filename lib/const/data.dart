import 'dart:ui';

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
const roleKey = 'role';
const markAsReadKey = 'markAsRead';

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
