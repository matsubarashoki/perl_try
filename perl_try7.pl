#ディレクトリ操作

#構文の間違いを自動的にチェック
use strict;
use warnings;

#探索するディレクトリ
my $dir = 'c:/sample/';

#ディレクトリハンドルを開く opendir関数
opendir my $dh, $dir
  or die qq/Can't open directory: $!/;

# ハンドルで1つずつ捜査 readdir関数
my @files;
while (my $file = readdir $dh) {
  #「.」「..」以外のファイルを取得
  next if $file eq '.' || $file eq '..';
  #
  push @files,$file;
}

closedir $dh;

print "@files";