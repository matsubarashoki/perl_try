#ログファイルの加工

#構文の間違いを自動的にチェック
use strict;
use warnings;

# 引数のファイル名
my $file = shift;

# 使用方法 unlessは後置条件 否定条件
die "Usage: $0 FILE"  unless defined $file;

# ファイルのreadでオープン dieはthrow　qqはダブルクォート
open my $fh, '<', $file
  or die qq{Can't open file: "$file":$!};

# 複数のパケット情報を格納するための配列のリファレンス
my $packet_infos = [];

# パレット情報を格納するためのハッシュのリファレンス
my $packet_info;

#ファイルを一行ずつ処理
while (my $line = <$fh>) {
  
    #改行の削除
    chomp $line;

    #各行の確認 =~は正規表現判定　時刻情報の判定
    if($line =~ /^(\d{2}:\d{2}:\d{2})/){
      #ハッシュの初期化 これif文の外じゃないと駄目じゃないかな
      $packet_info = {};
      #ハッシュのkey:timeにループしている値いれる
      $packet_info->{time} = $1;
    }
    elsif ($line =~ /^packet: (\d+)/) {
      #ハッシュのkey:packetに値を入れる
      $packet_info->{packet} = $1;
    }
    elsif ($line =~ /^loss: (\d+)/) {
      #ロス数
      $packet_info->{loss} = $1;
      #パケット情報の追加
      push @$packet_infos, $packet_info;
    }
}

#ファイルのクローズ
close $fh;

#ヘッダの出力
my @headers = qw/time packet loss/;
print join("\t", @headers) . "\n";

#出力処理
foreach my $packet_info (@$packet_infos){
  #各要素を並べる
  my @rec = (
    $packet_info->{time},
    $packet_info->{packet},
    $packet_info->{loss}
  );
  #タブ区切りで出力
  print join("\t", @rec) . "\n";
}