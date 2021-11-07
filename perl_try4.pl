#構文の間違いを自動的にチェック
use strict;
use warnings;

#ハッシュの宣言と代入：各教科の点数
#Perlにおけるハッシュというのは、他言語での連想配列。辞書型
my %scores = (math =>55,english => 70, japanese =>100);

#要素の参照 %ではない
my $math_score = $scores{math};
print "$math_score\n";
# 要素の代入
$scores{english} = 80;

#試験結果表示 keys関数でキーを全て取得できる
foreach my $subject(keys %scores) {
  #各教科の点数
  my $score = $scores{$subject};
  #制御構文:８０点以上の場合はgood
  if($score >= 80){
    print "$subject : good\n";
  }
  #60以上の場合はpass
  elsif ($score >= 60) {
    print "$subject : pass\n";
  }
  else{
    print "$subject : failed\n";
  }
}

#便利な関数 defined 値が定義されているか
my $value = 1;
my $is_defined = defined $value;
print "$is_defined\n";

#文字列のリストを生成するとき qwを使える
my @strs = qw/aaa bbb ccc/;
print "@strs";