import 'package:money_saver/features/home/data/model/transcation.dart';

List<Money> geterTop() {
  Money upwork = Money();
  upwork.name = 'upwork';
  upwork.fee = '400';
  upwork.image = 'imagee.png';
  upwork.time = 'today';
  upwork.buy = false;

  Money freework = Money();
  freework.name = 'freelancer';
  freework.fee = '300';
  freework.image = 'imagee.png';
  freework.time = 'today';
  freework.buy = true;

  return [upwork, upwork,freework];
}
