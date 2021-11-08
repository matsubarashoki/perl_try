#ディレクトリ操作2 File:Basenameモジュール

#構文の間違いを自動的にチェック
use strict;
use warnings;
use File::Basename 'basename';

#探索するディレクトリ
my $target = 'c:/sample/test.txt';

#　basename関数 末尾を取得
my $base = basename $target;
print "$base\n";

# fileparse関数 ファイル名とディレクトリ名を取得
use File::Basename 'fileparse';
my ($base2,$dir) = fileparse $target;
print "$base2\n";
print "$dir\n";

# ファイル名の連結
use File::Spec;
my $sampledir = 'c:/sample/test/';
my $samplefile= 'text.txt';

my $file_abs = File::Spec->catfile($sampledir, $samplefile);
print "$file_abs\n";

#現在実行中のスクリプト $0
print "$0\n";

#現在実行中のスクリプトのディレクトリと取得
use FindBin;
my $script_dir = $FindBin::Bin;
print "$script_dir";