USE [master]
GO
/****** Object:  Database [SinavDB]    Script Date: 1.01.2018 05:47:55 ******/
CREATE DATABASE [SinavDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SinavDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SinavDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SinavDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SinavDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SinavDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SinavDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SinavDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SinavDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SinavDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SinavDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SinavDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SinavDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SinavDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SinavDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SinavDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SinavDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SinavDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SinavDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SinavDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SinavDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SinavDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SinavDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SinavDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SinavDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SinavDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SinavDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SinavDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SinavDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SinavDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SinavDB] SET  MULTI_USER 
GO
ALTER DATABASE [SinavDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SinavDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SinavDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SinavDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SinavDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SinavDB]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 1.01.2018 05:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_Exam_Id]  DEFAULT (newid()),
	[Title] [nvarchar](500) NULL,
	[Text] [nvarchar](max) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 1.01.2018 05:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_Question_Id]  DEFAULT (newid()),
	[QuestionContent] [nvarchar](500) NULL,
	[OptionA] [nvarchar](250) NULL,
	[OptionB] [nvarchar](250) NULL,
	[OptionC] [nvarchar](250) NULL,
	[OptionD] [nvarchar](250) NULL,
	[Answer] [nvarchar](5) NULL,
	[ExamId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Result]    Script Date: 1.01.2018 05:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[ExamId] [uniqueidentifier] NULL,
	[NumberOfTrue] [int] NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 1.01.2018 05:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_User_Id]  DEFAULT (newid()),
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](64) NULL,
	[Role] [nvarchar](10) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Exam] ([Id], [Title], [Text], [Date]) VALUES (N'5f8b695d-5eb3-4077-9d7f-250f76397464', N'The Future of Weed Science Is a Van in Colorado', N'You enter the University of Colorado Boulder''s newest research laboratory through the side entrance. The door—which is heavy and white, with a black, jug-style handle—slides open from right to left. Crammed inside are a plain wooden dresser, two chairs, and a small desk, above which someone has taped a mediocre landscape-print (mountains, trees, clouds, etc.). A kaleidoscopic purple tapestry hangs from the far wall. The ceiling slings so low that it forces some visitors to duck, and the flooring is made of wood. Well, wood laminate.The modest setup occupies just a few dozen square feet of space—a tight but necessary fit, given that CU Boulder''s newest research laboratory is located not in a building on the university''s campus, but the back of a Ram ProMaster cargo van.The lab is mobile because it has to be. Researchers at CU Boulder’s Change Lab built it to study marijuana’s effects on human test subjects. But even in states like Colorado, where recreational marijuana has been legal since 2014, federal law prohibits scientists from experimenting with anything but government-grown pot.And Uncle Sam’s weed is weak.Cultivated by the University of Mississippi with funding from the National Institute on Drug Abuse, federally sanctioned cannabis is less potent and less chemically diverse than the range of cannabis products available for purchase at dispensaries. According to [findings published in the journal [Nature Scientific Reports](https://www.nature.com/articles/srep46528/) earlier this year, the weed that researchers use in clinical cannabis studies is very different from the weed people actually use.CU Boulder''s mobile lab (aka the CannaVan, aka the Mystery Machine) lets researchers drive around that problem. "The idea is: If we can’t bring real-world cannabis into the lab, let’s bring the lab to the people," says neurobiologist Cinnamon Bidwell, a coauthor on the aforementioned Nature study and head of the CannaVan research team.Researchers are using the CannaVan to investigate the potential risks of high-potency cannabis concentrates, like dabs, and the potential benefits of cannabis use among medical patients with anxiety and chronic pain.Patrick Campbell/University of ColoradoIt works like this: CannaVan researchers first meet with test subjects on CU Boulder campus, where they assign study participants specific commercial cannabis products with known potency and chemical makeups (including edibles and concentrates). Once the test subjects leave, they purchase their assigned cannabis from a local dispensary. Later, CannaVan researchers drive to the subjects'' homes. Participants enter the van sober, and researchers perform blood draws and establish test subjects'' baseline mental and physical states. Then they go back into their homes; eat, smoke, vape, or dab their product as they please; and return to the van, where researchers draw the subjects'' blood again, perform interviews, and evaluate things like memory and motor control.Bidwell''s team is currently using the van to investigate the potential risks of high-potency cannabis concentrates, like dabs, and the potential benefits of cannabis use among medical patients with anxiety and chronic pain. The researchers use the lab to evaluate the drugs'' acute effects, track usage and quality of life, monitor symptoms, and investigate how patients titrate their doses. "Basically, we''re looking at whether people can have pain relief without walking around feeling stoned all the time," Bidwell says.Crucially, all of this happens without any CU researchers buying, touching, or even seeing commercial cannabis themselves. "As Colorado citizens, we can purchase and use these products. But as researchers, we can''t legally bring them into our lab and directly test their effects, or directly analyze them," Bidwell says. The CannaVan studies are less precise than those her team could perform in a traditional lab (where they''d have greater influence over things like dosage, timing, and chemical makeup), but more controlled than a pure observational study. Plus, these studies are actually legal. “We’ve worked very closely with CU Boulder administration, our legal team, research compliance officers—the list goes on—to see that everything is above board,” Bidwell says.The upshot: Randomized controlled trials these are not, but these first observational investigations from CU Boulder''s CannaVan are liable to be some of the most relevant behavioral and therapeutic studies on cannabis in 2018, and—it seems likely—several years to come.That''s because weak government weed isn''t the only thing holding back medical marijuana research. Even as California, Nevada, Massachusetts, and Maine this year join the list of states where recreational weed is legal, in a country where 93 percent of voters support some form of legal pot, cannabis retains its designation under federal law as a Schedule I narcotic. That''s a classification on par with heroin and ecstasy, and one that seems unlikely to change in the current political climate.Attorney General Jeff Sessions'' aversion to medical marijuana has been well documented. In April, he directed a Justice Department task force to review and recommend changes to the Cole Memo, which, since 2013, has enabled states to implement their own medical marijuana laws with minimal intervention by the US government. A month later, Sessions asked Congress to undo the protections afforded by the Rohrbacher-Blumenauer amendment, which also shields state-legal medical marijuana programs from federal interference."He hasn''t yet, but if Sessions prevails at rolling these protections back, everything becomes harder for everybody, and that scares me" says geneticist Reggie Gaudino, chief science officer of marijuana analytics company Steep Hill. "I think it would have a chilling effect on the entire field—sales, medical research, genetic studies, chemical analyses. All of it."And experts agree a chilling effect is the opposite of what cannabis research needs. "There needs to be an enormous amount of work done not just on the compounds present in various cannabis products, but on the best ways to characterize exposure to those compounds," says Harvard pediatrician and public health researcher Marie McCormick. Earlier this year, she chaired a review by the National Academies of Science, Medicine and Engineering of existing marijuana research—the most thorough evaluation of its kind to date. The report found strong evidence for marijuana''s therapeutic potential, but gaping holes in foundational research that could guide its medical and recreational use. "It''s not terribly sexy work. It''s slow and methodological. But it''s critical to understanding the effects of cannabis exposure, its potential risks, and its potential remedies," McCormick says. That''s not all going to happen in 2018, she adds, "but developing a solid research agenda would go a long way toward moving things forward, and a big thing that would help would be the removal of marijuana''s Schedule I status."More on MarijuanaNick StocktonScientists Map the Receptor That Makes Weed WorkKatie M. PalmerA New Crop of Marijuana Geneticists Sets Out to Build Better WeedMegan MolteniJeff Sessions'' War on Medical Marijuana Gets Public Health All WrongIn Colorado, for example, rescheduling marijuana could embolden CU Boulder''s legal team to allow locally grown, non-NIDA weed on campus. This summer, state lawmakers passed House Bill 1367, a law which, when it goes into effect in July of 2018, will allow licensed Colorado cultivators and researchers to grow and study marijuana for clinical investigations. "But it’s still up to the university to say whether they’ll go with state or federal laws," Bidwell says. CU Boulder researchers receive hundreds of millions of dollars in federal funding every year; adhering to local laws over federal ones could put some of that money at risk. "We don''t know how the university will come on that," Bidwell says. "But the institution is, understandably, pretty risk averse, and we have no sense of a timeline on when they might decide."In the meantime, Bidwell and her team will continue cruising Colorado in the CannaVan, conducting observational studies of real-world pot usage. And if you''re in the Boulder area, the researchers are looking for study participants. Just … do be sure any vans you climb into are university-affiliated. Look for the CU-Boulder insignia, the chintzy purple tapestry, and the fake wood floors. Related VideoScienceA New Crop of Marijuana Geneticists Build Better WeedThere are thousands of strains of weed. Cracking their genetic codes may be the key to transforming pot from a budding business to a high-flying industry and a cannabis analytics lab is trying to unlock the true potential of weed. Pictures by Preston Gannaway.', CAST(N'2018-01-01' AS Date))
INSERT [dbo].[Exam] ([Id], [Title], [Text], [Date]) VALUES (N'109b6cc3-fa41-4c68-9038-7b628b730977', N'The Worst Hacks of 2017', N'2017 was bananas in a lot of ways, and cybersecurity was no exception. Critical infrastructure attacks, insecure databases, hacks, breaches, and leaks of unprecedented scale impacted institutions around the world—along with the billions of people who trust them with their data.This list includes incidents disclosed in 2017, but note that some took place earlier. (Speaking of which, you know it''s a heck of a year when Yahoo reveals that it leaked info for three billion accounts, and it''s still not a clear-cut winner for worst incident.) The pace has been unrelenting, but before we forge on, here’s WIRED’s look back at the biggest hacks in 2017.Crash Override and TritonSecurity doomsayers have long warned about the potential dangers posed by critical infrastructure hacking. But for many years the Stuxnet worm, first discovered in 2010, was the only known piece of malware built to target and physically damage industrial equipment. But in 2017, researchers from multiple security groups published findings on two such digital weapons. First came the grid-hacking tool Crash Override, revealed by the security firms ESET and Dragos Inc., which was used to target the Ukrainian electric utility Ukrenergo and cause a blackout in Kiev at the end of 2016. A suite of malware called Triton, discovered by the firm FireEye and Dragos, followed close behind and attacked industrial control systems.Crash Override and Triton don''t seem to be connected, but they have some similar conceptual elements that speak to the traits that are crucial to infrastructure attacks. Both infiltrate complex targets, which can potentially be reworked for other operations. They also include elements of automation, so an attack can be put in motion and then play out on its own. They aim not only to degrade infrastructure, but to target the safety mechanisms and failsafes meant to harden systems against attack. And Triton targets equipment used across numerous industrial sectors like oil and gas, nuclear energy, and manufacturing.Not every electric grid intrusion or infrastructure probe is cause for panic, but the most sophisticated and malicious attacks are. Unfortunately, Crash Override and Triton illustrate the reality that industrial control hacks are becoming more sophisticated and concrete. As Robert Lipovsky, a security researcher at ESET, told WIRED in June, "The potential impact here is huge. If this is not a wakeup call, I don’t know what could be.”EquifaxThis was really bad. The credit monitoring firm Equifax disclosed a massive breach at the beginning of September, which exposed personal information for 145.5 million people. The data included birth dates, addresses, some driver''s license numbers, about 209,000 credit card numbers, and Social Security numbers—meaning that almost half the US population potentially had their crucial secret identifier exposed. Because the information Equifax coughed up was so sensitive, it''s widely considered the worst corporate data breach ever. For now.Equifax also completely mishandled its public disclosure and response in the aftermath. The site the company set up for victims was itself vulnerable to attack, and asked for the last six digits of people''s Social Security numbers to confirm if they were impacted by the breach. Equifax also made the breach response page a standalone site, rather than part of its main corporate domain—a decision that invited imposter sites and aggressive phishing attempts. The official Equifax Twitter account even mistakenly tweeted the same phishing link four times. Four. Luckily, in that case, it was just a proof-of-concept research page.Observers have since seen numerous indications that Equifax had a dangerously lax security culture and lack of procedures in place. Former Equifax CEO Richard Smith told Congress in October that he usually only met with security and IT representatives once a quarter to review Equifax''s security posture. And hackers got into Equifax''s systems for the breach through a known web framework vulnerability that had a patch available. A digital platform used by Equifax employees in Argentina was even protected by the ultra-guessable credentials "admin, admin"—a truly rookie mistake.If any good comes from Equifax, it''s that it was so bad it may serve as a wake-up call. "My hope is that this really becomes a watershed moment and opens up everyone’s eyes," Jason Glassberg, cofounder of the corporate security and penetration testing firm Casaba Security, told WIRED at the end of September, "because it''s astonishing how ridiculous almost everything Equifax did was."YahooYahoo disclosed in September 2016 that it suffered a data breach in late 2014 impacting 500 million accounts. Then in December 2016 the company said that a billion of its users had data compromised in a separate August 2013 breach. Those increasingly staggering numbers proved no match for the update Yahoo released in October that the latter breach actually compromised all Yahoo accounts that existed at the time, or three billion total. Quite the correction.Yahoo had already taken steps to protect all users in December 2016, like resetting passwords and unencrypted security questions, so the the revelation didn''t lead to a complete frenzy. But three billion accounts exposed is, well, really a lot of accounts.Shadow BrokersThe Shadow Brokers first appeared online in August 2016, publishing a sample of spy tools it claimed were stolen from the elite NSA Equation Group (an international espionage hacking operation). But things got more intense in April 2017, when the group released a trove of NSA tools that included the Windows exploit "EternalBlue."That tool takes advantage of a vulnerability that was in virtually all Microsoft Windows operating systems until the company released at a patch at the NSA''s request in March, shortly before the Shadow Brokers made EternalBlue public. The vulnerability was in Microsoft''s Server Message Block file-sharing protocol, and seems like a sort of workhorse hacking tool for the NSA, because so many computers were vulnerable. Because large enterprise networks were slow to install the update, bad actors were able to use EternalBlue in crippling ransomware attacks—like WannaCry—and other digital assaults.The Shadow Brokers also rekindled the debate over intelligence agencies holding on to knowledge of widespread vulnerabilities—and how to exploit them. The Trump administration did announce in November that it had revised and was publishing information about the "Vulnerability Equities Process." The intelligence community uses this framework to determine which bugs to keep for espionage, which to disclose to vendors for patching, and when to disclose tools that have been in use for awhile. In this case, at least, it clearly came too late.WannaCryOn May 12, a type of ransomware known as WannaCry spread around the world, infecting hundreds of thousands of targets, including public utilities and large corporations. The ransomware also memorably hobbled National Health Service hospitals and facilities in the United Kingdom, impacting emergency rooms, medical procedures, and general patient care. One of the mechanisms WannaCry relied on to spread was EternalBlue, the Windows exploit leaked by the Shadow Brokers.Luckily, the ransomware had design flaws, particularly a mechanism security experts were able to use as a sort of kill switch to render the malware inert and stem its spread. US officials later concluded with "moderate confidence" that the ransomware was a North Korean government project, and they confirmed this attribution in mid-December. In all, WannaCry netted the North Koreans almost 52 bitcoins—worth less than $100,000 at the time, but over $800,000 now .NotPetya and BadRabbitAt the end of June another wave of ransomware infections hit multinational companies, particularly in Ukraine and Russia, creating problems at power companies, airports, public transit, and the Ukrainian central bank. The NotPetya ransomware impacted thousands of networks, and led to hundreds of millions of dollars in damage. Like WannaCry, it partially relied on Windows exploits leaked by the Shadow Brokers to spread.NotPetya was more advanced than WannaCry in many ways, but still had flaws like an ineffective payment system, and problems with decrypting infected devices. Some researchers suspect, though, that these were features, not bugs, and that NotPetya was part of a political hacking initiative to attack and disrupt Ukrainian institutions. NotPetya spread in part through compromised software updates to the accounting software MeDoc, which is widely used in Ukraine.In late October a second, smaller wave of destructive ransomware attacks spread to victims in Russia, Ukraine, Turkey, Bulgaria, and Germany. The malware, dubbed BadRabbit, hit infrastructure and hundreds of devices. Researchers later found links in how the ransomware was built and distributed to NotPetya and its creators.WikiLeaks CIA Vault 7 and Vault 8On March 7, WikiLeaks published a data trove of 8,761 documents allegedly stolen from the CIA. The release contained information about alleged spying operations and hacking tools, including iOS and Android vulnerabilities, bugs in Windows, and the ability to turn some smart TVs into listening devices. Wikileaks has since released frequent, smaller disclosures as part of this so-called "Vault 7" collection, describing techniques for using Wi-Fi signals to track a device''s location, and for persistently surveilling Macs by manipulating their firmware. WikiLeaks claims that Vault 7 reveals "the majority of [the CIA] hacking arsenal including malware, viruses, trojans, weaponized ''zero day'' exploits, malware remote control systems and associated documentation."At the beginning of November, WikiLeaks launched a parallel disclosure collection called "Vault 8," in which the organization claims it will reveal CIA source code for tools described in Vault 7 and beyond. So far, Wikileaks has posted the code behind a hacking tool called "Hive," which generates fake authentication certificates to communicate with malware installed on compromised devices. It''s too early to say how damaging Vault 8 may be, but if the organization isn''t careful, it could wind up aiding criminals and other destructive forces much like the Shadow Brokers have.Honorable Mention: Uber Hack2017 was a year of diverse, extensive, and deeply troubling digital attacks. Never one to be outdone on sheer drama, though, Uber hit new lows in its lack of disclosure after an incident last year.Uber''s new CEO Dara Khosrowshahi announced in late November that attackers stole user data from the company''s network in October 2016. Compromised information included the names, email addresses, and phone numbers of 57 million Uber users and the names and license information for 600,000 drivers. Not great, but not anywhere near, say, three billion compromised accounts. The real kicker, though, is that Uber knew about the hack for a year, and actively worked to conceal it, even reportedly paying a $100,000 ransom to the hackers to keep it quiet. These actions likely violated data breach disclosure laws in many states, and Uber reportedly may have even tried to hide the incident from Federal Trade Commission investigators. If you''re going to be hilariously sketchy about covering up your corporate data breach, this is how it''s done. Related VideoSecurityHow to Protect Yourself After a Massive Corporate HackIt seems like every time you turn around there''s a new breach of personal information. Follow these steps to minimize the damage.', CAST(N'2017-12-31' AS Date))
INSERT [dbo].[Question] ([Id], [QuestionContent], [OptionA], [OptionB], [OptionC], [OptionD], [Answer], [ExamId]) VALUES (N'f0013cb5-ef88-4c75-b95e-1a8067c8ea02', N'q3', N'q3', N'q3', N'q3', N'q3', N'C', N'109b6cc3-fa41-4c68-9038-7b628b730977')
INSERT [dbo].[Question] ([Id], [QuestionContent], [OptionA], [OptionB], [OptionC], [OptionD], [Answer], [ExamId]) VALUES (N'f8ae6bb8-324b-4e8d-a390-2b1a47a2bf3e', N'q1', N'q1', N'q1', N'q1', N'q1', N'A', N'109b6cc3-fa41-4c68-9038-7b628b730977')
INSERT [dbo].[Question] ([Id], [QuestionContent], [OptionA], [OptionB], [OptionC], [OptionD], [Answer], [ExamId]) VALUES (N'456053f9-694d-4569-84ee-3bf41241d5fb', N'tbser', N'arvawe', N'ravr', N'ayn', N'tysr', N'B', N'5f8b695d-5eb3-4077-9d7f-250f76397464')
INSERT [dbo].[Question] ([Id], [QuestionContent], [OptionA], [OptionB], [OptionC], [OptionD], [Answer], [ExamId]) VALUES (N'355f9870-c0d3-40e8-b87c-4d42c6f55c46', N'q2', N'q2', N'q2', N'q2', N'q2', N'B', N'109b6cc3-fa41-4c68-9038-7b628b730977')
INSERT [dbo].[Question] ([Id], [QuestionContent], [OptionA], [OptionB], [OptionC], [OptionD], [Answer], [ExamId]) VALUES (N'4384d48f-37e1-41f9-a798-66d1e13f2407', N'fgwrhw', N'her', N'wer', N'weg', N'heth', N'D', N'5f8b695d-5eb3-4077-9d7f-250f76397464')
INSERT [dbo].[Question] ([Id], [QuestionContent], [OptionA], [OptionB], [OptionC], [OptionD], [Answer], [ExamId]) VALUES (N'c3263215-3bc6-4564-9e4f-e507ec78cd5e', N'uıl', N'kyuk', N'fu', N'qrt', N'rq', N'A', N'5f8b695d-5eb3-4077-9d7f-250f76397464')
INSERT [dbo].[Question] ([Id], [QuestionContent], [OptionA], [OptionB], [OptionC], [OptionD], [Answer], [ExamId]) VALUES (N'21961b49-98e4-4695-ba39-eda7335991b8', N'qweqwe', N'dasq', N'eg', N'fqwfq', N'qgqe', N'B', N'5f8b695d-5eb3-4077-9d7f-250f76397464')
INSERT [dbo].[Question] ([Id], [QuestionContent], [OptionA], [OptionB], [OptionC], [OptionD], [Answer], [ExamId]) VALUES (N'ae6912dd-3c09-4120-a29c-f2a9ba59e6da', N'q4', N'q4', N'q4', N'q4', N'q4', N'D', N'109b6cc3-fa41-4c68-9038-7b628b730977')
INSERT [dbo].[User] ([Id], [UserName], [Password], [Role]) VALUES (N'3b3ef038-77bf-477c-a912-4081e0c43a6c', N'admin', N'ISMvKXpXpadDiUoOSoAfww==', N'admin')
INSERT [dbo].[User] ([Id], [UserName], [Password], [Role]) VALUES (N'05202dc4-26a7-4169-88cc-773745e62479', N'user', N'7hHLsZBS5AsHqsDKBgwj7g==', N'user')
ALTER TABLE [dbo].[Result] ADD  CONSTRAINT [DF_Result_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Exam] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exam] ([Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Exam]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Exam] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exam] ([Id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Exam]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_User]
GO
USE [master]
GO
ALTER DATABASE [SinavDB] SET  READ_WRITE 
GO
