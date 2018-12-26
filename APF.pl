#########################
# Coded By CrIpTiX CrEw #
#########################

use Tk;
use HTTP::Request;
use LWP::UserAgent;

$DrawMain = MainWindow->new( -background => "black", -cursor=>"arrow");
$DrawMain->geometry("855x235+100+300");
$DrawMain->title("APF v1.0");
$DrawMain->resizable(0,0);

$MainTitle = "APF v1.0";
$DrawMain->Label(-text => "Copyright © CrIpTiX CrEw Inc. 2010", -background => "black", -foreground => "blue", -font => "Verdana 7", -width => 120)->place(-x => 165, -y => 218);
$FoundStatus = "Admin Panels Found";
$StatFound = $DrawMain->Label(-textvariable => \$FoundStatus, -background => "black", -foreground => "blue", -font => "Verdana 9")->place(-x => 220, -y => 15);
$NonFoundStatus = "Admin Panels Not Found";
$StatNonFound = $DrawMain->Label(-textvariable => \$NonFoundStatus, -background => "black", -foreground => "blue", -font => "Verdana 9")->place(-x => 540, -y => 15);
$ScrollBox1 = $DrawMain->Scrolled("Text", -scrollbars => 'oe', -font => "Verdana 8", -background => "black", -foreground => "white", -selectbackground => "blue", -insertbackground => "blue", -relief => "groove", -width => 40, -height=> 12)->place(-x => 540, -y => 40);
$ScrollBox2 = $DrawMain->Scrolled("Text", -scrollbars => 'oe', -font => "Verdana 8", -background => "black", -foreground => "white", -selectbackground => "blue", -insertbackground => "blue", -relief => "groove", -width => 40, -height=> 12)->place(-x => 220, -y => 40);
$DrawMain->Label(-background => "black", -foreground => "blue", -font => "Verdana 9", -text => " Enter site URL ")->place(-x => 4, -y => 35);
$DrawMain->Entry(-background => "black", -foreground => "white", -selectbackground => "black", -insertbackground => "white", -width => 40, -relief => "ridge", -textvariable => \$site, -width => 30, -takefocus  => '2')->place(-x => 11, -y => 55);
$DrawMain->Label(-background => "black", -foreground => "blue", -font => "Verdana 9", -text => " Enter admin page file extension ")->place(-x => 4, -y => 80);
$DrawMain->Entry(-background => "black", -foreground => "white", -selectbackground => "black", -insertbackground => "white", -width => 40, -relief => "ridge", -textvariable => \$Extension, -width => 30)->place(-x => 11, -y => 100);
$DrawMain->Button(-activebackground => "blue", -activeforeground => "white", -background => "black", -foreground => "blue", -font => "Verdana 7", -relief => "groove", -text => "Start", -width => 5, -command => \&DoScan)->place(-x => 38, -y => 130);
$DrawMain->Button(-activebackground => "blue", -activeforeground => "white", -background => "black", -foreground => "blue", -font => "Verdana 7", -relief => "groove", -text => "Stop", -width => 5, -command => \&DoStore )->place(-x => 83, -y => 130);
$DrawMain->Button(-activebackground => "blue", -activeforeground => "white", -background => "black", -foreground => "blue", -font => "Verdana 7", -relief => "groove", -text => "Clear", -width => 5, -command => \&DoClear)->place(-x => 128, -y => 130);
$DrawMain->Button(-activebackground => "blue", -activeforeground => "white", -background => "black", -foreground => "blue", -font => "Verdana 7", -relief => "groove", -text => "Help/About", -width => 9, -command => \&About_Help)->place(-x => 48, -y => 160);
$DrawMain->Button(-activebackground => "blue", -activeforeground => "white", -background => "black", -foreground => "blue", -font => "Verdana 7", -relief => "groove", -text => "Exit", -width => 5, -command => sub { exit })->place(-x => 118, -y => 160);
$DrawMain->Label(-background => "black", -foreground => "blue", -font => "Verdana 9", -text => "-=Accepted File Extensions=-")->place(-x => 9, -y => 185);
$DrawMain->Label(-background => "black", -foreground => "blue", -font => "Verdana 7", -text => ".php, .asp, .jsp, .html, .htm, .aspx")->place(-x => 18, -y => 202);
$WorkStatus = $DrawMain->Label(-background => "black", -foreground => "blue", -font => "Verdana 7", -textvariable => \$ScanStatus)->place(-x => 537, -y => 202);

MainLoop;

sub About_Help {
$About = $DrawMain->Toplevel(-background => "black", -cursor=>"arrow");
$About->geometry("450x290+425+250");
$About->title("APF v1.0");
$About->resizable(0,0);
$About->Label(-background => "black", -foreground=>"blue")->pack();
$About->Label(-background => "black", -foreground=>"blue", -font=> "Cambria 10", -text => "APF v1.0 Help/Info")->pack();
$About->Label(-background => "black", -foreground=>"blue", -font=> "Cambria 10", -text => " -How To Use APF-\nEnter site URL\n Ex: http://www.target.com or http://www.target.com/path")->pack();
$About->Label(-background => "black", -foreground=>"blue", -font=> "Cambria 10", -text => " -Enter admin page file Extension-\n Ex: If you think its then admin.php just enter .php or\n if you think its admin.asp just enter .asp")->pack();
$About->Label(-background => "black", -foreground=>"blue", -font=> "Cambria 10", -text => "\nFull Ex:\n Enter site URL : http://www.target.com\n Enter admin page file Extension : .php")->pack();
$About->Label(-background => "black", -foreground=>"blue", -font=> "Cambria 11", -text => "-=Coded By CrIpTiX CrEw=-")->pack();
$About->Button(-activebackground => "blue", -activeforeground => "white", -background => "black", -foreground => "blue", -relief => "groove", -font=> "Verdana 7", -text => "Exit", -width => 50, -command => [$about => 'destroy'])->place(-x => 75, -y => 250);
$About->Label(-background => "black", -foreground => "blue", -font => "Cambria 8", -text => "Copyright © CrIpTiX CrEw Inc. 2010")->place(-x => 275, -y => 272);
}

sub DoClear {
$ScrollBox1->delete("0.0", "end");
$ScrollBox2->delete("0.0", "end");
$ScanStatus = ""
}

sub DoStore {
$SiteURL = "",
$ScanedPaths = "",
@path1 = ""
}

sub DoScan{

$ScrollBox1->delete("0.0", "end");
$ScrollBox2->delete("0.0", "end");
$SiteURL = $site;

if ( $SiteURL !~ /^http:/ ) {
$SiteURL = 'http://' . $SiteURL;
}
if ( $SiteURL !~ /\/$/ ) {
$SiteURL = $SiteURL . '/';
}

if($Extension eq ".php"){
@path1=('admin/','administrator/','moderator/','webadmin/','adminarea/','bb-admin/','adminLogin/','admin_area/','panel-administracion/','instadmin/',
'memberadmin/','administratorlogin/','adm/','admin/account.php','admin/index.php','admin/login.php','admin/admin.php','admin/account.php',
'admin_area/admin.php','admin_area/login.php','siteadmin/login.php','siteadmin/index.php','siteadmin/login.html','admin/account.html','admin/index.html','admin/login.html','admin/admin.html',
'admin_area/index.php','bb-admin/index.php','bb-admin/login.php','bb-admin/admin.php','admin/home.php','admin_area/login.html','admin_area/index.html',
'admin/controlpanel.php','admin.php','admincp/index.asp','admincp/login.asp','admincp/index.html','admin/account.html','adminpanel.html','webadmin.html',
'webadmin/index.html','webadmin/admin.html','webadmin/login.html','admin/admin_login.html','admin_login.html','panel-administracion/login.html',
'admin/cp.php','cp.php','administrator/index.php','administrator/login.php','nsw/admin/login.php','webadmin/login.php','admin/admin_login.php','admin_login.php',
'administrator/account.php','administrator.php','admin_area/admin.html','pages/admin/admin-login.php','admin/admin-login.php','admin-login.php',
'bb-admin/index.html','bb-admin/login.html','bb-admin/admin.html','admin/home.html','login.php','modelsearch/login.php','moderator.php','moderator/login.php',
'moderator/admin.php','account.php','pages/admin/admin-login.html','admin/admin-login.html','admin-login.html','controlpanel.php','admincontrol.php',
'admin/adminLogin.html','adminLogin.html','admin/adminLogin.html','home.html','rcjakar/admin/login.php','adminarea/index.html','adminarea/admin.html',
'webadmin.php','webadmin/index.php','webadmin/admin.php','admin/controlpanel.html','admin.html','admin/cp.html','cp.html','adminpanel.php','moderator.html',
'administrator/index.html','administrator/login.html','user.html','administrator/account.html','administrator.html','login.html','modelsearch/login.html',
'moderator/login.html','adminarea/login.html','panel-administracion/index.html','panel-administracion/admin.html','modelsearch/index.html','modelsearch/admin.html',
'admincontrol/login.html','adm/index.html','adm.html','moderator/admin.html','user.php','account.html','controlpanel.html','admincontrol.html',
'panel-administracion/login.php','wp-login.php','adminLogin.php','admin/adminLogin.php','home.php','admin.php','adminarea/index.php',
'adminarea/admin.php','adminarea/login.php','panel-administracion/index.php','panel-administracion/admin.php','modelsearch/index.php',
'modelsearch/admin.php','admincontrol/login.php','adm/admloginuser.php','admloginuser.php','admin2.php','admin2/login.php','admin2/index.php',
'adm/index.php','adm.php','affiliate.php','adm_auth.php','memberadmin.php','administratorlogin.php'
);

foreach $ScanedPaths(@path1){
$ScanStatus = "Scaning path: " . $ScanedPaths;
$WorkStatus->update();
$MainTitle = "APF v1.0";
$OutPut=$SiteURL.$ScanedPaths;
$Request=HTTP::Request->new(GET=>$OutPut);
$Get=LWP::UserAgent->new();
$Get->timeout(10);
$Response=$Get->request($Request);

if($Response->content =~ /Username/ ||
$Response->content =~ /Password/ ||
$Response->content =~ /username/ ||
$Response->content =~ /password/ ||
$Response->content =~ /USERNAME/ ||
$Response->content =~ /PASSWORD/ ||
$Response->content =~ /Senha/ ||
$Response->content =~ /senha/ ||
$Response->content =~ /Personal/ ||
$Response->content =~ /Usuario/ ||
$Response->content =~ /Clave/ ||
$Response->content =~ /Usager/ ||
$Response->content =~ /usager/ ||
$Response->content =~ /Sing/ ||
$Response->content =~ /passe/ ||
$Response->content =~ /P\/W/ ||
$Response->content =~ /Admin Password/
){
$ScrollBox2->insert('end', $OutPut."\n");
}else{
$ScrollBox1->insert('end', $OutPut."\n");
}
}
}

if($Extension eq ".asp"){
@path1=('admin/','administrator/','moderator/','webadmin/','adminarea/','bb-admin/','adminLogin/','admin_area/','panel-administracion/','instadmin/',
'memberadmin/','administratorlogin/','adm/','account.asp','admin/account.asp','admin/index.asp','admin/login.asp','admin/admin.asp',
'admin_area/admin.asp','admin_area/login.asp','admin/account.html','admin/index.html','admin/login.html','admin/admin.html',
'admin_area/admin.html','admin_area/login.html','admin_area/index.html','admin_area/index.asp','bb-admin/index.asp','bb-admin/login.asp','bb-admin/admin.asp',
'bb-admin/index.html','bb-admin/login.html','bb-admin/admin.html','admin/home.html','admin/controlpanel.html','admin.html','admin/cp.html','cp.html',
'administrator/index.html','administrator/login.html','administrator/account.html','administrator.html','login.html','modelsearch/login.html','moderator.html',
'moderator/login.html','moderator/admin.html','account.html','controlpanel.html','admincontrol.html','admin_login.html','panel-administracion/login.html',
'admin/home.asp','admin/controlpanel.asp','admin.asp','pages/admin/admin-login.asp','admin/admin-login.asp','admin-login.asp','admin/cp.asp','cp.asp',
'administrator/account.asp','administrator.asp','login.asp','modelsearch/login.asp','moderator.asp','moderator/login.asp','administrator/login.asp',
'moderator/admin.asp','controlpanel.asp','admin/account.html','adminpanel.html','webadmin.html','pages/admin/admin-login.html','admin/admin-login.html',
'webadmin/index.html','webadmin/admin.html','webadmin/login.html','user.asp','user.html','admincp/index.asp','admincp/login.asp','admincp/index.html',
'admin/adminLogin.html','adminLogin.html','admin/adminLogin.html','home.html','adminarea/index.html','adminarea/admin.html','adminarea/login.html',
'panel-administracion/index.html','panel-administracion/admin.html','modelsearch/index.html','modelsearch/admin.html','admin/admin_login.html',
'admincontrol/login.html','adm/index.html','adm.html','admincontrol.asp','admin/account.asp','adminpanel.asp','webadmin.asp','webadmin/index.asp',
'webadmin/admin.asp','webadmin/login.asp','admin/admin_login.asp','admin_login.asp','panel-administracion/login.asp','adminLogin.asp',
'admin/adminLogin.asp','home.asp','admin.asp','adminarea/index.asp','adminarea/admin.asp','adminarea/login.asp','admin-login.html',
'panel-administracion/index.asp','panel-administracion/admin.asp','modelsearch/index.asp','modelsearch/admin.asp','administrator/index.asp',
'admincontrol/login.asp','adm/admloginuser.asp','admloginuser.asp','admin2.asp','admin2/login.asp','admin2/index.asp','adm/index.asp',
'adm.asp','affiliate.asp','adm_auth.asp','memberadmin.asp','administratorlogin.asp','siteadmin/login.asp','siteadmin/index.asp','siteadmin/login.html'
);

foreach $ScanedPaths(@path1){
$ScanStatus = "Scaning path: " . $ScanedPaths;
$WorkStatus->update();
$MainTitle = "APF v1.0";
$OutPut=$SiteURL.$ScanedPaths;
$Request=HTTP::Request->new(GET=>$OutPut);
$Get=LWP::UserAgent->new();
$Get->timeout(10);
$Response=$Get->request($Request);

if($Response->content =~ /Username/ ||
$Response->content =~ /Password/ ||
$Response->content =~ /username/ ||
$Response->content =~ /password/ ||
$Response->content =~ /USERNAME/ ||
$Response->content =~ /PASSWORD/ ||
$Response->content =~ /Senha/ ||
$Response->content =~ /senha/ ||
$Response->content =~ /Personal/ ||
$Response->content =~ /Usuario/ ||
$Response->content =~ /Clave/ ||
$Response->content =~ /Usager/ ||
$Response->content =~ /usager/ ||
$Response->content =~ /Sing/ ||
$Response->content =~ /passe/ ||
$Response->content =~ /P\/W/ ||
$Response->content =~ /Admin Password/
){
$ScrollBox2->insert('end', $OutPut."\n");
}else{
$ScrollBox1->insert('end', $OutPut."\n");
}
}
}


if($Extension eq ".jsp"){
@path1=('admin/','administrator/','moderator/','webadmin/','adminarea/','bb-admin/','adminLogin/','admin_area/','panel-administracion/','instadmin/',
'memberadmin/','administratorlogin/','adm/','account.jsp','admin/account.jsp','admin/index.jsp','admin/login.jsp','admin/admin.jsp',
'admin_area/admin.jsp','admin_area/login.jsp','admin/account.html','admin/index.html','admin/login.html','admin/admin.html',
'admin_area/admin.html','admin_area/login.html','admin_area/index.html','admin_area/index.jsp','bb-admin/index.jsp','bb-admin/login.jsp','bb-admin/admin.jsp',
'bb-admin/index.html','bb-admin/login.html','bb-admin/admin.html','admin/home.html','admin/controlpanel.html','admin.html','admin/cp.html','cp.html',
'administrator/index.html','administrator/login.html','administrator/account.html','administrator.html','login.html','modelsearch/login.html','moderator.html',
'moderator/login.html','moderator/admin.html','account.html','controlpanel.html','admincontrol.html','admin_login.html','panel-administracion/login.html',
'admin/home.jsp','admin/controlpanel.jsp','admin.jsp','pages/admin/admin-login.jsp','admin/admin-login.jsp','admin-login.jsp','admin/cp.jsp','cp.jsp',
'administrator/account.jsp','administrator.jsp','login.jsp','modelsearch/login.jsp','moderator.jsp','moderator/login.jsp','administrator/login.jsp',
'moderator/admin.jsp','controlpanel.jsp','admin/account.html','adminpanel.html','webadmin.html','pages/admin/admin-login.html','admin/admin-login.html',
'webadmin/index.html','webadmin/admin.html','webadmin/login.html','user.jsp','user.html','admincp/index.jsp','admincp/login.jsp','admincp/index.html',
'admin/adminLogin.html','adminLogin.html','admin/adminLogin.html','home.html','adminarea/index.html','adminarea/admin.html','adminarea/login.html',
'panel-administracion/index.html','panel-administracion/admin.html','modelsearch/index.html','modelsearch/admin.html','admin/admin_login.html',
'admincontrol/login.html','adm/index.html','adm.html','admincontrol.jsp','admin/account.jsp','adminpanel.jsp','webadmin.jsp','webadmin/index.jsp',
'webadmin/admin.jsp','webadmin/login.jsp','admin/admin_login.jsp','admin_login.jsp','panel-administracion/login.jsp','adminLogin.jsp',
'admin/adminLogin.jsp','home.jsp','admin.jsp','adminarea/index.jsp','adminarea/admin.jsp','adminarea/login.jsp','admin-login.html',
'panel-administracion/index.jsp','panel-administracion/admin.jsp','modelsearch/index.jsp','modelsearch/admin.jsp','administrator/index.jsp',
'admincontrol/login.jsp','adm/admloginuser.jsp','admloginuser.jsp','admin2.jsp','admin2/login.jsp','admin2/index.jsp','adm/index.jsp',
'adm.jsp','affiliate.jsp','adm_auth.jsp','memberadmin.jsp','administratorlogin.jsp','siteadmin/login.jsp','siteadmin/index.jsp','siteadmin/login.html'
);

foreach $ScanedPaths(@path1){
$ScanStatus = "Scaning path: " . $ScanedPaths;
$WorkStatus->update();
$MainTitle = "APF v1.0";
$OutPut=$SiteURL.$ScanedPaths;
$Request=HTTP::Request->new(GET=>$OutPut);
$Get=LWP::UserAgent->new();
$Get->timeout(10);
$Response=$Get->request($Request);

if($Response->content =~ /Username/ ||
$Response->content =~ /Password/ ||
$Response->content =~ /username/ ||
$Response->content =~ /password/ ||
$Response->content =~ /USERNAME/ ||
$Response->content =~ /PASSWORD/ ||
$Response->content =~ /Senha/ ||
$Response->content =~ /senha/ ||
$Response->content =~ /Personal/ ||
$Response->content =~ /Usuario/ ||
$Response->content =~ /Clave/ ||
$Response->content =~ /Usager/ ||
$Response->content =~ /usager/ ||
$Response->content =~ /Sing/ ||
$Response->content =~ /passe/ ||
$Response->content =~ /P\/W/ ||
$Response->content =~ /Admin Password/
){
$ScrollBox2->insert('end', $OutPut."\n");
}else{
$ScrollBox1->insert('end', $OutPut."\n");
}
}
}

if($Extension eq ".html"){
@path1=('admin/','administrator/','moderator/','webadmin/','adminarea/','bb-admin/','adminLogin/','admin_area/','panel-administracion/','instadmin/',
'memberadmin/','administratorlogin/','adm/','account.html','admin/account.html','admin/index.html','admin/login.html','admin/admin.html',
'admin_area/admin.html','admin_area/login.html','admin/account.html','admin/index.html','admin/login.html','admin/admin.html',
'admin_area/admin.html','admin_area/login.html','admin_area/index.html','admin_area/index.html','bb-admin/index.html','bb-admin/login.html','bb-admin/admin.html',
'bb-admin/index.html','bb-admin/login.html','bb-admin/admin.html','admin/home.html','admin/controlpanel.html','admin.html','admin/cp.html','cp.html',
'administrator/index.html','administrator/login.html','administrator/account.html','administrator.html','login.html','modelsearch/login.html','moderator.html',
'moderator/login.html','moderator/admin.html','account.html','controlpanel.html','admincontrol.html','admin_login.html','panel-administracion/login.html',
'admin/home.html','admin/controlpanel.html','admin.html','pages/admin/admin-login.html','admin/admin-login.html','admin-login.html','admin/cp.html','cp.html',
'administrator/account.html','administrator.html','login.html','modelsearch/login.html','moderator.html','moderator/login.html','administrator/login.html',
'moderator/admin.html','controlpanel.html','admin/account.html','adminpanel.html','webadmin.html','pages/admin/admin-login.html','admin/admin-login.html',
'webadmin/index.html','webadmin/admin.html','webadmin/login.html','user.html','user.html','admincp/index.html','admincp/login.html','admincp/index.html',
'admin/adminLogin.html','adminLogin.html','admin/adminLogin.html','home.html','adminarea/index.html','adminarea/admin.html','adminarea/login.html',
'panel-administracion/index.html','panel-administracion/admin.html','modelsearch/index.html','modelsearch/admin.html','admin/admin_login.html',
'admincontrol/login.html','adm/index.html','adm.html','admincontrol.html','admin/account.html','adminpanel.html','webadmin.html','webadmin/index.html',
'webadmin/admin.html','webadmin/login.html','admin/admin_login.html','admin_login.html','panel-administracion/login.html','adminLogin.html',
'admin/adminLogin.html','home.html','admin.html','adminarea/index.html','adminarea/admin.html','adminarea/login.html','admin-login.html',
'panel-administracion/index.html','panel-administracion/admin.html','modelsearch/index.html','modelsearch/admin.html','administrator/index.html',
'admincontrol/login.html','adm/admloginuser.html','admloginuser.html','admin2.html','admin2/login.html','admin2/index.html','adm/index.html',
'adm.html','affiliate.html','adm_auth.html','memberadmin.html','administratorlogin.html','siteadmin/login.html','siteadmin/index.html','siteadmin/login.html'
);

foreach $ScanedPaths(@path1){
$ScanStatus = "Scaning path: " . $ScanedPaths;
$WorkStatus->update();
$MainTitle = "APF v1.0";
$OutPut=$SiteURL.$ScanedPaths;
$Request=HTTP::Request->new(GET=>$OutPut);
$Get=LWP::UserAgent->new();
$Get->timeout(10);
$Response=$Get->request($Request);

if($Response->content =~ /Username/ ||
$Response->content =~ /Password/ ||
$Response->content =~ /username/ ||
$Response->content =~ /password/ ||
$Response->content =~ /USERNAME/ ||
$Response->content =~ /PASSWORD/ ||
$Response->content =~ /Senha/ ||
$Response->content =~ /senha/ ||
$Response->content =~ /Personal/ ||
$Response->content =~ /Usuario/ ||
$Response->content =~ /Clave/ ||
$Response->content =~ /Usager/ ||
$Response->content =~ /usager/ ||
$Response->content =~ /Sing/ ||
$Response->content =~ /passe/ ||
$Response->content =~ /P\/W/ ||
$Response->content =~ /Admin Password/
){
$ScrollBox2->insert('end', $OutPut."\n");
}else{
$ScrollBox1->insert('end', $OutPut."\n");
}
}
}

if($Extension eq ".htm"){
@path1=('admin/','administrator/','moderator/','webadmin/','adminarea/','bb-admin/','adminLogin/','admin_area/','panel-administracion/','instadmin/',
'memberadmin/','administratorlogin/','adm/','account.htm','admin/account.htm','admin/index.htm','admin/login.htm','admin/admin.htm',
'admin_area/admin.htm','admin_area/login.htm','admin/account.htm','admin/index.htm','admin/login.htm','admin/admin.htm',
'admin_area/admin.htm','admin_area/login.htm','admin_area/index.htm','admin_area/index.htm','bb-admin/index.htm','bb-admin/login.htm','bb-admin/admin.htm',
'bb-admin/index.htm','bb-admin/login.htm','bb-admin/admin.htm','admin/home.htm','admin/controlpanel.htm','admin.htm','admin/cp.htm','cp.htm',
'administrator/index.htm','administrator/login.htm','administrator/account.htm','administrator.htm','login.htm','modelsearch/login.htm','moderator.htm',
'moderator/login.htm','moderator/admin.htm','account.htm','controlpanel.htm','admincontrol.htm','admin_login.htm','panel-administracion/login.htm',
'admin/home.htm','admin/controlpanel.htm','admin.htm','pages/admin/admin-login.htm','admin/admin-login.htm','admin-login.htm','admin/cp.htm','cp.htm',
'administrator/account.htm','administrator.htm','login.htm','modelsearch/login.htm','moderator.htm','moderator/login.htm','administrator/login.htm',
'moderator/admin.htm','controlpanel.htm','admin/account.htm','adminpanel.htm','webadmin.htm','pages/admin/admin-login.htm','admin/admin-login.htm',
'webadmin/index.htm','webadmin/admin.htm','webadmin/login.htm','user.htm','user.htm','admincp/index.htm','admincp/login.htm','admincp/index.htm',
'admin/adminLogin.htm','adminLogin.htm','admin/adminLogin.htm','home.htm','adminarea/index.htm','adminarea/admin.htm','adminarea/login.htm',
'panel-administracion/index.htm','panel-administracion/admin.htm','modelsearch/index.htm','modelsearch/admin.htm','admin/admin_login.htm',
'admincontrol/login.htm','adm/index.htm','adm.htm','admincontrol.htm','admin/account.htm','adminpanel.htm','webadmin.htm','webadmin/index.htm',
'webadmin/admin.htm','webadmin/login.htm','admin/admin_login.htm','admin_login.htm','panel-administracion/login.htm','adminLogin.htm',
'admin/adminLogin.htm','home.htm','admin.htm','adminarea/index.htm','adminarea/admin.htm','adminarea/login.htm','admin-login.htm',
'panel-administracion/index.htm','panel-administracion/admin.htm','modelsearch/index.htm','modelsearch/admin.htm','administrator/index.htm',
'admincontrol/login.htm','adm/admloginuser.htm','admloginuser.htm','admin2.htm','admin2/login.htm','admin2/index.htm','adm/index.htm',
'adm.htm','affiliate.htm','adm_auth.htm','memberadmin.htm','administratorlogin.htm','siteadmin/login.htm','siteadmin/index.htm','siteadmin/login.htm'
);

foreach $ScanedPaths(@path1){
$ScanStatus = "Scaning path: " . $ScanedPaths;
$WorkStatus->update();
$MainTitle = "APF v1.0";
$OutPut=$SiteURL.$ScanedPaths;
$Request=HTTP::Request->new(GET=>$OutPut);
$Get=LWP::UserAgent->new();
$Get->timeout(10);
$Response=$Get->request($Request);

if($Response->content =~ /Username/ ||
$Response->content =~ /Password/ ||
$Response->content =~ /username/ ||
$Response->content =~ /password/ ||
$Response->content =~ /USERNAME/ ||
$Response->content =~ /PASSWORD/ ||
$Response->content =~ /Senha/ ||
$Response->content =~ /senha/ ||
$Response->content =~ /Personal/ ||
$Response->content =~ /Usuario/ ||
$Response->content =~ /Clave/ ||
$Response->content =~ /Usager/ ||
$Response->content =~ /usager/ ||
$Response->content =~ /Sing/ ||
$Response->content =~ /passe/ ||
$Response->content =~ /P\/W/ ||
$Response->content =~ /Admin Password/
){
$ScrollBox2->insert('end', $OutPut."\n");
}else{
$ScrollBox1->insert('end', $OutPut."\n");
}
}
}

if($Extension eq ".aspx"){
@path1=('admin/','administrator/','moderator/','webadmin/','adminarea/','bb-admin/','adminLogin/','admin_area/','panel-administracion/','instadmin/',
'memberadmin/','administratorlogin/','adm/','account.aspx','admin/account.aspx','admin/index.aspx','admin/login.aspx','admin/admin.aspx',
'admin_area/admin.aspx','admin_area/login.aspx','admin/account.aspx','admin/index.aspx','admin/login.aspx','admin/admin.aspx',
'admin_area/admin.aspx','admin_area/login.aspx','admin_area/index.aspx','admin_area/index.aspx','bb-admin/index.aspx','bb-admin/login.aspx','bb-admin/admin.aspx',
'bb-admin/index.aspx','bb-admin/login.aspx','bb-admin/admin.aspx','admin/home.aspx','admin/controlpanel.aspx','admin.aspx','admin/cp.aspx','cp.aspx',
'administrator/index.aspx','administrator/login.aspx','administrator/account.aspx','administrator.aspx','login.aspx','modelsearch/login.aspx','moderator.aspx',
'moderator/login.aspx','moderator/admin.aspx','account.aspx','controlpanel.aspx','admincontrol.aspx','admin_login.aspx','panel-administracion/login.aspx',
'admin/home.aspx','admin/controlpanel.aspx','admin.aspx','pages/admin/admin-login.aspx','admin/admin-login.aspx','admin-login.aspx','admin/cp.aspx','cp.aspx',
'administrator/account.aspx','administrator.aspx','login.aspx','modelsearch/login.aspx','moderator.aspx','moderator/login.aspx','administrator/login.aspx',
'moderator/admin.aspx','controlpanel.aspx','admin/account.aspx','adminpanel.aspx','webadmin.aspx','pages/admin/admin-login.aspx','admin/admin-login.aspx',
'webadmin/index.aspx','webadmin/admin.aspx','webadmin/login.aspx','user.aspx','user.aspx','admincp/index.aspx','admincp/login.aspx','admincp/index.aspx',
'admin/adminLogin.aspx','adminLogin.aspx','admin/adminLogin.aspx','home.aspx','adminarea/index.aspx','adminarea/admin.aspx','adminarea/login.aspx',
'panel-administracion/index.aspx','panel-administracion/admin.aspx','modelsearch/index.aspx','modelsearch/admin.aspx','admin/admin_login.aspx',
'admincontrol/login.aspx','adm/index.aspx','adm.aspx','admincontrol.aspx','admin/account.aspx','adminpanel.aspx','webadmin.aspx','webadmin/index.aspx',
'webadmin/admin.aspx','webadmin/login.aspx','admin/admin_login.aspx','admin_login.aspx','panel-administracion/login.aspx','adminLogin.aspx',
'admin/adminLogin.aspx','home.aspx','admin.aspx','adminarea/index.aspx','adminarea/admin.aspx','adminarea/login.aspx','admin-login.aspx',
'panel-administracion/index.aspx','panel-administracion/admin.aspx','modelsearch/index.aspx','modelsearch/admin.aspx','administrator/index.aspx',
'admincontrol/login.aspx','adm/admloginuser.aspx','admloginuser.aspx','admin2.aspx','admin2/login.aspx','admin2/index.aspx','adm/index.aspx',
'adm.aspx','affiliate.aspx','adm_auth.aspx','memberadmin.aspx','administratorlogin.aspx','siteadmin/login.aspx','siteadmin/index.aspx','siteadmin/login.aspx'
);

foreach $ScanedPaths(@path1){
$ScanStatus = "Scaning path: " . $ScanedPaths;
$WorkStatus->update();
$MainTitle = "APF v1.0";
$OutPut=$SiteURL.$ScanedPaths;
$Request=HTTP::Request->new(GET=>$OutPut);
$Get=LWP::UserAgent->new();
$Get->timeout(10);
$Response=$Get->request($Request);

if($Response->content =~ /Username/ ||
$Response->content =~ /Password/ ||
$Response->content =~ /username/ ||
$Response->content =~ /password/ ||
$Response->content =~ /USERNAME/ ||
$Response->content =~ /PASSWORD/ ||
$Response->content =~ /Senha/ ||
$Response->content =~ /senha/ ||
$Response->content =~ /Personal/ ||
$Response->content =~ /Usuario/ ||
$Response->content =~ /Clave/ ||
$Response->content =~ /Usager/ ||
$Response->content =~ /usager/ ||
$Response->content =~ /Sing/ ||
$Response->content =~ /passe/ ||
$Response->content =~ /P\/W/ ||
$Response->content =~ /Admin Password/
){
$ScrollBox2->insert('end', $OutPut."\n");
}else{
$ScrollBox1->insert('end', $OutPut."\n");
}
}
}

}

#########################
# Coded By CrIpTiX CrEw #
#########################