function "Migration/Third Step" {
  input {
    int intervention_id?=355 {
      table = "INTERVENTION"
    }
  }

  stack {
    var $data {
      value = [
        {
          "name": "DJ SMART UPPER EAST",
          "description": "DJ Smart (Ayaaba Abdul Aziz) is a journalist and media personality operating in Ghana’s Upper East region. Through his work with BlueWaves Radio 93.7 FM, he provides news coverage and commentary on local issues, fostering public awareness and engagement within the community. His online presence serves as both a professional portfolio and a platform for real-time updates, media coverage, and interactions with listeners.",
          "contact": [
            [
              "email",
              "abdulazizayaaba1@gmail.com"
            ],
            [
              "phone_number",
              "+233 55 312 4874"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/profile.php?id=100063518662411"
            ],
            [
              "instagram",
              "https://www.instagram.com/djsmartuppereast/"
            ]
          ]
        },
        {
          "name": "James Adombire​",
          "description": "James Adombire is a Ghanaian broadcast journalist, news reporter, and entrepreneur. He is the CEO of Amazing Smocks and Fashion and has built a reputation as a communicator and online marketer. With a strong presence in Bolgatanga, Ghana, James combines media work with entrepreneurship, leveraging both journalism and business to create community impact.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/jamesadombire/"
            ],
            [
              "instagram",
              "https://www.instagram.com/jamesadombire/"
            ]
          ]
        },
        {
          "name": "DJ Gizy​",
          "description": "DJ Gizy is a local radio DJ and artist manager living in Bolgatanga, although he is originally from Sandema, another Northern Ghanaian town just over 100km from Bawku.​",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/gizy.macore/"
            ],
            [
              "instagram",
              "https://www.instagram.com/djgizygh"
            ]
          ]
        },
        {
          "name": "Roger Laari​",
          "description": "Roger Laari is a Ghanaian entrepreneur and real estate developer, serving as CEO and Founder of Moab Properties Limited. With a diverse background in business development, property investment, and community initiatives, he has established himself as a key player in Ghana’s northern economic landscape. Laari is also actively engaged in civic and economic discussions, particularly through roles at the Northern Economic Summit and initiatives that bridge business with social impact.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/roger.laarijnr/"
            ],
            [
              "instagram",
              "https://www.instagram.com/rogerlaari/"
            ]
          ]
        },
        {
          "name": "Toni Ayelbis Atubiga",
          "description": "Toni Ayelbis Atubiga is a Ghanaian cultural entrepreneur and the founder of Ayelbis Events, known for organizing the annual Miss Upper East Ghana Pageant. With a background in health, physical education, and recreation, he leverages cultural platforms to celebrate regional identity, empower youth, and create opportunities for community engagement. Based in Accra but originally from Binduri in the Upper East Region, he uses his work to connect traditional heritage with contemporary social development initiatives.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/toni.a.bis/"
            ],
            [
              "instagram",
              "https://www.instagram.com/miss_upper_east_ghana"
            ]
          ]
        },
        {
          "name": "Nadella Oya",
          "description": "Nadella Oya is a Trinidad and Tobago–based strategist and communications expert specializing in social impact initiatives and behavioral change campaigns. With extensive experience in media production, social enterprise, and advocacy, she is committed to designing and implementing communication strategies that empower young people and advance human rights. She combines her expertise in creative industries with a strong advocacy background, particularly in child rights, gender equality, and social inclusion.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/nadellaoya/"
            ],
            [
              "instagram",
              "https://www.instagram.com/oyacreating/"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/in/nadella-oya/"
            ]
          ]
        },
        {
          "name": "The Heros Foundation",
          "description": "Founded in 2002 with a mission to ignite the heroic spirit within Trinidad and Tobago’s youth, the Heroes Foundation is an award-winning specialist organisation supporting young people along a transformative development pathway to overcome life’s challenges and become 21st-century leaders.",
          "contact": [
            [
              "email",
              "info@theheroesfoundation.com"
            ],
            [
              "phone_number",
              "+1 868-218-4376"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/TheHeroesFoundation"
            ],
            [
              "instagram",
              "https://www.instagram.com/heroesfoundationtt/"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/the-heroes-foundation/"
            ],
            [
              "x",
              "https://x.com/TheHeroesHQ"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@theheroesfoundation"
            ],
            [
              "youtube",
              "https://www.youtube.com/@theheroesfoundation2150"
            ]
          ]
        },
        {
          "name": "We Say Yes",
          "description": "The We Say YES (WSY) Organization, founded in 2016 in Port of Spain, Trinidad and Tobago, empowers youth through the Youth Entrepreneurship for Self-Empowerment (YES) programme. Initiated by Nichola Harvey-Mitchell, WSY was created to provide alternatives to gang involvement and violence by equipping young people with entrepreneurial skills and leadership opportunities. Through creative and non-traditional programmes, the organization fosters personal growth, community well-being, and long-term success for vulnerable youth.",
          "contact": [
            [
              "email",
              "wesayyestt@gmail.com"
            ],
            [
              "phone_number",
              "868-770-4979"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/we.say.yestt/"
            ]
          ]
        },
        {
          "name": "Vestnik Tartu",
          "description": "Local news and insights on Tartu city life; in-depth reporting on community events and social issues; practical guides for residents and visitors.",
          "contact": [
            [
              "email",
              "info@vestniktartu.ee"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/vestniktartu"
            ],
            [
              "facebook",
              "https://www.facebook.com/vestniktartu"
            ],
            [
              "telegram",
              "https://t.me/vestniktartu"
            ]
          ]
        },
        {
          "name": "Delovyje Vedomosti",
          "description": "Business news and analysis in Estonia; market updates and investment trends; interviews with entrepreneurs and commentary on economic policy.",
          "contact": [
            [
              "email",
              "dv@aripaev.ee"
            ],
            [
              "phone_number",
              "+372 667 0085"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/delovoje_vedomosti/"
            ],
            [
              "facebook",
              "https://www.facebook.com/DVedomostj"
            ],
            [
              "telegram",
              "https://t.me/DVedomosti"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/dvedomosti/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@delovoje_vedomosti"
            ]
          ]
        },
        {
          "name": "Delfi Estonia",
          "description": "Round-the-clock news coverage on Estonian and global events; live updates on politics, economy, and society; in-depth features, opinion pieces, and multimedia storytelling.",
          "contact": [
            [
              "email",
              "delfi@delfi.ee"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/delfi.ee"
            ],
            [
              "instagram",
              "https://www.instagram.com/delfi.ee/"
            ]
          ]
        },
        {
          "name": "LSM",
          "description": "Comprehensive public-service news in Russian language in Latvia; live reports and analysis on politics, society, and international affairs; cultural programming and in-depth interviews.",
          "contact": [
            [
              "email",
              "platforma@lsm.lv"
            ],
            [
              "phone_number",
              "+371 20 008 785"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/LSMplus.lv"
            ],
            [
              "instagram",
              "https://www.instagram.com/lsmplus.lv"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@lsmplus.lv"
            ],
            [
              "youtube",
              "https://www.youtube.com/c/RUSLSM"
            ],
            [
              "telegram",
              "https://t.me/ruslsm"
            ]
          ]
        },
        {
          "name": "New East",
          "description": "Latvian NGO creating culture, media, and learning experiences to empower communities; in-depth analysis on democracy, civil society, and regional developments; education programs and public events fostering civic engagement.",
          "contact": [
            [
              "email",
              "contact@neweasteurope.com"
            ],
            [
              "phone_number",
              "+371 20 133 020"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/neweast.europe"
            ],
            [
              "instagram",
              "https://www.instagram.com/neweast/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@neweast.europe"
            ],
            [
              "telegram",
              "https://t.me/neweast_europe"
            ]
          ]
        },
        {
          "name": "IR.lv",
          "description": "Weekly in-depth analysis of Latvia’s key political, economic, and cultural developments; investigative essays and interviews with thought leaders; curated commentary on regional and global affairs.",
          "contact": [
            [
              "email",
              "redakcija@ir.lv"
            ],
            [
              "phone_number",
              "+371 27 734 907"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/wwwIRlv"
            ],
            [
              "instagram",
              "https://www.instagram.com/zurnalsir/"
            ],
            [
              "x",
              "https://x.com/irlv"
            ]
          ]
        },
        {
          "name": "Chayka",
          "description": "Local news and explainers in Latvia’; human-interest features and community storytelling; practical guides for leisure, culture, and civic projects.",
          "contact": [
            [
              "email",
              "info@chayka.lv"
            ],
            [
              "phone_number",
              "+371 27 711 350"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Chayka.lv/"
            ],
            [
              "instagram",
              "https://www.instagram.com/chaykalv/"
            ],
            [
              "telegram",
              "https://t.me/chaykalv"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@chaykalv"
            ]
          ]
        },
        {
          "name": "Latvijas Radio 4",
          "description": "Latvian public‐service radio with a focus on culture and ideas; in‐depth interviews with writers, artists, and thinkers; documentary features and discussions on literature, theater, and the arts.",
          "contact": [
            [
              "email",
              "lr4@latvijasradio.lv"
            ],
            [
              "phone_number",
              "+371 67 227 440"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/LatvijskoeRadio4/"
            ],
            [
              "instagram",
              "https://www.instagram.com/latvijas_radio_4/"
            ],
            [
              "x",
              "https://x.com/LatvijasRadio4"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCf5ny7HLsL7Bu4GmtLTwKSA"
            ]
          ]
        },
        {
          "name": "Postimees",
          "description": "Estonia’s leading daily news portal with comprehensive coverage of national and global affairs; breaking news, in-depth analyses, and expert commentary on politics, economy, and society.",
          "contact": [
            [
              "email",
              "online@postimees.ee"
            ],
            [
              "phone_number",
              "+372 666 2202"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/postimees"
            ],
            [
              "instagram",
              "https://www.instagram.com/postimees.ee"
            ],
            [
              "x",
              "https://x.com/postimees"
            ]
          ]
        },
        {
          "name": "TVNET",
          "description": "24/7 news portal offering comprehensive coverage of national and international events; dedicated sections on business, sports, lifestyle, auto, recipes, and special multimedia features.",
          "contact": [
            [
              "email",
              "redakcija@tvnetgrupa.lv"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/tvnet.lv/"
            ],
            [
              "instagram",
              "https://www.instagram.com/tvnet_lv/"
            ],
            [
              "x",
              "https://x.com/Tvnet_zinas"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@tvnet.lv"
            ]
          ]
        },
        {
          "name": "Delfi Latvia",
          "description": "Round-the-clock news coverage on Latvian and global events; live updates on politics, economy, and society; in-depth features, opinion pieces, and multimedia storytelling.",
          "contact": [
            [
              "email",
              "redakcija@delfi.lv"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Delfi.lv/"
            ],
            [
              "instagram",
              "https://www.instagram.com/delfi.lv/"
            ],
            [
              "x",
              "https://x.com/DelfiLV"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@delfilv"
            ],
            [
              "telegram",
              "https://t.me/delfi_lv"
            ]
          ]
        },
        {
          "name": "Gazeta",
          "description": "Russian-language news portal for Narva and the Estonian-Russian border region; real-time reporting on local developments, cross-border issues, and community life; live updates from emergency services and cultural guides.",
          "contact": [
            [
              "email",
              "redaktor@prospekt.ee"
            ],
            [
              "phone_number",
              "+372 5656 2956"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/gazeta.ee"
            ],
            [
              "instagram",
              "https://www.instagram.com/gazeta.ee/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@gazetaee"
            ],
            [
              "telegram",
              "https://t.me/gazetaee"
            ]
          ]
        },
        {
          "name": "I Gryanul Grem",
          "description": "The program \"I Gryanul Grem\" in the framework of which the hosts Vadim Radionov and Anna Smirnova discuss with guests - politicians, writers, political scientists, directors, artists, scientists, athletes and journalists acute, relevant and analytical topics of concern to society.",
          "contact": [
            [
              "email",
              "gremworld88@gmail.com"
            ]
          ],
          "media": [
            [
              "youtube",
              "https://www.youtube.com/@i_gryanul_grem"
            ],
            [
              "telegram",
              "https://t.me/gremtelegram"
            ],
            [
              "instagram",
              "https://www.instagram.com/granul_grem/"
            ]
          ]
        },
        {
          "name": "Julius Rou",
          "description": "Vlog series capturing everyday life in Estonia; immersive travelogues and explorations of urbanism and city culture.",
          "contact": [
            [
              "email",
              "juliusrou.work@gmail.com"
            ]
          ],
          "media": [
            [
              "youtube",
              "https://www.youtube.com/JuliusRou"
            ],
            [
              "instagram",
              "https://www.instagram.com/juliusrou/?hl=en"
            ],
            [
              "telegram",
              "t.me/JuliusRou"
            ]
          ]
        },
        {
          "name": "International Medical Corps (IMC)",
          "description": "Global humanitarian NGO delivering emergency medical services, training, and development programs to communities struck by conflict, disasters, and disease helping them move from relief to self-reliance.",
          "contact": [
            [
              "phone_number",
              "+1 310-826-7800"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/internationalmedicalcorps"
            ],
            [
              "x",
              "https://x.com/IMC_worldwide"
            ],
            [
              "instagram",
              "https://www.instagram.com/internationalmedicalcorps"
            ]
          ]
        },
        {
          "name": "Taiwan FactCheck Center",
          "description": "Taiwan’s first independent nonprofit fact‑checking organization—launched in 2018—to counter misinformation, enhance media literacy, and strengthen democratic trust through evidence‑based verification and transparency.",
          "contact": [
            [
              "email",
              "tfc@tfc-taiwan.org"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/taiwantfc/"
            ],
            [
              "x",
              "https://x.com/taiwantfc"
            ],
            [
              "instagram",
              "https://www.instagram.com/taiwan_factcheckcenter/"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCRrO7rwIR0n7P1K2Fc7CIXA"
            ]
          ]
        },
        {
          "name": "Science Media Centre (SMC)",
          "description": "An independent UK-based press office that equips journalists with accurate, evidence-based scientific expertise especially during high-profile or controversial science, health, and engineering stories and supports scientists to engage effectively with the media.",
          "contact": [
            [
              "email",
              "smsc@sciencemediacentre.org"
            ],
            [
              "phone_number",
              "+44 (0)20 7611 8300"
            ]
          ],
          "media": [
            [
              "x",
              "https://x.com/SMC_London"
            ]
          ]
        },
        {
          "name": "Anwer Aziz",
          "description": "Iraqi digital creator sharing commentary on political history, governance, and national affairs; combines perspectives from his professional background in healthcare with reflections on regional geopolitics.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/anwer.azeze"
            ],
            [
              "instagram",
              "https://www.instagram.com/anwer.adem/"
            ]
          ]
        },
        {
          "name": "Khalid Waleed Saber",
          "description": "A researcher and trainer in sustainable development, climate, and the environment; a political and civil activist who believes in freedom of expression and social justice; calls for supporting the state's discourse and rejecting weapons and extremist ideology; and strives for a secure homeland and a stable future.",
          "contact": [
            [
              "phone_number",
              "+964 772 229 8100"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/kaliedwalied.sabier"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@khaliedwaleedsabeer"
            ]
          ]
        },
        {
          "name": "Ali Hammadi Azooz",
          "description": "An Iraqi politician who focuses on issues of governance and accountability, criticizes the exploitation of government positions and public resources for electoral purposes; shares his views on transparency, the rule of law, and integrity in public life.",
          "contact": [
            [
              "phone_number",
              "+964 780 405 9984"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/mawswiy"
            ]
          ]
        },
        {
          "name": "Ali Qasim Khudhalr",
          "description": "Iraqi digital creator sharing political commentary, social perspectives, and calls for civic change; blends personal insights with reflections on governance, reform, and public mobilization.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/alialnoor11/"
            ]
          ]
        },
        {
          "name": "Ali kareem Talib",
          "description": "Iraqi digital creator and commentator focusing on governance, public services, and civic issues in Basra; raises awareness about infrastructure crises, political accountability, and the impact of systemic challenges on daily life.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Alikareem1335/"
            ],
            [
              "x",
              "https://x.com/alialbasri9"
            ]
          ]
        },
        {
          "name": "Alaa Al-Yaseri",
          "description": "Independent Iraqi politician and activist working on women’s rights, human development, and strategic policy; engages in human rights advocacy, social justice initiatives, and public commentary on governance and political reform.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/ala.alyasry.10054/"
            ],
            [
              "instagram",
              "https://www.instagram.com/yaserialaaal"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@alaaalyaser1"
            ],
            [
              "telegram",
              "https://t.me/alaaalyasri"
            ]
          ]
        },
        {
          "name": "Ahemd Abdulidhra Khalaf",
          "description": "Iraqi public figure sharing perspectives on community life, local events, and social values; engages in public discussions on societal ethics, trust, and cultural identity, with active participation in civic gatherings.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/ahmedalshurefy"
            ]
          ]
        },
        {
          "name": "Ameera Aljaber",
          "description": "Iraqi public figure and member of the Women’s Advisory Council, active in the Legal and Political Committee and the Committee for Public Relations and Media; engages in policy discussions, women’s rights advocacy, and public commentary on governance and national issues.",
          "contact": [
            [
              "email",
              "ameeraaloboody80@yahoo.com"
            ],
            [
              "phone_number",
              "+964 772 800 2401"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/ameera.jaafar"
            ]
          ]
        },
        {
          "name": "Zindagi Trust",
          "description": "Pakistan-based nonprofit transforming public schools through holistic reforms, creative learning programs, and policy advocacy; empowers children with critical thinking, life skills, and opportunities to thrive.",
          "contact": [
            [
              "email",
              "info@zindagitrust.org"
            ],
            [
              "phone_number",
              "+92 21 111 111 439"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/zindagitrust/"
            ],
            [
              "x",
              "https://x.com/zindagitrust"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCnvsdmmh9H-66ki_Pp5KWfw"
            ],
            [
              "instagram",
              "https://www.instagram.com/zindagitrust"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@zindagitrustpak"
            ]
          ]
        },
        {
          "name": "Aahung",
          "description": "Pakistan-based NGO delivering Life Skills Based Education (LSBE) to equip children and adolescents with critical knowledge on reproductive health, abuse prevention, and essential life management skills; works to empower youth with the tools to make informed, healthy, and safe life choices.",
          "contact": [
            [
              "email",
              "info@aahung.org"
            ],
            [
              "phone_number",
              "+92 21 35821654"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/aahungngo"
            ],
            [
              "x",
              "https://x.com/aahungngo"
            ],
            [
              "youtube",
              "https://www.youtube.com/aahungngo"
            ],
            [
              "instagram",
              "https://www.instagram.com/aahungngo/"
            ]
          ]
        },
        {
          "name": "Takhleeq Foundation",
          "description": "Pakistan-based nonprofit working for over 25 years to promote democratic values, human rights, and social justice; implements programs on peacebuilding, poverty alleviation, and community development to foster inclusive prosperity.",
          "contact": [
            [
              "email",
              "takhleeqfoundationkarachi@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/TakhleeqFoundationOfficial"
            ]
          ]
        },
        {
          "name": "Dusan Mladjenovic",
          "description": "International editor at N1 Serbia with experience in global journalism, cross-border reporting, and media collaboration; alumni of the Thomson Reuters Foundation and Bosch Stiftung programs, specializing in international affairs and investigative storytelling.",
          "contact": [],
          "media": [
            [
              "linkedin",
              "https://www.linkedin.com/in/dusan-mladjenovic-31b78421"
            ],
            [
              "x",
              "https://x.com/_GlobalFokus"
            ],
            [
              "facebook",
              "https://www.facebook.com/duIe.mI"
            ],
            [
              "instagram",
              "https://www.instagram.com/dusanmladenovic/"
            ]
          ]
        },
        {
          "name": "Ana Abashidze",
          "description": "Human rights advocate and legal expert specializing in immigration law; uses TikTok to share accessible legal information, raise awareness on migrants’ rights, and provide guidance on navigating immigration processes.",
          "contact": [
            [
              "email",
              "abashidze.a@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/abashidze86"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@anaabashidze94"
            ]
          ]
        },
        {
          "name": "Anti-Tribalism Movement (ATM)",
          "description": "Non-profit organization working to combat tribal discrimination and promote social cohesion within the UK’s BAME communities, particularly those of Horn of African origin. ATM focuses on fostering tolerance, developing leadership skills, and advancing social justice through advocacy, partnerships, and grassroots engagement. It has established itself as a trusted and visionary leader, regularly consulted by minority organizations, donors, and policymakers.",
          "contact": [
            [
              "email",
              "info@theatm.org"
            ],
            [
              "phone_number",
              "020 3588 1880"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/AntiTribalismMovement#"
            ],
            [
              "instagram",
              "https://www.instagram.com/movementatm/"
            ],
            [
              "x",
              "https://x.com/movementatm"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/anti-tribalism-movement-atm/"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UC6OrQen7S9evqH9QQPUT5RQ"
            ]
          ]
        },
        {
          "name": "Somali Youth Development Network (SOYDEN)",
          "description": "SOYDEN is a coalition of Somali youth organizations committed to uniting young people across clan divisions to promote equality, social cohesion, and peaceful coexistence. Through advocacy, community programs, and youth-led initiatives, the network works to empower Somali youth, combat discrimination, and foster a unified generation prepared to contribute to peacebuilding and national development.",
          "contact": [
            [
              "email",
              "info@soyden.net"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/soydennn/"
            ],
            [
              "x",
              "https://x.com/soyden_network"
            ]
          ]
        },
        {
          "name": "Somali Women and Children’s Organization (SSWC)",
          "description": "SSWC is a national Somali women-led humanitarian organization founded in 1992 in Mogadishu by women intellectuals from diverse backgrounds. It works to protect and empower women and children through humanitarian aid, advocacy, and development programs. The organization focuses on advancing gender equality, preventing and responding to gender-based violence, improving access to healthcare, and strengthening the role of women in peacebuilding and community resilience.",
          "contact": [
            [
              "email",
              "info@sswc-som.org"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/SSWCSomalia"
            ],
            [
              "x",
              "https://x.com/S_S_W_C"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCq3LKScipWHWd6B4TwMPoRQ"
            ]
          ]
        },
        {
          "name": "Shaqodoon",
          "description": "Shaqodoon is a Somali NGO established in 2011 to address youth employment challenges through skills development, entrepreneurship support, and technology-driven solutions. Operating across Somaliland, Puntland, and South-Central Somalia, it offers vocational training, market linkages, and access to finance while addressing gender-based violence and promoting inclusivity. The organization partners with local and international stakeholders to foster economic opportunities, social resilience, and youth-led community development.",
          "contact": [
            [
              "email",
              "Info@Shaqodoon.org"
            ],
            [
              "phone_number",
              "+252 2 515777"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/ShaqodoonOrganization"
            ],
            [
              "x",
              "https://x.com/shaqodoonorg"
            ],
            [
              "youtube",
              "https://www.youtube.com/@shaqodoonorganization"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/shaqodoon-organization/"
            ]
          ]
        },
        {
          "name": "Democracy Lab",
          "description": "Democracy Lab is a non‑partisan, nonprofit organization based in North Macedonia and the Western Balkans. Committed to strengthening democratic values, it runs a portfolio of impactful projects focusing on media literacy, countering disinformation, civic engagement, youth empowerment, security, and resilience against extremist threats. Democracy Lab fosters transparency, accountability, and institutional reform by building bridges with civil society, supporting journalist capacity, and engaging local communities in democratic participation.",
          "contact": [
            [
              "email",
              "contact@demlab.org"
            ],
            [
              "phone_number",
              "+389 71 305 303"
            ]
          ],
          "media": [
            [
              "x",
              "https://x.com/demlab_org"
            ],
            [
              "instagram",
              "https://www.instagram.com/democracy_lab/"
            ],
            [
              "facebook",
              "https://www.facebook.com/Demlab.org/"
            ]
          ]
        },
        {
          "name": "Kruševac Geto",
          "description": "Serbian-based YouTube channel producing entertainment, social commentary, and cultural content. Known for humorous videos, interviews, street surveys, and creative productions that engage youth and regional audiences while fostering discussion on social norms and everyday life.",
          "contact": [
            [
              "email",
              "cemprescrispung@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/getokrusevac"
            ],
            [
              "instagram",
              "https://www.instagram.com/getokrusevac/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@krusevacgeto_"
            ],
            [
              "youtube",
              "https://www.youtube.com/c/Kru%C5%A1evacGetoOFFICIAL"
            ]
          ]
        },
        {
          "name": "Nataša Gardašević",
          "description": "Nataša Kovačević is a Montenegrin digital creator, novelist, and podcast host known for her outspoken advocacy on gender equality, gender-based violence, and mental health. Through her social media presence, she combines personal storytelling, activism, and cultural commentary to engage a broad audience on issues of human rights and social justice.",
          "contact": [
            [
              "email",
              "njezvanova081@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/njezvanova"
            ],
            [
              "facebook",
              "https://www.facebook.com/natasa.gardasevic.37/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@njezvanova"
            ]
          ]
        },
        {
          "name": "Emerald Podbićanin",
          "description": "Bosnian YouTuber, cross-platform software engineer, and founder of the Bosnian music collective Huligani iz Gimnazije, creating digital content and music collaborations.",
          "contact": [
            [
              "email",
              "emeban.97@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/emeban"
            ],
            [
              "youtube",
              "https://www.youtube.com/@higtv1"
            ]
          ]
        },
        {
          "name": "Tert.am",
          "description": "Leading Armenian political-analytical news platform offering prompt, multi‑genre coverage of developments in Armenia, the South Caucasus, and around the world. Available in Armenian, Russian, and English, Tert.am operates 24/7 and includes news reports, live updates, opinion pieces, and interviews with both local and international experts",
          "contact": [
            [
              "email",
              "editor@tert.am"
            ],
            [
              "phone_number",
              "+374 41 768838"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/TERTam.arm"
            ],
            [
              "instagram",
              "https://www.instagram.com/tert_am/"
            ]
          ]
        },
        {
          "name": "NEWS.am",
          "description": "NEWS.am is an Armenian news platform providing real-time updates on politics, society, economy, and global events. It delivers content in Armenian, Russian, and English, covering national developments, regional affairs, and international news.",
          "contact": [
            [
              "email",
              "editor@news.am"
            ],
            [
              "phone_number",
              "+374 99 203212"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/newsamarm"
            ],
            [
              "instagram",
              "https://www.instagram.com/news.am"
            ],
            [
              "x",
              "https://x.com/NEWSam_Armenian"
            ]
          ]
        },
        {
          "name": "Aravot",
          "description": "Aravot is an Armenian online news outlet covering domestic, regional, and international developments across politics, society, economy, and culture. It provides in-depth reporting, analysis, and commentary, positioning itself as a source for reliable and timely information for Armenian and global audiences.",
          "contact": [
            [
              "email",
              "news@aravot.am"
            ],
            [
              "phone_number",
              "+374 60 274801"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/aravot.am/"
            ],
            [
              "instagram",
              "https://www.instagram.com/aravot.am/"
            ],
            [
              "x",
              "https://x.com/aravotdaily"
            ],
            [
              "telegram",
              "https://t.me/aravot"
            ],
            [
              "youtube",
              "https://www.youtube.com/user/AravotDaily"
            ]
          ]
        },
        {
          "name": "Mediamax",
          "description": "Mediamax is an Armenian online media outlet that provides in-depth reporting, interviews, and analysis on political, economic, and social issues in Armenia and the broader region. It publishes in Armenian, Russian, and English, offering both daily news updates and long-form features.",
          "contact": [
            [
              "phone_number",
              "+374 10 545431"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Mediamax.am"
            ],
            [
              "instagram",
              "https://www.instagram.com/mediamax.am/"
            ],
            [
              "x",
              "https://x.com/MediamaxEnglish"
            ],
            [
              "telegram",
              "https://telegram.me/s/mediamaxam"
            ]
          ]
        },
        {
          "name": "Factor.am",
          "description": "Factor.am is an Armenian news platform offering timely and comprehensive reporting across politics, economy, society, and culture. Covering domestic and international developments, it features sections such as politics (domestic, foreign, regional, global), economy, society, education, law, sports, and culture. The site publishes news, video reporting, commentary, and special features.",
          "contact": [
            [
              "email",
              "info@factor.am"
            ],
            [
              "phone_number",
              "+374 77 311080"
            ]
          ],
          "media": [
            [
              "youtube",
              "https://www.youtube.com/@Factortv"
            ],
            [
              "facebook",
              "https://www.facebook.com/factor.am/"
            ],
            [
              "telegram",
              "https://t.me/factoram"
            ]
          ]
        },
        {
          "name": "Hetq",
          "description": "Established in 2001 by the Investigative Journalists NGO in Yerevan, Hetq is Armenia’s premier investigative online newspaper. Publishing in Armenian since its inception and in English since 2002, it delivers in-depth investigative reporting, groundbreaking analyses, and multimedia storytelling covering corruption, human rights, environment, technology, and more. Hetq pioneered Armenia’s first journalistic Code of Ethics and has spearheaded professional development initiatives such as the Hetq Media Factory and the InFact fact‑checking network",
          "contact": [
            [
              "email",
              "info@hetq.am"
            ],
            [
              "phone_number",
              "+374 10 580219"
            ]
          ],
          "media": [
            [
              "youtube",
              "https://www.youtube.com/@HetqTV"
            ],
            [
              "facebook",
              "https://www.facebook.com/hetqonline"
            ],
            [
              "telegram",
              "https://t.me/hetqonline"
            ],
            [
              "instagram",
              "https://www.instagram.com/hetq_online/"
            ],
            [
              "x",
              "https://x.com/Hetq_Trace"
            ]
          ]
        },
        {
          "name": "Aliq Media Armenia",
          "description": "Aliq Media is a modern Armenian news and analytical platform established around 2020. It has quickly gained recognition for providing breaking news, reliable reporting, and critical commentary delivered in clear, accessible language. The outlet produces a wide range of multimedia content articles, video programs, podcasts, and interviews with a focus on thoughtful analysis of local, regional, and global affairs",
          "contact": [
            [
              "email",
              "aliqmediainfo@gmail.com"
            ]
          ],
          "media": [
            [
              "youtube",
              "https://www.youtube.com/@aliqmediaarmenia"
            ],
            [
              "facebook",
              "https://www.facebook.com/aliqmediaarm/"
            ]
          ]
        },
        {
          "name": "CivilNet",
          "description": "CivilNet is an independent, bilingual online media outlet launched in 2011 by the Civilitas Foundation. It is based in Yerevan, Armenia, and produces evidence-based news, analysis, documentaries, and explanatory journalism. CivilNet emphasizes deep dives into democracy, human rights, regional peace, and diasporic issues and consistently asks not only what happened but also why and how. It operates with high journalistic standards, including fact-checking certifications and active participation in international fact-checking network.",
          "contact": [
            [
              "email",
              "info@civilnet.am"
            ],
            [
              "phone_number",
              "+374 10 500119"
            ]
          ],
          "media": [
            [
              "youtube",
              "https://www.youtube.com/@CivilNetTV"
            ],
            [
              "facebook",
              "https://www.facebook.com/CivilNet.TV/"
            ],
            [
              "instagram",
              "https://www.instagram.com/civilnet.am/"
            ],
            [
              "x",
              "https://x.com/CivilNetTV"
            ],
            [
              "telegram",
              "https://t.me/civilnetv"
            ]
          ]
        },
        {
          "name": "Azatutyun (Radio Free Europe/Radio Liberty – Armenian Service)",
          "description": "Azatutyun serves as the Armenian arm of RFE/RL, delivering digital-first, independent journalism from Yerevan. It provides in-depth reporting and multimedia coverage including radio, podcasts, and videos on local and regional developments, from conflict and displacement to women’s rights and government accountability. Its real-time, trusted coverage, particularly on sensitive issues like the Armenia-Azerbaijan conflict and social justice, makes it one of the most influential media voices in Armenia.",
          "contact": [
            [
              "email",
              "yerevan@rferl.org"
            ],
            [
              "phone_number",
              "+374 10 544019"
            ]
          ],
          "media": [
            [
              "youtube",
              "https://www.youtube.com/azatutyunradio"
            ],
            [
              "facebook",
              "https://www.facebook.com/azatutyun"
            ],
            [
              "instagram",
              "https://www.instagram.com/azatutyuntv/"
            ],
            [
              "x",
              "https://x.com/azatutyunradio"
            ],
            [
              "telegram",
              "https://t.me/azatutyuntv"
            ]
          ]
        },
        {
          "name": "EVN Report",
          "description": "EVN Report is an independent, non-profit English-language online weekly magazine based in Yerevan. Established in 2017, it delivers in-depth reporting, analysis, commentary, and multimedia storytelling across politics, economy, society, technology, arts, and regional security aimed at fostering critical discourse, increasing media trust, and connecting Armenia’s evolving narrative with both diaspora and global audiences",
          "contact": [
            [
              "email",
              "editorial@evnreport.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/evnreport/"
            ],
            [
              "instagram",
              "https://www.instagram.com/evnreport"
            ],
            [
              "x",
              "https://x.com/evn_report"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/evn-report/"
            ]
          ]
        },
        {
          "name": "Armenian Times",
          "description": "Armtimes.com is the digital continuation of Haykakan Zhamanak, a prominent independent Armenian daily newspaper founded in 1999 and relaunched online. It delivers timely, objective, and in-depth coverage of political, economic, social, legal, cultural, and international developments. The site integrates daily news, photo reports, expert analysis, and archives, serving as one of Armenia's leading platforms for independent journalism",
          "contact": [
            [
              "email",
              "info@armtimes.com"
            ],
            [
              "phone_number",
              "+374 10 581175"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/HaykakanJamanak/"
            ],
            [
              "youtube",
              "https://www.youtube.com/user/armtimestv/videos"
            ],
            [
              "telegram",
              "https://t.me/armtimes_com"
            ]
          ]
        },
        {
          "name": "Panorama.am",
          "description": "Launched in 2005, Panorama.am is a major Armenian online news portal offering fast and broad coverage of current affairs. It publishes news, analysis, and opinion pieces in Armenian, Russian, and English spanning politics, economy, culture, sports, science, entertainment, health, and more .",
          "contact": [
            [
              "email",
              "info@panorama.am"
            ],
            [
              "phone_number",
              "+374 77 598799"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/PanoramaAM"
            ]
          ]
        },
        {
          "name": "Aysor.am",
          "description": "Aysor.am (Armenian for \"Today\") is a fast-paced online news portal delivering up-to-the-minute coverage of events in Armenia across categories like politics, economy, law, health, technology, and regional affairs. It offers content in Armenian, Russian, and English and features breaking news updates, analyses, and reports on developments from domestic to international spheres.",
          "contact": [
            [
              "email",
              "info@aysor.am"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/aysor.am"
            ],
            [
              "youtube",
              "https://www.youtube.com/@AysorTV"
            ],
            [
              "instagram",
              "https://www.instagram.com/aysor.am.official/"
            ]
          ]
        },
        {
          "name": "PanARMENIAN",
          "description": "PanARMENIAN.Net is the first Armenian online news and analysis agency, launched on April 2, 2000, and based in Yerevan. It operates under the umbrella of the PanArmenian Network NGO. The platform delivers comprehensive coverage news, analysis, interviews, photo series, and topic-focused reports in Armenian, Russian, and English. It aims to create a pan-Armenian information space and enhance Armenia’s global representation through modern information and communication technologies.",
          "contact": [
            [
              "email",
              "pr@pan.am"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/panarmenian.net"
            ]
          ]
        },
        {
          "name": "1in.am",
          "description": "1in.am short for \"First Informative\" is a dynamic Armenian online news portal, hosted out of New York. It publishes in Armenian, Russian, and English, offering a wide array of timely coverage across local, regional (Caucasus), and global affairs. Its sections span Armenia, the world, press affairs, business, sports (the latter two primarily in Armenian), and more. The site integrates real-time streaming via its 1in TV service and ranks among the most visited news platforms in Armenia.",
          "contact": [
            [
              "email",
              "arajinlratvakan@gmail.com"
            ],
            [
              "phone_number",
              "+374 77 520467"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/1in.am"
            ],
            [
              "instagram",
              "https://www.instagram.com/1in.am/"
            ],
            [
              "telegram",
              "https://t.me/arajinTV"
            ],
            [
              "youtube",
              "https://www.youtube.com/@1inTVArmenia"
            ]
          ]
        },
        {
          "name": "Infocom.am",
          "description": "Infocom.am launched in 2018 as a project of the “Information Committee” non-profit is an independent Armenian digital outlet that blends a verified news aggregator with original, data-driven journalism. It produces deep investigative reports, research-driven content, science and legal coverage, and fact-checked news, aiming to equip citizens with accurate, timely information essential for informed decision-making and advancing democratic principles in Armenia.",
          "contact": [
            [
              "email",
              "info@infocom.am"
            ],
            [
              "phone_number",
              "+374 41 463626"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/infocomm"
            ],
            [
              "instagram",
              "https://www.instagram.com/infocom.am"
            ],
            [
              "telegram",
              "https://t.me/infocomm"
            ],
            [
              "youtube",
              "https://www.youtube.com/@infocomam"
            ],
            [
              "x",
              "https://x.com/infocom_am"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@infocom.am"
            ]
          ]
        },
        {
          "name": "A1+",
          "description": "A1+ is a long-standing Armenian independent media network that began as a television channel in 1991 and evolved into an online-first news platform after being shut down by authorities in 2002. Today, its website delivers timely and objective news, interviews, live streams, and videos covering politics, society, culture, sports, business, and more",
          "contact": [
            [
              "email",
              "info@a1plus.am"
            ],
            [
              "phone_number",
              "+374 55 551261"
            ]
          ],
          "media": [
            [
              "x",
              "https://x.com/a1plusnews"
            ],
            [
              "facebook",
              "https://www.facebook.com/a1plus.am/"
            ],
            [
              "youtube",
              "https://www.youtube.com/user/a1plusnews"
            ]
          ]
        },
        {
          "name": "Armenpress",
          "description": "Armenpress, founded on December 18, 1918, is Armenia’s oldest and main state news agency. It provides timely, verified, and multilingual coverage of domestic, regional, and international events.",
          "contact": [
            [
              "email",
              "contact@armenpress.am"
            ],
            [
              "phone_number",
              "+374 11 539818"
            ]
          ],
          "media": [
            [
              "x",
              "https://x.com/armenpress"
            ],
            [
              "facebook",
              "https://www.facebook.com/armenpress"
            ],
            [
              "youtube",
              "https://www.youtube.com/@ArmenpressNewsAgencyArmenia"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@armenpressnews"
            ],
            [
              "instagram",
              "https://www.instagram.com/armenpress"
            ]
          ]
        },
        {
          "name": "Hromadske",
          "description": "Hromadske is Ukraine’s independent, NGO-owned digital media outlet, launched in November 2013 by journalists seeking editorial freedom and incorruptible reporting. It delivers high-impact, multimedia coverage including breaking news, investigative stories, explanatory analysis, documentaries, podcasts, and live streams focused on politics, war, corruption, human rights, society, and culture.",
          "contact": [
            [
              "email",
              "editor@hromadske.ua"
            ],
            [
              "phone_number",
              "+380 67 505 6740"
            ]
          ],
          "media": [
            [
              "x",
              "https://x.com/Hromadskeua"
            ],
            [
              "facebook",
              "https://www.facebook.com/hromadskeua"
            ],
            [
              "youtube",
              "https://www.youtube.com/@hromadske_ua"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@hromadske.ua"
            ],
            [
              "instagram",
              "https://www.instagram.com/hromadske.ua/"
            ],
            [
              "telegram",
              "https://t.me/hromadske_ua"
            ]
          ]
        },
        {
          "name": "Euroradio",
          "description": "Euroradio is an independent, non-profit Belarusian media outlet launched in 2006 in Warsaw by Belarusian journalists. It broadcasts in Belarusian and Russian via FM, satellite, and the internet, offering independent news, cultural programming, music, and human rights content. Despite being blocked and labeled \"extremist\" by Belarusian authorities, it remains one of the most trusted sources for objective information in Belarus and continues its mission from safe havens abroad.",
          "contact": [
            [
              "email",
              "info@euroradio.fm"
            ]
          ],
          "media": [
            [
              "x",
              "https://x.com/euroradio"
            ],
            [
              "facebook",
              "https://www.facebook.com/euroradio.fm"
            ],
            [
              "youtube",
              "https://www.youtube.com/@EuroradioLive"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@euroradio"
            ],
            [
              "instagram",
              "https://www.instagram.com/euroradio/"
            ],
            [
              "telegram",
              "https://t.me/euroradio"
            ]
          ]
        },
        {
          "name": "JAMnews",
          "description": "JAMnews is a multilingual, independent media platform based in Tbilisi (Georgia), with regional presence across the Caucasus including Yerevan, Baku, Sokhumi, and Tskhinvali. Founded in 2016, it brings together journalists, authors, and experts from across the region to deliver in-depth, verified, and multi-perspective reporting in Armenian, Azerbaijani, English, Georgian, Russian and often other languages. The outlet is known for cross-border, solution-oriented, explanatory journalism and a robust media school for emerging regional journalists.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/JAMnewsInEnglish/"
            ],
            [
              "x",
              "https://x.com/JAMnewsCaucasus"
            ],
            [
              "youtube",
              "https://www.youtube.com/@JAMnewsinEnglish"
            ],
            [
              "instagram",
              "https://www.instagram.com/jam_news/"
            ]
          ]
        },
        {
          "name": "Ziarul de Gardă (ZdG)",
          "description": "Ziarul de Gardă (ZdG) is Moldova’s leading independent investigative weekly, founded in 2004 by Alina Radu and Aneta Grosu to expose corruption, human rights abuses, and public corruption. It publishes in Romanian and Russian, with web content also available in English. Across platforms including print editions, trilingual digital portals, video, radio, social media, and investigative events ZdG stands out as the most trusted, widely read, and award-winning investigative media group in the country.",
          "contact": [
            [
              "email",
              "zdg.redactia@gmail.com"
            ],
            [
              "phone_number",
              "+373 790 20 007"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/zdg.md"
            ],
            [
              "x",
              "https://x.com/ziarul_de_garda"
            ],
            [
              "youtube",
              "https://www.youtube.com/@Ziarul_de_Garda"
            ],
            [
              "telegram",
              "https://t.me/zdgmd"
            ]
          ]
        },
        {
          "name": "Muyiwa Afolabi",
          "description": "Prominent Nigerian business and career coach, brand strategist, social reformer, and media entrepreneur. He founded and leads Frontiers International Limited",
          "contact": [
            [
              "email",
              "info@frontiersconsulting.net"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/FranklySpeakingWithMuyiwaAfolabi"
            ],
            [
              "instagram",
              "https://www.instagram.com/franklyafolabi/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@Muyiwa.Afolabi"
            ]
          ]
        },
        {
          "name": "Peace Itimi",
          "description": "Peace Itimi is a Nigerian entrepreneur, marketer, and media host, best known as the founder of The Founders Connect Show, where she interviews African startup founders and innovators. An MBA candidate at Imperial College Business School, she focuses on technology, entrepreneurship, and storytelling to spotlight Africa’s business and innovation ecosystem.",
          "contact": [
            [
              "email",
              "thefoundersconnect@gmail.com"
            ]
          ],
          "media": [
            [
              "x",
              "https://x.com/peaceitimi"
            ],
            [
              "youtube",
              "https://www.youtube.com/peaceitimiofficial"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/in/peaceitimi/"
            ],
            [
              "instagram",
              "https://www.instagram.com/peaceitimi"
            ]
          ]
        },
        {
          "name": "Tricia Biz",
          "description": "Tricia \"Business Fixer\" is a Nigerian business consultant, author, and global speaker who helps entrepreneurs grow and fix their businesses. As an impact investor and trainer, she empowers startups and SMEs through practical strategies, workshops, and motivational content, with a focus on sustainable growth and innovation.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/triciabiz/"
            ]
          ]
        },
        {
          "name": "Basra Press 24",
          "description": "Basra Press 24 is a comprehensive Iraqi news agency based in Basra, delivering breaking news, political updates, economic developments, and social issues affecting Iraq and the wider region. With a large following, it serves as a key source of timely information for local and regional audiences.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/BasraPress24/"
            ]
          ]
        },
        {
          "name": "Babylon the Gate of Gods",
          "description": "Babylon the Gate of Gods is a popular cultural and historical Facebook page dedicated to exploring the legacy of Mesopotamian civilizations, particularly focusing on Babylon and the heritage of ancient Iraq. The platform shares historical facts, archaeological findings, and cultural narratives, aiming to educate and inspire audiences about one of the world’s earliest and most influential civilizations.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/babylon.gods.gate.015/"
            ],
            [
              "instagram",
              "https://www.instagram.com/babylon_the_gate_of_gods"
            ]
          ]
        },
        {
          "name": "Shroogy and proud",
          "description": "A Facebook community page representing the voices of Southern Iraqis, highlighting their struggles, cultural identity, and political views. The page often shares news, commentary, and opinions on regional and national issues, amplifying the perspectives of marginalized communities in Iraq.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/shr00ky/"
            ]
          ]
        },
        {
          "name": "South of Iraq",
          "description": "جنوب العراق (South of Iraq) is a popular Arabic-language Facebook community page with over 117K followers, sharing content related to daily life, social issues, and challenges faced by people in southern Iraq, particularly focusing on vulnerable groups, gender issues, and local governance.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/janubaliraq/"
            ]
          ]
        },
        {
          "name": "Alnasria Madinaty",
          "description": "A popular local Facebook community page based in Nasiriyah, Iraq, that covers news, social updates, and local issues relevant to residents of the Dhi Qar province. With over 370K followers, it serves as a key hub for regional updates, community voices, and public discussions.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/profile.php?id=100071286025249#"
            ]
          ]
        },
        {
          "name": "Akhbar Almaysan",
          "description": "Akhbar Maysan is a local Iraqi community news platform focused on reporting developments in Maysan governorate and beyond. It highlights social, political, and governance issues affecting residents, providing a voice for civic concerns and regional identity. The page engages audiences across generations, offering commentary on governance, rights, and community challenges.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/MyssanNews/"
            ]
          ]
        },
        {
          "name": "Iraqi Comment",
          "description": "\"Iraqi Comment\" is a highly followed Iraqi social media page that curates and shares humorous, satirical, and popular commentary drawn from user-submitted comments, memes, and trending discussions. The platform functions as a digital community space where Iraqis engage in humor, debate, and cultural commentary, often blending entertainment with light social critique.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/comment.iraqi/"
            ]
          ]
        },
        {
          "name": "Iraqi Memes and Comics",
          "description": "Iraqi Memes and Comics is a popular entertainment page dedicated to humor and satire, sharing memes and comic content inspired by Iraqi culture and everyday life. It blends humor with social commentary, resonating with audiences across Iraq through relatable and often nostalgic posts.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/IraqiMemesandComics/"
            ]
          ]
        },
        {
          "name": "House of Iraqis",
          "description": "A large-scale Facebook community page with over 1M followers, focusing on clan affairs, governance, and social-political issues in Iraq. It often highlights mediation, conflict resolution, and the role of tribes in Iraqi society and politics.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/iraqs12/"
            ]
          ]
        },
        {
          "name": "Baghdad Projects",
          "description": "Baghdad Projects is an independent media and news platform focused on documenting and sharing updates on infrastructure, architecture, and development projects in Baghdad. It provides coverage of construction, urban renewal, and modernization efforts in the Iraqi capital, attracting audiences both locally and in the Iraqi diaspora.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/BaghdadProjects/"
            ],
            [
              "instagram",
              "https://www.instagram.com/baghdadprojects/"
            ]
          ]
        },
        {
          "name": "Sakore Zakriya",
          "description": "A highly followed Iraqi public figure page from Mosul that engages audiences with political commentary, governance issues, and regional affairs. It frequently highlights local and international politics, reflecting the concerns of young Iraqis, journalists, and policy stakeholders.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/sakore.z/"
            ],
            [
              "instagram",
              "https://www.instagram.com/sakeralzakarai/?hl=en"
            ]
          ]
        },
        {
          "name": "Noora Qaissi",
          "description": "Noora Qaissi is an Iraqi digital creator and activist based in Sweden. With a significant following on Facebook and Twitter/X, she is known for outspoken commentary on women’s rights, social justice, and political issues in Iraq. Her content often highlights gender-based discrimination, freedom of expression, and government accountability, while also connecting with diaspora audiences concerned about Iraq’s future.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/noora.qaissi.1"
            ],
            [
              "instagram",
              "https://www.instagram.com/noormqaissi"
            ],
            [
              "x",
              "https://x.com/nooraqaissi"
            ]
          ]
        },
        {
          "name": "Abrar Alani",
          "description": "Abrar Alani is an Iraqi public figure with a strong following on Facebook, where she engages with political, social, and civic issues. She often highlights governance, accountability, and human rights matters while addressing challenges facing Iraqi society. Her posts indicate advocacy for reform, transparency, and community empowerment.",
          "contact": [
            [
              "email",
              "Ahmdabrar56@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/AbrrarAlani/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@abrar_alanii"
            ],
            [
              "x",
              "https://x.com/alaniabrar"
            ]
          ]
        },
        {
          "name": "Breaking News",
          "description": "Iraq’s most followed breaking news platforms, with over 1.8M followers. It delivers fast updates on politics, security, and local events, often featuring political figures, parliamentary affairs, and major incidents. The page acts as a real-time news wire for Iraqis, blending political analysis with live developments and urgent reports.",
          "contact": [
            [
              "phone_number",
              "+964 772 459 8846"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/khabarajeal/"
            ],
            [
              "instagram",
              "https://www.instagram.com/kabrajeal"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@shkhabaraj"
            ]
          ]
        },
        {
          "name": "Al Ghad News",
          "description": "Al Ghad News is a popular Iraqi news platform that publishes political, social, and local news updates, with a focus on video-based coverage. The page highlights both breaking news and human-interest stories, often emphasizing community issues, governance, and local political dynamics. It aims to present \"freedom of opinion and expression\" to its audience while engaging them with a strong visual style.",
          "contact": [
            [
              "email",
              "alghadnews1@gmail.com"
            ],
            [
              "phone_number",
              "+964 771 731 8606"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/ALGHAdnew2019/"
            ]
          ]
        },
        {
          "name": "Latest Iraqi Events",
          "description": "A widely followed Iraqi Facebook page that shares breaking news, crime stories, local incidents, and human-interest content. Posts often include dramatic videos, eyewitness accounts, and appeals to the community, aiming to capture attention with emotionally charged narratives.",
          "contact": [
            [
              "email",
              "akhralahdathalraqyt@gmail.com"
            ]
          ],
          "media": []
        },
        {
          "name": "Nabd Al-Iraq",
          "description": "Nabd Al-Iraq is a highly followed Iraqi Facebook page focusing on entertainment, celebrity updates, and personal stories that spark emotional or viral engagement. Its content is often centered on popular figures, social gossip, family life, and personality-driven narratives that resonate with wide audiences across Iraq and the diaspora. The page mixes humor, drama, and sensational headlines, often amplifying individual stories into national talking points.",
          "contact": [
            [
              "email",
              "nbdalraq026@gmail.com"
            ]
          ],
          "media": []
        },
        {
          "name": "Beit Kteyo",
          "description": "Iraqi satirical page that blends humor with social commentary. The platform engages audiences by using irony and entertainment to highlight political, social, and cultural issues. While primarily comedic, its content often reflects underlying frustrations and everyday realities of Iraqi society, resonating strongly with youth and broader community groups.",
          "contact": [
            [
              "email",
              "bktyw21@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/beet.kteeoiraq/"
            ]
          ]
        },
        {
          "name": "Qabgh",
          "description": "Qabgh is a highly popular Iraqi digital creator known for producing humorous, satirical cartoon content. The page mixes animated caricatures with commentary on everyday Iraqi life, social issues, and politics. The tone is lighthearted, sarcastic, and visually engaging, often using exaggerated characters and scenarios to entertain while subtly critiquing social norms and governance.",
          "contact": [
            [
              "phone_number",
              "+964 771 197 9524"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Qabagh1"
            ],
            [
              "youtube",
              "https://www.youtube.com/@Qabagh/featured"
            ]
          ]
        },
        {
          "name": "Ahmed Waheed",
          "description": "Ahmed Waheed is a popular Iraqi comedian, satirist, and content creator with a large digital following. His work blends political and social satire with everyday humor, often highlighting corruption, governance issues, and cultural contradictions. He is active on both Facebook (2.1M followers) and Twitter/X (196K followers), producing skits, parody videos, and social commentary. His comedic style resonates strongly with younger audiences but also attracts cross-generational viewers, making him an influential voice in Iraqi entertainment and civic discourse.",
          "contact": [
            [
              "email",
              "ibrahim@hayahost.uk"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Ahmed.WaheedMa"
            ],
            [
              "youtube",
              "https://www.youtube.com/@AHMED.WAHEED"
            ],
            [
              "instagram",
              "https://www.instagram.com/ahmedwaheeeeed"
            ],
            [
              "x",
              "https://x.com/ahmedwa93188516"
            ]
          ]
        },
        {
          "name": "Made in Iraq",
          "description": "This page is strongly oriented toward economic nationalism, local industry promotion, and citizen-driven accountability. Its audience focus leans toward business owners, policymakers, older demographics, and consumers invested in Iraqi-made products.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/1q964/"
            ],
            [
              "instagram",
              "https://www.instagram.com/madeiq"
            ]
          ]
        },
        {
          "name": "News Mosul Now",
          "description": "Local news updates, photos, and event coverage, with a focus on Mosul infrastructure, development projects, and current events.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/mosul.newsnoww#"
            ]
          ]
        },
        {
          "name": "Salam Al-Rojbeyane",
          "description": "Salam Al-Rojbeyane identifies as a social researcher with professional ties to the Iraqi Ministry of Labor and Social Affairs and the Social Protection Committee. His content focuses on administrative issues, citizen dignity, social justice, and local governance. The posts often highlight bureaucratic inefficiencies, citizens’ struggles, and policy-related updates, using a mix of personal commentary, advocacy, and calls for accountability. His tone is critical yet grounded in civic responsibility, positioning himself as a voice for reform and improved governance.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/salam.al.rojbeyane/"
            ]
          ]
        },
        {
          "name": "From Baghdad",
          "description": "A major Iraqi news and media platform with over 2 million followers. It publishes political, economic, and social content, covering Iraq’s internal developments, international relations, and issues of governance. The page blends breaking news, analysis, and public opinion, positioning itself as both a media outlet and civic voice.",
          "contact": [
            [
              "phone_number",
              "+1 240-232-2220"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/MnBaghdad"
            ],
            [
              "instagram",
              "https://www.instagram.com/mnbaghdad"
            ]
          ]
        },
        {
          "name": "Hilla street 40",
          "description": "This Facebook community page focuses on social, cultural, and local issues in Babil province. It shares updates on governance matters (e.g., Ministry of Education decisions), community news, religious and cultural content, and youth-focused discussions. The page mixes official updates with local perspectives, appealing to both young Iraqis and broader community stakeholders.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/hillastreet40"
            ],
            [
              "instagram",
              "https://www.instagram.com/hilla.street40"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@hilla.street40?"
            ]
          ]
        },
        {
          "name": "Alforat TV – Basra branch",
          "description": "Local branch of Alforat TV, a national Iraqi television channel. The Basra page focuses on regional news, religious content, economic updates (such as currency exchange rates), and political developments. It often highlights religious ceremonies, governance updates, and financial/economic matters relevant to local and national audiences.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/aIbasra.hd/"
            ]
          ]
        },
        {
          "name": "Baghdadi Women",
          "description": "A popular Iraqi community Facebook page sharing news, cultural updates, and social issues relevant to Baghdad and wider Iraq. The page highlights local events, government initiatives, and social campaigns, attracting large-scale engagement from both Iraqi residents and the diaspora.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/profile.php?id=100064546097870#"
            ],
            [
              "instagram",
              "https://www.instagram.com/baghdadyat.1"
            ]
          ]
        },
        {
          "name": "Karrada",
          "description": ": Community page for residents of Baghdad’s Karrada district, sharing news, events, and issues relevant to local life. Content includes tributes, religious observances, fire incidents, and regional news.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/www.karrada/"
            ]
          ]
        },
        {
          "name": "Iraqi Comment",
          "description": "Popular social media page dedicated to showcasing satirical, comedic, and witty takes on daily Iraqi life, politics, religion, and society. The page often posts memes, humorous commentary, and viral jokes that resonate with younger audiences while occasionally addressing serious issues with sarcasm. It positions itself as a space for Iraqis to laugh at the absurdities of daily life and reflect on broader societal themes through humor.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/comment.iraqi/"
            ],
            [
              "instagram",
              "https://www.instagram.com/iraqi_comment_"
            ]
          ]
        },
        {
          "name": "Basrah",
          "description": "A regional Facebook news and media page focusing on political, legal, and governance-related updates in Basra, Iraq. It shares official documents, judicial council reports, and political commentary, serving as a local watchdog on governance and accountability issues.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Basra2009/"
            ]
          ]
        },
        {
          "name": "Memories of the Good Generation",
          "description": "A nostalgic and community-oriented public figure page with over 2M followers, focusing on cultural memories, local initiatives, and civic updates. Posts often mix sentimental content with coverage of community development projects, social issues, and public concerns. The page blends emotional connection with informational updates, making it both a cultural and civic touchpoint for a large audience.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/old.lraq/"
            ]
          ]
        },
        {
          "name": "Al-Iraq",
          "description": "A public figure/community-style page focused on Iraqi identity, politics, and regional issues. It highlights stories on citizenship, governance, and social affairs, such as the Kuwaiti government’s withdrawal of citizenship from individuals of Iraqi origin and subsequent Iraqi citizenship applications. The page often amplifies nationalistic narratives while spotlighting policy decisions and their impacts on Iraqis.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Iraq1/"
            ]
          ]
        },
        {
          "name": "Magda Boska Śmietnikoska",
          "description": "Centered on conscious consumption, anti-waste practices, and sustainable living. Content often highlights the problems of overconsumption, the benefits of reusing and exchanging items, and critiques of consumer culture. Posts mix personal reflections, lifestyle tips, and activism in an accessible, relatable tone.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/crush_on_trash/"
            ]
          ]
        },
        {
          "name": "Anna Pięta",
          "description": "Anna Pięta’s Instagram channel hello_pieta focuses on activism, communication, and advocacy. She shares content around environmental justice, social equality, women’s rights, and anti-greenwashing campaigns, often combining political commentary with creative visual storytelling. The account amplifies grassroots movements, highlights systemic inequalities, and engages in cultural and civic debates.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/hello_pieta/"
            ]
          ]
        },
        {
          "name": "Joanna Przetakiewicz",
          "description": "Joanna Przetakiewicz’s Instagram channel blends lifestyle, women’s empowerment, and activism. It showcases her initiatives around female solidarity, self-confidence, and emotional well-being, alongside glimpses of her luxury lifestyle, events, and motivational engagements.",
          "contact": [
            [
              "email",
              "kontakt@eranowychkobiet.com"
            ],
            [
              "phone_number",
              "660 423 417"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/joannaprzetakiewicz/"
            ]
          ]
        },
        {
          "name": "Natalia Panchenko",
          "description": ": Ukrainian civic activist and public figure using Instagram to mobilize around Ukrainian independence, culture, and rights. The channel highlights activism in exile, diaspora organizing, national identity, and political advocacy, often centered on community events and solidarity with Ukraine.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/natalia.ua/"
            ]
          ]
        },
        {
          "name": "Miłosz Wiatrakowski-Bujacz",
          "description": "Miłosz Wiatrakowski-Bujacz uses his Instagram channel miłosz.między.innymi to discuss issues of solidarity, justice, and human rights, with strong focus on Palestine, anti-war activism, and progressive politics. He shares reflections, book recommendations, and political commentary, often contextualized within global conflicts and their social impact. His content blends intellectual discussion with activism and advocacy.",
          "contact": [
            [
              "email",
              "milosz.miedzy.innymi@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/milosz.miedzy.innymi/"
            ]
          ]
        },
        {
          "name": "Martyna Wojciechowska",
          "description": "Martyna Wojciechowska’s Instagram channel presents her as a journalist, filmmaker, writer, and activist. It combines personal storytelling with professional highlights, humanitarian initiatives, travel, and advocacy for women and at-risk communities. Her content bridges media, activism, and lifestyle, while also highlighting her foundation work and projects.",
          "contact": [
            [
              "email",
              "office@martyna.pl"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/martyna.world/"
            ]
          ]
        },
        {
          "name": "Katarzyna Błażejewska-Stuhr",
          "description": "This channel belongs to a nutritionist and psychodietitian who shares content focused on healthy eating, mental well-being, and lifestyle balance. The posts combine personal reflections, professional diet tips, recipes, and motivational insights. The creator emphasizes mindful eating, food as a source of health and joy, and holistic approaches to well-being.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/kach_blazejewska_dietetyk/"
            ]
          ]
        },
        {
          "name": "Łukasz Bogusławski",
          "description": "Łukasz Bogusławski’s Instagram is a personal and lifestyle-focused profile blending wellness, creativity, and everyday reflections. His content includes candid snapshots of daily life, artistic photography, music/concert scenes, casual fashion, and moments with friends, pets, and travel. The overall tone is intimate, authentic, and visually minimalistic, resonating with a younger audience interested in aesthetics, lifestyle, and relatable experiences.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/lookashh/"
            ]
          ]
        },
        {
          "name": "Agnieszka Grzelak",
          "description": "Polish beauty and travel content creator who combines lifestyle vlogs, makeup tutorials, and explorations of global destinations. Her content is energetic, playful, and strongly rooted in aesthetics, often blending personal style with humor, fashion, and popular culture references. She also covers broader lifestyle topics and collaborates with international brands, bridging entertainment with personal expression.",
          "contact": [
            [
              "email",
              "a.grzelak.makeup@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/agagrzelakk/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@AgaGrzelakVlog"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@aga_grzelak"
            ]
          ]
        },
        {
          "name": "Sofiia Blidchenko",
          "description": "Sofi Liabi shares lifestyle and personal content on TikTok, mixing humor, daily reflections, travel snippets, and fitness/acrobatics. Her style is relatable and authentic, often blending everyday experiences with light social commentary.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@sofiiabi"
            ]
          ]
        },
        {
          "name": "Karolina Brzuszczyńska",
          "description": "Lifestyle, fitness, and empowerment-focused Instagram account mixing personal style, wellness routines, fitness content, and glimpses into everyday life. Strong emphasis on visual aesthetics, aspirational lifestyle, and community engagement.",
          "contact": [
            [
              "email",
              "kontakt@wayofblonde.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@way.of.blonde"
            ],
            [
              "instagram",
              "https://www.instagram.com/way.of.blonde/"
            ]
          ]
        },
        {
          "name": "Anita Sokołowska",
          "description": "Actress and public figure sharing lifestyle, acting career highlights, cultural engagement, and occasional activism. Mix of personal life, entertainment, and social issue awareness.",
          "contact": [
            [
              "email",
              "patryk@wolski.management"
            ],
            [
              "phone_number",
              "+48 512033733"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@anita_sokolowskaa"
            ],
            [
              "instagram",
              "https://www.instagram.com/anita_sokolowskaa/"
            ]
          ]
        },
        {
          "name": "Maja Ostaszewska",
          "description": "Advocacy for human rights and social justice; outspoken voice on gender equality and LGBTQ+ inclusion; support for migrants and humanitarian issues; cultural influence through film and theatre.",
          "contact": [
            [
              "email",
              "tom.kolarski@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/ostaszewskamaja_official/"
            ]
          ]
        },
        {
          "name": "Magda Łucyan",
          "description": "Reporting on climate change and environmental challenges; coverage of social and political issues in Poland; author of books on history, resilience, and human rights; journalism focused on connecting past lessons with present crises.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/magda_lucyan"
            ]
          ]
        },
        {
          "name": "Gdzie Bądź",
          "description": "Storytelling around sustainable travel and outdoor adventures; family-oriented content blending parenting with responsible tourism; promotion of environmental awareness and cultural exchange",
          "contact": [
            [
              "email",
              "gdziegdziebadz@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/gdziebadz"
            ],
            [
              "facebook",
              "https://www.facebook.com/gdziebadz/"
            ],
            [
              "youtube",
              "https://www.youtube.com/c/GDZIEB%C4%84D%C5%B9"
            ]
          ]
        },
        {
          "name": "Szymon Bożycki",
          "description": "Digital creator producing youth-oriented content through humor, lifestyle, and music; active in online culture and entertainment; engaging Gen Z audiences through creative expression and social media trends.",
          "contact": [
            [
              "email",
              "shimmy@aat.management"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/shimmybruh/"
            ]
          ]
        },
        {
          "name": "Paulina Grabowska",
          "description": "Content creator blending lifestyle, pop culture, and fandom communities; engages large youth audiences with entertainment, reviews, and personal storytelling; promotes online community-building and digital creativity.",
          "contact": [
            [
              "email",
              "kontakt@baoliin.pl"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/baoliin/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@baoliin"
            ]
          ]
        },
        {
          "name": "Bartosz Suchowiak",
          "description": "Digital creator producing humorous and relatable lifestyle content; connects with youth through fashion, comedy, and everyday storytelling; cultivates online community around self-expression and entertainment.",
          "contact": [
            [
              "email",
              "bartosz@aat.management"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/suchy.bartus/"
            ]
          ]
        },
        {
          "name": "Olia Haponchukk",
          "description": "Ukrainian creator in Poland sharing personal stories of migration, adaptation, and family life; builds supportive digital spaces for displaced communities; content highlighting everyday resilience and cross-cultural experience",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@olia_haponchukk"
            ]
          ]
        },
        {
          "name": "Oksana Shevchenko",
          "description": "Ukrainian blogger in Poland documenting migrant life, parenting, and integration; provides guidance for fellow Ukrainians navigating education, work, and adaptation abroad; shares personal reflections on identity, displacement, and resilience",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/oksana_krakowmama"
            ],
            [
              "telegram",
              "https://t.me/oksana_krakowmama"
            ]
          ]
        },
        {
          "name": "Oksana",
          "description": "Digital creator sharing candid lifestyle, motherhood, and personal storytelling; engages audiences with humorous and relatable content around daily challenges, family, and self-expression.",
          "contact": [
            [
              "email",
              "oksi.kontakt@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/oksiii____"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@oksiii______"
            ]
          ]
        },
        {
          "name": "Daria Fetsiak",
          "description": "Ukrainian digital creator sharing motivational and lifestyle content; engages audiences with humor, personal reflections, and beauty-related storytelling; builds an online community around resilience and everyday empowerment.",
          "contact": [
            [
              "email",
              "dasza.cooperation@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@prosto_dasza"
            ]
          ]
        },
        {
          "name": "Aleksandra Dulkiewicz",
          "description": "Mayor of Gdańsk advocating for democratic governance, civic participation, and European values; vocal on human rights, equality, and inclusive policies; strong presence in promoting community resilience and accountable leadership.",
          "contact": [
            [
              "email",
              "aleksandra.dulkiewicz@gdansk.gda.pl"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/A.Dulkiewicz"
            ],
            [
              "instagram",
              "https://www.instagram.com/adulkiewicz/"
            ],
            [
              "x",
              "https://x.com/Dulkiewicz_A"
            ]
          ]
        },
        {
          "name": "Magdalena Różczka",
          "description": "Actress and humanitarian ambassador engaged with UNICEF and adoption support initiatives; advocates for children’s rights, family welfare, and social inclusion; uses cultural influence to promote empathy and civic solidarity.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/magdalena_rozczka/"
            ]
          ]
        },
        {
          "name": "Joanna Racewicz",
          "description": "Journalist, author, and public speaking coach; known for commentary on politics, society, and women’s empowerment; uses media presence to address democratic values, human rights, and civic responsibility.",
          "contact": [
            [
              "email",
              "biuro@joannaracewicz.pl"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/joannaracewicz/"
            ]
          ]
        },
        {
          "name": "Paulina Krupińska-Karpiel",
          "description": "TV presenter and journalist engaging wide audiences through mainstream media; combines lifestyle and cultural content with social dialogue; leverages her public profile to highlight community values and civic awareness.",
          "contact": [
            [
              "email",
              "biuro.paulina.krupinska@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/pkrupinska/"
            ]
          ]
        },
        {
          "name": "Maciej Musiał",
          "description": "Actor and public figure using his platform to engage youth through culture, entertainment, and social commentary; connects popular media with reflections on history, identity, and contemporary civic values.",
          "contact": [
            [
              "email",
              "dominik@db4.pl"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/maciejmusial_official/"
            ]
          ]
        },
        {
          "name": "Gorod",
          "description": "Gorod.ee is a Russian-language online news platform and weekly newspaper based in Narva, Estonia. It focuses on local and regional news, culture, and community affairs, serving the Russian-speaking population in Ida-Virumaa and across Estonia.",
          "contact": [
            [
              "email",
              "gorod@gorod.ee"
            ],
            [
              "phone_number",
              "+372 558 0640"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/ajalehtgorod/"
            ]
          ]
        },
        {
          "name": "Rusradio",
          "description": "A leading Russian-language radio station based in Moscow, operating since 1995. It offers a mix of chart-topping pop music, entertainment shows (like Русские Перцы and Golden Gramophone), celebrity interviews, and cultural programming across Russia and the CIS.",
          "contact": [
            [
              "phone_number",
              "+7 (495) 995-105-7"
            ],
            [
              "phone_number",
              "+7 (499) 579-77-09"
            ]
          ],
          "media": [
            [
              "youtube",
              "https://www.youtube.com/@russkoe_radio"
            ],
            [
              "telegram",
              "https://t.me/rusradio"
            ]
          ]
        },
        {
          "name": "Radio Raduga",
          "description": "A Russian-language FM radio station based in Klaipėda, Lithuania (100.8 FM), broadcasting from September 1, 2001 until January 17, 2024. It offered 24/7 programming featuring international pop, Russian hits from the ’80s to today, news bulletins, talk segments, and listener games. Operated online as well, serving Russian-speaking communities in Lithuania and beyond.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/radioraduga/"
            ]
          ]
        },
        {
          "name": "LTV.lv",
          "description": "Latvijas Televīzija (Latvian Television), the country’s public service broadcaster. It provides national and international news, analysis, original TV content, cultural programming, and educational initiatives aimed at informing and engaging the Latvian public.",
          "contact": [
            [
              "email",
              "ltv@ltv.lv"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/LatvijasTV/"
            ],
            [
              "x",
              "https://x.com/LatvijasTV"
            ],
            [
              "instagram",
              "https://www.instagram.com/latvijastelevizija"
            ],
            [
              "youtube",
              "https://www.youtube.com/@ltvlv"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@latvijastelevizija"
            ]
          ]
        },
        {
          "name": "ETV+",
          "description": "ETV+ is a Russian-language public TV and multimedia channel in Estonia. It provides a mix of news, entertainment, and educational programming aimed at the Russian-speaking community, highlighting both local Estonian issues and broader international topics. The channel focuses on inclusivity and ensuring minority audiences are engaged and represented.",
          "contact": [
            [
              "email",
              "etvpluss@err.ee"
            ],
            [
              "phone_number",
              "+372 628 4100"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/etvpluss"
            ],
            [
              "instagram",
              "https://www.instagram.com/etvpluss"
            ]
          ]
        },
        {
          "name": "Raadio 4",
          "description": "Raadio 4 / Радио 4 is Estonia’s Russian-language public broadcasting radio channel, part of ERR. It provides news, talk shows, cultural programs, and music, focusing on the Russian-speaking community in Estonia. It covers social issues, local events, and international developments with emphasis on community integration and cultural diversity.",
          "contact": [
            [
              "email",
              "raadio4@err.ee"
            ],
            [
              "phone_number",
              "+372 611 4126"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Raadio4/"
            ],
            [
              "instagram",
              "https://www.instagram.com/raadio4"
            ]
          ]
        },
        {
          "name": "TV3 Plus",
          "description": "TV3 Plus is a Russian-language television channel in Latvia that brands itself as a family entertainment network. It offers a mix of movies, TV series, cartoons, and news segments, focusing on Russian-speaking audiences. The channel highlights both international films and local content while providing Russian-language news coverage relevant to Latvia.",
          "contact": [
            [
              "email",
              "tv3@tv3.lv"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/3pluslv/"
            ],
            [
              "instagram",
              "https://www.instagram.com/tv3eest"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@tv3.lv"
            ],
            [
              "x",
              "https://x.com/tv3lv"
            ]
          ]
        },
        {
          "name": "TavaRiga",
          "description": "TavaRiga.lv is a city portal project from Riga, Latvia, aimed at youth and civic activists. It covers local events, news, and cultural activities while providing a space for young people and communities to engage in social and urban issues.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/tavariga.lv/"
            ],
            [
              "instagram",
              "https://www.instagram.com/tavarigalv/"
            ]
          ]
        },
        {
          "name": "Novaya Gazeta – Baltia",
          "description": "An independent, censorship-free Russian-language news outlet covering the Baltic states (Estonia, Latvia, Lithuania), offering in-depth reporting, analytics, investigative journalism, and commentary on topics including human rights, migration, regional politics, and social issues. It operates across online portals and Europe editions.",
          "contact": [
            [
              "email",
              "info@novayagazeta.ee"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/ngbaltija"
            ],
            [
              "instagram",
              "https://www.instagram.com/ng_baltic"
            ],
            [
              "x",
              "https://x.com/novayabalt"
            ],
            [
              "telegram",
              "https://t.me/ng_baltic"
            ],
            [
              "youtube",
              "https://www.youtube.com/@%D0%9D%D0%BE%D0%B2%D0%B0%D1%8F%D0%93%D0%B0%D0%B7%D0%B5%D1%82%D0%B0-%D0%91%D0%B0%D0%BB%D1%82%D0%B8%D1%8F"
            ]
          ]
        },
        {
          "name": "Alternatives and Analyzes",
          "description": "Analyses & Alternatives is a Bulgarian non-governmental organization founded by experienced analysts specializing in energy, geopolitics, diplomacy, international relations, and security. It publishes in-depth analytical content, convenes strategic discussions, and promotes media freedom to help civil society, institutions, and young researchers navigate complex information landscapes.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/AltAnalyses"
            ],
            [
              "instagram",
              "https://www.instagram.com/alternativatabg/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@AlternativesandAnalyses"
            ]
          ]
        },
        {
          "name": "Atlatszo.hu",
          "description": "Átlátszó (Atlatszo.hu) is Hungary’s first nonprofit investigative journalism outlet and watchdog NGO, established in 2011. It promotes transparency, accountability, and freedom of information through investigative reporting, whistleblower platforms (MagyarLeaks), FOI request tools (Kimittud), legal actions, and data-driven journalism.",
          "contact": [
            [
              "email",
              "info@atlatszo.hu"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/atlatszo.hu/"
            ],
            [
              "instagram",
              "https://www.instagram.com/atlatszo"
            ],
            [
              "youtube",
              "https://www.youtube.com/c/Atlatszovideo"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@atlatszo.hu"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/atlatszo-hu/"
            ]
          ]
        },
        {
          "name": "Center for European Policy Analysis (CEPA)",
          "description": "A nonprofit, nonpartisan public policy think tank headquartered in Washington, DC, with hubs in London and Brussels. CEPA strengthens the transatlantic alliance by delivering cutting-edge research, analysis, and programs focused on democracy, security, technology, and authoritarian threats from Central and Eastern Europe to North America.",
          "contact": [
            [
              "email",
              "info@cepa.org"
            ],
            [
              "phone_number",
              "+1 202-551-9200"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/CenterforEuropeanPolicyAnalysis/"
            ],
            [
              "instagram",
              "https://www.instagram.com/cepaorg/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@cepa_org"
            ],
            [
              "x",
              "https://x.com/cepa"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/center-for-european-policy-analysis"
            ]
          ]
        },
        {
          "name": "The Centre for East European Policy Studies (CEEPS)",
          "description": "A Latvian think tank established in 2006, CEEPS contributes to advancing Latvia’s foreign policy expertise, particularly on Russia’s development and foreign policy tools. Its research covers Russia’s regional influence, soft power, media policy, and ideological issues, while also building international partnerships and raising public awareness through seminars and publications.",
          "contact": [
            [
              "email",
              "info@appc.lv"
            ],
            [
              "phone_number",
              "+371 67 282 101"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/CentreForEastEuropeanPolicyStudies"
            ],
            [
              "x",
              "https://x.com/APPC_LV"
            ]
          ]
        },
        {
          "name": "Barcelona Centre for International Affairs",
          "description": "CIDOB is an international affairs research centre that, through excellence and relevance, seeks to analyse the global issues that affect political, social and governance dynamics, from the international to the local.",
          "contact": [
            [
              "email",
              "cidob@cidob.org"
            ],
            [
              "phone_number",
              "+34 933 02 64 95"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/CidobBarcelona"
            ],
            [
              "instagram",
              "https://www.instagram.com/cidobbarcelona/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@CIDOBBarcelona"
            ],
            [
              "x",
              "https://x.com/CidobBarcelona"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/cidobbarcelona"
            ]
          ]
        },
        {
          "name": "Defence 24",
          "description": "A leading Polish independent media portal offering expert-driven news, analysis, and commentary on defense policy, armed forces, the defense industry, NATO–EU cooperation, and transatlantic security, serving Central and Eastern Europe in both Polish and English,",
          "contact": [
            [
              "email",
              "kontakt@defence24.pl"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Defence24"
            ],
            [
              "youtube",
              "https://www.youtube.com/@DF24pl"
            ],
            [
              "x",
              "https://x.com/Defence24pl"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/infosecurity24-pl/"
            ]
          ]
        },
        {
          "name": "Demaskuok",
          "description": "A national Lithuanian initiative uniting media, civil society, and the state to combat disinformation using advanced technology and volunteer networks (“elves”) to detect and debunk false news effectively.",
          "contact": [
            [
              "email",
              "info@debunk.eu"
            ]
          ],
          "media": []
        },
        {
          "name": "European Values Center for Security Policy (EuropeanValues.cz)",
          "description": "A Prague-based non-governmental think tank founded in 2005, committed to defending liberal democracy and transatlantic cooperation. It specializes in exposing authoritarian influence—particularly from Russia and China through programs like Kremlin Watch and Red Watch, along with research, policy recommendations, conferences, and security training.",
          "contact": [
            [
              "email",
              "info@europeanvalues.cz"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/EvropskeHodnoty/"
            ],
            [
              "instagram",
              "https://www.instagram.com/europeanvaluescenter/"
            ],
            [
              "youtube",
              "https://www.youtube.com/user/evropskehodnoty"
            ],
            [
              "x",
              "https://x.com/_europeanvalues"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/european-values/"
            ]
          ]
        },
        {
          "name": "Fakenews.pl",
          "description": "A Polish fact‑checking portal run by the “Counteracting Disinformation” Foundation, it debunks fake news, rumors, and manipulations with detailed verifications, expert-backed analysis, and educational tools.",
          "contact": [
            [
              "email",
              "kontakt@fakenews.pl"
            ],
            [
              "phone_number",
              "+48 794 661 721"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/fakenews.polska#"
            ],
            [
              "instagram",
              "https://www.instagram.com/fakenews_pl/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@Fakenewspl"
            ],
            [
              "x",
              "https://x.com/fakenews_pl"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/fakenews-pl/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@fakenewspl"
            ]
          ]
        },
        {
          "name": "GlobalFocus Center",
          "description": "An independent international studies think tank based in Bucharest, Romania, producing in-depth research and analysis on foreign policy, European affairs, good governance, security, and development. It builds regional expertise and supports cooperation across NGOs, experts, and public institutions.",
          "contact": [
            [
              "email",
              "office@global-focus.eu"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/globalfocuscenter"
            ],
            [
              "x",
              "https://x.com/GlobalFocusCntr"
            ]
          ]
        },
        {
          "name": "Laisvės TV",
          "description": "An independent Lithuanian online television channel founded in 2016 by journalist Andrius Tapinas, funded by viewers. It produces satirical news, investigative journalism, civic initiatives (e.g., “SKAIDRINAM”, “Freedom Picnic”), and educational programming to promote civic engagement, transparency, and social responsibility.",
          "contact": [
            [
              "email",
              "bendraukime@laisves.tv"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/laisvestv"
            ],
            [
              "instagram",
              "https://www.instagram.com/laisves_tv/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@LaisvesTV"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/laisves-tv/"
            ]
          ]
        },
        {
          "name": "NATO Strategic Communications Centre of Excellence",
          "description": "A NATO-accredited multinational research and training hub based in Riga, Latvia. StratCom CoE enhances strategic communications capabilities for NATO and allied nations through expert analysis, doctrine development, public diplomacy, education, and innovation in counter-disinformation and hybrid threats.",
          "contact": [
            [
              "email",
              "info@stratcomcoe.org"
            ],
            [
              "phone_number",
              "+371 67 335 463"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/StratComCOE/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@NATOStratComCOE"
            ],
            [
              "x",
              "https://x.com/stratcomcoe"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/nato-strategic-communications-centre-of-excellence/"
            ]
          ]
        },
        {
          "name": "University of Nicosia AI Lab",
          "description": "A research and teaching laboratory within the Computer Science Department at the University of Nicosia, focusing on advanced applications in AI, machine learning, data science, computational social science, smart cities, sentiment analysis, and social network analysis. The lab also hosts outreach events like AI Day for high schoolers and contributes to educational innovation and public seminars.",
          "contact": [
            [
              "email",
              "katakis.i@unic.ac.cy"
            ],
            [
              "email",
              "stassopoulou.a@unic.ac.cy"
            ],
            [
              "phone_number",
              "+357-22-841-731"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/unicailc"
            ],
            [
              "instagram",
              "https://www.instagram.com/universityofnicosia/"
            ]
          ]
        },
        {
          "name": "Political Capital",
          "description": "An independent policy research, analysis, and consulting think tank founded in 2001 in Budapest. Political Capital focuses on democracy, human rights, authoritarian influence, disinformation, and political systems through evidence-based research, public debates, and media contributions.",
          "contact": [
            [
              "email",
              "info@politicalcapital.hu"
            ],
            [
              "phone_number",
              "+36 20 665 0384"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/politicalcapital/"
            ],
            [
              "instagram",
              "https://www.instagram.com/politicalcapital_hu/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@politicalcapitalhungary"
            ],
            [
              "x",
              "https://x.com/Pol_Cap"
            ]
          ]
        },
        {
          "name": "Propastop",
          "description": "An independent Estonian blog run by volunteers dedicated to exposing propaganda, disinformation, and manipulative narratives in the media. It fact-checks misleading claims, analyzes hostile narratives, and explains the motives and tactics behind information operations in Estonia’s media space.",
          "contact": [
            [
              "email",
              "propastop@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/propastop"
            ],
            [
              "instagram",
              "https://www.instagram.com/propastop"
            ],
            [
              "x",
              "https://x.com/propastop"
            ]
          ]
        },
        {
          "name": "Vouliwatch",
          "description": "A Greek nonpartisan civic tech organization and parliamentary watchdog platform launched in 2014. It enhances democratic transparency by enabling citizens to track MPs’ votes (\"Votewatch\"), submit questions to representatives, and access public legislative and financial data—bridging the gap between citizens and parliament. It also advocates for open governance through FOI requests and legal action.",
          "contact": [
            [
              "email",
              "info@vouliwatch.gr"
            ],
            [
              "phone_number",
              "+30 21 3038 6340"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/vouliwatch"
            ],
            [
              "instagram",
              "https://www.instagram.com/vouliwatch/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@VouliwatchgrNGO"
            ]
          ]
        },
        {
          "name": "Association of Independent Press",
          "description": "A non-commercial organization founded in 1997, API supports independent media and journalists across Moldova. It strengthens professional capacities, resilience, and media policy through training, psychological support, advocacy, fact-checking, and projects like media literacy campaigns and election monitoring.",
          "contact": [
            [
              "email",
              "api@api.md"
            ],
            [
              "phone_number",
              "+373 22 220 996"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/www.API.md/"
            ],
            [
              "instagram",
              "https://www.instagram.com/api.md/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@asociatiapreseiindependent70"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/asocia%C8%9Bia-presei-independente-api/"
            ]
          ]
        },
        {
          "name": "Press Club Belarus",
          "description": "Founded in 2011 by Belarusian media professionals in exile, Press Club Belarus supports independent journalism through professional development, trainings, media ethics workshops, and the \"Press Under Pressure\" initiative that documents repression of journalists under the Lukashenko regime. It operates as a platform for dialogue, capacity building, and advocacy for press freedom amid authoritarian crackdowns.",
          "contact": [
            [
              "email",
              "secretariat@pressclubs.org"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/pressclubs.org"
            ],
            [
              "x",
              "https://x.com/PressClubs"
            ],
            [
              "youtube",
              "https://www.youtube.com/@PressClubs"
            ]
          ]
        },
        {
          "name": "FIP.am",
          "description": "An independent Armenian fact-checking media outlet founded in 2016 by the Union of Informed Citizens. FIP.am specializes in exposing disinformation, manipulations by officials and media, and operates with editorial independence and adherence to journalistic ethics.",
          "contact": [
            [
              "email",
              "fiparmenia@gmail.com"
            ]
          ],
          "media": [
            [
              "telegram",
              "https://t.me/fiparmenia"
            ],
            [
              "facebook",
              "https://www.facebook.com/fiparmenia"
            ],
            [
              "x",
              "https://x.com/FIPArmenia"
            ],
            [
              "youtube",
              "https://www.youtube.com/@FIPFactInvestigationPlatform"
            ],
            [
              "instagram",
              "https://www.instagram.com/fiparmenia/"
            ]
          ]
        },
        {
          "name": "Gavigudet",
          "description": "Gavigudet is a civic movement based in Rustavi, Georgia, launched in 2018 to tackle severe air pollution and environmental degradation caused primarily by local industry. The movement advocates for stronger legislative frameworks, improved enforcement of environmental standards, and increased public awareness about air quality and health. Gavigudet promotes civic activism and responsibility to create a safer, healthier environment in Rustavi and across Georgia.",
          "contact": [
            [
              "email",
              "gavigudet@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/gavigude"
            ],
            [
              "instagram",
              "https://www.instagram.com/gavigudet/"
            ]
          ]
        },
        {
          "name": "Orbeliani Georgia",
          "description": "Empowering citizens across Georgia to identify local challenges and implement solutions through small grants, civic campaigns, and capacity-building; supporting grassroots activism and inclusive decision-making to strengthen democratic participation, social justice, and local accountability in underserved communities.",
          "contact": [
            [
              "email",
              "info@orbelianimeti.ge"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/OrbelianiMeti"
            ],
            [
              "youtube",
              "https://www.youtube.com/@orbelianigeorgia2891"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/orbeliani-meti/"
            ],
            [
              "instagram",
              "https://www.instagram.com/orbelianimeti/"
            ]
          ]
        },
        {
          "name": "Guild – Independent Trade Unions in the Field of Culture and Media",
          "description": "Advocating for the rights and welfare of professionals working in Georgia’s cultural and media sectors; supporting freedom of expression, fair labour conditions, and unionisation in creative industries; promoting cultural workers’ social protections, policy inclusion, and independent media as pillars of democratic resilience.",
          "contact": [
            [
              "email",
              "labourguild@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/LabourGuild"
            ],
            [
              "instagram",
              "https://www.instagram.com/labour_guild/"
            ]
          ]
        },
        {
          "name": "Parents for Education (PFE)",
          "description": "Mobilising parents, educators, and communities to advocate for inclusive, child-centred, and rights-based education in Georgia; promoting transparency, participation, and accountability in education policy; challenging discrimination and working to ensure equal access to quality education for all children, regardless of background or ability.",
          "contact": [
            [
              "email",
              "georgianp4e@gmail.com"
            ],
            [
              "phone_number",
              "+995 32 219 60 80"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/mshoblebiganatlebistvis/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@MshoblebiGanatlebistvis"
            ]
          ]
        },
        {
          "name": "Tozu Gulmamedli",
          "description": "Tozu Gulmamedli is a passionate advocate for women’s rights within Georgia’s ethnic Azeri community. She challenges entrenched traditional gender roles that confine women to domestic spheres and actively speaks out against domestic violence, sexual harassment, and forced marriages. Her work promotes gender equality and empowers women to claim their rights in a culturally sensitive context.",
          "contact": [
            [
              "email",
              "gulmamedova21@gmail.com"
            ],
            [
              "phone_number",
              "595123278"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Tozu.Gul"
            ],
            [
              "instagram",
              "https://www.instagram.com/gul_tozu/"
            ]
          ]
        },
        {
          "name": "Esma Gumberidze",
          "description": "Esma Gumberidze is a prominent Georgian activist advocating for the rights of persons with disabilities. She serves on the board of the Georgian Network of Women with Disabilities and chairs the Platform for New Opportunities. Esma actively participates in government consultative councils and engages in international youth networks including Generation Democracy and the UN’s GRACE Initiative. She writes and contributes on key issues such as disability rights, corruption, women’s rights, peacebuilding, youth empowerment, and financial and media literacy. Esma holds a B.A. in law from Tbilisi State University.",
          "contact": [
            [
              "email",
              "esma@inclusive-policy.org"
            ],
            [
              "phone_number",
              "598 408 194"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/esma.gumberidze"
            ]
          ]
        },
        {
          "name": "Nana Bagalishvili",
          "description": "Nana Bagalishvili is an experienced civil society professional with over 10 years in the sector, specializing in crowdfunding, community advocacy, social media, leadership training, and public speaking. She is the founder of Knowledge Cafe, a multifunctional educational center and social enterprise focused on fostering lifelong learning and active community engagement.",
          "contact": [
            [
              "email",
              "civicinit@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/nana.bagalishvili"
            ],
            [
              "instagram",
              "https://www.instagram.com/bagalishvilinana/"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/in/nana-bagalishvili-b1883041/"
            ]
          ]
        },
        {
          "name": "Mikheil Mumladze",
          "description": "Mishiko Mumladze is a digital creator and founder of the social movement \"We Stand With You,\" which supports the Ukrainian community in Kutaisi, Georgia. He is a social entrepreneur and community leader based in Kutaisi, actively engaged in civic activism and social support initiatives.",
          "contact": [
            [
              "email",
              "mikheilmumladze91@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/mishiko.mumladze"
            ],
            [
              "instagram",
              "https://www.instagram.com/Mishkamilan"
            ]
          ]
        },
        {
          "name": "Akaki Saghinadze",
          "description": "Akaki is a prominent activist advocating for democracy and human rights. He founded the movement “We Stand With You” to support Ukrainians in Georgia and currently serves as Deputy Chairperson of Regional Strengthening of Democracy – RED.",
          "contact": [
            [
              "email",
              "akakisaghinadze@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/akaki.saghinadze.5"
            ],
            [
              "instagram",
              "https://www.instagram.com/akaki.saghinadze/"
            ]
          ]
        },
        {
          "name": "Mariam Shekiladze",
          "description": "Mariam Shekiladze is an environmental activist and co-founder of the Museum of Environment Dighomi Meadows. She actively leads and participates in grassroots protests against ecological degradation in the Dighomi area. Mariam is passionate about environmental education, youth empowerment, and civic engagement, striving to protect natural habitats and raise public awareness about climate and ecological issues in Georgia.",
          "contact": [
            [
              "email",
              "marika.shekiladze.emp20@gipa.ge"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/mshekiladze"
            ],
            [
              "instagram",
              "https://www.instagram.com/Mariamshekiladze_"
            ]
          ]
        },
        {
          "name": "Giga Bekauri",
          "description": "Giga Bekauri is a passionate defender of labour rights within the arts and culture sectors. As a founder member of the creative guild Guild, he works to empower artists and cultural workers, advocating for fair working conditions and stronger labour protections. Giga also previously led the Youth GTUC (Trade Union of Georgia), where he championed young workers’ rights, focusing on mobilizing and educating youth about labour issues and social justice.",
          "contact": [
            [
              "email",
              "gigabekauri@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/gigabekaurifb"
            ],
            [
              "instagram",
              "https://www.instagram.com/bekaurigiga/"
            ]
          ]
        },
        {
          "name": "Center for Civil Integration and Inter-Ethnic Relations (CCIIR)",
          "description": "Promoting civil integration and interethnic harmony in Georgia through inclusive education, teacher training, and policy reform; supporting minority language rights, multicultural curricula, and equal access to quality education; fostering dialogue and mutual respect among diverse communities to strengthen social cohesion and democratic participation.",
          "contact": [
            [
              "email",
              "info@cciir.ge"
            ],
            [
              "phone_number",
              "+995 32 292 25 95"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/CCIIR/"
            ],
            [
              "x",
              "https://x.com/CCIIRorg"
            ],
            [
              "youtube",
              "https://www.youtube.com/@CCIIRorg"
            ]
          ]
        },
        {
          "name": "Curatio International Foundation",
          "description": "Advancing evidence-based health policy and system reform in Georgia and globally through applied research, capacity-building, and strategic consulting; addressing public health challenges including healthcare equity, pandemic response, and mental health services; promoting accountable governance and data-driven policymaking in health and social protection.",
          "contact": [
            [
              "email",
              "cif@curatio.com"
            ],
            [
              "phone_number",
              "+995 32 225 31 04"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/curatiofoundation"
            ],
            [
              "x",
              "https://x.com/Curatio_CIF"
            ],
            [
              "youtube",
              "https://www.youtube.com/user/CIF1994"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/curatio-international-foundation-cif-/"
            ]
          ]
        },
        {
          "name": "Tamar Jakeli",
          "description": "Tamar Jakeli is the Director of Tbilisi Pride, a leading LGBTQI+ rights organization in Georgia. She has been at the forefront of opposing the Georgian government's 2024 \"anti-LGBT propaganda\" law, which imposes severe restrictions on LGBTQI+ rights, including bans on public gatherings, gender-affirming care, and media representation. Jakeli's activism emphasizes the defense of freedom of expression, assembly, and bodily autonomy for LGBTQI+ individuals in an increasingly repressive environment. Her work involves mobilizing communities, advocating for policy change, and raising international awareness about the challenges faced by LGBTQI+ people in Georgia.",
          "contact": [
            [
              "email",
              "tata@tbilisipride.ge"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/tata.jakeli"
            ],
            [
              "instagram",
              "https://www.instagram.com/tata.jakeli"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@tamar.jakeli"
            ]
          ]
        },
        {
          "name": "Samira Bayramova",
          "description": "Human rights defender and civic activist based in Marneuli, Georgia, advocating for ethnic minority rights, gender equality, and civic participation. Founder of the Journalists’ Network for Gender Equality, she actively campaigns against early and forced marriages, promotes women's empowerment, and challenges far-right extremism. Bairamova has faced threats and harassment for her activism, including protests against pro-Russian political groups and initiatives to support cross-border community ties between Georgia and Azerbaijan.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Samira.Bayramovaa"
            ],
            [
              "instagram",
              "https://www.instagram.com/_samira_bayramova/"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/in/samira-bairamova-b57a04b2/"
            ],
            [
              "x",
              "https://x.com/SamBayramova"
            ]
          ]
        },
        {
          "name": "Luiza Mutoshvili",
          "description": "Civic educator and human rights advocate from Georgia’s Pankisi Valley, working to dismantle ethnic stigma, promote gender equality, and defend minority rights. As a history teacher and youth mentor, she has led programs through the Kakheti Regional Development Foundation (KRDF) to improve access to education and civic participation for Kist youth and women. Mutoshvili has been a vocal critic of state repression, including the militarization of Pankisi, the marginalization of ethnic minorities, and the construction of hydropower plants without community consent. She has faced threats for her work with Pankisi Radio and remains one of the few remaining local voices advocating for justice and inclusion in the region.",
          "contact": [
            [
              "email",
              "pankisicommunity@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/luiza.mutoshvili"
            ],
            [
              "instagram",
              "https://www.instagram.com/tereza_2389/"
            ]
          ]
        },
        {
          "name": "Mariam Kvaratskhelia",
          "description": "Co-founder and former director of Tbilisi Pride, Mariam Kvaratskhelia is a leading LGBTQI+ rights activist in Georgia. She has been instrumental in organizing Pride events and advocating for LGBTQI+ visibility and rights, often facing significant opposition from conservative and far-right groups. Kvaratskhelia emphasizes the importance of peaceful assembly and freedom of expression as tools to combat homophobia and transphobia in Georgian society. Her activism includes community empowerment initiatives, public awareness campaigns, and international advocacy to align Georgia's human rights practices with European standards.",
          "contact": [
            [
              "email",
              "mari.kvara@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/mariami.kvaratskhelia"
            ],
            [
              "instagram",
              "https://www.instagram.com/whoareallofu"
            ]
          ]
        },
        {
          "name": "Archil Marshania",
          "description": "Physician, civic educator, and digital rights advocate in Georgia, Archil Marshania leverages his medical expertise to combat health-related disinformation and promote public health awareness. Through public lectures and social media platforms like TikTok, he addresses topics ranging from COVID-19 myths to the importance of vaccination. Marshania also engages in discussions on discrimination and human rights, aiming to foster critical thinking and resilience against misinformation in Georgian society.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/archil.marshania"
            ],
            [
              "instagram",
              "https://www.instagram.com/archilmarshania/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@dr_marshania"
            ]
          ]
        },
        {
          "name": "Tamar Kuratishvili",
          "description": "Regional organizer and civic activist with Georgia’s Shame Movement, Tamar Kuratishvili has led grassroots mobilization in Batumi since 2020. With a background in journalism and human rights communications, she has coordinated protests against authoritarianism, Russian influence, and the erosion of democratic institutions. Kuratishvili has faced arrests and harassment for her activism, including during a 2024 protest defending the legacy of Georgian war heroes. She continues to play a central role in youth engagement and civil resistance across the Adjara region.",
          "contact": [
            [
              "phone_number",
              "+995 591 99 48 15"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/tamarkuratishvili"
            ],
            [
              "instagram",
              "https://www.instagram.com/takokuratishvili/"
            ]
          ]
        },
        {
          "name": "Tamta Mikeladze",
          "description": "Human rights lawyer, academic, and co-founder of Georgia’s Social Justice Center (formerly EMC), Tamta Mikeladze leads the Equality Policy Programme, focusing on anti-discrimination, minority rights, and civic freedoms. Her work includes strategic litigation at the European Court of Human Rights, research on secularism and religious freedom, and advocacy for LGBTQI+ rights, ethnic minorities, and internally displaced persons. Mikeladze has been a vocal critic of state repression, including police violence, far-right extremism, and authoritarian legal reforms. She has faced state harassment, including interrogation by the State Security Service, for her activism. In 2022, she accepted the OSCE’s Max van der Stoel Award on behalf of the Social Justice Center for advancing minority rights in Georgia.",
          "contact": [
            [
              "email",
              "t.mikeladze@yahoo.com"
            ],
            [
              "phone_number",
              "+995 599 155 977"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/tamta.mikeladze"
            ]
          ]
        },
        {
          "name": "Eastern European Centre for Multiparty Democracy (EECMD)",
          "description": "Promoting democratic development, political pluralism, and civic engagement across Eastern Europe through education, dialogue, and institutional support; delivering Democracy Schools, election integrity initiatives, and leadership training to empower active citizenship and accountable governance in transitional societies.",
          "contact": [
            [
              "email",
              "contact@eecmd.org"
            ],
            [
              "phone_number",
              "+995 32 291 56 50"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/EECMD/,"
            ],
            [
              "x",
              "https://x.com/EECMD_ORG"
            ]
          ]
        },
        {
          "name": "Social Justice Center",
          "description": "Advancing human rights, social equality, and democratic governance in Georgia through legal advocacy, strategic litigation, and community empowerment; challenging structural discrimination against minorities, women, and vulnerable groups; promoting participatory policymaking and accountability in state institutions.",
          "contact": [
            [
              "email",
              "info@socialjustice.org.ge"
            ],
            [
              "phone_number",
              "+995 599 65 66 11"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/socialjustice.org.ge"
            ],
            [
              "x",
              "https://x.com/sjccenter"
            ],
            [
              "youtube",
              "https://www.youtube.com/user/EMCgeorgia"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/human-rights-education-and-monitoring-center-emc/"
            ]
          ]
        },
        {
          "name": "Human Rights Center (HRC) – Georgia",
          "description": "Defending civil, political, and minority rights in Georgia through legal aid, strategic litigation, and human rights monitoring; advocating against torture, discrimination, and abuse of power while supporting victims of state violence and systemic injustice; promoting democratic reform, transparency, and access to justice.",
          "contact": [
            [
              "email",
              "hrc@hrc.ge"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/humanrights.ge"
            ],
            [
              "x",
              "https://x.com/HRCGeorgia"
            ],
            [
              "youtube",
              "https://www.youtube.com/@-hrc7843"
            ]
          ]
        },
        {
          "name": "International Society for Fair Elections and Democracy (ISFED)",
          "description": "Promoting transparent, fair, and inclusive electoral processes in Georgia through independent observation, civic education, and legal advocacy; monitoring elections, political finance, and disinformation to safeguard democratic integrity; empowering citizens and civil society to hold institutions accountable and participate meaningfully in governance.",
          "contact": [
            [
              "email",
              "info@isfed.ge"
            ],
            [
              "phone_number",
              "+995 800 80 01 02"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/isfed.official"
            ],
            [
              "x",
              "https://x.com/isfed_official"
            ],
            [
              "youtube",
              "https://www.youtube.com/@IISFED"
            ],
            [
              "instagram",
              "https://www.instagram.com/isfed_official"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@isfed.official"
            ]
          ]
        },
        {
          "name": "Sapari",
          "description": "Advancing women’s rights and gender equality through legal aid, strategic litigation, and public advocacy; supporting survivors of domestic and sexual violence with trauma-informed services; promoting feminist policy reform, anti-discrimination protections, and the empowerment of marginalised groups in Georgia’s legal and social systems.",
          "contact": [
            [
              "email",
              "info@sapari.ge"
            ],
            [
              "phone_number",
              "+995 599 40 76 03"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/unionsapari"
            ],
            [
              "x",
              "https://x.com/UnionSapari"
            ],
            [
              "instagram",
              "https://www.instagram.com/union.sapari/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@union.sapari"
            ]
          ]
        },
        {
          "name": "Women's Initiatives Supporting Group (WISG)",
          "description": "Advocacy and capacity-building for LGBTQI+ rights and gender equality in Georgia; public education on discrimination and human rights; intersectional feminist analysis in policy and media; community empowerment initiatives.",
          "contact": [
            [
              "email",
              "media@wisg.org"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/WISG.org/"
            ],
            [
              "x",
              "https://x.com/WISG_/"
            ],
            [
              "instagram",
              "https://www.instagram.com/thisiswisg"
            ]
          ]
        },
        {
          "name": "Fund Sukhumi",
          "description": "Peacebuilding and conflict transformation initiatives in post-conflict regions of Georgia; psychosocial support for internally displaced persons (IDPs); violence prevention and gender equality training for youth and communities.",
          "contact": [
            [
              "email",
              "womansukhumi@gmail.com"
            ],
            [
              "phone_number",
              "+995 431 27 13 68"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/WFSukhumi"
            ],
            [
              "youtube",
              "https://www.youtube.com/@fundsokhumi5387"
            ]
          ]
        },
        {
          "name": "Institute for Development of Freedom of Information (IDFI)",
          "description": "Promoting open government and transparent public institutions in Georgia; supporting investigative journalism and access to information; combating corruption through civic monitoring and digital tools for accountability.",
          "contact": [
            [
              "email",
              "info@idfi.ge"
            ],
            [
              "phone_number",
              "+99532 2921514"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/IDFI.official"
            ],
            [
              "youtube",
              "https://www.youtube.com/user/IDFIGeorgia"
            ],
            [
              "x",
              "https://x.com/IDFIGeorgia"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/institute-for-development-of-freedom-of-information-idfi-/"
            ]
          ]
        },
        {
          "name": "Europe-Georgia Institute (EGI)",
          "description": "Youth-focused civic engagement and democratic development initiatives across Georgia; countering authoritarian influence through education and activism; campaigns promoting European integration and media literacy.",
          "contact": [
            [
              "email",
              "info@egi.ge"
            ],
            [
              "phone_number",
              "+995 511 56 30 61"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/chemiEGI/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@europe_georgia"
            ],
            [
              "x",
              "https://x.com/EGI_cso"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/egige/"
            ],
            [
              "instagram",
              "https://www.instagram.com/egi_cso/"
            ]
          ]
        },
        {
          "name": "Georgian Young Lawyers Association (GYLA)",
          "description": "Legal advocacy and strategic litigation on human rights and rule of law in Georgia; civic education on constitutional rights and freedoms; monitoring of elections, public policy, and justice sector reforms.",
          "contact": [
            [
              "email",
              "gyla@gyla.ge"
            ],
            [
              "phone_number",
              "+995 577 07 05 63"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/GYLA.ge"
            ],
            [
              "youtube",
              "https://www.youtube.com/@GYLASAIA"
            ],
            [
              "x",
              "https://x.com/GYLA_CSO"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/gyla-eng/"
            ],
            [
              "instagram",
              "https://www.instagram.com/gyla.ge"
            ]
          ]
        },
        {
          "name": "Partnership for Human Rights (PHR)",
          "description": "Strategic litigation and advocacy for the rights of children, persons with disabilities, and survivors of gender-based violence in Georgia; capacity-building for inclusive public services; mental health and social protection reforms.",
          "contact": [
            [
              "email",
              "phr.georgia@gmail.com"
            ],
            [
              "phone_number",
              "+995 32 233 13 56"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/PHR.HumanRights"
            ],
            [
              "youtube",
              "https://www.youtube.com/@PartnershipForHumanRightsPHR"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/partnership-for-human-rights-phr/"
            ]
          ]
        },
        {
          "name": "Center for Strategy and Development (CSD)",
          "description": "Research and policy analysis on regional security, governance, and disinformation threats; capacity-building for civil society and media on strategic communication; fostering democratic resilience and Euro-Atlantic integration.",
          "contact": [
            [
              "email",
              "gcsd@gcsd.org.ge"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/CSD.org.ge"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/center-for-security-and-development/"
            ]
          ]
        },
        {
          "name": "Georgia's Reforms Associates (GRASS)",
          "description": "Evidence-based policy analysis and advocacy on democratic reforms and Euro-Atlantic integration; strategic communications to counter disinformation; civic education and training for youth, media, and governance stakeholders.",
          "contact": [
            [
              "email",
              "grass@grassgroup.org"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/grassgrouporg/"
            ],
            [
              "x",
              "https://x.com/GRASSORGGE"
            ]
          ]
        },
        {
          "name": "Tolerance and Diversity Institute (TDI)",
          "description": "Legal advocacy and public awareness on religious freedom, minority rights, and anti-discrimination in Georgia; civic education to promote tolerance and social cohesion; strategic litigation for marginalized groups.",
          "contact": [
            [
              "email",
              "info@tdi.ge"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/tdi.ge/"
            ],
            [
              "x",
              "https://x.com/TDI_Georgia"
            ]
          ]
        },
        {
          "name": "Soviet Past Research Laboratory (Sovlab)",
          "description": "Research and public engagement on Soviet-era repression, historical memory, and democratic values in Georgia; educational projects on totalitarianism, civic resistance, and transitional justice; exhibitions, publications, and youth outreach.",
          "contact": [
            [
              "email",
              "info.sovlab@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/sovlab"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@sov.lab"
            ],
            [
              "instagram",
              "https://www.instagram.com/sov.lab"
            ],
            [
              "youtube",
              "https://www.youtube.com/@publicarchive-sovlab8411"
            ]
          ]
        },
        {
          "name": "Democracy Research Institute (DRI)",
          "description": "Research and advocacy on democratic development, minority integration, and human rights in Georgia; monitoring hate speech, extremist narratives, and disinformation; civic education and inclusive policymaking support.",
          "contact": [
            [
              "email",
              "info@democracyresearch.org"
            ],
            [
              "phone_number",
              "+995 32 237 52 28"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Democracy.Research.Institute/"
            ],
            [
              "instagram",
              "https://www.instagram.com/dri_democracyresearchinstitute/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@democracyresearchinstitute7887"
            ]
          ]
        },
        {
          "name": "Ana Kaulashvili",
          "description": "Lifestyle and food content creator sharing accessible recipes, daily routines, and relatable humor; creates engaging short-form videos highlighting Georgian food culture, budget-friendly tips, and personal vlogs with strong aesthetic appeal and authentic tone.",
          "contact": [
            [
              "email",
              "Yaulashviliana@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/anastasia.mikheilisa"
            ],
            [
              "tiktok",
              "tiktok.com/@ana.kaulashvili"
            ],
            [
              "instagram",
              "https://www.instagram.com/ana_kaulashvili"
            ]
          ]
        },
        {
          "name": "Anano Totiauri",
          "description": "Digital creator and youth lifestyle influencer producing content on wellness, daily routines, personal growth, and positivity; engages followers with vlogs, mental health reflections, and creative visuals aimed at empowering young women and building emotional resilience.",
          "contact": [
            [
              "email",
              "AnanoBusiness@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@anano.totiauri"
            ],
            [
              "instagram",
              "https://www.instagram.com/anano.totiauri/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@AnanoTotiauri"
            ]
          ]
        },
        {
          "name": "Nini Gogichaishvili",
          "description": "Professional dancer and digital creator blending performance art with lifestyle content; showcases contemporary dance, body positivity, and youth creativity through expressive short-form videos and behind-the-scenes moments from the Georgian arts scene.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@dancerninii"
            ],
            [
              "instagram",
              "https://www.instagram.com/dancernini/"
            ]
          ]
        },
        {
          "name": "Elene Rukhadze (Foxy Eleniko)",
          "description": "Bold and comedic digital creator known for character-driven skits, social satire, and lifestyle content; explores themes of gender roles, everyday absurdities, and identity through humor and performance, resonating with a wide youth and feminist audience in Georgia.",
          "contact": [
            [
              "email",
              "foxy_collab@yahoo.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@foxy_eleniko"
            ],
            [
              "instagram",
              "https://www.instagram.com/foxy_eleniko/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@FoxyEleniko"
            ]
          ]
        },
        {
          "name": "Giorgi Danelia",
          "description": "Content creator blending humor, commentary, and lifestyle vlogs to engage youth on everyday challenges, societal observations, and personal growth; known for his relatable tone and sharp storytelling that often reflects on identity, culture, and social norms.",
          "contact": [
            [
              "email",
              "Gdaneliabusiness@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@giodannell"
            ],
            [
              "instagram",
              "https://www.instagram.com/giodannell/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@Giodannell"
            ],
            [
              "facebook",
              "https://www.facebook.com/giorgidaneliavlog"
            ]
          ]
        },
        {
          "name": "Giorgi Kalatozi",
          "description": "Sports commentator and content creator known for dynamic, entertaining coverage of football and trending sports events; produces high-energy reactions, match breakdowns, and commentary that resonate with younger audiences across TikTok, YouTube, and Instagram.",
          "contact": [
            [
              "email",
              "octopuscommercial@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@kalatozigiorgi"
            ],
            [
              "instagram",
              "https://www.instagram.com/giorgikalatozi/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@Octopusi"
            ],
            [
              "facebook",
              "https://www.facebook.com/giorgi.kalatozi"
            ]
          ]
        },
        {
          "name": "H1TA (Davit Alavidze)",
          "description": "Multi-platform digital creator and pop culture commentator known for comedic takes on trending news, sports, internet phenomena, and Georgian social quirks. Combines satire, reaction content, and guest interviews to engage a wide youth audience with humor and critical curiosity.",
          "contact": [
            [
              "email",
              "martorqa18@hotmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@h1taa"
            ],
            [
              "instagram",
              "https://www.instagram.com/h1taaa/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@H1Ta/videos"
            ]
          ]
        },
        {
          "name": "Hungryman",
          "description": "Trio of creators producing high-energy, challenge-based content, parody sports commentary, and social experiments; blends humor, pop culture, food reviews, and creative competitions to entertain and engage mass youth audiences across Georgia. Known for their dynamic group chemistry, storytelling, and relatability.",
          "contact": [
            [
              "email",
              "info@hungryman.ge"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@hungryman.ge"
            ],
            [
              "instagram",
              "https://www.instagram.com/hungrymantv/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@hungrymantv/videos"
            ]
          ]
        },
        {
          "name": "Ioane Romanadze (@iooane)",
          "description": "Philosophy student and content creator known for his humorous yet thoughtful takes on life, language, and society; engages followers with Q&A-style videos, commentary on Georgian culture, and intellectually playful dialogues that blur the lines between satire and sincerity.",
          "contact": [
            [
              "email",
              "iiooooaannee@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@iooane"
            ],
            [
              "instagram",
              "https://www.instagram.com/iooane/"
            ]
          ]
        },
        {
          "name": "Katsebi (\"Men\")",
          "description": "Popular Georgian comedy and commentary talk show blending satire, pop culture, and everyday absurdities from a male perspective. With a rotating group of charismatic hosts, Katsebi tackles social taboos, internet culture, and relationships through humor, parody, and candid discussions—building strong resonance with younger male and regional audiences.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@katsebiofficial"
            ],
            [
              "instagram",
              "https://www.instagram.com/katsebi/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@katsebi"
            ],
            [
              "facebook",
              "https://www.facebook.com/katsebi/"
            ]
          ]
        },
        {
          "name": "Keta Bagashvili",
          "description": "Bold, confident digital creator known for empowering commentary on relationships, beauty standards, and personal boundaries. Blends lifestyle content with feminist humor and sharp social critique, speaking directly to young women navigating modern identity, love, and self-worth.",
          "contact": [
            [
              "email",
              "ketabagpr@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@ketabag"
            ],
            [
              "instagram",
              "https://www.instagram.com/ketabag/"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/in/keta-bagashvili-46ab19172/"
            ]
          ]
        },
        {
          "name": "Korsizi (Giorgi Kordize)",
          "description": "Popular digital creator and social commentator blending sports culture, satire, and introspective humor. Through TikTok monologues and collaborations on Hamaki Studio, Giorgi tackles topics ranging from masculinity and identity to football fandom and generational struggles with wit and authenticity.",
          "contact": [
            [
              "email",
              "info@hamaki.studio"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@korsizi"
            ],
            [
              "instagram",
              "https://www.instagram.com/kooridzeg/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@hamakistudio"
            ]
          ]
        },
        {
          "name": "Lika Jorbenadze",
          "description": "Charismatic lifestyle and relationship content creator blending humor, storytelling, and fashion aesthetics. Lika's videos center around romantic dynamics, family moments, beauty, and food offering highly relatable and emotionally engaging content for a wide female and youth audience.",
          "contact": [
            [
              "email",
              "likajorbenadze.collab@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@likajorben"
            ],
            [
              "instagram",
              "https://www.instagram.com/likajorbenadze/"
            ]
          ]
        },
        {
          "name": "Linako (Lina Giunashvili)",
          "description": "Bright and expressive content creator blending humor, personal storytelling, and cultural commentary. Lina’s content ranges from comedic reflections on daily life to explorations of art spaces, festivals, and social awkwardness engaging young audiences with a distinctive blend of charm, honesty, and creativity.",
          "contact": [
            [
              "email",
              "linako.cornish@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@liiinako"
            ],
            [
              "instagram",
              "https://www.instagram.com/liiinako/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@pinklinako"
            ]
          ]
        },
        {
          "name": "Lukrecius Sitchinava",
          "description": "Creates engaging literary and cultural content in Georgian, blending book reviews, language jokes, and social commentary. His videos often explore national identity, civic values, and media consumption with humor and emotional resonance, particularly aimed at younger audiences. He contributes to informal civic education through popular formats, helping demystify complex topics like identity, propaganda, and history.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@bookrecius"
            ],
            [
              "instagram",
              "https://www.instagram.com/lukrecius_sichinava/"
            ]
          ]
        },
        {
          "name": "Mamia Kublashvili",
          "description": "Produces fast-paced, culturally attuned video content combining humor, lifestyle commentary, and emotionally honest vignettes from contemporary Georgian life. His work oscillates between satire, pop-culture dissection, and gender role inversion, often poking fun at societal expectations, masculinity, and youth struggles. His storytelling style resonates particularly with younger viewers navigating identity, relationships, and digital culture.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@mkublashvili"
            ],
            [
              "instagram",
              "https://www.instagram.com/m.kublashvili/"
            ]
          ]
        },
        {
          "name": "Manana Gvritishvili",
          "description": "Co-creator of the family-friendly content brand \"oritertnairi,\" Manana Gvritishvili produces imaginative, empowering, and educational videos aimed at children and tweens. Blending humor, emotional intelligence, social learning, and playful role-play formats, the platform nurtures creativity, curiosity, and confidence in young audiences. With viral reach on TikTok and a clear mission to promote self-belief and inclusive imagination, her work helps normalize open dialogue, kindness, and expression among Georgian youth.",
          "contact": [
            [
              "email",
              "Mananagvritishvilii@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@mananavaricodet"
            ],
            [
              "instagram",
              "https://www.instagram.com/mananavaricodet/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@oriertnairi"
            ]
          ]
        },
        {
          "name": "Mancho Nozadze",
          "description": "A prominent voice in Georgian digital culture, Mancho blends humor, vulnerability, and advocacy through storytelling on motherhood, societal expectations, and emotional resilience. Her direct-to-camera monologues and casual commentary confront issues such as parental burnout, women’s autonomy, and mental health in an accessible, often humorous tone. She creates a space for dialogue on gendered experiences and normalizes emotional expression and self-awareness, especially among women and young parents.",
          "contact": [
            [
              "email",
              "Manchonozadze30@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@manchonozadze"
            ],
            [
              "instagram",
              "https://www.instagram.com/manchonozadze__/"
            ]
          ]
        },
        {
          "name": "Giorgi Nachkebia (Mandrein)",
          "description": "Giorgi Nachkebia creates dynamic street interviews, reaction content, and social commentary that reflect the pulse of Georgian youth culture. Blending sports fandom, tech trends, humor, and quickfire public Q&As, his content offers a window into generational attitudes on pop culture, civic knowledge, and digital literacy. While his tone remains light and engaging, his platform has potential as a vehicle for soft civic education and public awareness.",
          "contact": [
            [
              "email",
              "ggnachkebia@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@mandrein"
            ],
            [
              "instagram",
              "https://www.instagram.com/mandrein_/"
            ]
          ]
        },
        {
          "name": "Mariam Jighaurishvili",
          "description": "Mariam Jighaurishvili uses a direct-to-camera, emotionally resonant storytelling style to discuss themes such as injustice, social exclusion, and the everyday experiences of young women in Georgia. Her content often touches on issues of systemic inequality, gender norms, and public accountability, mixing social critique with relatable personal reflections. Her voice is part of a growing ecosystem of digitally native commentary that resonates across gender-aware, socially conscious Gen Z audiences.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@mariamm.blog"
            ],
            [
              "instagram",
              "https://www.instagram.com/mariamjighaurishvili"
            ]
          ]
        },
        {
          "name": "Mariam Napetvaridze",
          "description": "Mariam blends aesthetics, vulnerability, and unapologetic self-expression in her digital storytelling. Through fashion, wellness, and lifestyle content, she engages with themes of autonomy, body image, self-worth, and emotional resilience. Her calm confidence, paired with occasional direct audience address, positions her as a relatable micro-influencer for young women navigating empowerment, appearance politics, and inner strength in modern Georgian society.",
          "contact": [
            [
              "email",
              "Mariam.napetvaridze.1@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@itsmariamnaa"
            ],
            [
              "instagram",
              "https://www.instagram.com/itsmariamna/"
            ]
          ]
        },
        {
          "name": "Megan Beridze",
          "description": "Megan Beridze documents her experiences as a Georgian migrant in Europe, combining lifestyle vlogging, reflective video diaries, and family-centered content. Through gentle, narrative-driven storytelling, she touches on adaptation, career-building abroad, and emotional health. Her candid tone and multilingual storytelling style help normalize the migrant journey while promoting empathy and resilience among dispersed youth and families.",
          "contact": [
            [
              "email",
              "meganbrdz@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@meganberidze"
            ],
            [
              "instagram",
              "https://www.instagram.com/meganberidze/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@meganberidze/"
            ]
          ]
        },
        {
          "name": "Misho Rostomiani",
          "description": "Misho Rostomiani blends construction site humor, everyday social critique, and physical labor into comedic yet relatable content that highlights working-class realities in Georgia. His distinctive mix of satire, masculinity, and absurdism bridges cultural commentary with blue-collar storytelling. By spotlighting economic precarity, generational frustration, and gender norms—often through self-deprecating skits—Misho resonates with male youth and underrepresented regional audiences.",
          "contact": [
            [
              "email",
              "Mikheil.rostomian@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@mishorostomiani"
            ],
            [
              "instagram",
              "https://www.instagram.com/mishorostomiani/"
            ]
          ]
        },
        {
          "name": "Nana Aroshidze",
          "description": "Ti Machavariani is a digital storyteller and cultural commentator who blends fashion, philosophy, and poetic introspection across platforms. Her content is deeply aesthetic, often rooted in personal narrative, feminist perspective, and soft-spoken critique of social norms. Through visual metaphors and monologues, she explores topics such as self-expression, emotional agency, and women's autonomy—offering a powerful voice for youth seeking identity, beauty, and critical thought beyond algorithmic trends.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@ti_machavariani"
            ],
            [
              "instagram",
              "https://www.instagram.com/ti_machavariani/"
            ]
          ]
        },
        {
          "name": "Sali Shubitidze",
          "description": "Sali Shubitidze combines her roles as a musician, producer, and digital creator to deliver content that merges creativity with thoughtful commentary on youth experiences, societal expectations, and cultural identity. Through humor, self-produced music, and direct dialogue with her audience, she fosters emotional resilience, individuality, and self-expression. Her voice bridges the creative arts with conversations around mental health and gender norms in contemporary Georgia.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@salishubitidze"
            ],
            [
              "instagram",
              "https://www.instagram.com/salien___/"
            ]
          ]
        },
        {
          "name": "Salome Lemonjava",
          "description": "Salome Lemonjava balances roles as a mother, journalist, and digital creator. Her content blends personal storytelling with a nuanced public voice on social issues, emotional wellbeing, and informal civic dialogue. As a business journalist and vocal critic of authoritarian politics, she also integrates subtle civic education and public accountability themes into her daily lifestyle content, resonating with millennial women navigating family, identity, and social responsibility.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@salomelemonjava"
            ],
            [
              "instagram",
              "https://www.instagram.com/salomelemonjava/"
            ],
            [
              "facebook",
              "https://www.facebook.com/salome.lemonjava/"
            ]
          ]
        },
        {
          "name": "Salome Totchkua",
          "description": "Salome Totchkua produces highly personal, emotionally vulnerable video content focused on wellbeing, mental health, and life balance. She shares candid reflections on emotional struggles, self-care, relationships, and personal development, often breaking cultural taboos around open emotional dialogue in Georgia. Her audience connects with her authenticity, making her a relatable voice on mental health and gendered experiences for young women navigating anxiety, burnout, and identity formation.",
          "contact": [
            [
              "email",
              "salome.toshkua16@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@salometoshkua"
            ],
            [
              "instagram",
              "https://www.instagram.com/salomitoshkua/"
            ]
          ]
        },
        {
          "name": "Sandro Gotsiridze",
          "description": "Sandro Gotsiridze is a satirical content creator who uses exaggerated characters, role-play, and situational comedy to reflect on Georgian social dynamics, gender norms, and generational conflicts. Through humor rooted in everyday dialogue and exaggerated stereotypes, his skits address topics like family relations, regional stereotypes, and societal expectations. His content resonates widely across age groups, offering a unique format for informal social critique.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@san.gotsiridze"
            ],
            [
              "instagram",
              "https://www.instagram.com/san.gotsiridze/"
            ]
          ]
        },
        {
          "name": "Tako Lochoshvili (@influtako)",
          "description": "Tako Lochoshvili creates intimate, candid video content combining emotional vulnerability, everyday reflection, and self-presentation. Her monologues often explore personal well-being, confidence, relationships, and emotional self-regulation, positioning her as a relatable voice for young women navigating identity formation, mental health, and emotional agency in Georgian digital culture. She represents a growing cohort of Gen Z influencers blending wellness content with informal peer-led civic dialogue.",
          "contact": [
            [
              "email",
              "Lochoshvilitako2@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@influtako"
            ],
            [
              "instagram",
              "https://www.instagram.com/lochoshvilit/"
            ]
          ]
        },
        {
          "name": "Tato Batsikadze",
          "description": "Tato Batsikadze is one of Georgia’s leading sports commentators, widely recognized for his energetic, engaging, and culturally resonant coverage of both national and international sporting events. Beyond live commentary, his growing digital presence allows him to connect with younger audiences around national identity, collective pride, and civic values through the lens of sports. His public persona contributes to informal civic education by fostering dialogue around teamwork, resilience, public discourse, and community cohesion.",
          "contact": [],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/batsikadze"
            ],
            [
              "instagram",
              "https://www.instagram.com/tato_batsikadze/"
            ]
          ]
        },
        {
          "name": "Tako Kacharava",
          "description": "Tato Karchava produces lifestyle, career, and identity-driven digital content blending vlogging, cultural commentary, and personal storytelling. Living and studying abroad, her content often touches on the experience of navigating identity as a Georgian in Europe, career aspirations, youth mobility, and emotional wellbeing. She uses light humor and personal reflection to engage a young audience on topics of self-growth, adaptation, and belonging.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@tatokarchava"
            ],
            [
              "instagram",
              "https://www.instagram.com/tk.tato/"
            ]
          ]
        },
        {
          "name": "Tinatin Abuladze",
          "description": "Tikosha is a high-energy lifestyle and beauty content creator who combines humor, sibling dynamics, daily vlogging, and makeup tutorials into highly engaging videos. With her strong personal brand, she normalizes conversations around beauty standards, confidence, emotional vulnerability, and interpersonal relationships, particularly targeting young women navigating identity, appearance, and self-worth in contemporary Georgian society.",
          "contact": [
            [
              "email",
              "tikooshaa@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@tikooshaaa"
            ],
            [
              "instagram",
              "https://www.instagram.com/tikooshaa/"
            ]
          ]
        },
        {
          "name": "Zura Balanchivadze",
          "description": "Zura Balanchivadze blends journalism, cultural history, and storytelling to make Georgian history, religion, art, and politics accessible to young digital audiences. Through concise TikTok explainers, visual storytelling, and educational monologues, he fosters civic knowledge, historical awareness, and critical engagement with Georgia’s national identity. His accessible historical commentary bridges gaps between formal civic education and popular youth-oriented platforms.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@zurriuss"
            ],
            [
              "instagram",
              "https://www.instagram.com/zurriuss/"
            ]
          ]
        },
        {
          "name": "Lizi Khudjadze (Elizabeth Leps)",
          "description": "Elizabeth Leps creates visually rich, highly curated travel and lifestyle content centered on global luxury destinations, fashion, and wellness. While primarily positioned in the aesthetic and aspirational travel space, her content intersects with broader discussions around women's independence, global mobility, and aspirational identity-building among young women in Georgia. Her platform exemplifies how soft narratives of personal freedom, mobility, and self-confidence intersect with lifestyle storytelling.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@elizabethleps"
            ],
            [
              "instagram",
              "https://www.instagram.com/elizabethleps/"
            ],
            [
              "facebook",
              "https://www.facebook.com/elizabeth.leps.2025"
            ]
          ]
        },
        {
          "name": "David And Dogs",
          "description": "David And Dogs combines emotional storytelling, dog care education, and light humor to engage large audiences across Georgia and beyond. His videos humanize pet ownership, responsible animal care, and emotional bonding, while offering an informal platform for promoting empathy, emotional wellbeing, and responsible community values. His influence extends into broader youth emotional culture, where narratives of care, responsibility, and kindness circulate in accessible formats.",
          "contact": [
            [
              "email",
              "davidanddogs5@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@david_and_dogs"
            ],
            [
              "instagram",
              "https://www.instagram.com/david_and_dogs/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@DavidAndDogs"
            ]
          ]
        },
        {
          "name": "Escanor on Earth",
          "description": "Escanor On Earth crafts a visually striking persona combining rural Georgian landscapes, masculinity, rural labor, and fine arts. His content balances traditional shepherding, hyper-masculine imagery, and aesthetic art creation, offering a highly unique blend of cultural pride, physicality, and creative self-expression. He challenges stereotypical narratives of masculinity while elevating rural identity, nature, and emotional vulnerability through artistic formats.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@escanor_on_earth"
            ],
            [
              "instagram",
              "https://www.instagram.com/escanor_on_earth/"
            ]
          ]
        },
        {
          "name": "Giorgi Mgaloblishvili (GI2GI)",
          "description": "GI2GI is one of the leading figures in Georgia’s digital gaming and streaming scene, producing long-form YouTube content, live streams, competitive game analysis, and interactive challenges. His platform serves as a cultural hub for Gen Z audiences interested in gaming culture, digital skills, tech literacy, and participatory entertainment. While primarily focused on entertainment, his platform indirectly cultivates digital competencies, online community engagement, and youth socialization in virtual environments.",
          "contact": [
            [
              "email",
              "gi2gicontact@gmail.com"
            ]
          ],
          "media": [
            [
              "youtube",
              "https://www.youtube.com/@GI2GI/"
            ]
          ]
        },
        {
          "name": "George Sarishvili",
          "description": "George Sarishvili is one of Georgia’s leading automotive content creators, producing detailed car reviews, test drives, and motorsport commentary for a growing Gen Z and millennial audience. His long-form YouTube content combines technical expertise with entertainment, fostering interest in technology, innovation, mechanics, and digital production skills. His content also indirectly cultivates a culture of tech curiosity, responsible driving, and public conversation around innovation and transportation.",
          "contact": [
            [
              "email",
              "g.sarishvili300@gmail.com"
            ]
          ],
          "media": [
            [
              "youtube",
              "https://www.youtube.com/@GeorgeSarishviliOfficial/videos"
            ],
            [
              "facebook",
              "https://www.facebook.com/GeorgeSarishviliOfficial/"
            ]
          ]
        },
        {
          "name": "Giviko Didia",
          "description": "Giviko Didia documents a deeply personal, multi-generational rural Georgian family life, sharing intimate portrayals of everyday care, resilience, and emotional warmth. His content creates a highly relatable narrative around family bonds, elder care, rural traditions, and emotional wellbeing, offering a gentle but powerful counter-narrative to fast-paced, urbanized digital culture. Through intergenerational storytelling, he contributes to civic narratives about empathy, caregiving, dignity, and social inclusion.",
          "contact": [
            [
              "email",
              "givikodidiaofficial@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/giviko_didia/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@GivikoDidia"
            ]
          ]
        },
        {
          "name": "Omar Chitishvili (Go Let's Play)",
          "description": "GoLetsPlay produces hybrid gaming, automotive, and unboxing content targeted at a growing Georgian gaming and tech-interested audience. His multi-format content combines humor, detailed gaming walkthroughs, consumer electronics, car reviews, and playful tech commentary. While rooted primarily in entertainment, his platform contributes to the development of digital literacy, gaming culture, and youth tech engagement — providing informal exposure to technical knowledge, online community dynamics, and digital participatory culture.",
          "contact": [
            [
              "email",
              "goolatsplay@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/ochitishvili"
            ],
            [
              "youtube",
              "https://www.youtube.com/@GoLetsPlayo8/"
            ],
            [
              "facebook",
              "https://www.facebook.com/ochitishvili/"
            ]
          ]
        },
        {
          "name": "Gzadagza",
          "description": "GZADAGZA operates as a new generation digital media platform blending podcasting, satire, commentary, and humor to critically discuss social, political, cultural, and civic topics in Georgia. It serves as a safe space for complex dialogue, bringing younger audiences into discussions around governance, societal tensions, generational differences, gender roles, and media culture. GZADAGZA combines civic awareness with humor, irony, and approachable language, making difficult or politically sensitive topics digestible to younger audiences.",
          "contact": [
            [
              "email",
              "gzadagzamedia@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/gzadagza/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@Gzadagza/"
            ],
            [
              "facebook",
              "https://www.facebook.com/gzadagza"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@gzadagza"
            ]
          ]
        },
        {
          "name": "Jano Jino Gossip",
          "description": "Jano Jino operates in the intersection of influencer culture, entertainment commentary, gossip, and humor with strong resonance among digital-native Gen Z and Millennial audiences. His style blends celebrity culture, pop-culture gossip, meme humor, and observational commentary—often parodying social dynamics, gender roles, and pop cultural events both internationally and within Georgian online discourse. While not overtly political, his content contributes to media literacy, digital culture awareness, and pop-cultural critique for a young, hyper-online audience.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/jano.jino/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@janojino.gossip"
            ]
          ]
        },
        {
          "name": "Nika Kakoishvili (Kako)",
          "description": "Human Kako is a highly popular Georgian travel content creator whose videos focus on cross-cultural experiences, global travel, food challenges, and societal observations. His humorous and relatable style draws large audiences, particularly among Georgian youth and families who are curious about global lifestyles and cultures. He showcases international travel destinations, economic comparisons, unusual cultural practices, and light social commentary. While primarily an entertainment creator, Kako also fosters cross-cultural understanding, international awareness, and critical thinking about global disparities.",
          "contact": [
            [
              "email",
              "kakodopmn@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/humankako/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@HumanKako"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@humankako"
            ]
          ]
        },
        {
          "name": "Kristaaph",
          "description": "Creative digital storytelling with a focus on daily lifestyle, dance, fashion, and cultural insights from Kazakhstan; engaging content promoting body positivity, self-expression, and youthful empowerment through accessible narratives on TikTok and Instagram.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/kristaaph/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@kristaaph"
            ]
          ]
        },
        {
          "name": "Night Sardafi",
          "description": "Creative digital content focused on humor, satire, and adventurous storytelling rooted in Georgian youth culture; videos highlighting outdoor survival challenges, comedic social commentary, and engaging narratives designed to foster critical thinking, media literacy, and youth participation.",
          "contact": [
            [
              "email",
              "nightbasement@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/night.sardafi/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@nightsardafi"
            ],
            [
              "youtube",
              "https://www.youtube.com/@Nightbasement"
            ]
          ]
        },
        {
          "name": "Nikusha Kalichava (NikaTMG)",
          "description": "Popular gaming and entertainment content creator from Georgia, specializing in interactive gameplay, challenges, humorous reactions, and digital culture; fostering community engagement and digital literacy through gaming experiences, social experiments, and relatable humor.",
          "contact": [
            [
              "email",
              "nikatmg.advertise@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/nikushakalichava/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@nikakalichavatmg"
            ],
            [
              "youtube",
              "https://www.youtube.com/@NikaTMG"
            ]
          ]
        },
        {
          "name": "NikoLoz Kuparashvili",
          "description": "Popular Georgian gaming and sports content creator specializing in football simulations, game analysis, and interactive gameplay (FIFA, eFootball, racing games); promoting gaming culture, sports fandom, and digital community-building through engaging, commentary-rich videos and live streams.",
          "contact": [
            [
              "email",
              "nikoloznikoloz31@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/nikoloz31/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@NikoLoz31"
            ]
          ]
        },
        {
          "name": "Qimera",
          "description": "Georgian YouTube creator known for immersive and humorous gaming content, horror gameplay reactions, interactive challenges, and digital storytelling; engaging youth audiences through creative commentary, community interaction, and entertainment-focused narratives that enhance digital literacy and critical thinking.",
          "contact": [
            [
              "email",
              "qimera.advertise@gmail.com"
            ]
          ],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/qimera__"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@qimeraa"
            ],
            [
              "youtube",
              "https://www.youtube.com/@QIMERAYT"
            ]
          ]
        },
        {
          "name": "Ruska Karkashadze",
          "description": "Georgian actress, TV host, and influencer creating engaging lifestyle, travel, and entertainment content; sharing personal experiences, fashion insights, and behind-the-scenes moments to empower young women and promote cultural awareness and inclusivity.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/russkakarkashadze/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@ruskakarkashadzee"
            ]
          ]
        },
        {
          "name": "Achi Jaiani",
          "description": "Georgian digital creator known for humorous and satirical short-form videos, trending challenges, and youth-focused entertainment content; employing comedy and cultural references to engage younger audiences, fostering digital literacy and youth participation.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/achijaiani222/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@achijaiani2222"
            ]
          ]
        },
        {
          "name": "Ioseb Laliashvili",
          "description": "Georgian digital creator sharing engaging and creative culinary content, exploring popular foods, innovative cooking techniques, and relatable food experiences; promoting accessible culinary culture and digital storytelling through visually appealing, short-form videos.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/jozeflaliashvili/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@jozeflaliashvili"
            ]
          ]
        },
        {
          "name": "Shmagi Samkharadze",
          "description": "Shmagi Samkharadze stands out with anti-Russian content and promotes Georgian values. Moreover, he strongly opposes the pro-Russian outlet \"Alt-info\" and tries to debunk Kremlin-related myths in an entertaining form which makes him a potentially good candidate for the project",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@shmagi_samkharadze"
            ]
          ]
        },
        {
          "name": "Publica",
          "description": "A Georgian socio-political online publication committed to impartial, fact-based, and ethically rigorous journalism; offering in-depth reporting, analyses, and multimedia content aimed at enhancing civic education, media literacy, and democratic participation. Coverage includes socio-political affairs, culture, literature, science, and educational content.",
          "contact": [
            [
              "email",
              "info@publika.ge"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/publika.ge/"
            ],
            [
              "x",
              "https://x.com/publika_ge"
            ],
            [
              "youtube",
              "https://www.youtube.com/@publika8437"
            ],
            [
              "instagram",
              "https://www.instagram.com/publika.ge/"
            ]
          ]
        },
        {
          "name": "Batumelebi",
          "description": "Batumelebi is a regional media outlet based in the Adjara region of Georgia, providing independent, reliable, and locally focused news coverage. It offers in-depth reporting on social, political, economic, and cultural issues relevant to Adjara, supporting community awareness, regional development, and informed public discourse.",
          "contact": [
            [
              "email",
              "infobatumelebi@gmail.com"
            ],
            [
              "phone_number",
              "+995 579 22 36 33"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/batumelebi"
            ],
            [
              "x",
              "https://x.com/batumelebi_ge"
            ],
            [
              "instagram",
              "https://www.instagram.com/batumelebi.ge"
            ],
            [
              "telegram",
              "https://t.me/Netgazeti_Batumelebi"
            ]
          ]
        },
        {
          "name": "Project 64",
          "description": "Project 64 is a Georgian multimedia platform focused on delivering well-researched storytelling that goes beyond mere facts to explain complex socio-political issues in an accessible, clear, and engaging way. The platform emphasizes clarity and understanding to help audiences grasp important narratives affecting society.",
          "contact": [
            [
              "email",
              "contact@project64.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/64multimedia"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/project-64/"
            ],
            [
              "instagram",
              "https://www.instagram.com/64.project/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@64-project/videos"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@64.project"
            ]
          ]
        },
        {
          "name": "Democracy Defenders",
          "description": "Democratic Development (DEMDEF) is a Georgian non-governmental organization dedicated to strengthening democracy, promoting civic engagement, and supporting human rights through advocacy, research, and public education.",
          "contact": [
            [
              "email",
              "info@demdef.org"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/DemocracyDefendersGeorgia"
            ],
            [
              "x",
              "https://x.com/DemDefGeo"
            ]
          ]
        },
        {
          "name": "The Center for Media, Information and Social Research (CMIS)",
          "description": "The Center for Media, Information, and Social Studies (CMIS) is a Georgian organization committed to promoting free media and a free society. CMIS works to protect journalists' rights and media organizations, monitors and evaluates the media landscape, conducts research, and provides training and advocacy to ensure media freedom and information integrity.",
          "contact": [
            [
              "email",
              "cmisresearch@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/profile.php?id=100091845916170"
            ]
          ]
        },
        {
          "name": "Center for Development and Democracy",
          "description": "CDD is a Georgian organization dedicated to advancing EU and Euro-Atlantic integration by fostering dialogue among stakeholders, raising community awareness, advocating for positive change, and empowering youth. It combats disinformation and promotes truth, democracy, rule of law, election observation, gender equality, and civic participation to build an open, inclusive, and consolidated society.",
          "contact": [
            [
              "email",
              "Info@CDD.ge"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/CDD.ge/"
            ]
          ]
        },
        {
          "name": "Journalism Resource Center",
          "description": "Since 2011, the Journalism Resource Center (JRC) has been actively supporting the development of local democracies in Georgia through three main pillars: education, production, and development. JRC develops journalism education programs, partners with authoritative international organizations including DW, BBG, and Open Media Hub, and focuses on strengthening regional media by supporting regional journalism schools. JRC is an active participant in the Eastern Partnership Civil Society Forum, promoting quality journalism and media professionalism.",
          "contact": [
            [
              "email",
              "jrcgeorgia@gmail.com"
            ],
            [
              "phone_number",
              "+995 32 243 10 35"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/JournalismResourceCenter"
            ]
          ]
        },
        {
          "name": "Netgazeti",
          "description": "Netgazeti.ge is a bilingual (Georgian and Russian) online news portal based in Tbilisi, providing timely and independent coverage of political developments, conflicts, and social issues in Georgia. It operates in a challenging media environment, delivering in-depth reporting to promote transparency, accountability, and informed public discourse.",
          "contact": [
            [
              "email",
              "info@netgazeti.ge"
            ],
            [
              "phone_number",
              "+995 599 14 92 06"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/netgazeti/"
            ],
            [
              "instagram",
              "https://www.instagram.com/netgazeti/"
            ],
            [
              "x",
              "https://x.com/Netgazeti"
            ]
          ]
        },
        {
          "name": "On.ge",
          "description": "on.ge is a Georgian online news media platform delivering up-to-date news and information on politics, society, economy, and culture. The platform aims to provide accessible, reliable journalism to inform the public and foster civic engagement across Georgia.",
          "contact": [
            [
              "email",
              "news@on.ge"
            ],
            [
              "phone_number",
              "+995 558 21 46 91"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/news.on.ge"
            ],
            [
              "instagram",
              "https://www.instagram.com/on.ge"
            ],
            [
              "x",
              "https://x.com/OnGeLive"
            ]
          ]
        },
        {
          "name": "Formula",
          "description": "Objective, unbiased and fast information; Analytical socio-political talk-shows; All time best Georgian TV shows and entertainment programmes. Broadcasting company TV Formula was founded in 2019 with an ambition to be the first in Georgian TV-space.",
          "contact": [
            [
              "email",
              "ad@formula.ge"
            ],
            [
              "phone_number",
              "+995 32 250 02 22"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/TVFormula"
            ],
            [
              "instagram",
              "https://www.instagram.com/formulaoriginals/"
            ],
            [
              "x",
              "https://x.com/formulage"
            ],
            [
              "youtube",
              "https://www.youtube.com/@FormulaNews"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@tvformula"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/tvformula/"
            ]
          ]
        },
        {
          "name": "Georgian Foundation for Strategic and International Studies (Rondeli Foundation)",
          "description": "Established in 1998, the Georgian Foundation for Strategic and International Studies (Rondeli Foundation) is an independent, non-profit policy think tank focused on enhancing public policy decision-making in Georgia through rigorous research, policy analysis, and education. It offers training for policymakers and analysts, facilitates public outreach, and fosters dialogue between government, academia, and civil society on key domestic and international strategic issues affecting Georgia and the Caucasus.",
          "contact": [
            [
              "email",
              "info@gfsis.org"
            ],
            [
              "phone_number",
              "+995 32 247 35 55"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/GFSIS/"
            ],
            [
              "instagram",
              "https://www.instagram.com/rondelifoundation/"
            ],
            [
              "x",
              "https://x.com/GFSIS_official"
            ],
            [
              "youtube",
              "https://www.youtube.com/@rondelifoundation9296"
            ]
          ]
        },
        {
          "name": "444",
          "description": "444.hu is a Hungarian online news portal providing independent, timely, and in-depth coverage of politics, society, culture, and current events. Known for its investigative journalism and critical reporting, it serves as a key platform for fostering transparency and public discourse in Hungary.",
          "contact": [
            [
              "email",
              "szerk@444.hu"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/444.hu"
            ],
            [
              "instagram",
              "https://www.instagram.com/negynegynegy/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@4negy4"
            ],
            [
              "youtube",
              "https://www.youtube.com/@negynegynegy"
            ]
          ]
        },
        {
          "name": "Partizán",
          "description": "Partizan.hu is a Hungarian media platform offering independent news, cultural commentary, and in-depth analysis of social and political issues. It focuses on providing alternative perspectives to mainstream media, supporting critical thinking and public engagement in Hungary.",
          "contact": [
            [
              "email",
              "info@partizanmedia.hu"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/partizanpolitika/"
            ],
            [
              "instagram",
              "https://www.instagram.com/partizanpolitika"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@partizan_media"
            ],
            [
              "youtube",
              "https://www.youtube.com/c/Partiz%C3%A1nm%C3%A9dia"
            ]
          ]
        },
        {
          "name": "Outriders Klub",
          "description": "Outriders Klub is a Polish media platform dedicated to in-depth, investigative journalism and long-form storytelling on social, political, and environmental issues. It aims to foster critical public discourse, highlight underreported topics, and promote media literacy and civic engagement across Poland and the region.",
          "contact": [
            [
              "email",
              "klub@weareoutriders.com"
            ],
            [
              "phone_number",
              "+48 796 999 711"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/outridersklub/"
            ],
            [
              "instagram",
              "https://www.instagram.com/outridersklub/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@outridersklub"
            ],
            [
              "youtube",
              "https://www.youtube.com/@outridersklub"
            ],
            [
              "x",
              "https://x.com/jakubgornicki"
            ]
          ]
        },
        {
          "name": "Direkt36",
          "description": "Direkt36 is a Hungarian investigative journalism platform dedicated to exposing abuse of power, corruption, negligence, and misuse of public resources. Committed to the highest professional standards, Direkt36 uses in-depth reporting to hold authorities accountable, raise public awareness, and strengthen democratic governance despite challenging external conditions.",
          "contact": [
            [
              "email",
              "info@direkt36.hu"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/direkt36"
            ],
            [
              "instagram",
              "https://www.instagram.com/direkt36"
            ],
            [
              "x",
              "https://x.com/direkt36"
            ]
          ]
        },
        {
          "name": "OKO.press",
          "description": "OKO.press is a Polish investigative journalism portal focused on fact-checking, monitoring government and societal realities, and telling compelling human stories. It serves as a civic watchdog, holding those in power accountable through rigorous investigations and transparency advocacy.",
          "contact": [
            [
              "email",
              "redakcja@oko.press"
            ],
            [
              "phone_number",
              "+48 22 253 07 58"
            ]
          ],
          "media": []
        },
        {
          "name": "N1 Slovenija",
          "description": "N1 Info Slovenia is a regional news outlet providing independent, timely, and comprehensive coverage of political, social, and economic issues in Slovenia and the broader Balkan region. Known for its commitment to journalistic integrity, N1 Info offers investigative reporting, in-depth analysis, and live news broadcasts to inform and engage the public.",
          "contact": [
            [
              "email",
              "urednistvo@n1info.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/n1slovenija/"
            ],
            [
              "instagram",
              "https://www.instagram.com/n1slovenija/"
            ],
            [
              "x",
              "https://x.com/n1slovenija"
            ],
            [
              "youtube",
              "https://www.youtube.com/@n1slovenija"
            ]
          ]
        },
        {
          "name": "PressOne",
          "description": "PressOne is a Romanian independent news platform dedicated to investigative journalism, in-depth reporting, and analysis of political, social, and cultural issues. It aims to promote transparency, accountability, and informed public debate through fact-based journalism and engaging storytelling.",
          "contact": [
            [
              "email",
              "contact@pressone.ro"
            ],
            [
              "email",
              "marketing@pressone.ro"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/pressoneromania"
            ],
            [
              "instagram",
              "https://www.instagram.com/pressoneromania/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@pressoneromania"
            ],
            [
              "youtube",
              "https://www.youtube.com/@PressOneRomania"
            ],
            [
              "telegram",
              "https://t.me/pressonero"
            ],
            [
              "x",
              "https://x.com/PressOneRomania"
            ]
          ]
        },
        {
          "name": "HotNews",
          "description": "HotNews.ro is one of Romania’s leading online news platforms, delivering breaking news, in-depth analyses, and comprehensive coverage across politics, economy, society, and culture. Known for timely updates and broad reach, HotNews.ro aims to keep the public informed and engaged in critical national and international issues.",
          "contact": [
            [
              "email",
              "redactie@hotnews.ro"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/www.hotnews.ro/"
            ],
            [
              "instagram",
              "https://www.instagram.com/hotnews.ro/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@hotnews_ro"
            ]
          ]
        },
        {
          "name": "Vecer",
          "description": "Večer is a leading Slovenian daily newspaper and online news platform providing comprehensive coverage of national and regional politics, social issues, economy, and culture. Known for its credible journalism and in-depth reporting, Večer plays a key role in informing and engaging the Slovenian public.",
          "contact": [
            [
              "email",
              "internet@vecer.com"
            ],
            [
              "phone_number",
              "+386 2 235 31 10"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/CasnikVecer"
            ],
            [
              "instagram",
              "https://www.instagram.com/casnik_vecer"
            ],
            [
              "youtube",
              "https://www.youtube.com/@vecerportal7223"
            ],
            [
              "x",
              "https://x.com/vecer"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/vecer"
            ]
          ]
        },
        {
          "name": "Association of European Journalists – Bulgaria (AEJ Bulgaria)",
          "description": "AEJ Bulgaria is a professional association dedicated to promoting high standards of journalism and protecting press freedom in Bulgaria. It supports journalists through training, advocacy, and networking, fostering independent reporting and ethical media practices in challenging political and social environments.",
          "contact": [
            [
              "email",
              "team@aej-bulgaria.org"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/aej.bulgaria"
            ],
            [
              "instagram",
              "https://www.instagram.com/aejbulgaria"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCGOaDVmRTCJNO-xw60TFJZQ"
            ],
            [
              "x",
              "https://x.com/AEJBulgaria"
            ]
          ]
        },
        {
          "name": "G4Media",
          "description": "G4Media.ro is an independent Romanian news outlet focused on delivering investigative journalism, breaking news, and in-depth political and social analysis. It aims to promote transparency, accountability, and informed public debate by providing fact-based reporting and critical perspectives on national and international issues.",
          "contact": [
            [
              "email",
              "redactia@g4media.ro"
            ],
            [
              "phone_number",
              "0770330037"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/g4media.ro"
            ],
            [
              "instagram",
              "https://www.instagram.com/g4media.ro/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@g4media.ro"
            ],
            [
              "youtube",
              "https://www.youtube.com/@g4media479"
            ]
          ]
        },
        {
          "name": "Gospodari",
          "description": "Gospodari is a Romanian digital media platform known for its satirical and humorous take on current events, politics, and social issues. Through entertaining videos, memes, and commentary, it engages a younger audience while promoting critical thinking and media literacy in an accessible and engaging way.",
          "contact": [
            [
              "email",
              "gospodari@gospodari.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/gospodari/"
            ],
            [
              "instagram",
              "https://www.instagram.com/gospodariofficial"
            ],
            [
              "x",
              "https://x.com/Gospodari_com"
            ],
            [
              "youtube",
              "https://www.youtube.com/@gospodarinaefira"
            ]
          ]
        },
        {
          "name": "Toest",
          "description": "Toest s a Bulgarian independent online news platform focused on delivering timely news, investigative reporting, and in-depth analysis of political, social, and economic issues. It strives to promote transparency, accountability, and civic engagement through quality journalism that serves the public interest.",
          "contact": [
            [
              "email",
              "contact@toest.bg"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/toest.bg"
            ],
            [
              "instagram",
              "https://www.instagram.com/toestbg"
            ],
            [
              "youtube",
              "https://www.youtube.com/@toestbg"
            ]
          ]
        },
        {
          "name": "Govori Internet",
          "description": "Govori Internet is a Bulgarian digital platform dedicated to media literacy, fact-checking, and raising public awareness about disinformation and digital safety. The platform provides educational content, analysis, and tools to help citizens critically evaluate online information and strengthen resilience against misinformation.",
          "contact": [
            [
              "email",
              "info@govori-internet.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/govori.internet/"
            ],
            [
              "instagram",
              "https://www.instagram.com/govori.internet"
            ],
            [
              "x",
              "https://x.com/govori_internet"
            ]
          ]
        },
        {
          "name": "Funky Citizens",
          "description": "Romanian civil society organization using data, storytelling, and civic tech to promote transparency, anti-corruption, and citizen engagement; blends watchdog journalism, policy advocacy, and educational tools to empower informed participation, especially among youth.",
          "contact": [
            [
              "email",
              "laura@funky.ong"
            ],
            [
              "email",
              "elena@funky.ong"
            ],
            [
              "email",
              "weare@funkycitizens.org"
            ]
          ],
          "media": [
            [
              "website",
              "https://funky.ong"
            ],
            [
              "facebook",
              "https://www.facebook.com/funkycitizens"
            ],
            [
              "x",
              "https://x.com/funkycitizens"
            ]
          ]
        },
        {
          "name": "Global Focus",
          "description": "Romanian think tank focused on foreign policy, democratic resilience, and security; conducts research and strategic analysis on hybrid threats, disinformation, and regional geopolitics; fosters dialogue between civil society, policymakers, and media on democratic values and global challenges.",
          "contact": [
            [
              "email",
              "oana.popescu@global-focus.eu"
            ],
            [
              "email",
              "daniela.burciu@global-focus.eu"
            ],
            [
              "email",
              "office@global-focus.eu"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.global-focus.eu/"
            ],
            [
              "facebook",
              "https://www.facebook.com/globalfocuscenter"
            ],
            [
              "x",
              "https://x.com/GlobalFocusCntr"
            ]
          ]
        },
        {
          "name": "Faktyoxla",
          "description": "Azerbaijani fact-checking and verification platform working to counter disinformation and misinformation in the media and public discourse; publishes accessible analyses, trains journalists, and promotes critical thinking through public education and media monitoring.",
          "contact": [
            [
              "email",
              "ahadahadli@faktyoxla.info"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.faktyoxla.info/en"
            ],
            [
              "facebook",
              "https://www.facebook.com/FaktYoxla.info"
            ],
            [
              "x",
              "https://x.com/faktyoxla"
            ],
            [
              "instagram",
              "https://www.instagram.com/fakt.yoxla/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@faktyoxla"
            ]
          ]
        },
        {
          "name": "Restart Civic Youth Foundation",
          "description": "Youth-led organization in Armenia dedicated to promoting democratic values, civic engagement, and good governance through education, advocacy, and participatory projects; empowers young people to hold institutions accountable and become active citizens.",
          "contact": [
            [
              "email",
              "yuri.avagyan1995@gmail.com"
            ],
            [
              "email",
              "restartfoundationedu@gmail.com"
            ],
            [
              "phone_number",
              "+374 77 250545"
            ]
          ],
          "media": [
            [
              "website",
              "https://restartfound.org/"
            ],
            [
              "facebook",
              "https://www.facebook.com/restartfoundation/"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCgiy7zxQr_5G8vw3zzb5uSA"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@restartfoundation"
            ],
            [
              "telegram",
              "https://t.me/restart_foundation"
            ],
            [
              "instagram",
              "https://www.instagram.com/restart_foundation/"
            ]
          ]
        },
        {
          "name": "Media Initiatives Center (MIC)",
          "description": "Armenian media development organization advancing quality journalism, media literacy, and freedom of expression; offers training, content production support, and community initiatives to counter disinformation and strengthen public trust in media.",
          "contact": [
            [
              "email",
              "nsarkissian@mediainitiatives.am"
            ],
            [
              "email",
              "office@mediainitiatives.am"
            ],
            [
              "phone_number",
              "+374 10 583620"
            ],
            [
              "phone_number",
              "+374 11 583620"
            ]
          ],
          "media": [
            [
              "website",
              "https://mediainitiatives.am/en/"
            ],
            [
              "facebook",
              "https://www.facebook.com/MediaInitiativesCenter/"
            ],
            [
              "x",
              "https://x.com/MediaIC"
            ],
            [
              "instagram",
              "https://www.instagram.com/media_ic/"
            ]
          ]
        },
        {
          "name": "Union of Informed Citizens (UIC)",
          "description": "Armenian CSO promoting transparency, democratic accountability, and informed civic participation through investigative journalism, media literacy, and policy advocacy; known for fact-checking, election monitoring, and access to information campaigns.",
          "contact": [
            [
              "email",
              "danioanis@gmail.com"
            ],
            [
              "email",
              "p.petrosyan09@gmail.com"
            ],
            [
              "email",
              "info@uic.am"
            ],
            [
              "phone_number",
              "+374 11 355042"
            ]
          ],
          "media": [
            [
              "website",
              "https://uic.am/en"
            ],
            [
              "facebook",
              "https://www.facebook.com/uicarmenia"
            ],
            [
              "x",
              "https://x.com/uicarmenia"
            ],
            [
              "instagram",
              "https://www.instagram.com/uicarmenia/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@UICArmenia"
            ]
          ]
        },
        {
          "name": "Coda Story",
          "description": "Independent newsroom covering the roots of global crises through deep, narrative journalism; investigates disinformation, authoritarian tech, and the weaponization of culture, delivering cross-border reporting that connects local events to global systems.",
          "contact": [
            [
              "email",
              "antelava@codastory.com"
            ],
            [
              "email",
              "info@codastory.com"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.codastory.com/"
            ],
            [
              "facebook",
              "https://www.facebook.com/StayOntheStory/"
            ],
            [
              "x",
              "https://x.com/CodaStory"
            ],
            [
              "instagram",
              "https://www.instagram.com/codastory/"
            ],
            [
              "youtube",
              "https://www.youtube.com/c/CodaStory"
            ]
          ]
        },
        {
          "name": "Georgia’s Reforms Associates (GRASS)",
          "description": "Georgian think tank and watchdog organization focused on democratic reform, disinformation resilience, and Euro-Atlantic integration; conducts fact-checking, policy analysis, and civic education to promote transparency, informed debate, and public accountability.",
          "contact": [
            [
              "email",
              "mariamtsitsikashvili@gmail.com"
            ],
            [
              "email",
              "grass@grassgroup.org"
            ],
            [
              "phone_number",
              "995 32) 2 222 913"
            ]
          ],
          "media": [
            [
              "website",
              "https://grass.org.ge/en"
            ],
            [
              "facebook",
              "https://www.facebook.com/grassgrouporg/"
            ],
            [
              "x",
              "https://x.com/GRASSORGGE"
            ]
          ]
        },
        {
          "name": "iFact",
          "description": "Georgian investigative journalism outlet producing in-depth reporting on corruption, organized crime, human rights, and public accountability; part of regional and international networks advancing transparency, fact-checking, and cross-border investigations.",
          "contact": [
            [
              "email",
              "ninobakradze@ifact.ge"
            ],
            [
              "email",
              "info@ifact.ge"
            ]
          ],
          "media": [
            [
              "website",
              "https://ifact.ge/en/"
            ],
            [
              "facebook",
              "https://www.facebook.com/ifact.ge"
            ],
            [
              "x",
              "https://x.com/Ifactgeorgia"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCPQvIEXuBT3ByvW4GPPdAsw"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/investigative-journalist-team-ifact/"
            ],
            [
              "instagram",
              "https://www.instagram.com/ifact.ge/"
            ]
          ]
        },
        {
          "name": "International Society for Fair Elections and Democracy (ISFED)",
          "description": "Georgian civil society organization promoting electoral integrity, democratic governance, and citizen participation; conducts election observation, disinformation monitoring, civic education, and legal advocacy to uphold transparency and public trust in democratic processes.",
          "contact": [
            [
              "email",
              "ndolidze@isfed.ge"
            ],
            [
              "email",
              "info@isfed.ge"
            ],
            [
              "phone_number",
              "995 32) 0 800 800 102"
            ]
          ],
          "media": [
            [
              "website",
              "https://isfed.ge/eng"
            ],
            [
              "facebook",
              "https://www.facebook.com/isfed.official"
            ],
            [
              "x",
              "https://x.com/isfed_official"
            ],
            [
              "youtube",
              "https://www.youtube.com/user/isfed123"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/the-international-society-for-fair-elections-and-democracy-isfed-/"
            ],
            [
              "instagram",
              "https://www.instagram.com/isfed_official/"
            ]
          ]
        },
        {
          "name": "Media Development Foundation (MDF)",
          "description": "Georgian NGO focused on strengthening media integrity, countering disinformation, and promoting media literacy and democratic values; conducts monitoring of hate speech, foreign influence, and electoral coverage, along with civic education and fact-checking initiatives.",
          "contact": [
            [
              "email",
              "tamaramdf@gmail.com"
            ],
            [
              "email",
              "tamar@mdfgeorgia.ge"
            ],
            [
              "phone_number",
              "0322 11 20 26"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.mdfgeorgia.ge/eng/home"
            ],
            [
              "facebook",
              "https://www.facebook.com/MediaDevelopmentFoundation"
            ],
            [
              "x",
              "https://x.com/mdfgeo"
            ]
          ]
        },
        {
          "name": "SOVA.News",
          "description": "Russian-language independent media outlet based in Georgia, covering current affairs, politics, and society in the South Caucasus and beyond; known for accessible reporting, youth-oriented storytelling, and counter-narratives to propaganda and authoritarian discourse.",
          "contact": [
            [
              "email",
              "ardashelia.m@gmail.com"
            ],
            [
              "email",
              "info@sovanews.tv"
            ]
          ],
          "media": [
            [
              "website",
              "https://sovanews.tv/"
            ],
            [
              "facebook",
              "https://www.facebook.com/sovanews/"
            ],
            [
              "x",
              "https://x.com/sovanews"
            ],
            [
              "instagram",
              "https://www.instagram.com/sovanews.tv/"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCbhwacrD-zDtGHrjAP3IdVA"
            ]
          ]
        },
        {
          "name": "Association of Independent Press (API)",
          "description": "Moldovan media development organization supporting independent local and regional outlets through training, policy advocacy, and investigative reporting; leads initiatives on press freedom, disinformation monitoring, and transparent election coverage.",
          "contact": [
            [
              "email",
              "pmacovei@api.md"
            ],
            [
              "email",
              "api@api.md"
            ],
            [
              "phone_number",
              "+373 22 22 09 96"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.api.md/home/"
            ],
            [
              "facebook",
              "https://www.facebook.com/www.API.md/"
            ],
            [
              "instagram",
              "https://www.instagram.com/api.md/"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCgk8hqRcsPEe5AlKHxSDSGg"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/asocia%C8%9Bia-presei-independente-api"
            ]
          ]
        },
        {
          "name": "Newsmaker",
          "description": "Independent news outlet in Moldova publishing in Russian and Romanian, known for in-depth reporting, analysis, and fact-checking on politics, social issues, and regional affairs; plays a key role in countering disinformation and informing multilingual audiences.",
          "contact": [
            [
              "email",
              "allik@newsmaker.md"
            ],
            [
              "phone_number",
              "+373 62 073 333"
            ]
          ],
          "media": [
            [
              "website",
              "https://newsmaker.md/"
            ],
            [
              "facebook",
              "https://www.facebook.com/newsmakermd/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@newsmaker.md"
            ],
            [
              "telegram",
              "https://t.me/newsmakerlive"
            ],
            [
              "instagram",
              "https://www.instagram.com/newsmakermd/"
            ]
          ]
        },
        {
          "name": "Rise Moldova",
          "description": "Investigative journalism platform uncovering corruption, organized crime, illicit finances, and abuses of power in Moldova and the region; produces cross-border investigations, data-driven storytelling, and public interest reports in collaboration with international media networks.",
          "contact": [
            [
              "email",
              "iurie@rise.md"
            ],
            [
              "email",
              "info@rise.md"
            ],
            [
              "phone_number",
              "+373 688 50 555"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.rise.md/"
            ],
            [
              "facebook",
              "https://www.facebook.com/risemoldova"
            ],
            [
              "x",
              "https://x.com/risemoldova"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/rise-moldova/"
            ],
            [
              "instagram",
              "https://www.instagram.com/risemoldova/"
            ]
          ]
        },
        {
          "name": "WatchDog.md",
          "description": "Moldovan think tank and watchdog organization focused on democratic governance, rule of law, and disinformation resilience; conducts policy analysis, public education campaigns, media monitoring, and election-related transparency initiatives.",
          "contact": [
            [
              "email",
              "catalina.budurin@watchdog.md"
            ],
            [
              "email",
              "valeriu.pasha@watchdog.md"
            ]
          ],
          "media": [
            [
              "website",
              "https://watchdog.md/"
            ],
            [
              "facebook",
              "https://www.facebook.com/watchdogmd"
            ],
            [
              "instagram",
              "https://www.instagram.com/watchdog.md/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@ComunitateaWatchDog"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/watchdog-md-community/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@watchdog.md"
            ],
            [
              "telegram",
              "https://t.me/watchdogmd"
            ],
            [
              "x",
              "https://twitter.com/ComunitateaW"
            ]
          ]
        },
        {
          "name": "Ziarul de Gardă",
          "description": "One of Moldova’s leading investigative journalism outlets, exposing corruption, human rights abuses, and public sector mismanagement; provides in-depth reporting, election coverage, and watchdog journalism to hold power to account and inform the public.",
          "contact": [
            [
              "email",
              "alinaradu.zdg@gmail.com"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.zdg.md/"
            ],
            [
              "facebook",
              "https://www.facebook.com/zdg.md"
            ],
            [
              "instagram",
              "https://www.instagram.com/ziaruldegarda/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@Ziarul_de_Garda"
            ],
            [
              "telegram",
              "http://t.me/zdgmd"
            ],
            [
              "x",
              "https://twitter.com/ziarul_de_garda"
            ]
          ]
        },
        {
          "name": "Delfi.ee",
          "description": "One of Estonia’s largest digital media platforms, offering comprehensive news coverage, investigative journalism, and multimedia reporting on domestic and international affairs; known for its role in countering disinformation and informing Estonian-speaking audiences.",
          "contact": [
            [
              "email",
              "delfi@delfi.ee"
            ],
            [
              "email",
              "erik.moora@delfi.ee"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.delfi.ee/"
            ],
            [
              "facebook",
              "https://www.facebook.com/delfi.ee/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@DelfiTV"
            ],
            [
              "instagram",
              "https://www.instagram.com/delfi.ee/"
            ]
          ]
        },
        {
          "name": "The International Centre for Defence and Security (ICDS)",
          "description": "Estonia-based think tank specializing in security policy, defense strategy, and democratic resilience; conducts research and analysis on hybrid threats, NATO and EU affairs, disinformation, and regional security, bridging expert insight with policy impact.",
          "contact": [
            [
              "email",
              "dmitri.teperik@kaitsen.ee"
            ],
            [
              "email",
              "info@icds.ee"
            ],
            [
              "phone_number",
              "+372 6949 340"
            ]
          ],
          "media": [
            [
              "website",
              "https://icds.ee/en/"
            ],
            [
              "facebook",
              "https://www.facebook.com/ICDS.Tallinn"
            ],
            [
              "x",
              "https://x.com/ICDS_Tallinn"
            ],
            [
              "instagram",
              "https://www.instagram.com/icds_tallinn/"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/icds-tallinn/"
            ]
          ]
        },
        {
          "name": "VitaTiim",
          "description": "Estonian youth organization empowering young people through non-formal education, intercultural exchange, and personal development programs; promotes civic participation, inclusion, and digital literacy in both local and cross-border youth communities.",
          "contact": [
            [
              "email",
              "julia@vitatiim.ee"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.vitatiim.ee/en"
            ],
            [
              "facebook",
              "https://www.facebook.com/sinuvitatiim/"
            ],
            [
              "instagram",
              "https://www.instagram.com/vitatiim/"
            ]
          ]
        },
        {
          "name": "The Centre for East European Policy Studies (CEEPS)",
          "description": "Latvia-based think tank focusing on regional security, foreign influence, and democratic resilience in Eastern Europe; conducts research, policy analysis, and strategic communication on Russian disinformation, hybrid threats, and the rule of law.",
          "contact": [
            [
              "email",
              "maris.cepuritis@appc.lv"
            ],
            [
              "email",
              "info@appc.lv"
            ],
            [
              "phone_number",
              "+371 67282101"
            ]
          ],
          "media": [
            [
              "website",
              "https://appc.lv/en/homepage/"
            ],
            [
              "x",
              "https://x.com/APPC_LV"
            ]
          ]
        },
        {
          "name": "Providus",
          "description": "Latvia-based public policy think tank promoting evidence-based decision-making, democratic participation, and good governance; focuses on anti-corruption, citizen engagement, migration policy, and transparent electoral processes through research and advocacy.",
          "contact": [
            [
              "email",
              "iveta.kazoka@providus.lv"
            ],
            [
              "phone_number",
              "+371 6 703 9252"
            ]
          ],
          "media": [
            [
              "website",
              "https://providus.lv/en/"
            ],
            [
              "facebook",
              "https://www.facebook.com/providuslv"
            ],
            [
              "x",
              "https://x.com/providus"
            ],
            [
              "youtube",
              "https://www.youtube.com/user/politikalv"
            ]
          ]
        },
        {
          "name": "Krievu Balss Latvijai",
          "description": "Civic initiative promoting democratic engagement and media literacy among Latvia’s Russian-speaking population; focuses on countering disinformation, fostering dialogue, and supporting inclusion through accessible content and public outreach.",
          "contact": [
            [
              "email",
              "krievubalsslatvijai@gmail.com"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.krievubalsslatvijai.lv/"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@krievubalsslatvijai"
            ],
            [
              "facebook",
              "https://www.facebook.com/KrievuBalss/"
            ],
            [
              "x",
              "https://x.com/krievubalss"
            ]
          ]
        },
        {
          "name": "Delfi Latvia",
          "description": "One of Latvia’s leading digital news platforms, offering independent reporting, investigative journalism, and multilingual content on politics, society, and international affairs; plays a key role in countering disinformation and ensuring transparent electoral coverage.",
          "contact": [
            [
              "email",
              "filips.lastovskis@delfi.lv"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.delfi.lv/"
            ],
            [
              "x",
              "https://x.com/DelfiLV"
            ],
            [
              "instagram",
              "https://www.instagram.com/delfi.lv/"
            ],
            [
              "telegram",
              "https://t.me/delfi_lv"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@delfilv"
            ]
          ]
        },
        {
          "name": "Civic Resilience Initiative",
          "description": "Lithuania-based CSO focused on enhancing societal resilience to disinformation, propaganda, and hybrid threats; conducts research, public awareness campaigns, media literacy training, and policy advocacy to strengthen democratic security and civic participation.",
          "contact": [
            [
              "email",
              "info@cri.lt"
            ]
          ],
          "media": [
            [
              "website",
              "https://cri.lt/"
            ],
            [
              "facebook",
              "https://www.facebook.com/CivicResilienceInitiative/"
            ],
            [
              "x",
              "https://x.com/CivicResilience"
            ],
            [
              "instagram",
              "https://www.instagram.com/civicresilienceinitiative"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/civic-resilience-initiative"
            ]
          ]
        },
        {
          "name": "Debunk.org",
          "description": "Regional initiative operating in the Baltics and beyond to detect, analyze, and counter disinformation and information manipulation; combines OSINT, media monitoring, and public education to build societal resilience and protect democratic discourse.",
          "contact": [
            [
              "email",
              "viktoras@debunk.org"
            ],
            [
              "email",
              "Info@debunkeu.org"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.debunk.org/"
            ],
            [
              "facebook",
              "https://www.facebook.com/Debunk.org"
            ],
            [
              "x",
              "https://x.com/DebunkEu"
            ],
            [
              "youtube",
              "https://www.youtube.com/@DebunkOrg"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/debunk-org/"
            ],
            [
              "instagram",
              "https://www.instagram.com/official.debunk/"
            ]
          ]
        },
        {
          "name": "Delfi Lithuania",
          "description": "One of Lithuania’s most prominent independent news platforms, providing comprehensive reporting, investigative journalism, and multilingual content on national and international issues; actively counters disinformation and promotes transparent, ethical journalism.",
          "contact": [
            [
              "email",
              "aiste.meidute@delfi.lt"
            ],
            [
              "email",
              "info@delfi.lt"
            ],
            [
              "phone_number",
              "5) 204 54 00"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.delfi.lt/en/"
            ],
            [
              "facebook",
              "https://www.facebook.com/DelfiLietuva"
            ],
            [
              "x",
              "https://x.com/DELFILietuva"
            ],
            [
              "instagram",
              "https://www.instagram.com/delfilietuva"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/delfi-lt/"
            ]
          ]
        },
        {
          "name": "European Values Center for Security Policy",
          "description": "Czech-based think tank advancing democratic security by countering authoritarian influence, disinformation, and hybrid threats; conducts strategic analysis, public education, and advocacy on rule of law, national security, and information integrity across Europe.",
          "contact": [
            [
              "email",
              "zuzana.koskova@europeanvalues.cz"
            ],
            [
              "email",
              "info@europeanvalues.cz"
            ]
          ],
          "media": [
            [
              "website",
              "https://europeanvalues.cz/en/"
            ],
            [
              "facebook",
              "https://www.facebook.com/EvropskeHodnoty/"
            ],
            [
              "x",
              "https://x.com/_europeanvalues"
            ],
            [
              "youtube",
              "https://www.youtube.com/user/evropskehodnoty"
            ]
          ]
        },
        {
          "name": "Prague Security Studies Institute (PSSI)",
          "description": "Czech think tank focused on strengthening democratic institutions and countering hybrid threats through research, education, and strategic analysis; specializes in economic and space security, disinformation, and malign foreign influence in the transatlantic context.",
          "contact": [
            [
              "email",
              "info@pssi.cz"
            ],
            [
              "email",
              "sefcikova@pssi.cz"
            ],
            [
              "phone_number",
              "+420 234 721 253"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.pssi.cz/"
            ],
            [
              "facebook",
              "https://www.facebook.com/pssi.prague"
            ],
            [
              "x",
              "https://x.com/pssi_prague"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/prague-security-studies-institute/"
            ],
            [
              "instagram",
              "https://www.instagram.com/pssi_prague"
            ]
          ]
        },
        {
          "name": "Átlátszó",
          "description": "Hungarian investigative journalism outlet exposing corruption, abuses of power, and threats to press freedom; known for in-depth reporting, FOI-based investigations, and transparency tools that empower citizens to hold institutions accountable.",
          "contact": [
            [
              "email",
              "info@atlatszo.hu"
            ],
            [
              "email",
              "newsroom@atlatszo.hu"
            ],
            [
              "email",
              "fulop.orsolya@atlatszo.hu"
            ]
          ],
          "media": [
            [
              "website",
              "https://atlatszo.hu/"
            ],
            [
              "facebook",
              "https://www.facebook.com/atlatszo.hu/"
            ],
            [
              "instagram",
              "https://www.instagram.com/atlatszo"
            ],
            [
              "youtube",
              "https://www.youtube.com/c/Atlatszovideo"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@atlatszo.hu"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/atlatszo-hu/"
            ]
          ]
        },
        {
          "name": "Political Capital",
          "description": "Hungarian think tank conducting research and advocacy on democratic governance, political extremism, and foreign authoritarian influence; produces in-depth analysis on disinformation, populism, and rule of law challenges in Hungary and Central Europe.",
          "contact": [
            [
              "email",
              "hunyadi@politicalcapital.hu"
            ],
            [
              "email",
              "info@politicalcapital.hu"
            ],
            [
              "phone_number",
              "+36 20 665-0384"
            ]
          ],
          "media": [
            [
              "website",
              "https://politicalcapital.hu/"
            ],
            [
              "facebook",
              "https://www.facebook.com/politicalcapital/"
            ],
            [
              "instagram",
              "https://www.instagram.com/politicalcapital_hu/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@politicalcapitalhungary"
            ]
          ]
        },
        {
          "name": "Casimir Pulaski Foundation",
          "description": "Poland-based foreign policy and security think tank focused on transatlantic cooperation, defense strategy, and democratic resilience; conducts research, high-level policy dialogue, and public engagement on hybrid threats, disinformation, and regional security.",
          "contact": [
            [
              "email",
              "alewicka@pulaski.pl"
            ],
            [
              "email",
              "office@pulaski.pl"
            ],
            [
              "phone_number",
              "22 658 04 01"
            ]
          ],
          "media": [
            [
              "website",
              "https://pulaski.pl/en/"
            ],
            [
              "facebook",
              "https://www.facebook.com/FundacjaPulaskiego"
            ],
            [
              "instagram",
              "https://www.instagram.com/pulaskifoundation/"
            ],
            [
              "youtube",
              "https://www.youtube.com/user/pulaskifoundation"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/casimir-pulaski-foundation"
            ]
          ]
        },
        {
          "name": "Fakenews.pl",
          "description": "Polish fact-checking platform dedicated to identifying and debunking false information in media and public discourse; provides accessible verification, educational resources, and awareness campaigns to strengthen media literacy and online resilience.",
          "contact": [
            [
              "email",
              "korzel@fakenews.pl"
            ],
            [
              "email",
              "kontakt@fakenews.pl"
            ]
          ],
          "media": [
            [
              "website",
              "https://fakenews.pl/"
            ],
            [
              "facebook",
              "https://www.facebook.com/pg/Fakenewspl-112837966782935"
            ],
            [
              "x",
              "https://twitter.com/fakenews_pl"
            ],
            [
              "youtube",
              "https://www.youtube.com/@Fakenewspl"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/fakenews-pl"
            ],
            [
              "instagram",
              "https://www.instagram.com/fakenews_pl/"
            ]
          ]
        },
        {
          "name": "The Kościuszko Institute",
          "description": "Polish research institute focused on strategic security, cybersecurity, and transatlantic cooperation; conducts policy analysis and public engagement on disinformation, digital sovereignty, and the protection of democratic institutions against hybrid threats.",
          "contact": [
            [
              "email",
              "eliza.kotowska@ik.org.pl"
            ]
          ],
          "media": [
            [
              "website",
              "https://ik.org.pl/en/"
            ],
            [
              "facebook",
              "https://www.facebook.com/InstytutKosciuszki"
            ],
            [
              "x",
              "https://twitter.com/IKosciuszki/"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/instytut-ko%C5%9Bciuszki/"
            ]
          ]
        },
        {
          "name": "Reporters’ Foundation (Fundacja Reporterów)",
          "description": "Polish investigative journalism organization producing cross-border investigations on corruption, organized crime, and human rights violations; supports collaborative reporting, journalist training, and public interest journalism across Central and Eastern Europe.",
          "contact": [
            [
              "email",
              "anna.gielewska@fundacjareporterow.org"
            ],
            [
              "email",
              "kontakt@fundacjareporterow.org"
            ]
          ],
          "media": [
            [
              "website",
              "https://fundacjareporterow.org/en/"
            ],
            [
              "facebook",
              "https://www.facebook.com/fundacjareporterow"
            ],
            [
              "x",
              "https://x.com/FReporterow"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/frontstorypl/"
            ]
          ]
        },
        {
          "name": "Adapt Institute",
          "description": "Slovakia-based think tank focused on strategic defense, hybrid threats, and democratic resilience; conducts research and policy engagement on disinformation, civil preparedness, and national security in the context of emerging geopolitical challenges.",
          "contact": [
            [
              "email",
              "fratric@adaptinstitute.org"
            ],
            [
              "email",
              "office@adaptinstitute.org"
            ],
            [
              "phone_number",
              "+421 908 327 491"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.adaptinstitute.org/"
            ],
            [
              "facebook",
              "https://www.facebook.com/adapt.institute"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/adapt-institute-org/"
            ]
          ]
        },
        {
          "name": "GLOBSEC",
          "description": "Slovakia-based global think tank committed to enhancing security, prosperity, and sustainability in Europe and beyond; drives strategic dialogue on defense, democratic resilience, disinformation, and emerging technologies through high-level research, convenings, and advocacy.",
          "contact": [
            [
              "email",
              "katarina.klingova@globsec.org"
            ],
            [
              "email",
              "info@globsec.org"
            ],
            [
              "phone_number",
              "+421 2 321 378 00"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.globsec.org/"
            ],
            [
              "facebook",
              "https://www.facebook.com/GLOBSECforum/"
            ],
            [
              "x",
              "https://x.com/GLOBSEC"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/globsec"
            ],
            [
              "instagram",
              "https://www.instagram.com/globsecthinktank/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@GLOBSEC"
            ]
          ]
        },
        {
          "name": "Institute for Public Affairs (IVO)",
          "description": "Slovak think tank focused on the promotion of democratic values, civil society development, and rule of law; conducts public policy research, monitors media and human rights, and advocates for transparency, civic engagement, and informed public discourse.",
          "contact": [
            [
              "email",
              "meseznikov@gmail.com"
            ]
          ],
          "media": []
        },
        {
          "name": "The Investigative Center of Ján Kuciak (ICJK)",
          "description": "Slovak investigative journalism center continuing the legacy of Ján Kuciak through cross-border reporting on corruption, organized crime, and abuses of power; promotes transparency, electoral integrity, and press freedom through fearless, evidence-based journalism.",
          "contact": [
            [
              "email",
              "diko@icjk.sk"
            ],
            [
              "email",
              "icjk@icjk.sk"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.icjk.sk/"
            ],
            [
              "facebook",
              "https://www.facebook.com/icjk.sk"
            ],
            [
              "x",
              "https://twitter.com/ICJK_sk"
            ],
            [
              "instagram",
              "https://www.instagram.com/icjk.sk/"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCPQY77IlYZN_wwSXpfipXHA"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/investigativne-centrum-jana-kuciaka/"
            ]
          ]
        },
        {
          "name": "MEMO98",
          "description": "Slovakia-based non-profit specializing in media monitoring, election observation, and strategic communication; works globally to analyze media environments, promote fair electoral coverage, and counter disinformation through evidence-based advocacy and training.",
          "contact": [
            [
              "email",
              "kuzel@memo98.sk"
            ],
            [
              "email",
              "memo98@memo98.sk"
            ],
            [
              "phone_number",
              "+421 903 581 591"
            ]
          ],
          "media": [
            [
              "website",
              "https://memo98.sk/"
            ],
            [
              "facebook",
              "https://www.facebook.com/memo98.sk"
            ],
            [
              "x",
              "https://x.com/memo98slovakia"
            ],
            [
              "instagram",
              "https://www.instagram.com/memo_98_sk"
            ],
            [
              "youtube",
              "https://www.youtube.com/@memo9861"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/memo-98/"
            ]
          ]
        },
        {
          "name": "Institute for European Policies and Reforms (IPRE)",
          "description": "Policy research and advocacy on European integration and democratic governance in Moldova; monitoring of hybrid threats and disinformation; public engagement on rule of law and reform processes.",
          "contact": [
            [
              "email",
              "info@ipre.md"
            ],
            [
              "phone_number",
              "+373 22 788 986"
            ]
          ],
          "media": [
            [
              "website",
              "https://ipre.md/"
            ],
            [
              "facebook",
              "https://www.facebook.com/IPREMoldova"
            ],
            [
              "instagram",
              "https://www.instagram.com/ipre.md"
            ],
            [
              "x",
              "https://x.com/IPREMD"
            ]
          ]
        },
        {
          "name": "IDIS “Viitorul”",
          "description": "Research and analysis on economic development, good governance, and public policy in Moldova; initiatives countering disinformation and promoting media literacy; civic dialogue on transparency and democratic reform.",
          "contact": [
            [
              "email",
              "office@viitorul.org"
            ],
            [
              "phone_number",
              "+373 600 88 544"
            ]
          ],
          "media": [
            [
              "website",
              "http://www.viitorul.org/ro"
            ],
            [
              "facebook",
              "https://www.facebook.com/IDISViitorul"
            ]
          ]
        },
        {
          "name": "Expert-Grup",
          "description": "Independent economic and policy analysis on Moldova’s development; evidence-based reporting on governance, fiscal transparency, and social equity; public outreach on countering misinformation and promoting informed civic participation.",
          "contact": [
            [
              "email",
              "info@expert-grup.org"
            ],
            [
              "phone_number",
              "+373 22 999 312"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.expert-grup.org/ro/"
            ],
            [
              "facebook",
              "https://www.facebook.com/expertgrup.org"
            ],
            [
              "x",
              "https://x.com/Expert_Grup"
            ]
          ]
        },
        {
          "name": "Gender-Centru (Gender-Center)",
          "description": "Programs and advocacy on gender equality, women’s empowerment, and non-discrimination in Moldova; training and support services for survivors of gender-based violence; civic initiatives promoting feminist leadership and inclusive policy reforms.",
          "contact": [
            [
              "email",
              "lunguval@mcc.md"
            ],
            [
              "email",
              "gendercentru@gmail.com"
            ],
            [
              "phone_number",
              "+373 69182020"
            ]
          ],
          "media": [
            [
              "website",
              "https://gender-centru.md/en/about.html"
            ],
            [
              "facebook",
              "https://www.facebook.com/GenderCentru/"
            ],
            [
              "x",
              "https://x.com/centermoldova"
            ],
            [
              "instagram",
              "https://www.instagram.com/gendercentrumoldova/"
            ]
          ]
        },
        {
          "name": "GDM – Genderdoc-M",
          "description": "Advocacy, support services, and public education on LGBTQI+ rights in Moldova; legal assistance, community building, and anti-discrimination campaigns; visibility initiatives to challenge stigma and promote inclusive social change.",
          "contact": [
            [
              "email",
              "info@gdm.md"
            ],
            [
              "phone_number",
              "+373 22) 288 861"
            ]
          ],
          "media": [
            [
              "website",
              "https://gdm.md/en/home-eng-test/"
            ],
            [
              "facebook",
              "https://www.facebook.com/gdm.md/"
            ],
            [
              "instagram",
              "https://www.instagram.com/centrul_gdm/"
            ],
            [
              "vk",
              "https://vk.com/genderdoc"
            ],
            [
              "youtube",
              "https://www.youtube.com/c/genderdocm"
            ]
          ]
        },
        {
          "name": "Nokta.md",
          "description": "Independent journalism outlet reporting on political, social, and minority issues in Gagauzia and Moldova; investigations into governance, corruption, and disinformation; bilingual content aimed at strengthening informed civic engagement in underserved communities.",
          "contact": [
            [
              "email",
              "info@piligrim-demo.org.md"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/Nokta.md"
            ],
            [
              "instagram",
              "https://www.instagram.com/nokta.md/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@noktamd"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@nokta.md"
            ],
            [
              "telegram",
              "https://t.me/nokta_live"
            ]
          ]
        },
        {
          "name": "CCF Moldova",
          "description": "Programs focused on child protection, family reintegration, and inclusive education in Moldova; advocacy against institutionalization and for children’s rights; support services for vulnerable families and awareness campaigns on social inclusion.",
          "contact": [
            [
              "email",
              "contact@ccfmoldova.org"
            ],
            [
              "phone_number",
              "+373 22) 23 25 28"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.ccfmoldova.org/"
            ],
            [
              "facebook",
              "https://www.facebook.com/CCFHHCMoldova"
            ],
            [
              "instagram",
              "https://www.instagram.com/ccfmoldova/"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCXaqBsDZ8pBXLDgk0jT8Qaw"
            ]
          ]
        },
        {
          "name": "Diaconia",
          "description": "Faith-based social service organization supporting vulnerable communities in Moldova; initiatives on food security, housing, youth empowerment, and family support; advocacy for social justice and community resilience through local partnerships.",
          "contact": [
            [
              "email",
              "office@diaconia.md"
            ],
            [
              "phone_number",
              "+373 22 463 228"
            ]
          ],
          "media": [
            [
              "website",
              "https://diaconia.md/"
            ],
            [
              "facebook",
              "https://www.facebook.com/diaconia.md"
            ],
            [
              "instagram",
              "https://www.instagram.com/diaconia.md/"
            ]
          ]
        },
        {
          "name": "Center for Legal Resources of Moldova (CRJM)",
          "description": "Strategic litigation, policy advocacy, and monitoring of the justice sector in Moldova; initiatives promoting the rule of law, judicial independence, and human rights; research and civic engagement on governance, anti-corruption, and legal reform.",
          "contact": [
            [
              "email",
              "contact@crjm.org"
            ],
            [
              "phone_number",
              "+373 22) 843 601"
            ]
          ],
          "media": [
            [
              "website",
              "https://crjm.org/"
            ],
            [
              "facebook",
              "https://www.facebook.com/CRJM.org"
            ],
            [
              "x",
              "https://twitter.com/CRJMoldova"
            ],
            [
              "instagram",
              "https://instagram.com/crjm.ngo"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/10473484/"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCuSXb5aK503cEnMxhAfF2hg"
            ],
            [
              "telegram",
              "https://t.me/+b62wA3-Y7AozMWRi"
            ]
          ]
        },
        {
          "name": "Soros Foundation Moldova",
          "description": "Grantmaking and policy support for democratic governance, human rights, and open society values in Moldova; initiatives advancing media independence, justice reform, civic education, and inclusion of marginalized communities.",
          "contact": [
            [
              "email",
              "foundation@soros.md"
            ]
          ],
          "media": [
            [
              "website",
              "https://soros.md/"
            ],
            [
              "facebook",
              "https://www.facebook.com/fsorosmoldova"
            ],
            [
              "youtube",
              "https://youtube.com/@soros_md"
            ]
          ]
        },
        {
          "name": "Terre des hommes Moldova (Tdh Moldova)",
          "description": "Child protection and psychosocial support programs for vulnerable children and youth in Moldova; initiatives on justice for children, gender-based violence prevention, and safe migration; training and advocacy to strengthen child- and youth-friendly systems.",
          "contact": [
            [
              "email",
              "mda.office@tdh.org"
            ],
            [
              "phone_number",
              "+373 22 238 039"
            ]
          ],
          "media": [
            [
              "website",
              "https://tdh-moldova.org/"
            ],
            [
              "facebook",
              "https://www.facebook.com/tdhmoldova"
            ],
            [
              "youtube",
              "https://www.youtube.com/user/TdhMoldova/videos"
            ]
          ]
        },
        {
          "name": "Child Rights Information Center (CRIC Moldova)",
          "description": "Advocacy and education to promote children’s rights and meaningful participation in Moldova; development of child-friendly resources, civic education curricula, and teacher training; monitoring of policy implementation and promotion of inclusive education.",
          "contact": [
            [
              "email",
              "office@ciddc.md"
            ],
            [
              "email",
              "ciddc@yahoo.com"
            ],
            [
              "phone_number",
              "373 22) 747813"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.drepturilecopilului.md/index.php?lang=en"
            ],
            [
              "facebook",
              "https://www.facebook.com/ciddc/#"
            ]
          ]
        },
        {
          "name": "CONTACT Center Moldova",
          "description": "Capacity-building and support services for civil society organizations across Moldova; programs focused on community development, good governance, and civic participation; training and resources to strengthen local NGOs and grassroots initiatives.",
          "contact": [
            [
              "email",
              "info@contact.md"
            ],
            [
              "email",
              "info.ong.contact@gmail.com"
            ],
            [
              "phone_number",
              "+373 (022) 233946"
            ],
            [
              "phone_number",
              "+373 (022) 233947"
            ]
          ],
          "media": [
            [
              "website",
              "https://contact.md/"
            ],
            [
              "facebook",
              "https://www.facebook.com/Contact.md/"
            ],
            [
              "x",
              "https://x.com/CentrulCONTACT"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/in/centrul-contact-b826a0213/"
            ]
          ]
        },
        {
          "name": "Partnerships for Every Child (P4EC Moldova)",
          "description": "Programs supporting child and family welfare through deinstitutionalization, inclusive education, and social services reform in Moldova; advocacy for children’s rights and participation; community-based initiatives to protect and empower vulnerable families.",
          "contact": [
            [
              "email",
              "оffice@p4ec.md"
            ],
            [
              "phone_number",
              "+373 (22) 92-50-76"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/ParteneriatePentruFiecareCopil"
            ]
          ]
        },
        {
          "name": "The Moldova Project",
          "description": "Holistic support for vulnerable families and children in Moldova through education access, housing, healthcare, and social inclusion programs; community outreach focused on breaking the cycle of poverty and empowering families for long-term resilience.",
          "contact": [
            [
              "email",
              "office@themoldovaproject.org"
            ],
            [
              "phone_number",
              "+373 68098222"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.themoldovaproject.org/"
            ],
            [
              "facebook",
              "https://www.facebook.com/themoldovaproject"
            ],
            [
              "youtube",
              "https://www.youtube.com/@themoldovaproject"
            ],
            [
              "instagram",
              "https://www.instagram.com/themoldovaproject/"
            ]
          ]
        },
        {
          "name": "People in Need Moldova (PIN Moldova)",
          "description": "Comprehensive humanitarian and development programs addressing social inclusion, education, livelihoods, and crisis response in Moldova; initiatives promoting civic engagement, media literacy, and support for refugees and vulnerable groups.",
          "contact": [
            [
              "email",
              "info.moldova@peopleinneed.net"
            ],
            [
              "phone_number",
              "+373 609 89 905"
            ]
          ],
          "media": [
            [
              "website",
              "https://moldova.peopleinneed.net/mo/"
            ],
            [
              "facebook",
              "https://www.facebook.com/PIN.moldova"
            ]
          ]
        },
        {
          "name": "East Europe Foundation Moldova (EEF Moldova)",
          "description": "Programs advancing democratic governance, economic opportunity, and civic engagement in Moldova; initiatives supporting local NGOs, social entrepreneurship, digital innovation, and community resilience through participatory decision-making.",
          "contact": [
            [
              "email",
              "info@eef.md"
            ],
            [
              "phone_number",
              "+373)22 23-53-43"
            ]
          ],
          "media": [
            [
              "website",
              "https://eef.md/en/"
            ],
            [
              "facebook",
              "https://www.facebook.com/fundatia.est.europeana"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCXfAysxW_QA5Nwo7wobod3A/videos"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/east-europe-foundation-moldova/about/"
            ]
          ]
        },
        {
          "name": "Solidarity Fund PL in Moldova",
          "description": "Support for local development and community resilience in Moldova through participatory planning, rural revitalization, and citizen engagement; partnerships with public authorities and civil society to strengthen local governance and inclusive growth.",
          "contact": [
            [
              "email",
              "info@solidarityfund.md"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/solidarityfund.md"
            ],
            [
              "instagram",
              "https://www.instagram.com/solidarityfundplinmoldova/"
            ],
            [
              "youtube",
              "https://www.youtube.com/channel/UCumOsMHXOENHfhLCOzsb72w"
            ],
            [
              "linkedin",
              "https://www.linkedin.com/company/solidarity-fund-pl-in-moldova/"
            ]
          ]
        },
        {
          "name": "Promo-LEX Association",
          "description": "Monitoring, advocacy, and legal assistance to promote democracy, human rights, and the rule of law in Moldova; civic education campaigns, election observation missions, and strategic litigation to strengthen justice and democratic institutions.",
          "contact": [
            [
              "email",
              "info@promolex.md"
            ],
            [
              "phone_number",
              "373 22 310945"
            ],
            [
              "phone_number",
              "373 22 450024"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/promolex.md/"
            ],
            [
              "instagram",
              "https://www.instagram.com/asociatia_promolex/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@asociatiapromo-lex8534"
            ]
          ]
        },
        {
          "name": "Center for Independent Journalism (CJI Moldova)",
          "description": "Media development and press freedom advocacy in Moldova; training programs for journalists, media literacy campaigns, and legal support for independent media; initiatives addressing disinformation, ethics, and transparency in journalism.",
          "contact": [
            [
              "email",
              "info@ijc.md"
            ],
            [
              "phone_number",
              "+373 22) 213652"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/cji.moldova#"
            ],
            [
              "instagram",
              "https://www.instagram.com/cjimoldova/"
            ],
            [
              "youtube",
              "https://www.youtube.com/c/IJCMoldova/videos"
            ]
          ]
        },
        {
          "name": "Association of Electronic Press of Moldova (APEL)",
          "description": "Promotion of pluralism and quality standards in Moldovan broadcasting; media policy advocacy, content monitoring, and support for independent audiovisual outlets; initiatives enhancing transparency, ethical journalism, and public interest media.",
          "contact": [
            [
              "email",
              "apel_md@yahoo.com"
            ],
            [
              "email",
              "ao.apel@gmail.com"
            ],
            [
              "phone_number",
              "+373 22 845-355"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/AO.APEL"
            ]
          ]
        },
        {
          "name": "Chiril-Adam Macari",
          "description": "Content creator and civic voice spotlighting political accountability, social justice, and youth engagement in Moldova; uses satire, commentary, and investigative storytelling to challenge disinformation and mobilize digital audiences.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@chiril_adam"
            ]
          ]
        },
        {
          "name": "Vitalie Eșanu / Blog Forum Moldova",
          "description": "Civic activist and media literacy influencer promoting critical thinking, digital resilience, and civic responsibility in Moldova; creates accessible content on disinformation, online manipulation, and fact-checking for youth and digital audiences.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@vitaliblogforummoldova"
            ]
          ]
        },
        {
          "name": "Savciuc Lucian",
          "description": "Youth influencer and digital content creator known for relatable Moldovan humor, lifestyle commentary, and motivational videos; engages young audiences through social trends, daily challenges, and messages of personal growth and positivity.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@lucian.312"
            ],
            [
              "instagram",
              "https://www.instagram.com/lucian.312/"
            ]
          ]
        },
        {
          "name": "Violeta Ciuprin",
          "description": "Youth lifestyle influencer creating content that inspires self-confidence, educational ambition, and personal expression; combines fashion, motivation, and advocacy to empower young Moldovans to pursue growth and civic-minded leadership.",
          "contact": [
            [
              "email",
              "travelwithvioleta@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@violetaciuprin"
            ],
            [
              "instagram",
              "https://www.instagram.com/violetaciuprin/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@travelwithvioleta"
            ],
            [
              "facebook",
              "https://www.facebook.com/violeta.ciuprin/"
            ]
          ]
        },
        {
          "name": "Morgoci Official (Andrei Morgoci)",
          "description": "Youth humor influencer known for comedic sketches and satire reflecting Moldovan daily life; uses humor and light civic commentary to engage young audiences, spark dialogue on social norms, and promote relatable civic awareness.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@morgociofficial"
            ]
          ]
        },
        {
          "name": "Banca de Bancuri",
          "description": "Popular digital humor platform sharing comedic sketches, viral jokes, and culturally rooted satire; engages Moldovan youth through humor while subtly addressing everyday social themes and generational experiences.",
          "contact": [
            [
              "email",
              "valeriu.rascu1@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@bancadebancuri"
            ],
            [
              "instagram",
              "https://www.instagram.com/bancadebancuri/"
            ],
            [
              "facebook",
              "https://www.facebook.com/banca.bancuri/"
            ],
            [
              "youtube",
              "https://www.youtube.com/c/BancaDeBancuri"
            ]
          ]
        },
        {
          "name": "Nanu Danu",
          "description": "Entertainer and content creator known for Moldovan humor, relatable social commentary, and comedic storytelling; blends cultural references, satire, and youth trends to engage digital audiences with light civic awareness and local identity.",
          "contact": [
            [
              "email",
              "nanudanu7@gmail.com"
            ]
          ],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@nanu_danu_"
            ]
          ]
        },
        {
          "name": "Emilian Crețu",
          "description": "Actor, comedian, and digital creator known for sharp satire, character-driven sketches, and advocacy through humor; blends entertainment with commentary on social issues, gender norms, and civic values to engage wide Moldovan audiences.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@emiliancretu"
            ],
            [
              "instagram",
              "https://www.instagram.com/emiliancretu05/"
            ],
            [
              "youtube",
              "https://www.youtube.com/@EmilianCretu"
            ],
            [
              "facebook",
              "https://www.facebook.com/profile.php?id=100044134479263"
            ]
          ]
        },
        {
          "name": "Sergiu Coșnician",
          "description": "Content creator and satirist known for his sharp takes on politics, media, and everyday Moldovan life; uses humor, parody, and relatable scenarios to promote critical thinking, civic awareness, and media literacy among digital audiences.",
          "contact": [],
          "media": [
            [
              "tiktok",
              "https://www.tiktok.com/@sergiucosnician"
            ],
            [
              "instagram",
              "https://www.instagram.com/sergiucosnician"
            ]
          ]
        },
        {
          "name": "Keya Health",
          "description": "Keya Health is a digital health platform using telehealth tools like virtual care, remote monitoring, and health information services to promote accessible and affordable preventive healthcare.",
          "contact": [
            [
              "email",
              "healthkeya@gmail.com"
            ]
          ],
          "media": [
            [
              "website",
              "https://keya.rw/"
            ],
            [
              "facebook",
              "https://www.facebook.com/keya.heath/"
            ],
            [
              "instagram",
              "https://www.instagram.com/healthkeya/"
            ],
            [
              "x",
              "https://x.com/health_keya"
            ]
          ]
        },
        {
          "name": "HealthEdu Ltd",
          "description": "HealthEdu is a digital health education platform providing evidence-based online and offline training for health professionals and community health workers.",
          "contact": [
            [
              "email",
              "helthedultd@gmail.com"
            ],
            [
              "phone_number",
              "+250 789 044 439"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.healthedu.rw/"
            ],
            [
              "facebook",
              "https://www.facebook.com/people/HealthEdu/100031806323337/"
            ],
            [
              "instagram",
              "https://www.instagram.com/healthedurw/"
            ],
            [
              "x",
              "https://x.com/healthedultd1"
            ]
          ]
        },
        {
          "name": "Check Me",
          "description": "Check Me is a health tech startup using digital platforms and AI tools to promote breast cancer awareness and early detection among African women, especially in underserved areas. Its solution includes a mobile/web app, AI assistant, and upcoming portable screening device.",
          "contact": [],
          "media": [
            [
              "instagram",
              "https://www.instagram.com/checkmeappltd/"
            ]
          ]
        },
        {
          "name": "WelTel Rwanda",
          "description": "WelTel is a secure, evidence-based digital health platform integrated into Rwanda’s health system that uses SMS and AI to enhance patient engagement and virtual care across diseases, including Ebola and chronic conditions.",
          "contact": [
            [
              "email",
              "privacy@weltel.org"
            ],
            [
              "email",
              "info@weltel.org"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.weltelhealth.com/"
            ],
            [
              "facebook",
              "https://www.facebook.com/WelTelInternational"
            ],
            [
              "instagram",
              "https://www.instagram.com/weltelhealth?igsh=eGJ2Nm52bTE2dWF5"
            ],
            [
              "x",
              "https://x.com/WelTelHealth"
            ]
          ]
        },
        {
          "name": "Viebeg Technologies",
          "description": "Viebeg is a health tech company using AI to optimize medical supply chains in Central and East Africa, ensuring that healthcare providers maintain consistent, cost-effective access to essential medical supplies.",
          "contact": [
            [
              "email",
              "sales@viebeg.com"
            ],
            [
              "phone_number",
              "+250 782 205 366"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.viebeg.com/"
            ],
            [
              "facebook",
              "https://www.facebook.com/profile.php?id=100063507904892#"
            ],
            [
              "instagram",
              "https://www.instagram.com/viebeg_medical/"
            ],
            [
              "x",
              "https://x.com/ViebegM"
            ]
          ]
        },
        {
          "name": "University of Global Health Equity",
          "description": "The University of Global Health Equity in Rwanda trains future health professionals and leaders, while supporting medical education, research, and medtech innovation to improve healthcare quality and access in Africa.",
          "contact": [
            [
              "phone_number",
              "+250 786 405 072"
            ]
          ],
          "media": [
            [
              "website",
              "https://ughe.org/"
            ],
            [
              "x",
              "https://x.com/ughe_org"
            ],
            [
              "instagram",
              "https://www.instagram.com/ughe_org/"
            ],
            [
              "facebook",
              "https://www.facebook.com/ughe.org/"
            ]
          ]
        },
        {
          "name": "Health Builders",
          "description": "Health Builders is a non-profit strengthening Rwanda’s health systems by providing management frameworks, infrastructure, and essential resources to primary care facilities serving over 1 million people.",
          "contact": [
            [
              "email",
              "info@healthbuilders.org"
            ],
            [
              "phone_number",
              "+1 303 598 5320"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.healthbuilders.org/"
            ],
            [
              "facebook",
              "https://www.facebook.com/healthbuildersintl"
            ],
            [
              "instagram",
              "https://www.instagram.com/hbuildersintl/"
            ],
            [
              "x",
              "https://x.com/HB_Rwanda"
            ]
          ]
        },
        {
          "name": "Centre for AI Policy and Innovation Ltd",
          "description": "The Centre for AI Policy and Innovation Ltd drives AI-enabled health innovation in Rwanda by developing governance frameworks, supporting scalable AI solutions, and establishing health data trusts to improve public health outcomes.",
          "contact": [
            [
              "email",
              "info@c4ir.rw"
            ]
          ],
          "media": [
            [
              "website",
              "https://c4ir.rw/"
            ],
            [
              "x",
              "https://x.com/c4ir_rw"
            ]
          ]
        },
        {
          "name": "Society for Family Health",
          "description": "Society for Family Health empowers health leaders and communities in malaria-endemic countries through data-driven decision-making and evidence-based social behavior change communication.",
          "contact": [
            [
              "email",
              "info@sfhrwanda.org"
            ],
            [
              "phone_number",
              "+250 7883 12174"
            ],
            [
              "phone_number",
              "+250 78830 5685"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.sfhrwanda.org.rw/"
            ],
            [
              "facebook",
              "https://www.facebook.com/p/Society-for-Family-Health-Rwanda-100081353344716/"
            ],
            [
              "x",
              "https://x.com/sfhrwanda"
            ],
            [
              "instagram",
              "https://www.instagram.com/sfhrwanda/"
            ]
          ]
        },
        {
          "name": "King Faisal Hospital Rwanda Foundation (KFHRF)",
          "description": "KFHRF supports medical research, training, and education in Rwanda, focusing on maternal and child health, non-communicable diseases, and improving access to surgical care.",
          "contact": [
            [
              "email",
              "info@kfhkigali.com"
            ],
            [
              "phone_number",
              "+250 788 123 200"
            ],
            [
              "phone_number",
              "+250 792 576 938"
            ]
          ],
          "media": [
            [
              "website",
              "https://kfh.rw/"
            ],
            [
              "x",
              "https://x.com/kfaisalhospital"
            ],
            [
              "facebook",
              "https://www.facebook.com/KFHKigali"
            ]
          ]
        },
        {
          "name": "Ministry of Health, Rwanda",
          "description": "The Ministry of Health, Rwanda, leads the country’s health sector modernization with a focus on innovation, digitalization, research, and building a resilient healthcare system to achieve universal health coverage by 2030.",
          "contact": [
            [
              "email",
              "info@moh.gov.rw"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.moh.gov.rw/"
            ],
            [
              "x",
              "https://x.com/RwandaHealth"
            ],
            [
              "instagram",
              "https://www.instagram.com/rwandahealth/#"
            ],
            [
              "facebook",
              "https://www.facebook.com/rwandahealth"
            ]
          ]
        },
        {
          "name": "African Institute for Mathematical Sciences - Next Einstein Initiative Foundation (AIMS-NEI)",
          "description": "AIMS-NEI is a pan-African network that builds STEM capacity and supports health research, including disease modeling and outbreak characterization, to advance scientific innovation and public health across Africa.",
          "contact": [
            [
              "email",
              "info@aims.ac.rw"
            ]
          ],
          "media": [
            [
              "website",
              "https://aims.ac.rw/"
            ],
            [
              "x",
              "https://x.com/AIMS_Rwanda"
            ],
            [
              "facebook",
              "https://www.facebook.com/AIMSRwanda"
            ]
          ]
        },
        {
          "name": "HISP Ltd",
          "description": "HISP Ltd develops customizable digital health information systems to improve immunization planning and healthcare delivery across Rwanda and Africa.",
          "contact": [
            [
              "email",
              "hisp.rwanda@gmail.com"
            ],
            [
              "email",
              "contact@hisprwanda.org"
            ],
            [
              "phone_number",
              "+250 791 590 407"
            ],
            [
              "phone_number",
              "+250 791 590 406"
            ]
          ],
          "media": [
            [
              "website",
              "https://hisprwanda.org/"
            ],
            [
              "x",
              "https://x.com/HispRwanda"
            ],
            [
              "facebook",
              "https://www.facebook.com/hisp.rwanda.7"
            ],
            [
              "instagram",
              "https://www.instagram.com/hisp_rwanda/"
            ]
          ]
        },
        {
          "name": "AKADEMIYA2063",
          "description": "AKADEMIYA2063 is a pan-African research organization building advanced data and analytical capacities to support evidence-based policymaking aligned with Africa’s Agenda 2063.",
          "contact": [
            [
              "email",
              "hq-office@akademiya2063.org"
            ],
            [
              "phone_number",
              "+250 788 318 315"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.akademiya2063.org/#"
            ],
            [
              "x",
              "https://x.com/AKADEMIYA2063"
            ],
            [
              "facebook",
              "https://www.facebook.com/AKADEMIYA2063"
            ]
          ]
        },
        {
          "name": "Imbuto Foundation",
          "description": "Imbuto Foundation improves maternal health by enhancing obstetric care through early diagnosis and timely referral of high-risk pregnancies, while also addressing HIV/AIDS and broader community wellbeing.",
          "contact": [
            [
              "email",
              "info@imbutofoundation.org"
            ],
            [
              "phone_number",
              "+250 252 552 064"
            ]
          ],
          "media": [
            [
              "website",
              "https://imbutofoundation.org/"
            ],
            [
              "x",
              "https://x.com/Imbuto"
            ],
            [
              "instagram",
              "https://www.instagram.com/imbutofoundation/"
            ],
            [
              "facebook",
              "https://www.facebook.com/profile.php?id=100064781798196&fref=ts#"
            ]
          ]
        },
        {
          "name": "National Council for Science and Technology",
          "description": "NCST promotes research and innovation at the intersection of climate change and public health to foster a healthier population and sustainable development in Rwanda.",
          "contact": [
            [
              "email",
              "info@ncst.gov.rw"
            ],
            [
              "phone_number",
              "+250 781 030 798"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.ncst.gov.rw/"
            ],
            [
              "x",
              "https://x.com/ScienceTechRw"
            ],
            [
              "instagram",
              "https://www.instagram.com/NCSTRwanda/"
            ]
          ]
        },
        {
          "name": "TKMD Rwanda Ltd",
          "description": "TKMD Rwanda Ltd manufactures safety and auto-disable syringes and other medical consumables to ensure stable, high-quality supply for COVID-19 and routine immunization across Africa.",
          "contact": [
            [
              "email",
              "bbd@tkmedical.com"
            ],
            [
              "phone_number",
              "+86 550 730 9165"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.tkmedical.com/"
            ]
          ]
        },
        {
          "name": "BK TecHouse Limited",
          "description": "BK TecHouse leverages digital innovation to scale integrated platforms that support agricultural and health-related services through public-private partnerships in Rwanda.",
          "contact": [
            [
              "email",
              "bktechouse@bk.rw"
            ],
            [
              "phone_number",
              "+250 788 195 700 -"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.bktechouse.rw/index.html"
            ],
            [
              "x",
              "https://x.com/bktechouse"
            ],
            [
              "facebook",
              "https://www.facebook.com/BKTecHouse.Rw"
            ]
          ]
        },
        {
          "name": "Irembo Limited",
          "description": "Irembo Limited enhances the efficiency and accessibility of digital health services by supporting government-led digital transformation initiatives in Rwanda.",
          "contact": [
            [
              "email",
              "info@irembo.com"
            ],
            [
              "phone_number",
              "+250 788 179 100"
            ]
          ],
          "media": [
            [
              "website",
              "https://irembo.com/"
            ],
            [
              "x",
              "https://x.com/teamirembo"
            ],
            [
              "instagram",
              "https://www.instagram.com/teamirembo/?utm_medium=copy_link"
            ],
            [
              "facebook",
              "https://www.facebook.com/irembogov"
            ]
          ]
        },
        {
          "name": "University of Rwanda",
          "description": "The University of Rwanda conducts research on digital health and telemedicine effectiveness in low-income settings, supporting innovation in health service delivery.",
          "contact": [
            [
              "email",
              "info@ur.ac.rw"
            ]
          ],
          "media": [
            [
              "website",
              "https://ur.ac.rw/"
            ],
            [
              "x",
              "https://x.com/Uni_Rwanda"
            ],
            [
              "tiktok",
              "https://www.tiktok.com/@uni_rwanda"
            ],
            [
              "facebook",
              "https://www.facebook.com/UniversityofRwanda/"
            ],
            [
              "instagram",
              "https://www.instagram.com/uni_rwanda13/?igsh=aHhoaTJrdHNneHQ5#"
            ]
          ]
        },
        {
          "name": "Rwanda Biomedical Centre",
          "description": "Rwanda Biomedical Centre is the country’s central health agency implementing innovative, evidence-based health interventions, including digital monitoring for services like COVID-19 response, family planning, etc.",
          "contact": [
            [
              "email",
              "info@rbc.gov.rw"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.rbc.gov.rw/"
            ],
            [
              "x",
              "https://x.com/RBCRwanda"
            ],
            [
              "facebook",
              "https://www.facebook.com/rwandahealth/?fref=ts"
            ]
          ]
        },
        {
          "name": "Rwanda Agriculture Board",
          "description": "RAB integrates research, extension, and policy to modernize agriculture and improve land use, including digital tools like soil information services for smallholder farmers.",
          "contact": [
            [
              "email",
              "info@rab.gov.rw"
            ],
            [
              "phone_number",
              "+250 788 385 312"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.rab.gov.rw/"
            ],
            [
              "x",
              "https://x.com/RwandaAgriBoard"
            ],
            [
              "instagram",
              "https://www.instagram.com/rwandaagriboard/"
            ],
            [
              "facebook",
              "https://www.facebook.com/RwandaAgriBoard/"
            ]
          ]
        },
        {
          "name": "Pit Vidura",
          "description": "Pit Vidura develops SMS-based platforms and technologies to improve coordination and reduce costs for safe fecal waste collection in underserved urban communities.",
          "contact": [
            [
              "email",
              "info@pitvidura.com"
            ],
            [
              "phone_number",
              "+250 781 464 716"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.pitvidura.com/"
            ],
            [
              "facebook",
              "https://www.facebook.com/PitViduraRwanda"
            ],
            [
              "instagram",
              "https://www.instagram.com/pitvidura/?hl=en"
            ],
            [
              "x",
              "https://x.com/PitVidura"
            ]
          ]
        },
        {
          "name": "Government of Rwanda, Ministry of Infrastructure",
          "description": "The Ministry of Infrastructure supports water, sanitation, and hygiene (WASH) initiatives like AfricaSan to improve public health and quality of life across Rwanda.",
          "contact": [
            [
              "email",
              "info@mininfra.gov.rw"
            ],
            [
              "phone_number",
              "+250 788 387 125"
            ]
          ],
          "media": [
            [
              "website",
              "http://www.mininfra.gov.rw/"
            ],
            [
              "x",
              "https://x.com/RwandaInfra"
            ],
            [
              "facebook",
              "https://www.facebook.com/RwandaInfra"
            ]
          ]
        },
        {
          "name": "Send a Cow Rwanda",
          "description": "Send a Cow Rwanda promotes gender equity and improved household health by educating communities on gender roles and encouraging the use of energy-saving stoves to reduce time, labor, and health risks.",
          "contact": [
            [
              "email",
              "info@rippleeffect.org"
            ],
            [
              "phone_number",
              "+44 (0)1225 874222"
            ],
            [
              "phone_number",
              "+44 (0)1225 688222"
            ]
          ],
          "media": [
            [
              "website",
              "https://rippleeffect.org/"
            ],
            [
              "x",
              "https://x.com/RippleEffectNGO"
            ],
            [
              "instagram",
              "https://www.instagram.com/rippleeffectngo/"
            ],
            [
              "facebook",
              "https://www.facebook.com/rippleeffectngo"
            ]
          ]
        },
        {
          "name": "Lifesten Health Limited",
          "description": "Lifesten Health is a Rwandan digital wellness platform that integrates physical activity, nutrition, and mental health through personalized, incentive-based programs aimed at preventing lifestyle diseases like cardiovascular conditions.",
          "contact": [
            [
              "email",
              "Lifesten.health@gmail.com"
            ],
            [
              "phone_number",
              "+250 790 001 248 ("
            ],
            [
              "phone_number",
              "+250) 795456769"
            ]
          ],
          "media": [
            [
              "website",
              "https://lifestenhealth.com/"
            ],
            [
              "instagram",
              "https://www.instagram.com/lifesten_health/"
            ],
            [
              "facebook",
              "https://www.facebook.com/lifesten"
            ],
            [
              "x",
              "https://x.com/lifesten_health"
            ]
          ]
        },
        {
          "name": "Mizero Care LTD",
          "description": "Mizero Care Ltd provides online psychotherapy services to address mental health challenges stemming from trauma, particularly related to the Genocide against the Tutsi, with a focus on reducing isolation.",
          "contact": [
            [
              "email",
              "mizerocare.moc@gmail.com"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/MizeroCare/"
            ]
          ]
        },
        {
          "name": "Tantine Group",
          "description": "Tantine Group offers a digital health app that supports women’s reproductive health by tracking menstruation, fertility, and pregnancy, while delivering daily baby development updates and health advice.",
          "contact": [
            [
              "email",
              "tantinerwanda@gmail.com"
            ],
            [
              "phone_number",
              "+250 786 944 426"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.tantine.rw/"
            ],
            [
              "facebook",
              "https://www.facebook.com/tantinerw?_rdc=1&_rdr#"
            ],
            [
              "x",
              "https://x.com/tantinerw"
            ],
            [
              "instagram",
              "https://www.instagram.com/tantinerw/"
            ]
          ]
        },
        {
          "name": "Kapsule",
          "description": "Kapsule is a health tech company improving the affordability, accessibility, and authenticity of healthcare in low-resource settings by digitizing healthcare processes and delivering actionable data insights.",
          "contact": [
            [
              "email",
              "info@kapsuletech.com"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.kapsuletech.com/"
            ],
            [
              "instagram",
              "https://www.instagram.com/kapsuletech/"
            ]
          ]
        },
        {
          "name": "Afiapharma",
          "description": "AFIAPHARMA is an FDA-certified online pharmacy platform in Rwanda that delivers affordable medications to patients’ homes with just a few clicks, improving access to essential medicines across Africa.",
          "contact": [
            [
              "email",
              "info@afiapharma.com"
            ],
            [
              "phone_number",
              "+250 785 831 256"
            ]
          ],
          "media": [
            [
              "website",
              "https://afiapharma.com/"
            ],
            [
              "instagram",
              "https://www.instagram.com/afiapharma/"
            ],
            [
              "facebook",
              "https://www.facebook.com/afiapharma"
            ],
            [
              "x",
              "https://x.com/PharmaAfia"
            ]
          ]
        },
        {
          "name": "TIP Global Health",
          "description": "TIP Global Health developed E-Heza, a digital data collection system that enables healthcare workers in Rwanda to record and analyze patient data in real time, improving care quality and the use of evidence-based clinical protocols in resource-limited settings.",
          "contact": [
            [
              "email",
              "info@tipglobalhealth.org"
            ],
            [
              "phone_number",
              "+1 831-661-5237"
            ]
          ],
          "media": [
            [
              "website",
              "https://tipglobalhealth.org/"
            ],
            [
              "x",
              "https://x.com/tipglobalhealth"
            ],
            [
              "facebook",
              "https://www.facebook.com/TIPGlobalHealth/"
            ],
            [
              "instagram",
              "https://www.instagram.com/tipglobalhealth/"
            ]
          ]
        },
        {
          "name": "Eden Care",
          "description": "Eden Care is a digital health insurance platform that equips employers with a smart HR dashboard and provides members with a mobile app and concierge team to manage and access healthcare services efficiently.",
          "contact": [
            [
              "email",
              "info@edencaremedical.com"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.edencaremedical.com/"
            ],
            [
              "x",
              "https://x.com/edencaremedical?lang=en"
            ],
            [
              "facebook",
              "https://www.facebook.com/profile.php?id=100087439992711"
            ],
            [
              "instagram",
              "https://www.instagram.com/edencaremedical/"
            ]
          ]
        },
        {
          "name": "KarisimbiTech",
          "description": "KarisimbiTech is a Kigali-based startup transforming healthcare in Africa through its electronic medical records platform, XanaHealth, which connects patients, providers, insurers, and policymakers to eliminate data inefficiencies and improve care.",
          "contact": [
            [
              "email",
              "info@karisimbitech.rw"
            ],
            [
              "phone_number",
              "+250-788-597-772"
            ],
            [
              "phone_number",
              "+250-790-990-538"
            ]
          ],
          "media": [
            [
              "website",
              "https://karisimbitech.rw/"
            ],
            [
              "facebook",
              "https://www.facebook.com/karisimbitech/"
            ],
            [
              "x",
              "https://x.com/KarisimbiTech"
            ]
          ]
        },
        {
          "name": "eFiche",
          "description": "eFiche is a health-tech company transforming healthcare in Africa with an AI-powered electronic medical records (EMR) system that connects patients, providers, and facilities to improve access, efficiency, and equity in care.",
          "contact": [
            [
              "email",
              "info@efiche.africa"
            ],
            [
              "phone_number",
              "+250788307498"
            ]
          ],
          "media": [
            [
              "website",
              "https://efiche.rw/"
            ],
            [
              "instagram",
              "https://www.instagram.com/efichehq?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw%3D%3D"
            ],
            [
              "x",
              "https://x.com/fiche_e"
            ]
          ]
        },
        {
          "name": "Dynasoft",
          "description": "Dynasoft is a Rwandan health-tech company behind Medisoft, an advanced EMR platform that digitizes healthcare workflows and integrates with national health systems, including RSSB-CBHI and OpenHIE, to improve care coordination and efficiency",
          "contact": [
            [
              "email",
              "info@dynasoft.rw"
            ],
            [
              "phone_number",
              "+250 788 210 800"
            ],
            [
              "phone_number",
              "+250 783 610 006"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.dynasoft.rw/"
            ]
          ]
        },
        {
          "name": "Dot Glasses",
          "description": "Dot Glasses is a social enterprise innovating affordable vision care through a patented modular eyeglasses system and a portable vision-testing toolkit, enabling rapid, low-cost diagnosis and distribution in underserved communities.",
          "contact": [
            [
              "email",
              "info@dotglasses.org"
            ],
            [
              "phone_number",
              "+254 732 587 508"
            ]
          ],
          "media": [
            [
              "website",
              "https://dotglasses.org/"
            ],
            [
              "facebook",
              "https://www.facebook.com/dotglasses"
            ],
            [
              "instagram",
              "https://www.instagram.com/dotglasses_international/"
            ],
            [
              "x",
              "https://x.com/dotglasses"
            ]
          ]
        },
        {
          "name": "The Ministry of Information Communication Technology and Innovation",
          "description": "MINICT drives Rwanda’s economic growth and poverty reduction by developing and coordinating national ICT and innovation policies, empowering citizens, and enabling digital solutions that can enhance health systems and service delivery.",
          "contact": [
            [
              "email",
              "info@minict.gov.rw"
            ],
            [
              "phone_number",
              "+250 786 791 388"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.minict.gov.rw/"
            ],
            [
              "x",
              "https://x.com/RwandaICT"
            ],
            [
              "instagram",
              "https://www.instagram.com/rwandaict/"
            ],
            [
              "facebook",
              "https://www.facebook.com/MYICTrw"
            ]
          ]
        },
        {
          "name": "HealthTech Hub",
          "description": "HealthTech Hub Africa is a Kigali-based pan-African accelerator supporting the development and fast-tracking of innovative health technologies by fostering collaboration between startups, governments, and global health funders to address critical public health challenges in underserved populations.",
          "contact": [],
          "media": [
            [
              "website",
              "https://thehealthtech.org/"
            ],
            [
              "instagram",
              "https://www.instagram.com/healthtechhubafrica/"
            ],
            [
              "facebook",
              "https://www.facebook.com/healthtechhubafrica/"
            ],
            [
              "x",
              "https://x.com/HealthTech_org"
            ]
          ]
        },
        {
          "name": "Insightiv Technologies",
          "description": "Insightiv develops AI-powered teleradiology solutions to expand access to remote medical imaging diagnostics in Rwanda and Africa.",
          "contact": [
            [
              "email",
              "info@insightiv.ai"
            ],
            [
              "phone_number",
              "+1 857-288-9534"
            ]
          ],
          "media": [
            [
              "facebook",
              "https://www.facebook.com/insightivtech/"
            ],
            [
              "instagram",
              "https://www.instagram.com/insightiv_tech/"
            ],
            [
              "x",
              "https://x.com/insightiv_tech"
            ]
          ]
        },
        {
          "name": "The Global Health Network Africa",
          "description": "The Global Health Network Africa strengthens health research and data science capabilities through regional training and partnerships.",
          "contact": [
            [
              "email",
              "africa@tghn2.org"
            ],
            [
              "email",
              "info@theglobalhealthnetwork.org"
            ]
          ],
          "media": [
            [
              "website",
              "https://africa.tghn.org/"
            ],
            [
              "x",
              "https://x.com/info_tghn"
            ],
            [
              "facebook",
              "https://www.facebook.com/TheGlobalHealthNetwork/"
            ]
          ]
        },
        {
          "name": "Zipline",
          "description": "Zipline operates autonomous drone delivery systems to rapidly transport medical supplies and healthcare products to remote and underserved communities",
          "contact": [],
          "media": [
            [
              "website",
              "https://www.zipline.com/"
            ],
            [
              "x",
              "https://x.com/zipline"
            ],
            [
              "facebook",
              "https://www.facebook.com/flyzipline/"
            ],
            [
              "instagram",
              "https://www.instagram.com/zipline/"
            ]
          ]
        },
        {
          "name": "Audere",
          "description": "Audere develops AI-powered digital health platforms that support disease detection, treatment adherence, and real-time monitoring to improve healthcare delivery in low-resource settings.",
          "contact": [
            [
              "email",
              "audereafrica@auderenow.org"
            ],
            [
              "phone_number",
              "+27 82 546 8978"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.auderenow.org/"
            ],
            [
              "facebook",
              "https://www.facebook.com/auderenow"
            ],
            [
              "x",
              "https://x.com/AudereNow"
            ]
          ]
        },
        {
          "name": "Babyl",
          "description": "Babyl leverages mobile technology to provide accessible, affordable, and personalized digital healthcare services, including online consultations, diagnostics, and prescription delivery in Rwanda",
          "contact": [
            [
              "email",
              "support@babyl.rw"
            ]
          ],
          "media": [
            [
              "website",
              "https://www.babyl.rw/"
            ],
            [
              "x",
              "https://x.com/BabylHealth"
            ],
            [
              "facebook",
              "https://www.facebook.com/babylrwanda"
            ]
          ]
        },
        {
          "name": "Rwanda Health Informatics Alliance (RHIA)",
          "description": "RHIA promotes the adoption and advancement of health informatics in Rwanda to improve healthcare delivery, data accuracy, and public health through innovative use of information and communication technologies",
          "contact": [
            [
              "email",
              "healthinformaticsrwanda@gmail.com"
            ],
            [
              "phone_number",
              "+250 790 696 667"
            ]
          ],
          "media": [
            [
              "website",
              "https://rhia.rw/"
            ],
            [
              "instagram",
              "https://www.instagram.com/healthinformaticsrwanda/reels/"
            ],
            [
              "x",
              "https://x.com/rhiassociation"
            ]
          ]
        }
      ]
    }
  
    db.query SOCIAL_MEDIA_CHANNEL {
      return = {type: "list"}
    } as $SOCIAL_MEDIA_CHANNELS
  
    var $to_map {
      value = {}
    }
  
    foreach ($SOCIAL_MEDIA_CHANNELS) {
      each as $i {
        var.update $to_map {
          value = $to_map|set:($i.name|to_lower):$i.id
        }
      }
    }
  
    var.update $SOCIAL_MEDIA_CHANNELS {
      value = $to_map
    }
  
    var $TO_UPDATE {
      value = []
    }
  
    db.transaction {
      stack {
        foreach ($data) {
          each as $item {
            db.query PARTNER {
              where = $db.PARTNER.name == $item.name && $db.PARTNER.description == $item.description
              return = {type: "single"}
              output = ["id"]
            } as $PARTNER_ID|get:"id":null
          
            precondition ($PARTNER_ID != null) {
              error_type = "inputerror"
            }
          
            var $contact_to_create {
              value = []
            }
          
            foreach ($item.contact) {
              each as $contact_info {
                array.push $contact_to_create {
                  value = {}
                    |set:"type":($contact_info|first)
                    |set:"value":($contact_info|last)
                    |set:"partner_id":$PARTNER_ID
                }
              }
            }
          
            conditional {
              if (($contact_to_create|is_empty) == false) {
                db.bulk.add PARTNER_CONTACT_DETAIL {
                  allow_id_field = false
                  items = $contact_to_create
                } as $contact_to_create
              }
            }
          
            var $social_to_create {
              value = []
            }
          
            foreach ($item.media) {
              each as $media_info {
                function.run "Migration/Get Ids from Map" {
                  input = {
                    databaseIds: $SOCIAL_MEDIA_CHANNELS
                    string     : $media_info|first
                    separator  : ","
                  }
                } as $social_id|first
              
                array.push $social_to_create {
                  value = {}
                    |set:"social_media_channel":$social_id
                    |set:"url":($media_info|last)
                    |set:"partner":$PARTNER_ID
                }
              }
            }
          
            conditional {
              if (($social_to_create|is_empty) == false) {
                db.bulk.add PARTNER_SOCIAL_MEDIA_CHANNEL {
                  allow_id_field = false
                  items = $social_to_create
                } as $social_to_create
              }
            }
          
            array.push $TO_UPDATE {
              value = {}
                |set:"id":$PARTNER_ID
                |!set:"partner_social_medias":$social_to_create
                |set:"partner_contact_details":$contact_to_create
            }
          }
        }
      
        db.bulk.patch PARTNER {
          items = $TO_UPDATE
        } as $PARTNER
      }
    }
  }

  response = $TO_UPDATE
}