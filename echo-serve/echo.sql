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
	foreign key(cid) references echo_channel(cid),
	foreign key(sid) references echo_love(sid),
	foreign key(sid) references echo_comment(sid)
);

#insert into echo_user values(null,"pepsi",md5('s19941211'),"715803334@qq.com","15019494324","http://127.0.0.1:3000/img/avatar/pic.jpg","洪智豪","1");


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

#向频道表插入数据
insert into echo_channel values(null,'3D音乐奇幻旋律馆',null,'http://127.0.0.1:5050/img/channel/channel1.jpg',47000,1381000,18000);
insert into echo_channel values(null,'欧美流行指南',null,'http://127.0.0.1:5050/img/channel/channel2.jpg',76000,638000,3802);
insert into echo_channel values(null,'高手在民间',null,'http://127.0.0.1:5050/img/channel/channel3.jpg',40000,842000,6977);
insert into echo_channel values(null,'3D音效奇妙听觉馆',null,'http://127.0.0.1:5050/img/channel/channel4.jpg',21000,1107000,16000);
insert into echo_channel values(null,'飞行燃料',null,'http://127.0.0.1:5050/img/channel/channel5.jpg',3517,42000,769);
insert into echo_channel values(null,'最美纯人声伴奏合唱',null,'http://127.0.0.1:5050/img/channel/channel6.jpg',2505,262000,1992);
insert into echo_channel values(null,'嘻哈帝国',null,'http://127.0.0.1:5050/img/channel/channel7.jpg',463,6711,25);
insert into echo_channel values(null,'做一名优秀的DJ',null,'http://127.0.0.1:5050/img/channel/channel8.jpg',56000,249000,2463);
insert into echo_channel values(null,'霹雳俱乐部',null,'http://127.0.0.1:5050/img/channel/channel9.jpg',304,10000,83);
insert into echo_channel values(null,'双声道联袂馆',null,'http://127.0.0.1:5050/img/channel/channel10.jpg',6809,511000,4107);
insert into echo_channel values(null,'霓虹流行乐',null,'http://127.0.0.1:5050/img/channel/channel11.jpg',1034,18000,59);
insert into echo_channel values(null,'关于我爱你这件事',null,'http://127.0.0.1:5050/img/channel/channel12.jpg',16000,141000,1289);

#向歌曲列表插入数据
insert into echo_song values(null,'「前奏控」一秒好心情的霓虹流行 Funky J-Pop サンキュー!!','http://127.0.0.1:5050/music/「前奏控」一秒好心情的霓虹流行 Funky J-Pop サンキュー!!.mp3','歌曲：サンキュー!!<br>音乐人：HOME MADE 家族<br>专辑：LAST FOREVER BEST ～未来へとつなぐFAMILY SELECTION～<br><br>歌词中文翻译<br><br>一直以来支持我的人们 多谢平日关照<br>籍一首狂诗曲 让我表达这份感激之情<br>一直以来感谢你们 真的十分感谢你们<br>无论身在何处 真心诚意感谢你的存在<br><br>当黄昏的街道染成绯色 不经意地信步其间<br>下午 人来人往逐渐频繁 下意识地停住脚步<br>手机轻微的振动 真的可以填补人心的空缺<br>你并非孤身一人 看啊 大家都是相互扶持著努力前行<br><br>自觉前途渺然 苦恼不堪<br>是你一言不发 向我伸出手<br>是你为我分担痛苦 带来快乐<br>我发誓 当你遇到烦恼时 我也会第一个来到你身边<br><br>一直以来支持我的人们 多谢平日关照<br>籍一首狂诗曲 让我表达这份感激之情<br>一直以来感谢你们 真的十分感谢你们<br>无论身在何处 真心诚意感谢你的存在<br><br>FARAWAY FARAWAY 无论相隔多远 岁月长河中<br>你我曾经共度的时光 那份记忆不会抹去<br>朋友 家人 恋人 以及我遇见的所有的人<br>谢谢 全靠你们 明天我也能精神百倍昂首阔步<br><br>无论谁也无法独自一人生存下去 我们需要互相照应<br>发生矛盾的时候 应该多多沟通 一起放声笑 笑到直不起腰<br>然而 为何偏要毒舌相向 彼此中伤？<br>我就是没头没脑地喜欢你 虽然不好意思 却是真心的<br><br>一直以来支持我的人们 多谢平日关照<br>籍一首狂诗曲 让我表达这份感激之情<br>一直以来感谢你们 真的十分感谢你们<br>无论身在何处 真心诚意感谢你的存在<br><br>大家一定都是太怕羞 四目相对便谁也开不了口<br>其实是很想说出来 却都心理作祟一味逞强<br>偶尔也坦然一点吧 语言具有不可思议的力量<br>多简单的事情 主动一点 你一定办得到<br><br>回头看看 I WILL BE THERE<br>JUST FOREVER 就如你对我说的那样<br>回头看看 I WILL BE THERE<br>JUST FOREVER 就如你对我说的那样<br><br>一直以来支持我的人们 多谢平日关照<br>籍一首狂诗曲 让我表达这份感激之情<br>一直以来感谢你们 真的十分感谢你们<br>无论身在何处 真心诚意感谢你的存在<br><br>一直以来支持我的人们 多谢平日关照<br>籍一首狂诗曲 让我表达这份感激之情<br>一直以来感谢你们 真的十分感谢你们<br>无论身在何处 真心诚意感谢你的存在','1970-01-01 00:04:13','王宝气宝气气','http://127.0.0.1:5050/img/author/王宝气宝气气.png','http://127.0.0.1:5050/img/song/「前奏控」一秒好心情的霓虹流行 Funky J-Pop サンキュー!!.jpg','2015-01-17',14000,41000,1502,11);

insert into echo_song values(null,'「双声道版」Safe and sound','http://127.0.0.1:5050/music/「双声道版」Safe and sound.mp3','歌曲：Safe And Sound<br>音乐人：Taylor Swift/Madilyn Bailey<br>专辑：Safe & Sound<br><br>自制，左边Taylor Swift，右边Madilyn Bailey，戴耳机收听~<br>因为找不到原调的男声翻唱（jason chen 还有 sam tsui的都降调了……），所以只能两边都是女声了，所以没有那种男女声的对比强烈╭(╯ε╰)╮最后哪部分两边得不是很一样，所以合起来了，觉得还不错~<br><br>今天更新有点晚，因为全天满课T^T而且有些课快结课考试了，所以几天天可能只能更一首了（再也不是母猪……），有时可能会加，看情况吧~<br><br>【之前作品点击头像查看，欢迎关注(*ˉ︶ˉ*)】<br><br>I remember tears streaming down your face<br>When I said, "I'll never let you go"<br>When all those shadows almost killed your light<br>I remember you said, "Don't leave me here alone"<br>But all that's dead and gone and passed tonight<br>Just close your eyes<br>The sun is going down<br>You'll be alright<br>No one can hurt you now<br>Come morning light<br>You and I'll be safe and sound<br>Don't you dare look out your window darling<br>Everything's on fire<br>The war outside our door keeps raging on<br>Hold onto this lullaby<br>Even when the music's gone, gone<br>Just close your eyes<br>The sun is going down<br>You'll be alright<br>No one can hurt you now<br>Come morning light<br>You and I'll be safe and sound<br>Oooh, Oooh, Oooh, Oooh<br>Oooh, Oooh, Oooh, Oooh<br>Just close your eyes<br>You'll be alright<br>Come morning light,<br>You and I'll be safe and sound...<br>Oooh, oooh, oooh, oooh oh oh','1970-01-01 00:04:02','张也变','http://127.0.0.1:5050/img/author/张也变.jpg','http://127.0.0.1:5050/img/song/「双声道版」Safe and sound.jpg','2015-05-04',141000,307000,6497,10);

insert into echo_song values(null,'『3D环绕』房东的猫 「云烟成雨」','http://127.0.0.1:5050/music/『3D环绕』房东的猫 「云烟成雨」.mp3','歌曲：云烟成雨<br>音乐人：房东的猫<br>专辑：云烟成雨<br><br>云烟成雨<br>动画《我是江小白》片尾曲<br><br>专辑：云烟成雨 (动画《我是江小白》片尾曲)<br>歌手：房东的猫<br>来源：我下载的音乐<br>作曲 : 少年佩<br><br>作词 : 墨鱼丝<br><br>制作人：黎偌天<br><br>编曲：黎偌天<br><br>监制：李纤橙<br><br><br><br>你的晚安 是下意识的恻隐<br><br>我留至夜深 治疗失眠梦呓<br><br>那封手写信 留在行李箱底<br><br>来不及 赋予它旅途的意义<br><br>若一切 都已云烟成雨<br><br>我能否 变成淤泥<br><br>再一次 沾染你<br><br>若生命 如过场电影<br><br>Oh让我再一次 甜梦里惊醒<br><br>我多想再见你<br><br>哪怕匆匆一眼就别离<br><br>路灯下昏黄的剪影<br><br>越走越漫长的林径<br><br>我多想再见你<br><br>至少玩笑话还能说起<br><br>街巷初次落叶的秋分<br><br>渐行渐远去的我们<br><br>若一切 都已云烟成雨<br><br>我能否 变成淤泥<br><br>再一次 沾染你<br><br>若生命 如过场电影<br><br>Oh让我再一次 甜梦里惊醒<br><br>我多想再见你<br><br>哪怕匆匆一眼就别离<br><br>路灯下昏黄的剪影<br><br>越走越漫长的林径<br><br>我多想再见你<br><br>至少玩笑话还能说起<br><br>街巷初次落叶的秋分<br><br>渐行渐远去的我们<br><br>站台 汽笛响起<br><br>想念是你的声音<br><br>我们提着过去 走入人群<br><br>寻找着一个位置 安放自己<br><br>我多想再见你<br><br>哪怕匆匆一眼就别离<br><br>路灯下昏黄的剪影<br><br>越走越漫长的林径<br><br>我多想再见你<br><br>至少玩笑话还能说起<br><br>街巷初次落叶的秋分<br><br>渐行渐远去的我们<br>你的晚安 是下意识的恻隐<br><br>我留至夜深 治疗失眠梦呓<br><br>那封手写信 留在行李箱底<br><br>来不及 赋予它旅途的意义<br><br>若一切 都已云烟成雨<br><br>我能否 变成淤泥<br><br>再一次 沾染你<br><br>若生命 如过场电影<br><br>Oh让我再一次 甜梦里惊醒<br><br>我多想再见你<br><br>哪怕匆匆一眼就别离<br><br>路灯下昏黄的剪影<br><br>越走越漫长的林径<br><br>我多想再见你<br><br>至少玩笑话还能说起<br><br>街巷初次落叶的秋分<br><br>渐行渐远去的我们<br><br>若一切 都已云烟成雨<br><br>我能否 变成淤泥<br><br>再一次 沾染你<br><br>若生命 如过场电影<br><br>Oh让我再一次 甜梦里惊醒<br><br>我多想再见你<br><br>哪怕匆匆一眼就别离<br><br>路灯下昏黄的剪影<br><br>越走越漫长的林径<br><br>我多想再见你<br><br>至少玩笑话还能说起<br><br>街巷初次落叶的秋分<br><br>渐行渐远去的我们<br><br>站台 汽笛响起<br><br>想念是你的声音<br><br>我们提着过去 走入人群<br><br>寻找着一个位置 安放自己<br><br>我多想再见你<br><br>哪怕匆匆一眼就别离<br><br>路灯下昏黄的剪影<br><br>越走越漫长的林径<br><br>我多想再见你<br><br>至少玩笑话还能说起<br><br>街巷初次落叶的秋分<br><br>渐行渐远去的我们','1970-01-01 00:04:01','何惟昕','http://127.0.0.1:5050/img/author/何惟昕.jpg','http://127.0.0.1:5050/img/song/『3D环绕』房东的猫 「云烟成雨」.jpg','2018-08-30',342,1577,776,1);

insert into echo_song values(null,'10秒钟征服耳朵系列 霓虹美式R&B','http://127.0.0.1:5050/music/10秒钟征服耳朵系列 霓虹美式R&B.mp3','歌曲：好きだよ。~100回の後悔~<br>
音乐人：Che'Nelle<br>
专辑：ラブ・ソングス2<br>
<br>
好听的女声~ 针对日本市场的精致流行乐作品

It's too late but I will try a hundred times
I can't forget you anymore
I realized my heart was missing you every day
And ever since I closed the door
Oh how I'm needing you I know it's crazy to say
I keep falling back in love with you now
I know I let you go can we start over again

I'm spending hours going thru all of the emails that I kept
You would send me smiley faces yeah I've left them all in my phone
Our anniversary I can't help but celebrate alone
How did I say goodbye 'cos now it's just a lonely road

I'm losing sleep without you
All the nights I laid my head
On you I wish for more and more
You are all I want when you're not home
I feel like I can't ever be the same 'cos we promised to be forever
Now you're gone

It's too late but I will try a hundred times
I can't forget you anymore
I realized my heart was missing you every day
And ever since I closed the door
Oh how I'm needing you I know it's crazy to say
I keep falling back in love with you now
I know I let you go can we start over again

Where are you at, and who are you with
And what are you doing now
I get so nervous on the days I don't see you around
And the times we aren't talking I feel like I'm not important
And I can't bear these feelings
'Cos you know just how much I love you

I wish that you were holding on to me
So can you please come back
'Cos right in your arms is where I wanna be
I loved it when you would get closer 'til your feeling my heart beat
I don't know why I keep letting you leave me here so lonely

Holding your hands and kissing
We did everything together
Smiling and taking pictures
Now I'm all alone without ya
Without ya

I gotta show you how bad that I really need ya
I'm crying not laughing and smiling like I used to be

And now I finally realized that
I should have treated our love more preciously
And since the day we broke up
I regretted that it happened
Baby can you come back to me

It's too late but I will try a hundred times
I can't forget you anymore
I realized my heart was missing you every day
And ever since I closed the door
Oh how I'm needing you I know it's crazy to say
I keep falling back in love with you now
I know I let you go can we start over again

Both of our rings still in my hands I carry them everywhere
Together we had what nobody had our love was gold
Looked all around for somebody else it was a mess
There's only you I can never replace baby you were the best thing
And I'm gonna keep on waiting for you
Searching for you dreaming of u baby I will do anything
I can't live if I'm not having here with me
I don't think you get that there is nothing better
in life then a world with you

Our happiness is so far only 'cos we are apart
so can we bring it back to life
I know I hurt u and I had made so many mistakes
I left you crying deep inside
I wanna love you like I have never loved before
Just let me make it all right
Please tell me we can do this one more time
I swear I'll be there

It's too late but I will try a hundred times
I can't forget you anymore
I realized my heart was missing you every day
And ever since I closed the door
Oh how I'm needing you I know it's crazy to say
I keep falling back in love with you now
I know I let you go can we start over again

Can we start, can we start
Can we start over again','1970-01-01 00:05:06','吖丶瑞夕','http://127.0.0.1:5050/img/author/吖丶瑞夕.jpg','http://127.0.0.1:5050/img/song/10秒钟征服耳朵系列 霓虹美式R&B.jpg','2015-03-17',27000,84000,2389,11);

insert into echo_song values(null,'北欧空灵女声 Liekkas','http://127.0.0.1:5050/music/北欧空灵女声 Liekkas.mp3','歌曲：Liekkas
音乐人：Sofia Jannok
专辑：Assogattis: By The Embers

这是一首由萨米族歌手Sofia Jannok演唱的萨米族语歌曲。如此轻柔的北欧风格，感觉自己就像一只翱翔在海上的海鸥一样。第一次听这首歌就爱上了，感觉好温暖的声音，所有的不快和烦恼都变得不再那么重要。这是发自内心地真情流露，听着舒缓的钢琴前奏，纯净的北欧女声哼唱，让我们放下手下所有的事情，停下你的脚步，安静的聆听这段旋律，相信你肯定会喜欢上的。也许只有这样的音乐才能慰藉自己浮躁的心。

索非亚·詹娜克出生于1982年九月十五日，萨米族人，是北欧最后的少数民族，人口一万左右。来自瑞典北端的小城市 G&auml;llivare（伊利瓦勒）。


萨米族语歌词
（吟唱）
Nástegokčasa vuolde
mon ráhkadan luottaid
Guovssahasa sánit
libardit dáivahis
（吟唱）
Doala mu gieđa
Njávkka mu niera
savkalčáppa sániid
jeđđe litnasit
Leage nu liekkas vai mon in galbmo
Juoiggas vel munnje
Jaskatvuo a hálddus
mu vuoigŋamat dávistit
Juoga savkala munnje
ahte leat boahtime
Doala mu gieđa
Njávkka mu niera
savkalčáppa sániid
jeđđe litnasit
Leage nu liekkas vai mon in galbmo
Juoiggas vel munnje
（吟唱）
Doala mu gieđa
Njávkka mu niera
savkalčáppa sániid
jeđđe litnasit
Leage nu liekkas vai mon in galbmo
Juoiggas vel munnje','1970-01-01 00:03:23','微束心火','http://127.0.0.1:5050/img/author/微束心火.jpg','http://127.0.0.1:5050/img/song/北欧空灵女声 Liekkas.jpg','2015-08-28',13000,55000,1128,1);

insert into echo_song values(null,'戴上耳机 东京食尸鬼双声道版','http://127.0.0.1:5050/music/戴上耳机 东京食尸鬼双声道版.mp3','歌曲：unravel
音乐人：TK from 凛として時雨
专辑：unravel

双声道《东京喰种》主题曲

右耳原唱。左耳为@小缘喵

教えて、教えてよ、その仕組みを　
告诉我，告诉我，其中的构造　　　　　　　　
僕の中に誰がいるの？　　　　　　　　　　　　　　　
是谁在我身体里面？

壊れた、壊れたよ、この世界で　　　　　　　　　　　
坏掉了，坏掉了的，这个世界里
君が笑う、何も見えずに　　　　　　　　　　　　　　
你还在笑着，明明什么也看不见


壊れた僕なんてさ、息を止めて　　　　　　　　　　　
让这个已经坏掉的我，停止呼吸
ほどけない、もう、ほどけないよ　　　　　　　　　　
无法放下，已经，什么都不明白了
真実さえ FREEZE　　　　　　　　　　　　　　　　　
连同真实也凝结

壊せる、壊せない　　　　　　　　　　　　　　　　　
快要疯掉，无法疯掉
狂える、狂えない　　　　　　　　　　　　　　　　　
快要崩溃，无法崩溃
あなたを見つけて　　　　　　　　　　　　　　　　　
只是追寻着你

揺れた．．．　　　　　　　　　　　　　　　　　　

＞歪んだ世界にだんだん僕は　　　　　　　　　　　　
在这个动荡扭曲世界里面我
＞透き通って見えなくなって　　　　　　　　　　　　
逐渐变得透明的无法被看清．．．
＞見つけないで、僕のことを　　　　　　　　　　　　
不要来找我
＞見つめないで．．．　　　　　　　　　　　　　　　
不要看着我．．．

誰かが描いた世界の中で、　　　　　　　　　　　　　
在不知道是谁描绘的世界里面
あなたを傷つけたくはないよ　　　　　　　　　　　　
我不想去伤害你
覚えていて、僕のことを．．　　　　　　　　　　　　
请记住我
鮮やかなまま　　　　　　　　　　　　　　　　　　　
依然鲜明的存在


無限に広がる孤独が絡まる　　　　　　　　　　　　　
被无尽延伸的孤独
無邪気に笑った記憶が刺さって　　　　　　　　　　　
曾经我们笑得天真烂漫的记忆，好刺痛

動けない．．．
无法行动．．．
動けないよ．．．
动不了啊．．．．
UNRAVELLING THE WORLD

変わってしまった、変えられなかった　　　　　　　　
完全变掉了，已经无法挽救了，
２つが絡まる、２人が滅びる　　　　　　　　　　　　
两者相互纠缠，两者一同灭亡

壌せる、壊せない　　　　　　　　　　　　　　　　　
快要疯掉，无法疯掉
狂える、狂えない　　　　　　　　　　　　　　　　　
快要崩溃，无法崩溃
あなたを汚せないよ　　　　　　　　　　　　　　　　
不想要污染了你

揺れた．．．　　　　　　　　　　　　　　　　　　　

歪んだ世界にだんだん僕は　　　　　　　　　　　　
在这个动荡扭曲世界里面我
透き通って見えなくなって．．．　　　　　　　　　
逐渐变得透明的无法被看清．．．
見つけないで、僕のことを　　　　　　　　　　　　
不要来找我
見つめないで．．．　　　　　　　　　　　　　　　
不要看着我．．．

誰かが仕組んだ孤独な罠に　　　　　　　　　　　　　
有谁布下让我陷入孤独的圈套里
未来がほどけてしまう前に　　　　　　　　　　　　　
在未来瓦解之前如果我无法逃离
思い出して、僕のことを、　　　　　　　　　　　　　
请记起来，我的事情
鮮やかなまま　　　　　　　　　　　　　　　　　　　
依然那样鲜明的存在

忘れないで．．．
请不要忘记．．．

変わってしまったことに PARALYZE　　　　　　　　　
对早已面目全非的事情已经麻木
変えられないことだらけの PARADISE　　　　　　　　
这个充斥着无可奈何事情的乐园
覚えていて、僕のことを　　　　　　　　　　　　　　
也请一直记得，我的事情

教えて、教えて　　　　　　　　　　　　　　　　　　
告诉我，告诉我，
僕の中に　　　　　　　　　　　　　　　　　　　　　
在我体内，
誰がいるの？　　　　　　　　　　　　　　　　　　　
有谁？


おわってしまえ。','1970-01-01 00:01:39','AMY的大熊先生','http://127.0.0.1:5050/img/author/AMY的大熊先生.jpg','http://127.0.0.1:5050/img/song/戴上耳机 东京食尸鬼双声道版.jpg','2015-01-18',103000,226000,16000,10);

insert into echo_song values(null,'陪伴是最长情的告白 正确把霉方式 Enchanted','http://127.0.0.1:5050/music/陪伴是最长情的告白 正确把霉方式 Enchanted.mp3','歌曲：Enchanted
音乐人：Owl City
专辑：Enchanted

传说中的表白神曲，翻唱我霉又表白我霉，爱意满满。
超爱Adam的声音啊啊啊！I just wish u knew,Taylor I was so in love with u(⁄ ⁄•⁄ω⁄•⁄ ⁄)

There I was again tonight forcing laughter, faking smiles
带着勉强的笑容我又来到了这里
Same old tired, lonely place
还是那个破旧孤寂的地方

Walls of insincerity
伪善的言语
Shifting eyes and vacancy vanished when I saw your face
飘忽的眼神还有怅然若失的心情，当我见到你的时候这一切都烟消云散
All I can say is it was enchanting to meet you
我只能说，我已经对你着了迷

Your eyes whispered "have we met?"
你的眼睛悄悄向我传达“我们见过吗”的信息
Across the room your silhouette starts to make it's way to me
来自这个房间的另一个角落，你完美的侧脸朝我靠近
The playful conversation starts
就这样开始了一段俏皮的谈话
Counter all your quick remarks like passing notes in secrecy
回应着你的俏皮话就像穿着有秘密的纸条
All I can say is it was enchanting to meet you
我只能说我已经对你着迷
Oh Taylor I was so enchanted to meet you too
啊，泰勒，我对你如此着迷

This night is sparkling, don't you let it go
如此绚丽的夜晚，不要让它只是作为你记忆里的一个片段
I'm wonderstruck, blushing all the way home
我有些惊喜，回家路上一直羞红着脸
I'll spend forever wondering if you knew
我愿穷尽一生的时间只想了解你是否知道
I was enchanted to meet you too
我也对你如此着迷

The lingering question kept me up
脑海中挥之不去的问题让我难以入睡
2AM, who do you love?
都凌晨两点了，你到底爱着谁呢
I wondered till I'm wide awake
我思考着结果彻夜未眠
Now I'm pacing back and forth, wishing you were at my door
此刻我正心思不宁地来回踱步，希望你能出现在我门前
I'd open up and you would say,
在我轻启房门后说
Hey it was enchanting to meet you
“嘿，我已经对你着了迷”
Oh Taylor I was so enchanted to meet you too
啊，泰勒我对你是如此着迷

This night is sparkling, don't you let it go
如此绚丽的夜晚，不要让它只是作为你记忆里的一个片段
I'm wonderstruck, blushing all the way home
我有些惊喜，回家路上一直羞红着脸
I'll spend forever wondering if you knew
我愿穷尽一生的时间只想了解你是否知道
I was enchanted to meet you too
我也对你如此着迷

This is me praying that this was the very first page
我正真诚地祈祷着这是我们故事的第一页
Not where the story line ends
并非句号前的最后一笔
My thoughts will echo your name until I see you again
我的脑海里不停回放着你的名字直到你再一次出现在我面前
These are the words I held back as I was leaving too soon
这些是我因为过早地离开而没能说出口的话语
I was enchanted to meet you too
我也对你如此着迷
Please don't be in love with someone else
请不要爱上他人
Please don't have somebody waiting on you
请不要让别人为你守候
Please don't be in love with someone else
请不要爱上他人
Please don't have somebody waiting on you
请不要让别人为你守候

This night is sparkling, don't you let it go
如此绚丽的夜晚，不要让它只是作为你记忆里的一个片段
I'm wonderstruck, blushing all the way home
我有些惊喜，回家路上一直羞红着脸
I'll spend forever wondering if you knew
我愿穷尽一生的时间只想了解你是否知道
This night is flawless, don't you let it go
如此完美的夜晚，不要让它只是作为你记忆里的一个片段
I'm wonderstruck, dancing around all alone
我有些惊喜，回家路上一直羞红着脸
Taylor I'll spend my whole life wondering if you knew
泰勒我将用我的一生来猜想你是否知道
I was enchanted to meet you too
我也如此地对你着迷

I was never in love with someone else
我从来没爱上过他人
I never had somebody waiting on me
我从未让别人为我守候
Cause you were all of my dreams come true
因为你让我所有的美梦都成真
And I just wish you knew
我只想让你知道
Taylor I was so in love with you.
我也如此地对你着迷','1970-01-01 00:05:01','霉超疯','http://127.0.0.1:5050/img/author/霉超疯.jpg','http://127.0.0.1:5050/img/song/陪伴是最长情的告白 正确把霉方式 Enchanted.jpg','2015-06-18',52000,157000,8573,12);

insert into echo_song values(null,'谦谦的红歌 循环无数遍「演员」','http://127.0.0.1:5050/music/谦谦的红歌 循环无数遍「演员」.mp3','歌曲：演员
音乐人：薛之谦
专辑：绅士

循环无数遍


简单点说话的方式简单点
递进的情绪请省略
你又不是个演员
别设计那些情节
没意见我只想看看你怎么圆
你难过的太表面 像没天赋的演员
观众一眼能看见
该配合你演出的我演视而不见
在逼一个最爱你的人即兴表演
什么时候我们开始收起了底线
顺应时代的改变看那些拙劣的表演
可你曾经那么爱我干嘛演出细节
我该变成什么样子才能延缓厌倦
原来当爱放下防备后的这些那些
才是考验
没意见你想怎样我都随便
你演技也有限
又不用说感言
分开就平淡些
该配合你演出的我演视而不见
别逼一个最爱你的人即兴表演
什么时候我们开始没有了底线
顺着别人的谎言被动就不显得可怜
可你曾经那么爱我干嘛演出细节
我该变成什么样子才能配合出演
原来当爱放下防备后的这些那些
都有个期限
其实台下的观众就我一个
其实我也看出你有点不舍
场景也习惯我们来回拉扯
还计较着什么
其实说分不开的也不见得
其实感情最怕的就是拖着
越演到重场戏越哭不出了
是否还值得
该配合你演出的我尽力在表演
像情感节目里的嘉宾任人挑选
如果还能看出我有爱你的那面
请剪掉那些情节让我看上去体面
可你曾经那么爱我干嘛演出细节
不在意的样子是我最后的表演
是因为爱你我才选择表演这种成全','1970-01-01 00:04:21','离散L','http://127.0.0.1:5050/img/author/离散L.jpg','http://127.0.0.1:5050/img/song/谦谦的红歌 循环无数遍「演员」.jpg','2015-06-08',18000,22000,1092,12);

insert into echo_song values(null,'小清新洗脑神曲 好想你 四叶草','http://127.0.0.1:5050/music/小清新洗脑神曲 好想你 四叶草.mp3','歌曲：好想你
音乐人：朱主爱
专辑：四叶草Joyce Chu

是真的真的好想你 不是假的假的好想你

想要传送一封简讯给你
我好想好想你
想要立刻打通电话给你
我好想好想你
每天起床的第一件事情
就是好想好想你
无论晴天还是下雨
都好想好想你
每次当我一说我好想你
你都不相信
但却总爱问我有没有想你
我不懂的甜言蜜语
所以只说好想你
反正说来说去
都只想让你开心
好想你 好想你 好想你 好想你
是真的真的好想你
不是假的假的好想你
好想你 好想你 好想你 好想你
是够力够力好想你
真的西北西北好想你
好想你
每次当我一说我好想你
你都不相信
但却总爱问我有没有想你
我不懂的甜言蜜语
所以只说好想你
反正说来说去
都只想让你开心
好想你 好想你 好想你 好想你
是真的真的好想你
不是假的假的好想你
好想你 好想你 好想你 好想你
是够力够力好想你
真的西北西北好想你
好想你 好想你 好想你 好想你
是真的真的好想你
不是假的假的好想你
好想你 好想你 好想你 好想你
是够力够力好想你
真的西北西北好想你
好想你
好想你
好想你','1970-01-01 00:02:36','我最最最喜欢你了
','http://127.0.0.1:5050/img/author/我最最最喜欢你了
.jpg','http://127.0.0.1:5050/img/song/小清新洗脑神曲 好想你 四叶草.jpg','2015-12-21',31000,33000,1866,12);

insert into echo_song values(null,'心灵止痛剂 愛し子よ (Ballad Ver.)','http://127.0.0.1:5050/music/心灵止痛剂 愛し子よ (Ballad Ver.).mp3','歌曲：愛し子よ(ballade Ver)
音乐人：ルルティア

"愛し子よ" 听得我眼泪满眶。 一种近乎变态的强烈的占有欲。 美得要命。



I to shi go yo I tsu ma de mo
愛し子よ いつまでも

/ 亲爱的宝贝　无论何时
ko no mu ne ni da ka re te ne mu ri na sa I
この胸に抱かれて眠りなさい
/ 都请在我的怀抱中沉沉入睡

I to ke na I a na ta no ko to wo
稚い あなたのことを
/ 天真的你
mo u ni do to ni ga shi ta ri wa shi na i
もう二度と逃がしたりはしない
/ 决不容许再次逃离此处
ka no jyo no ko to na ra wa su re te shi ma I na sa I
彼女のことなら忘れてしまいなさい
/ 把她的一切都忘了吧
za ra tsu I ta ne ko na de ko e ga
ざらついた猫撫で声が
/ 愿她不会用沙哑的撒娇声
so no mi mi wo na me na I yo u ni
その耳を舐めないように
/ 舔舐你的耳畔
no do wo shi me a ge te o I ta ka ra
咽を締めあげておいたから
/ 否则我将紧勒她的咽喉

fu ta ri da ke de I I
ふたりだけでいい
/ 只要两人就好
ho ka ni wa da re mo I ra na i
他には誰もいらない
/ 其他什么人都不需要
wa ta shi da ke ga a na ta wo mi ta se ru wa
私だけがあなたを満たせるわ
/ 你只由我来满足
a na ta no a shi ni
あなたの足に
/ 在你的双足上
gi n no a shi wo ha me ma shou
銀の足がせをはめましょう
/ 镶嵌银色的枷锁
o na ji a ya ma chi wo o ka sa na i yo u ni
同じ過ちを犯さないように
/ 但愿你不会重蹈覆辙

I to shi go yo ko no mu ne ni
愛し子よ こな胸に
/ 亲爱的宝贝　在我的胸怀中
mya ku u tsu a ma I mi tsu wo su I na sa i
脈打つ甘い蜜を吸いなさい
/ 吮吸脉动的甜美蜜汁吧

I to ke na I a na ta ka ra
稚い あなたから
/ 天真的你
mo u ni do to me wo ha na shi ta ri shi na I
もう二度と目を離したりしない
/ 决不容许再度离开我的视线

ka no jyo no ko to wa mo u ki ni shi na I de I I wa
彼女のことはもう気にしないでいいわ
/ 把她的一切都置之脑后吧
mo shi mo ma ta tsu me wo ta te te
もしもまた爪を立てて
/ 若她举起利爪
a na ta wo u ba i ni ki ta ra
あなたを奪いに来たら
/ 前来夺走你
ko no te de u chi ko ro shi te a ge ru
この手で撃ち殺してあげる
/ 我就亲手杀死她

a ra ga u ko to na ku
抗うことなく
/ 不要反抗了
sa su be te wo a zu ke te
さあすべてを預けて
/ 来吧 把一切都交给我
wa ta shi da ke ga a na ta wo I ka se ru wa
私だけがあなたを生かせるわ
/ 只有我能让你生存下去
a na ta no ha ne wo chi gi ri
あなたの羽根を千切り
/ 把你的羽翼撕个粉碎
su te te shi ma i ma shou
棄ててしまいましょう
/ 丢弃了吧
mo u do ko ka he to bi ta te na i yo u ni
もうどこかへ飛び立てないように
/ 但愿你再也飞不到任何地方

fu ta ri da ke de I I
ふたりだけでいい
/ 只要两人就好
ho ka ni wa da re mo I ra na I
他には誰もいらない
/ 其他什么人都不需要
wa ta shi da ke ga a na ta wo mi ta se ru wa
私だけがあなたを満たせるわ
/ 你只由我来满足
a na ta no a shi ni
あなたの足に
/ 在你的双足上
gi n no a shi wo ha me ma shou
銀の足がせをはめましょう
/ 镶嵌银色的枷锁
o na ji a ya ma chi wo o ka sa na i yo u ni
同じ過ちを犯さないように
/ 但愿你不会重蹈覆辙

a ra ga u ko to na ku
抗うことなく
/ 不要反抗
sa su be te wo a zu ke te
さあすべてを預けて
/ 来吧　把一切都交给我
wa ta shi da ke ga a na ta wo I ka se ru wa
私だけがあなたを生かせるわ
/ 只有我能让你生存下去
a na ta no ha ne wo chi gi ri
あなたの羽根を千切り
/ 把你的羽翼撕个粉碎
su te te shi ma i ma shou
棄ててしまいましょう
/ 丢弃了吧
mo u do ko ka he to bi ta te na i yo u ni
もうどこかへ飛び立てないように
/ 但愿你再也飞不到任何地方','1970-01-01 00:03:41','差太多先生','http://127.0.0.1:5050/img/author/差太多先生.jpg','http://127.0.0.1:5050/img/song/心灵止痛剂 愛し子よ (Ballad Ver.).jpg','2014-12-28',9720,35000,1401,11);

insert into echo_song values(null,'有了你 波尔卡圆点粉色小屋才完整「Little Pink House」','http://127.0.0.1:5050/music/有了你 波尔卡圆点粉色小屋才完整「Little Pink House」.mp3','歌曲：Little Pink House
音乐人：The Czars
专辑：Best of

沙皇乐队(The Czars)是来自丹佛的美国另类摇滚乐团。 类似Tindersticks、Migala乐派的低调抑郁风格。The Czars，五个人组成。主唱John William Grant早年曾在德国求学达六年之久, 之后便回到丹佛市开始组团。The Czars中的Grant低沉浑厚的男中音是乐队最吸引人的亮点，而乐队是采用双吉他配器，以及小提琴、各种鼓器的交相辉映。 2004年专辑《The Ugly People VS. The Beautiful People》（丑陋与美丽的对峙）专辑在英国大受欢迎，成为瞩目新星。有人用“低调，温文，清新，浪漫，成熟”来形容The Czars的音乐。

歌词:
Lilacs and tiger-lilies
丁香花和虎皮百合
won't be enough for me when you're gone
随你的离去失色
Hollyhocks, gladiolas,
蜀葵也好、剑兰也好
will never replace this face
都无法替代这张脸

In your little pink house with the blue polka-dots
在你装饰着蓝色波尔卡圆点的粉色小屋
I learned what I was and what I was not,
我知道了什么才是我、什么不是
Supposed to be
应该是吧
Supposed to be
应该是的
Supposed to be
应该是的
Supposed to be
应该是的

Bleeding heart, lily-of-the-valley
滴血的心，铃兰
Snapdragon, rambling rose
金鱼草，蔷薇
You'll never make it in this world
在这世上你永远也无法办到
If you're not one of those
如果你不是其中的一员

In your little pink house, with the blue polka-dots
在你装饰着蓝色波尔卡圆点的粉色小屋
I learned what I was and what I was not
我知道了什么才是我、什么不是
Supposed to be
应该是吧
Supposed to be
应该是的
Supposed to be
应该是的
Supposed to be
应该是的

Diadem, orange sensation
王冠，橙色的感觉
Diorama, bell canto,
立体画，美声
Baby-Lune, and princess too,
新月，还有公主
But you were the one I chose
但我选择的那个人是你

In your little pink house, with the blue polka-dots
在你装饰着蓝色波尔卡圆点的粉色小屋
I learned what I was and what I was not
我知道了什么才是我、什么不是
Supposed to be
应该是吧
Supposed to be
应该是的
Supposed to be
应该是的
Supposed to be
应该是的','1970-01-01 00:05:14','九头虫都有人用过','http://127.0.0.1:5050/img/author/九头虫都有人用过jpg','http://127.0.0.1:5050/img/song/有了你 波尔卡圆点粉色小屋才完整「Little Pink House」.jpg','2018-03-27',50,366,44,1);

insert into echo_song values(null,'周品-自我嘲弄','http://127.0.0.1:5050/music/周品-自我嘲弄.mp3','周品携手荒井十一、常石磊、彭飞、周天澈、邓鼓等多位金曲奖制作人形成的梦之队团队，共同合作完成此次新曲《自我嘲弄》，曾在四年前首次录制过歌曲，又因感情积累不够而推翻作品，在经历四年沉淀后重拾初心，以全新视角演绎爱曲，同时也是周品与众好友关于音乐和初心的一次对话。
《自我嘲弄》是一首抒情的走心之作，感叹每一个在异乡漂泊，抱着初心追梦的人，在人群中慢慢的变得圆滑，在外人面前假装乐观、坚强，面对现实世界强颜欢笑，其实已经是伤痕累累。悲伤或快乐，你看到的我，也只能隐藏伤痛虚伪的傻笑着，曾是自己最不愿成为的那个面孔，如今也只能拍手附和。
歌词的真实写照，旋律的浓浓情感随着温柔而撕心裂肺的唱腔，整首歌曲以钢琴开启主故事线、弦乐编织出抒情场景，小提琴和贝斯合奏相互呼应，营造出触动人心的氛围；感叹人生寥寥，想摆脱平庸实现那时追逐的梦，却也不得不在初心这张白纸上多了几道蹂躏折痕，学会附和、学会违背、学着习惯嘲讽……

「自我嘲弄」
词·曲·编：邓鼓
制作人：周品
和声&和声编写：常石磊
鼓手：荒井十一
小提琴：彭飞
贝斯：甯子达
主唱录音&编辑：曹洋@C·VOICE
弦乐编写：胡静成
弦乐监制：胡静成
弦乐团：国际首席爱乐乐团
弦乐录音：李昕达@九紫天成
分轨编辑：倪涵文@Studio 21A
混音&母带：周天澈@Studio 21A
制作所：LAST KNIGHT MUSIC·末爵音乐
音乐发行：奔跑怪物
躲在聚光灯下
重复的 说着一个谎话
而我嬉皮笑脸
任人宰割 装作不痛不痒
黑暗中隐藏着 虚伪的傻笑着
溜须的打闹着 不违和
努力拍手附和 幽默总争第一个
就接着 淹没在 笑声中

人总想着要实现那时的梦
实现多年后能够摆脱平庸
学着习惯嘲讽
能回头 却无力再往回走
重复抱怨着那空白的内容
隐藏着眼神中弥漫的空洞
自我嘲弄 分散着我的软弱

躲在聚光灯下
轻易的 说着一个谎话
而我认真诉说
暗示伤痛 却无人能听懂
黑暗中隐藏着 虚伪的傻笑着
溜须的打闹着 不违和
努力拍手附和 卖弄总争第一个
就接着 被忘在 喧闹中

人总想着要实现那时的梦
实现多年后能够摆脱平庸
学着习惯嘲讽
能回头 却无力再往回走
重复抱怨着那空白的内容
隐藏着眼神中弥漫的空洞
自我嘲弄 分散着我的软弱

我蜷曲在黑暗之中
被狂风带走 还没够
挣脱在黑暗之中
不愿再 受折磨！

总想着要实现那时的梦
实现多年后能够摆脱平庸
学着习惯嘲讽 能回头
却若无其事的往前走

重复抱怨着那空白的内容
隐藏着眼神弥漫的惶恐
自我嘲弄 分散着我的软弱
分散着 我的脆弱

躲在聚光灯下 重复的说着一个谎话
躲在聚光灯下 轻易的说着一个谎话
躲在聚光灯下 甘愿的……','1970-01-01 00:05:29','奔跑怪物','http://127.0.0.1:5050/img/author/奔跑怪物.png','http://127.0.0.1:5050/img/song/周品-自我嘲弄.jpg','2019-10-11',6,102,1,3);