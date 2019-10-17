#设置客户端连接服务器端编码
set names utf8;
#丢弃数据库，如果存在
drop database if exists echo_app;
#创建数据库，设置编码
create database echo_app charset=utf8;
#进入创建的数据库
use echo_app;

#创建echo用户列表
create table echo_user(
	uid int primary key auto_increment,
	uname varchar(32),
	upwd varchar(32),
	email varchar(64),
	phone varchar(16) not null unique,
	avatar varchar(255),
	city varchar(32),
	xz varchar(8),#星座 可以为空,如果为空即在数据库填入null,前端为"未填入"
	gender int,
	introduction varchar(100),
	following int,#关注个数
	followed int,#被关注,
	friend int   #友个数
);
#收藏列表
create table echo_love(
	sid int primary key,
	uid int ,
	foreign key(uid) references echo_user(uid)
);
#用户评论
create table echo_comment(
	sid int primary key,
	uid int,
	uname varchar(32),
	comment_time int,#评论时间
	avatar varchar(255),
	content varchar(128),
	love int#点赞
);

#创建频道的资料表
create table echo_channel(
	cid int primary key auto_increment,
	cname varchar(64),
	type varchar(32),#该频道属于什么类型的风格
	pic varchar(255),
	song_count int,#该频道下储存多少首歌曲
	share int,
	followed int
);

#创建echo歌单列表
create table echo_song(
	sid int primary key  auto_increment,
	sname varchar(64),
	song varchar(255),
	lyrics varchar(3000),
	duration timestamp,#歌曲长度或持续时间,我们采用元年计算,1970-01-01 00:00:01来记录歌曲的长度或持续时间,这样子记录后的时间,转化为毫秒数也是正确的,按空格分割取后面一段 也是正确的
	author varchar(32) not null,
	author_pic varchar(255),
	song_pic varchar(255),
	uploadtime date,
	share int,
	love int,#歌曲点赞
	com_times int,#评论次数
	cid int,
	foreign key(cid) references echo_channel(cid)
);



#创建名人的资料表
create table echo_famous(
	fid int primary key auto_increment,
	fname varchar(64),
	f_avatar varchar(32),
	gender int,
	xz varchar(8),#星座 可以为空,如果为空即在数据库填入null,前端为"未填入"
	pic varchar(255),
	city varchar(32),
	introduction varchar(100),
	following int,
	followed int,
	friend int,
	uid int#如果个人用户实名认证后,通过"名人"认证后,会被记录下uid,以便于识别用户和名人两张表的关联
);


