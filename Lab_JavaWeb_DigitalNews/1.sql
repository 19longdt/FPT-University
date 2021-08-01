USE [DigitalNews]
GO
/****** Object:  Table [dbo].[Digital]    Script Date: 21/06/2021 16:49:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Digital](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tittle] [varchar](max) NULL,
	[description] [text] NULL,
	[image] [varchar](200) NULL,
	[author] [varchar](200) NULL,
	[dateCreate] [datetime] NULL,
	[shortDes] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Digital] ON 

INSERT [dbo].[Digital] ([id], [tittle], [description], [image], [author], [dateCreate], [shortDes]) VALUES (1, N'England 1-0 Croatia: Sterling edges Three Lions to victory', N'England were quickly out of the blocks at Wembley Stadium with Phil Foden curling an effort off the post and Kalvin Phillips bringing a low save out of Dominik Livakovic, but Croatia weathered the early storm and finished the half on par with their hosts.
Luka Modric finally called Jordan Pickford into action after the interval but, almost immediately, the visitors fell behind when Kalvin Phillips incisive pass gave Sterling enough time to fire under Livakovic.
Sterling blazed over a presentable chance to make the game safe but the visitors rarely looked like responding as Gareth Southgates men started Group D with an important success.
Man of the Match: Raheem Sterling(England)', N'eng.jpg', N'UEFA', CAST(N'2021-06-12T00:00:00.000' AS DateTime), N'Raheem Sterlings goal was enough to give Gareth Southgates men a landmark success. goal ensured England won their opening game at a EURO finals for the first time in their history.')
INSERT [dbo].[Digital] ([id], [tittle], [description], [image], [author], [dateCreate], [shortDes]) VALUES (2, N'UEFA President sends support to Christian Eriksen', N'"Moments like this put everything in life into perspective," said President Ceferin. "I wish Christian a full and speedy recovery and pray his family has strength and faith. At these times, the unity of the football family is so strong and he and his family carry with them the good wishes and prayers of everyone. I heard of fans of both teams chanting his name. Football is beautiful and Christian plays it beautifully."', N'eriksen.jpg', N'UEFA', CAST(N'2021-06-11T00:00:00.000' AS DateTime), N'UEFA President Aleksander Ceferin sent a message of support to Denmarks Christian Eriksen, who is undergoing medical tests in a Copenhagen hospital after receiving emergency treatment during his teams UEFA EURO 2020 match against Finland.')
INSERT [dbo].[Digital] ([id], [tittle], [description], [image], [author], [dateCreate], [shortDes]) VALUES (8, N'German state of Bavaria in talks with Intel on chip megafactory', N'June 18 (Reuters) - Germanys southern state of Bavaria is in talks with Intel (INTC.O) to build a European chip factory in a bid to counter supply bottlenecks that have hampered production in the automotive sector, the local economy minister said on Friday.
In recent months, the U.S. chipmaker has been seeking 8 billion euros ($9.5 billion) in public subsidies to build a semiconductor manufacturing site in Europe. read more
"I strongly support this," said Economy Minister Hubert Aiwanger, whose state is home to luxury carmaker BMW (BMWG.DE). "The possible location of a large international semiconductor manufacturer in Bavaria is an outstanding opportunity."
Bavaria has suggested a disused air base in Penzing-Landsberg, west of Munich as a possible location for the factory, Aiwanger said.
A shortage of semiconductors is causing headwinds for Europes car manufacturers and threatens to de-rail Germanys economic recovery from the coronavirus pandemic.', N'intel.jpg', N'Reuters', CAST(N'2021-06-18T20:20:00.000' AS DateTime), N'U.S. chipmaker Intel Corps logo is seen on their "smart building" in Petah Tikva, near Tel Aviv, Israel. December 15, 2019. REUTERS/Amir Cohen/File Photo')
INSERT [dbo].[Digital] ([id], [tittle], [description], [image], [author], [dateCreate], [shortDes]) VALUES (4, N'Google new tech to track you for ads can do more harm than good: Firefox', N'Google is aiming to replace third-party cookies with its new FLoC standard for showing you relevant ads online. FLoC stands for Federated Learning of Cohorts. Google claims that this new tech offers better privacy for users while tracking them for showing relevant online ads. However, Firefox creator Mozilla disagreed and said that FLoC could pose “significant” privacy risk to users.

Now the concept of FLoC is complex. Instead of advertisers making individual profiles for digital ads, FLoC will create a group of users (at least 1000) having the same interests and advertisers will be able to showcase ads to these groups. So, instead of ads-based on individual preferences, you will be part of larger anonymous groups and get ads served accordingly.

On the other hand, Mozilla explained in a blog post that “FLoC leaks more information than you want”.', N'goo.jpg', N'John Stone', CAST(N'2021-06-12T00:00:00.000' AS DateTime), N'Google claims that this new tech offers better privacy for users while tracking them for showing relevant online ads...')
INSERT [dbo].[Digital] ([id], [tittle], [description], [image], [author], [dateCreate], [shortDes]) VALUES (5, N'Saturday Solologues: The scent of AI', N'This was one of the most fascinating reads of the week.

Sample this: you are ordering your favourite food from one of the best restaurants. Before you dive in to devour what has just been served on your table, out comes your cell phone and hovers above the dish. To the outside world, this might look like you are clicking a picture to upload on Instagram. But the AI software in your mobile is actually decoding the entire recipe of the dish based on the aroma. Soon you have a report on all ingredients that have gone into the dish, measured to the miligram. In the near future, AI could be the tool that helps you graduate from being a wonder chef (the one who always dreams of becoming a good chef) to a masterchef.', N'ai.jpg', N'Prasad Sangameshwaran', CAST(N'2021-06-13T00:00:00.000' AS DateTime), N'As AI develops a sense of smell, we do some crystal ball gazing on the immense possibilities...')
INSERT [dbo].[Digital] ([id], [tittle], [description], [image], [author], [dateCreate], [shortDes]) VALUES (6, N'When it comes to social networks, bigger isnt always better', N'Bigger is always better. Many of us think this is true when it comes to building our online networks of social media friends, connections and followers. But new research suggests the opposite may be closer to the truth: curating small networks of trusted connections may be smarter in the long run. While this may seem counterintuitive, it also comes with a caveat.

We often feel compelled, and are even encouraged by social media platforms, to grow our networks. Consider all the prompts about "someone else you might know" and "who to follow." We all want the sociometrics (that number of friends or followers posted in the corner of your profile) to look good.', N'soci.jpg', N'PTI', CAST(N'2021-06-04T02:30:00.000' AS DateTime), N'All those digital viewing, scanning, sharing, searching and storing capabilities of our social media networks make it really easy for us to believe we have the ability and arrangements to use our networks as pipes.')
INSERT [dbo].[Digital] ([id], [tittle], [description], [image], [author], [dateCreate], [shortDes]) VALUES (9, N'Facebook’s ‘Neighborhoods’ faces crowded niche market, profiling concerns', N'Here, in a corner of the worlds largest social network, people met neighbors, shared banana bread ingredients, helped locate missing cats and swapped local business recommendations, the features product manager Reid Patton said in a recent interview.

But Facebook, which is rolling out the feature in four U.S. cities - Baton Rouge, Louisiana; Charlotte, North Carolina; Newark, New Jersey; and San Diego, California - is already playing catch-up in the red-hot market for local social apps. Community site Nextdoor has emerged as a key player along with Amazon Rings Neighbors and crime-tracking app Citizen. Nextdoor, which saw usage surge during lockdowns, reported 50% annual growth in daily active users last year. Facebook has in recent years focused on on-site communities that matter to its users as a tactic to drive engagement. The company, which made the vast majority of its almost $84.2 billion ad revenue last year from smaller businesses, many of whom court local users, also said users activity and information in Neighborhoods may be used to personalize their experience and ads across Facebook.', N'fb.jpg', N'Elizabeth Culliford, Moira Warburton', CAST(N'2021-06-18T14:30:00.000' AS DateTime), N'June 18 (Reuters) - When Facebook (FB.O) began testing its new “Neighborhoods” feature in Canada last October amid the COVID-19 pandemic, the tech giant described it as a dedicated place for people to connect with their local communities.')
SET IDENTITY_INSERT [dbo].[Digital] OFF
