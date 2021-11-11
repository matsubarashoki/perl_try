#起動コマンド　morbo webapp.pl

use Mojolicious::Lite;
#ハローワールド renderでtext属性を付けると文字列だけ表示
get '/' => sub { shift->render(text => 'Hello World!') };

#ルーティング　URLパラメータ取得
get '/date/:date' => sub{
    my $self = shift;
    #パラメータ受け取り
    my $date = $self->param('date');
    #受け取ったパラメータをレンダリング
    $self->render(text => "Date:$date");
};

#ルーティング　クエリ文字列を受け取る
# 例： /diary/?date2=20131016&user=kimoto
get '/diary' => sub {
    my $self = shift;

    #パラメータの受け取り
    my $date2 = $self->param('date2');
    my $user = $self->param('user');

    $self->render(text => "Date: $date2, User: $user");
};

# templateの表示
get 'index' => sub{
    my $self = shift;
    $self->render('index');
};

app->start;

__DATA__

@@ index.html.ep
<%
  my $name = 'kimoto';
  my $age = 19;
  my @nums = (1, 2, 3);
%>
<html>
  <head>
    <title>Index</title>
  </head>
  <body>
    <h1>Index</h1>
    % if ($name eq 'kimoto') {
      Kimoto
    % } else {
      Other
    % }
    <br>
    He is <%= $age %> years old.<br>
    
    % for my $num (@nums) {
      <%= $num %><br>
    % }
  </body>
</html>
