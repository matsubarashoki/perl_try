#最大値最小値を求めるサブルーチン

#構文の間違いを自動的にチェック
use strict;
use warnings;
# scalarは数量　
use Scalar::Util 'looks_like_number';

#コマンドライン引数の受け取り
my @nums = @ARGV;

#引数が数値かどうかのチェック
# 「die」関数はエラーが発生した場合にプログラムを終了させる場合に使用し、
# エラーメッセージを出力しPerlスクリプトを終了します。
foreach my $num (@nums){
  die "Arguments must be numbers"
    unless looks_like_number($num);
}

#最大値を求める
my $max = max(@nums);

#最小値を求める
my $min = min(@nums);

#結果の出力
print "max:$max\n" .
      "min:$min\n";

#最大値を求めるサブルーチン
sub max{
  my @nums = @_;

  my $max;
  foreach my $num (@nums) {
    $max = $num if !defined $max || $num > $max;
  }
  return $max;
}

#最小値を求めるサブルーチン
sub min{
  my @nums = @_;

  my $min;
  foreach my $num (@nums){
    $min = $num if !defined $min || $num < $min;
  }
  return $min;
}