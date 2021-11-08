#FTPのトライアル

#構文の間違いを自動的にチェック
use strict;
use warnings;
use Net::FTP;
use File::Spec;
use File::Copy 'move';

#ダウンロードしたファイルを保存するディレクトリ
my $download_dir = 'c:/tmp';

#ファイルのダウンロードのサブルーチン呼び出し
download_files($download_dir);

#ファイルを拡張子毎に分類しディレクトリ移動
categorize_files($download_dir);

#ファイルをダウンロードするサブルーチン
sub download_files {
    #引数のディレクトリをローカル変数に
    my $ldir = shift;
    
    #ホスト名
    my $host = 'ftp.riken.jp';

    # FTPサーバへの接続
    my $ftp = Net::FTP->new($host)
        or die qq{Can't connect to "$host": $@};

    #FTPサーバにログイン
    $ftp->login('anonymous')
        or die qq{Can't login "$host"} . $ftp->message;
    
    #ダウンロードファイルの保存先を作成 -dで存在チェック
    mkdir $ldir unless -d $ldir;

    #捜査するリモートディレクトリ
    my $rdir = '/lang/CPAN';

    #リモートディレクトリの移動
    $ftp->cwd($rdir)
        or die qq{Can't change directory "$rdir"} . $ftp->message;

    #ファイルの取得
    foreach my $file ($ftp->ls) {
        #htmlとgz以外はスキップ
        next unless $file =~ /(\.html|\.gz)$/;

        #ファイルに名前を付けて保存
        $ftp->get($file, File::Spec->catfile($ldir,$file))
            or die qq{Can't get file "$file"} . $ftp->message;
    }
}

#カテゴライズして移動するサブルーチン
sub categorize_files {
    my $dir = shift;

    #現在ローカルに保存されているファイルをすべて取得し、
    my @files = glob(File::Spec->catfile($dir, '*'));
    @files = grep { -f $_ } @files;

    #ファイルの拡張子をチェックし分類
    my %exts;
    foreach my $file (@files) {
        #拡張子を取得
        my $ext;
        if($file =~ /\.([^\.]+)$/) {
            $ext = $1;
        }

        #拡張子名でディレクトリ作成　作成済みはとばし
        my $ext_dir = File::Spec->catfile($dir,$ext);
        mkdir $ext_dir unless -d $ext_dir;

        #ファイルを移動
        move $file, $ext_dir
            or die qq{Can't move file "$file" to "$ext_dir": $!};
    }
}



