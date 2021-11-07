#構文の間違いを自動的にチェック
use strict;
use warnings;

#配列の宣言
my @nums;
#配列に代入
@nums = (5,10,15);
#要素の参照
my $num = $nums[0];
#要素の代入
$nums[1] = 100;

#for文要素の出力
for (my $i = 0; $i < @nums; $i++) {
  print $nums[$i], "\n";
}

#foreach文要素の出力
foreach my $num (@nums) {
  $num +=1;
  print $num, "\n";
}

#while文
my $i = 0;
while ($i < @nums) {
    $i++;
    print $i, "\n";
}