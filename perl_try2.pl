#構文の間違いを自動的にチェック
use strict;
use warnings;

#四則演算
my $math = 77;
my $eng = 88;

my $total = $math + $eng;

#結果を見やすいように改行文字列にする.インライン的にかけるのか
my $score = "Math:$math\n" .
            "English:$eng\n" .
            "Total:$total\n";
#文字列いろいろ
my $message = 'I like' . ' dog'; #連結

#print関数
print $score
