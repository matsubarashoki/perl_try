#構文の間違いを自動的にチェック
use strict;
use warnings;

#コマンドライン引数の取得
my @nums = @ARGV;


#和を求める
my $total = sum(@nums);

#出力
print "Total \n";
print "$total \n";

#合計を計算するサブルーチン(関数)
sub sum {
    #引数の受け取り
    my @nums = @_;

    #和の計算
    my $total = 0;
        foreach my $num (@nums) {
            $total += $num;
    }
    #戻り値
    return $total;
}