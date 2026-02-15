function "Migration/Second Step" {
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
          "partner_entity_types": "Influencer",
          "partner_countries": "Ghana",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Regional audiences, Journalists and Media Practitioners"
        },
        {
          "name": "James Adombire​",
          "description": "James Adombire is a Ghanaian broadcast journalist, news reporter, and entrepreneur. He is the CEO of Amazing Smocks and Fashion and has built a reputation as a communicator and online marketer. With a strong presence in Bolgatanga, Ghana, James combines media work with entrepreneurship, leveraging both journalism and business to create community impact.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Ghana",
          "partner_languages": "English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Business community"
        },
        {
          "name": "DJ Gizy​",
          "description": "DJ Gizy is a local radio DJ and artist manager living in Bolgatanga, although he is originally from Sandema, another Northern Ghanaian town just over 100km from Bawku.​",
          "partner_entity_types": "Influencer",
          "partner_countries": "Ghana",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Regional audiences, Business community"
        },
        {
          "name": "Roger Laari​",
          "description": "Roger Laari is a Ghanaian entrepreneur and real estate developer, serving as CEO and Founder of Moab Properties Limited. With a diverse background in business development, property investment, and community initiatives, he has established himself as a key player in Ghana’s northern economic landscape. Laari is also actively engaged in civic and economic discussions, particularly through roles at the Northern Economic Summit and initiatives that bridge business with social impact.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Ghana",
          "partner_languages": "English",
          "partner_audiences": "Business community, Policy and Governance Stakeholders, Regional audiences, Civic and Human Rights Activists"
        },
        {
          "name": "Toni Ayelbis Atubiga",
          "description": "Toni Ayelbis Atubiga is a Ghanaian cultural entrepreneur and the founder of Ayelbis Events, known for organizing the annual Miss Upper East Ghana Pageant. With a background in health, physical education, and recreation, he leverages cultural platforms to celebrate regional identity, empower youth, and create opportunities for community engagement. Based in Accra but originally from Binduri in the Upper East Region, he uses his work to connect traditional heritage with contemporary social development initiatives.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Ghana",
          "partner_languages": "English",
          "partner_audiences": "Regional audiences, Youth Empowerment, Participation, Civic and Human Rights Activists, Women"
        },
        {
          "name": "Nadella Oya",
          "description": "Nadella Oya is a Trinidad and Tobago–based strategist and communications expert specializing in social impact initiatives and behavioral change campaigns. With extensive experience in media production, social enterprise, and advocacy, she is committed to designing and implementing communication strategies that empower young people and advance human rights. She combines her expertise in creative industries with a strong advocacy background, particularly in child rights, gender equality, and social inclusion.",
          "partner_entity_types": "Expert",
          "partner_countries": "Trinidad and Tobago",
          "partner_languages": "English",
          "partner_audiences": "Civic and Human Rights Activists, Women, Education Institutions and Stakeholders"
        },
        {
          "name": "The Heros Foundation",
          "description": "Founded in 2002 with a mission to ignite the heroic spirit within Trinidad and Tobago’s youth, the Heroes Foundation is an award-winning specialist organisation supporting young people along a transformative development pathway to overcome life’s challenges and become 21st-century leaders.",
          "partner_entity_types": "CSO",
          "partner_countries": "Trinidad and Tobago",
          "partner_languages": "English",
          "partner_audiences": "Youth Empowerment, Participation, Education Institutions and Stakeholders, Civic and Human Rights Activists, Policy and Governance Stakeholders"
        },
        {
          "name": "We Say Yes",
          "description": "The We Say YES (WSY) Organization, founded in 2016 in Port of Spain, Trinidad and Tobago, empowers youth through the Youth Entrepreneurship for Self-Empowerment (YES) programme. Initiated by Nichola Harvey-Mitchell, WSY was created to provide alternatives to gang involvement and violence by equipping young people with entrepreneurial skills and leadership opportunities. Through creative and non-traditional programmes, the organization fosters personal growth, community well-being, and long-term success for vulnerable youth.",
          "partner_entity_types": "CSO",
          "partner_countries": "Trinidad and Tobago",
          "partner_languages": "English",
          "partner_audiences": "Youth Empowerment, Participation, Education Institutions and Stakeholders, Civic and Human Rights Activists, Policy and Governance Stakeholders"
        },
        {
          "name": "Vestnik Tartu",
          "description": "Local news and insights on Tartu city life; in-depth reporting on community events and social issues; practical guides for residents and visitors.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Estonia",
          "partner_languages": "Estonian, Russian",
          "partner_audiences": "Regional audiences, Journalists and Media Practitioners, Gen Z, Millennials"
        },
        {
          "name": "Delovyje Vedomosti",
          "description": "Business news and analysis in Estonia; market updates and investment trends; interviews with entrepreneurs and commentary on economic policy.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Estonia",
          "partner_languages": "Estonian, Russian",
          "partner_audiences": "Business community, Policy and Governance Stakeholders, Journalists and Media Practitioners, Gen X"
        },
        {
          "name": "Delfi Estonia",
          "description": "Round-the-clock news coverage on Estonian and global events; live updates on politics, economy, and society; in-depth features, opinion pieces, and multimedia storytelling.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Estonia",
          "partner_languages": "Estonian, Russian",
          "partner_audiences": "Regional audiences, Gen Z, Millennials, Journalists and Media Practitioners"
        },
        {
          "name": "LSM",
          "description": "Comprehensive public-service news in Russian language in Latvia; live reports and analysis on politics, society, and international affairs; cultural programming and in-depth interviews.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Latvia",
          "partner_languages": "Latvian, Russian",
          "partner_audiences": "Regional audiences, Journalists and Media Practitioners, Policy and Governance Stakeholders, Gen Z"
        },
        {
          "name": "New East",
          "description": "Latvian NGO creating culture, media, and learning experiences to empower communities; in-depth analysis on democracy, civil society, and regional developments; education programs and public events fostering civic engagement.",
          "partner_entity_types": "CSO",
          "partner_countries": "Latvia",
          "partner_languages": "Latvian, English",
          "partner_audiences": "Civil Society, Education Institutions and Stakeholders, Civic and Human Rights Activists, Gen Z"
        },
        {
          "name": "IR.lv",
          "description": "Weekly in-depth analysis of Latvia’s key political, economic, and cultural developments; investigative essays and interviews with thought leaders; curated commentary on regional and global affairs.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Latvia",
          "partner_languages": "Latvian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Business community, Journalists and Media Practitioners, Millennials"
        },
        {
          "name": "Chayka",
          "description": "Local news and explainers in Latvia’; human-interest features and community storytelling; practical guides for leisure, culture, and civic projects.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Latvia",
          "partner_languages": "Latvian, Russian",
          "partner_audiences": "Regional audiences, Civil Society, Journalists and Media Practitioners, Education Institutions and Stakeholders"
        },
        {
          "name": "Latvijas Radio 4",
          "description": "Latvian public‐service radio with a focus on culture and ideas; in‐depth interviews with writers, artists, and thinkers; documentary features and discussions on literature, theater, and the arts.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Latvia",
          "partner_languages": "Latvian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Education Institutions and Stakeholders, Gen X, Boomers"
        },
        {
          "name": "Postimees",
          "description": "Estonia’s leading daily news portal with comprehensive coverage of national and global affairs; breaking news, in-depth analyses, and expert commentary on politics, economy, and society.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Estonia",
          "partner_languages": "Estonian",
          "partner_audiences": "Regional audiences, Business community, Policy and Governance Stakeholders, Millennials"
        },
        {
          "name": "TVNET",
          "description": "24/7 news portal offering comprehensive coverage of national and international events; dedicated sections on business, sports, lifestyle, auto, recipes, and special multimedia features.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Latvia",
          "partner_languages": "Latvian, Russian",
          "partner_audiences": "Millennials, Gen Z, Business community, Women"
        },
        {
          "name": "Delfi Latvia",
          "description": "Round-the-clock news coverage on Latvian and global events; live updates on politics, economy, and society; in-depth features, opinion pieces, and multimedia storytelling.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Latvia",
          "partner_languages": "Latvian, Russian",
          "partner_audiences": "Regional audiences, Gen Z, Millennials, Journalists and Media Practitioners"
        },
        {
          "name": "Gazeta",
          "description": "Russian-language news portal for Narva and the Estonian-Russian border region; real-time reporting on local developments, cross-border issues, and community life; live updates from emergency services and cultural guides.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Estonia",
          "partner_languages": "Estonian, Russian",
          "partner_audiences": "Regional audiences, Migrants and At Risk Groups, Civil Society, Journalists and Media Practitioners"
        },
        {
          "name": "I Gryanul Grem",
          "description": "The program \"I Gryanul Grem\" in the framework of which the hosts Vadim Radionov and Anna Smirnova discuss with guests - politicians, writers, political scientists, directors, artists, scientists, athletes and journalists acute, relevant and analytical topics of concern to society.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Latvia",
          "partner_languages": "English",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civil Society, Millennials"
        },
        {
          "name": "Julius Rou",
          "description": "Vlog series capturing everyday life in Estonia; immersive travelogues and explorations of urbanism and city culture.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Estonia",
          "partner_languages": "English, Russian",
          "partner_audiences": "Gen Z, Millennials, Regional audiences, Education Institutions and Stakeholders"
        },
        {
          "name": "International Medical Corps (IMC)",
          "description": "Global humanitarian NGO delivering emergency medical services, training, and development programs to communities struck by conflict, disasters, and disease helping them move from relief to self-reliance.",
          "partner_entity_types": "CSO",
          "partner_countries": "Global",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Civil Society, Women"
        },
        {
          "name": "Taiwan FactCheck Center",
          "description": "Taiwan’s first independent nonprofit fact‑checking organization—launched in 2018—to counter misinformation, enhance media literacy, and strengthen democratic trust through evidence‑based verification and transparency.",
          "partner_entity_types": "CSO",
          "partner_countries": "Taiwan",
          "partner_languages": "Chinese, English",
          "partner_audiences": "Millennials, Journalists and Media Practitioners, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Science Media Centre (SMC)",
          "description": "An independent UK-based press office that equips journalists with accurate, evidence-based scientific expertise especially during high-profile or controversial science, health, and engineering stories and supports scientists to engage effectively with the media.",
          "partner_entity_types": "CSO",
          "partner_countries": "United Kingdom",
          "partner_languages": "English",
          "partner_audiences": "Journalists and Media Practitioners, Education Institutions and Stakeholders, Policy and Governance Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Anwer Aziz",
          "description": "Iraqi digital creator sharing commentary on political history, governance, and national affairs; combines perspectives from his professional background in healthcare with reflections on regional geopolitics.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic, English",
          "partner_audiences": "Civic and Human Rights Activists, Civil Society, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Khalid Waleed Saber",
          "description": "A researcher and trainer in sustainable development, climate, and the environment; a political and civil activist who believes in freedom of expression and social justice; calls for supporting the state's discourse and rejecting weapons and extremist ideology; and strives for a secure homeland and a stable future.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic, English",
          "partner_audiences": "Civil Society, Policy and Governance Stakeholders, Environmental and Climate Advocates, Civic and Human Rights Activists"
        },
        {
          "name": "Ali Hammadi Azooz",
          "description": "An Iraqi politician who focuses on issues of governance and accountability, criticizes the exploitation of government positions and public resources for electoral purposes; shares his views on transparency, the rule of law, and integrity in public life.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Civil Society, Regional audiences"
        },
        {
          "name": "Ali Qasim Khudhalr",
          "description": "Iraqi digital creator sharing political commentary, social perspectives, and calls for civic change; blends personal insights with reflections on governance, reform, and public mobilization.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Civic and Human Rights Activists, Civil Society, Regional audiences, Policy and Governance Stakeholders"
        },
        {
          "name": "Ali kareem Talib",
          "description": "Iraqi digital creator and commentator focusing on governance, public services, and civic issues in Basra; raises awareness about infrastructure crises, political accountability, and the impact of systemic challenges on daily life.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Civic and Human Rights Activists, Civil Society, Regional audiences, Policy and Governance Stakeholders"
        },
        {
          "name": "Alaa Al-Yaseri",
          "description": "Independent Iraqi politician and activist working on women’s rights, human development, and strategic policy; engages in human rights advocacy, social justice initiatives, and public commentary on governance and political reform.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Civic and Human Rights Activists, Civil Society, Policy and Governance Stakeholders, Women"
        },
        {
          "name": "Ahemd Abdulidhra Khalaf",
          "description": "Iraqi public figure sharing perspectives on community life, local events, and social values; engages in public discussions on societal ethics, trust, and cultural identity, with active participation in civic gatherings.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Urdu",
          "partner_audiences": "Civil Society, Regional audiences, Civic and Human Rights Activists, Gen X"
        },
        {
          "name": "Ameera Aljaber",
          "description": "Iraqi public figure and member of the Women’s Advisory Council, active in the Legal and Political Committee and the Committee for Public Relations and Media; engages in policy discussions, women’s rights advocacy, and public commentary on governance and national issues.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Women, Civil Society"
        },
        {
          "name": "Zindagi Trust",
          "description": "Pakistan-based nonprofit transforming public schools through holistic reforms, creative learning programs, and policy advocacy; empowers children with critical thinking, life skills, and opportunities to thrive.",
          "partner_entity_types": "CSO",
          "partner_countries": "Pakistan",
          "partner_languages": "English",
          "partner_audiences": "Education Institutions and Stakeholders, Civic and Human Rights Activists, Women, Gen Z"
        },
        {
          "name": "Aahung",
          "description": "Pakistan-based NGO delivering Life Skills Based Education (LSBE) to equip children and adolescents with critical knowledge on reproductive health, abuse prevention, and essential life management skills; works to empower youth with the tools to make informed, healthy, and safe life choices.",
          "partner_entity_types": "CSO",
          "partner_countries": "Pakistan",
          "partner_languages": "English",
          "partner_audiences": "Education Institutions and Stakeholders, Civic and Human Rights Activists, Women, Youth"
        },
        {
          "name": "Takhleeq Foundation",
          "description": "Pakistan-based nonprofit working for over 25 years to promote democratic values, human rights, and social justice; implements programs on peacebuilding, poverty alleviation, and community development to foster inclusive prosperity.",
          "partner_entity_types": "CSO",
          "partner_countries": "Pakistan",
          "partner_languages": "English",
          "partner_audiences": "Civil Society, Civic and Human Rights Activists, Policy and Governance Stakeholders, Migrants and At Risk Groups"
        },
        {
          "name": "Dusan Mladjenovic",
          "description": "International editor at N1 Serbia with experience in global journalism, cross-border reporting, and media collaboration; alumni of the Thomson Reuters Foundation and Bosch Stiftung programs, specializing in international affairs and investigative storytelling.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Serbia",
          "partner_languages": "English, Serbian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civic and Human Rights Activists, Civil Society"
        },
        {
          "name": "Ana Abashidze",
          "description": "Human rights advocate and legal expert specializing in immigration law; uses TikTok to share accessible legal information, raise awareness on migrants’ rights, and provide guidance on navigating immigration processes.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Migrants and At Risk Groups, Civil Society, Education Institutions and Stakeholders"
        },
        {
          "name": "Anti-Tribalism Movement (ATM)",
          "description": "Non-profit organization working to combat tribal discrimination and promote social cohesion within the UK’s BAME communities, particularly those of Horn of African origin. ATM focuses on fostering tolerance, developing leadership skills, and advancing social justice through advocacy, partnerships, and grassroots engagement. It has established itself as a trusted and visionary leader, regularly consulted by minority organizations, donors, and policymakers.",
          "partner_entity_types": "CSO",
          "partner_countries": "United Kingdom",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Migrants and At Risk Groups, Civic and Human Rights Activists"
        },
        {
          "name": "Somali Youth Development Network (SOYDEN)",
          "description": "SOYDEN is a coalition of Somali youth organizations committed to uniting young people across clan divisions to promote equality, social cohesion, and peaceful coexistence. Through advocacy, community programs, and youth-led initiatives, the network works to empower Somali youth, combat discrimination, and foster a unified generation prepared to contribute to peacebuilding and national development.",
          "partner_entity_types": "CSO",
          "partner_countries": "Somalia",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists, Migrants and At Risk Groups"
        },
        {
          "name": "Somali Women and Children’s Organization (SSWC)",
          "description": "SSWC is a national Somali women-led humanitarian organization founded in 1992 in Mogadishu by women intellectuals from diverse backgrounds. It works to protect and empower women and children through humanitarian aid, advocacy, and development programs. The organization focuses on advancing gender equality, preventing and responding to gender-based violence, improving access to healthcare, and strengthening the role of women in peacebuilding and community resilience.",
          "partner_entity_types": "CSO",
          "partner_countries": "Somalia",
          "partner_languages": "English",
          "partner_audiences": "Women, Civic and Human Rights Activists, Civil Society, Migrants and At Risk Groups"
        },
        {
          "name": "Shaqodoon",
          "description": "Shaqodoon is a Somali NGO established in 2011 to address youth employment challenges through skills development, entrepreneurship support, and technology-driven solutions. Operating across Somaliland, Puntland, and South-Central Somalia, it offers vocational training, market linkages, and access to finance while addressing gender-based violence and promoting inclusivity. The organization partners with local and international stakeholders to foster economic opportunities, social resilience, and youth-led community development.",
          "partner_entity_types": "CSO",
          "partner_countries": "Somalia",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists, Migrants and At Risk Groups"
        },
        {
          "name": "Democracy Lab",
          "description": "Democracy Lab is a non‑partisan, nonprofit organization based in North Macedonia and the Western Balkans. Committed to strengthening democratic values, it runs a portfolio of impactful projects focusing on media literacy, countering disinformation, civic engagement, youth empowerment, security, and resilience against extremist threats. Democracy Lab fosters transparency, accountability, and institutional reform by building bridges with civil society, supporting journalist capacity, and engaging local communities in democratic participation.",
          "partner_entity_types": "CSO",
          "partner_countries": "North Macedonia",
          "partner_languages": "English",
          "partner_audiences": "Civic and Human Rights Activists, Journalists and Media Practitioners, Millennials, Policy and Governance Stakeholders"
        },
        {
          "name": "Kruševac Geto",
          "description": "Serbian-based YouTube channel producing entertainment, social commentary, and cultural content. Known for humorous videos, interviews, street surveys, and creative productions that engage youth and regional audiences while fostering discussion on social norms and everyday life.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Serbia",
          "partner_languages": "English, Serbian",
          "partner_audiences": "Gen Z, Millennials, Regional audiences, Civic and Human Rights Activists"
        },
        {
          "name": "Nataša Gardašević",
          "description": "Nataša Kovačević is a Montenegrin digital creator, novelist, and podcast host known for her outspoken advocacy on gender equality, gender-based violence, and mental health. Through her social media presence, she combines personal storytelling, activism, and cultural commentary to engage a broad audience on issues of human rights and social justice.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Montenegro",
          "partner_languages": "English, Montenegrin",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists, Civil Society"
        },
        {
          "name": "Emerald Podbićanin",
          "description": "Bosnian YouTuber, cross-platform software engineer, and founder of the Bosnian music collective Huligani iz Gimnazije, creating digital content and music collaborations.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Bosnia and Herzegovina",
          "partner_languages": "English, Bosnian",
          "partner_audiences": "Gen Z, Millennials, Regional audiences, Culture And The Arts Stakeholders"
        },
        {
          "name": "Tert.am",
          "description": "Leading Armenian political-analytical news platform offering prompt, multi‑genre coverage of developments in Armenia, the South Caucasus, and around the world. Available in Armenian, Russian, and English, Tert.am operates 24/7 and includes news reports, live updates, opinion pieces, and interviews with both local and international experts",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Millennials, Journalists and Media Practitioners, Policy and Governance Stakeholders, Civil Society"
        },
        {
          "name": "NEWS.am",
          "description": "NEWS.am is an Armenian news platform providing real-time updates on politics, society, economy, and global events. It delivers content in Armenian, Russian, and English, covering national developments, regional affairs, and international news.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civil Society, Regional audiences"
        },
        {
          "name": "Aravot",
          "description": "Aravot is an Armenian online news outlet covering domestic, regional, and international developments across politics, society, economy, and culture. It provides in-depth reporting, analysis, and commentary, positioning itself as a source for reliable and timely information for Armenian and global audiences.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Civil Society, Policy and Governance Stakeholders, Regional audiences, Gen X, Boomers"
        },
        {
          "name": "Mediamax",
          "description": "Mediamax is an Armenian online media outlet that provides in-depth reporting, interviews, and analysis on political, economic, and social issues in Armenia and the broader region. It publishes in Armenian, Russian, and English, offering both daily news updates and long-form features.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civil Society, Regional audiences"
        },
        {
          "name": "Factor.am",
          "description": "Factor.am is an Armenian news platform offering timely and comprehensive reporting across politics, economy, society, and culture. Covering domestic and international developments, it features sections such as politics (domestic, foreign, regional, global), economy, society, education, law, sports, and culture. The site publishes news, video reporting, commentary, and special features.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civil Society, Regional audiences"
        },
        {
          "name": "Hetq",
          "description": "Established in 2001 by the Investigative Journalists NGO in Yerevan, Hetq is Armenia’s premier investigative online newspaper. Publishing in Armenian since its inception and in English since 2002, it delivers in-depth investigative reporting, groundbreaking analyses, and multimedia storytelling covering corruption, human rights, environment, technology, and more. Hetq pioneered Armenia’s first journalistic Code of Ethics and has spearheaded professional development initiatives such as the Hetq Media Factory and the InFact fact‑checking network",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civic and Human Rights Activists, Civil Society"
        },
        {
          "name": "Aliq Media Armenia",
          "description": "Aliq Media is a modern Armenian news and analytical platform established around 2020. It has quickly gained recognition for providing breaking news, reliable reporting, and critical commentary delivered in clear, accessible language. The outlet produces a wide range of multimedia content articles, video programs, podcasts, and interviews with a focus on thoughtful analysis of local, regional, and global affairs",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civic and Human Rights Activists, Civil Society"
        },
        {
          "name": "CivilNet",
          "description": "CivilNet is an independent, bilingual online media outlet launched in 2011 by the Civilitas Foundation. It is based in Yerevan, Armenia, and produces evidence-based news, analysis, documentaries, and explanatory journalism. CivilNet emphasizes deep dives into democracy, human rights, regional peace, and diasporic issues and consistently asks not only what happened but also why and how. It operates with high journalistic standards, including fact-checking certifications and active participation in international fact-checking network.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Civil Society"
        },
        {
          "name": "Azatutyun (Radio Free Europe/Radio Liberty – Armenian Service)",
          "description": "Azatutyun serves as the Armenian arm of RFE/RL, delivering digital-first, independent journalism from Yerevan. It provides in-depth reporting and multimedia coverage including radio, podcasts, and videos on local and regional developments, from conflict and displacement to women’s rights and government accountability. Its real-time, trusted coverage, particularly on sensitive issues like the Armenia-Azerbaijan conflict and social justice, makes it one of the most influential media voices in Armenia.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "EVN Report",
          "description": "EVN Report is an independent, non-profit English-language online weekly magazine based in Yerevan. Established in 2017, it delivers in-depth reporting, analysis, commentary, and multimedia storytelling across politics, economy, society, technology, arts, and regional security aimed at fostering critical discourse, increasing media trust, and connecting Armenia’s evolving narrative with both diaspora and global audiences",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civic and Human Rights Activists, Education Institutions and Stakeholders"
        },
        {
          "name": "Armenian Times",
          "description": "Armtimes.com is the digital continuation of Haykakan Zhamanak, a prominent independent Armenian daily newspaper founded in 1999 and relaunched online. It delivers timely, objective, and in-depth coverage of political, economic, social, legal, cultural, and international developments. The site integrates daily news, photo reports, expert analysis, and archives, serving as one of Armenia's leading platforms for independent journalism",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civil Society, Regional audiences"
        },
        {
          "name": "Panorama.am",
          "description": "Launched in 2005, Panorama.am is a major Armenian online news portal offering fast and broad coverage of current affairs. It publishes news, analysis, and opinion pieces in Armenian, Russian, and English spanning politics, economy, culture, sports, science, entertainment, health, and more .",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civil Society, Regional audiences"
        },
        {
          "name": "Aysor.am",
          "description": "Aysor.am (Armenian for \"Today\") is a fast-paced online news portal delivering up-to-the-minute coverage of events in Armenia across categories like politics, economy, law, health, technology, and regional affairs. It offers content in Armenian, Russian, and English and features breaking news updates, analyses, and reports on developments from domestic to international spheres.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "Armenian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civil Society, Regional audiences"
        },
        {
          "name": "PanARMENIAN",
          "description": "PanARMENIAN.Net is the first Armenian online news and analysis agency, launched on April 2, 2000, and based in Yerevan. It operates under the umbrella of the PanArmenian Network NGO. The platform delivers comprehensive coverage news, analysis, interviews, photo series, and topic-focused reports in Armenian, Russian, and English. It aims to create a pan-Armenian information space and enhance Armenia’s global representation through modern information and communication technologies.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civil Society, Regional audiences"
        },
        {
          "name": "1in.am",
          "description": "1in.am short for \"First Informative\" is a dynamic Armenian online news portal, hosted out of New York. It publishes in Armenian, Russian, and English, offering a wide array of timely coverage across local, regional (Caucasus), and global affairs. Its sections span Armenia, the world, press affairs, business, sports (the latter two primarily in Armenian), and more. The site integrates real-time streaming via its 1in TV service and ranks among the most visited news platforms in Armenia.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "English, Armenian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civil Society, Regional audiences"
        },
        {
          "name": "Infocom.am",
          "description": "Infocom.am launched in 2018 as a project of the “Information Committee” non-profit is an independent Armenian digital outlet that blends a verified news aggregator with original, data-driven journalism. It produces deep investigative reports, research-driven content, science and legal coverage, and fact-checked news, aiming to equip citizens with accurate, timely information essential for informed decision-making and advancing democratic principles in Armenia.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "Armenian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Education Institutions and Stakeholders"
        },
        {
          "name": "A1+",
          "description": "A1+ is a long-standing Armenian independent media network that began as a television channel in 1991 and evolved into an online-first news platform after being shut down by authorities in 2002. Today, its website delivers timely and objective news, interviews, live streams, and videos covering politics, society, culture, sports, business, and more",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "Armenian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Armenpress",
          "description": "Armenpress, founded on December 18, 1918, is Armenia’s oldest and main state news agency. It provides timely, verified, and multilingual coverage of domestic, regional, and international events.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "Armenian, Russian, English, French, Spanish, Arabic, Turkish, Persian, Chinese, Georgian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civil Society, Regional audiences"
        },
        {
          "name": "Hromadske",
          "description": "Hromadske is Ukraine’s independent, NGO-owned digital media outlet, launched in November 2013 by journalists seeking editorial freedom and incorruptible reporting. It delivers high-impact, multimedia coverage including breaking news, investigative stories, explanatory analysis, documentaries, podcasts, and live streams focused on politics, war, corruption, human rights, society, and culture.",
          "partner_entity_types": "CSO",
          "partner_countries": "Ukraine",
          "partner_languages": "English, Ukrainian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Euroradio",
          "description": "Euroradio is an independent, non-profit Belarusian media outlet launched in 2006 in Warsaw by Belarusian journalists. It broadcasts in Belarusian and Russian via FM, satellite, and the internet, offering independent news, cultural programming, music, and human rights content. Despite being blocked and labeled \"extremist\" by Belarusian authorities, it remains one of the most trusted sources for objective information in Belarus and continues its mission from safe havens abroad.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Belarus",
          "partner_languages": "English, Russian, Belarusian",
          "partner_audiences": "Gen Z, Millenials, Civil Society, Civic and Human Rights Activists"
        },
        {
          "name": "JAMnews",
          "description": "JAMnews is a multilingual, independent media platform based in Tbilisi (Georgia), with regional presence across the Caucasus including Yerevan, Baku, Sokhumi, and Tskhinvali. Founded in 2016, it brings together journalists, authors, and experts from across the region to deliver in-depth, verified, and multi-perspective reporting in Armenian, Azerbaijani, English, Georgian, Russian and often other languages. The outlet is known for cross-border, solution-oriented, explanatory journalism and a robust media school for emerging regional journalists.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Georgia",
          "partner_languages": "English, Georgian, Russian, Armenian, Azerbaijani",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Civil Society, Policy and Governance Stakeholders"
        },
        {
          "name": "Ziarul de Gardă (ZdG)",
          "description": "Ziarul de Gardă (ZdG) is Moldova’s leading independent investigative weekly, founded in 2004 by Alina Radu and Aneta Grosu to expose corruption, human rights abuses, and public corruption. It publishes in Romanian and Russian, with web content also available in English. Across platforms including print editions, trilingual digital portals, video, radio, social media, and investigative events ZdG stands out as the most trusted, widely read, and award-winning investigative media group in the country.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Moldova",
          "partner_languages": "English, Romanian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Civil Society"
        },
        {
          "name": "Muyiwa Afolabi",
          "description": "Prominent Nigerian business and career coach, brand strategist, social reformer, and media entrepreneur. He founded and leads Frontiers International Limited",
          "partner_entity_types": "Influencer",
          "partner_countries": "Nigeria",
          "partner_languages": "English",
          "partner_audiences": "Millennials, Gen X, Civic and Human Rights Activists, Civil Society"
        },
        {
          "name": "Peace Itimi",
          "description": "Peace Itimi is a Nigerian entrepreneur, marketer, and media host, best known as the founder of The Founders Connect Show, where she interviews African startup founders and innovators. An MBA candidate at Imperial College Business School, she focuses on technology, entrepreneurship, and storytelling to spotlight Africa’s business and innovation ecosystem.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Nigeria",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Business community, Startups, Entrepreneurs, Education Institutions and Stakeholders"
        },
        {
          "name": "Tricia Biz",
          "description": "Tricia \"Business Fixer\" is a Nigerian business consultant, author, and global speaker who helps entrepreneurs grow and fix their businesses. As an impact investor and trainer, she empowers startups and SMEs through practical strategies, workshops, and motivational content, with a focus on sustainable growth and innovation.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Nigeria",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Entrepreneurs, Startups, Business community, Education Institutions and Stakeholders"
        },
        {
          "name": "Basra Press 24",
          "description": "Basra Press 24 is a comprehensive Iraqi news agency based in Basra, delivering breaking news, political updates, economic developments, and social issues affecting Iraq and the wider region. With a large following, it serves as a key source of timely information for local and regional audiences.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Regional audiences, Policy and Governance Stakeholders, Journalists and Media Practitioners, Civil Society, Migrants and At Risk Groups, Business community"
        },
        {
          "name": "Babylon the Gate of Gods",
          "description": "Babylon the Gate of Gods is a popular cultural and historical Facebook page dedicated to exploring the legacy of Mesopotamian civilizations, particularly focusing on Babylon and the heritage of ancient Iraq. The platform shares historical facts, archaeological findings, and cultural narratives, aiming to educate and inspire audiences about one of the world’s earliest and most influential civilizations.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Gen Z, Millennials, Regional audiences, Education Institutions and Stakeholders"
        },
        {
          "name": "Shroogy and proud",
          "description": "A Facebook community page representing the voices of Southern Iraqis, highlighting their struggles, cultural identity, and political views. The page often shares news, commentary, and opinions on regional and national issues, amplifying the perspectives of marginalized communities in Iraq.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Gen Z, Civic and Human Rights Activists, Journalists and Media Practitioners, Regional audiences"
        },
        {
          "name": "South of Iraq",
          "description": "جنوب العراق (South of Iraq) is a popular Arabic-language Facebook community page with over 117K followers, sharing content related to daily life, social issues, and challenges faced by people in southern Iraq, particularly focusing on vulnerable groups, gender issues, and local governance.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Gen Z, Millennials, Regional audiences, Civic and Human Rights Activists, Women, Men, Migrants and At Risk Groups"
        },
        {
          "name": "Alnasria Madinaty",
          "description": "A popular local Facebook community page based in Nasiriyah, Iraq, that covers news, social updates, and local issues relevant to residents of the Dhi Qar province. With over 370K followers, it serves as a key hub for regional updates, community voices, and public discussions.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Regional audiences, Gen Z, Gen X, Civic and Human Rights Activists, Policy and Governance Stakeholders"
        },
        {
          "name": "Akhbar Almaysan",
          "description": "Akhbar Maysan is a local Iraqi community news platform focused on reporting developments in Maysan governorate and beyond. It highlights social, political, and governance issues affecting residents, providing a voice for civic concerns and regional identity. The page engages audiences across generations, offering commentary on governance, rights, and community challenges.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Regional audiences, Gen Z, Millennials, Gen X, Boomers, Civic and Human Rights Activists"
        },
        {
          "name": "Iraqi Comment",
          "description": "\"Iraqi Comment\" is a highly followed Iraqi social media page that curates and shares humorous, satirical, and popular commentary drawn from user-submitted comments, memes, and trending discussions. The platform functions as a digital community space where Iraqis engage in humor, debate, and cultural commentary, often blending entertainment with light social critique.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Gen Z, Millennials, Men, Women, Civil Society, Regional audiences"
        },
        {
          "name": "Iraqi Memes and Comics",
          "description": "Iraqi Memes and Comics is a popular entertainment page dedicated to humor and satire, sharing memes and comic content inspired by Iraqi culture and everyday life. It blends humor with social commentary, resonating with audiences across Iraq through relatable and often nostalgic posts.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Gen Z, Millennials, Men, Women"
        },
        {
          "name": "House of Iraqis",
          "description": "A large-scale Facebook community page with over 1M followers, focusing on clan affairs, governance, and social-political issues in Iraq. It often highlights mediation, conflict resolution, and the role of tribes in Iraqi society and politics.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic, English",
          "partner_audiences": "Regional audiences, Policy and Governance Stakeholders, Journalists and Media Practitioners, Gen X"
        },
        {
          "name": "Baghdad Projects",
          "description": "Baghdad Projects is an independent media and news platform focused on documenting and sharing updates on infrastructure, architecture, and development projects in Baghdad. It provides coverage of construction, urban renewal, and modernization efforts in the Iraqi capital, attracting audiences both locally and in the Iraqi diaspora.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic, English",
          "partner_audiences": "Business community, Policy and Governance Stakeholders, Regional audiences, Gen Z, Millennials"
        },
        {
          "name": "Sakore Zakriya",
          "description": "A highly followed Iraqi public figure page from Mosul that engages audiences with political commentary, governance issues, and regional affairs. It frequently highlights local and international politics, reflecting the concerns of young Iraqis, journalists, and policy stakeholders.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Gen Z, Millennials, Journalists and Media Practitioners, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Noora Qaissi",
          "description": "Noora Qaissi is an Iraqi digital creator and activist based in Sweden. With a significant following on Facebook and Twitter/X, she is known for outspoken commentary on women’s rights, social justice, and political issues in Iraq. Her content often highlights gender-based discrimination, freedom of expression, and government accountability, while also connecting with diaspora audiences concerned about Iraq’s future.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic, English",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists, Journalists and Media Practitioners, Migrants and At Risk Groups"
        },
        {
          "name": "Abrar Alani",
          "description": "Abrar Alani is an Iraqi public figure with a strong following on Facebook, where she engages with political, social, and civic issues. She often highlights governance, accountability, and human rights matters while addressing challenges facing Iraqi society. Her posts indicate advocacy for reform, transparency, and community empowerment.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic, English",
          "partner_audiences": "Civic and Human Rights Activists, Policy and Governance Stakeholders, Gen Z, Millennials, Education Institutions and Stakeholders"
        },
        {
          "name": "Breaking News",
          "description": "Iraq’s most followed breaking news platforms, with over 1.8M followers. It delivers fast updates on politics, security, and local events, often featuring political figures, parliamentary affairs, and major incidents. The page acts as a real-time news wire for Iraqis, blending political analysis with live developments and urgent reports.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Gen Z, Millennials, Regional audiences"
        },
        {
          "name": "Al Ghad News",
          "description": "Al Ghad News is a popular Iraqi news platform that publishes political, social, and local news updates, with a focus on video-based coverage. The page highlights both breaking news and human-interest stories, often emphasizing community issues, governance, and local political dynamics. It aims to present \"freedom of opinion and expression\" to its audience while engaging them with a strong visual style.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Regional audiences, Journalists and Media Practitioners, Policy and Governance Stakeholders, Civic and Human Rights Activists, Civil Society"
        },
        {
          "name": "Latest Iraqi Events",
          "description": "A widely followed Iraqi Facebook page that shares breaking news, crime stories, local incidents, and human-interest content. Posts often include dramatic videos, eyewitness accounts, and appeals to the community, aiming to capture attention with emotionally charged narratives.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Gen Z, Millennials, Gen X, Boomers, Regional audiences"
        },
        {
          "name": "Nabd Al-Iraq",
          "description": "Nabd Al-Iraq is a highly followed Iraqi Facebook page focusing on entertainment, celebrity updates, and personal stories that spark emotional or viral engagement. Its content is often centered on popular figures, social gossip, family life, and personality-driven narratives that resonate with wide audiences across Iraq and the diaspora. The page mixes humor, drama, and sensational headlines, often amplifying individual stories into national talking points.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Gen Z, Millennials, Women, Men, Civic and Human Rights Activists, Civil Society, Regional audiences"
        },
        {
          "name": "Beit Kteyo",
          "description": "Iraqi satirical page that blends humor with social commentary. The platform engages audiences by using irony and entertainment to highlight political, social, and cultural issues. While primarily comedic, its content often reflects underlying frustrations and everyday realities of Iraqi society, resonating strongly with youth and broader community groups.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Gen Z, Millennials, Regional audiences, Civic and Human Rights Activists"
        },
        {
          "name": "Qabgh",
          "description": "Qabgh is a highly popular Iraqi digital creator known for producing humorous, satirical cartoon content. The page mixes animated caricatures with commentary on everyday Iraqi life, social issues, and politics. The tone is lighthearted, sarcastic, and visually engaging, often using exaggerated characters and scenarios to entertain while subtly critiquing social norms and governance.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Gen Z, Millennials, Women, Men, Civic and Human Rights Activists, Civil Society, Regional audiences"
        },
        {
          "name": "Ahmed Waheed",
          "description": "Ahmed Waheed is a popular Iraqi comedian, satirist, and content creator with a large digital following. His work blends political and social satire with everyday humor, often highlighting corruption, governance issues, and cultural contradictions. He is active on both Facebook (2.1M followers) and Twitter/X (196K followers), producing skits, parody videos, and social commentary. His comedic style resonates strongly with younger audiences but also attracts cross-generational viewers, making him an influential voice in Iraqi entertainment and civic discourse.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Gen Z, Millennials, Gen X, Boomers, Journalists and Media Practitioners, Civic and Human Rights Activists"
        },
        {
          "name": "Made in Iraq",
          "description": "This page is strongly oriented toward economic nationalism, local industry promotion, and citizen-driven accountability. Its audience focus leans toward business owners, policymakers, older demographics, and consumers invested in Iraqi-made products.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Business community, Policy and Governance Stakeholders, Gen X, Boomers"
        },
        {
          "name": "News Mosul Now",
          "description": "Local news updates, photos, and event coverage, with a focus on Mosul infrastructure, development projects, and current events.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Civic and Human Rights Activists, Regional audiences, Gen X, Policy and Governance Stakeholders"
        },
        {
          "name": "Salam Al-Rojbeyane",
          "description": "Salam Al-Rojbeyane identifies as a social researcher with professional ties to the Iraqi Ministry of Labor and Social Affairs and the Social Protection Committee. His content focuses on administrative issues, citizen dignity, social justice, and local governance. The posts often highlight bureaucratic inefficiencies, citizens’ struggles, and policy-related updates, using a mix of personal commentary, advocacy, and calls for accountability. His tone is critical yet grounded in civic responsibility, positioning himself as a voice for reform and improved governance.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Regional audiences"
        },
        {
          "name": "From Baghdad",
          "description": "A major Iraqi news and media platform with over 2 million followers. It publishes political, economic, and social content, covering Iraq’s internal developments, international relations, and issues of governance. The page blends breaking news, analysis, and public opinion, positioning itself as both a media outlet and civic voice.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Regional audiences, Policy and Governance Stakeholders, Journalists and Media Practitioners, Gen X"
        },
        {
          "name": "Hilla street 40",
          "description": "This Facebook community page focuses on social, cultural, and local issues in Babil province. It shares updates on governance matters (e.g., Ministry of Education decisions), community news, religious and cultural content, and youth-focused discussions. The page mixes official updates with local perspectives, appealing to both young Iraqis and broader community stakeholders.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Gen Z, Millennials, Regional audiences, Policy and Governance Stakeholders"
        },
        {
          "name": "Alforat TV – Basra branch",
          "description": "Local branch of Alforat TV, a national Iraqi television channel. The Basra page focuses on regional news, religious content, economic updates (such as currency exchange rates), and political developments. It often highlights religious ceremonies, governance updates, and financial/economic matters relevant to local and national audiences.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Regional audiences, Policy and Governance Stakeholders, Gen X, Boomers"
        },
        {
          "name": "Baghdadi Women",
          "description": "A popular Iraqi community Facebook page sharing news, cultural updates, and social issues relevant to Baghdad and wider Iraq. The page highlights local events, government initiatives, and social campaigns, attracting large-scale engagement from both Iraqi residents and the diaspora.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Regional audiences, Gen X, Gen Z, Millennials, Policy and Governance Stakeholders"
        },
        {
          "name": "Karrada",
          "description": ": Community page for residents of Baghdad’s Karrada district, sharing news, events, and issues relevant to local life. Content includes tributes, religious observances, fire incidents, and regional news.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Regional audiences, Gen X, Boomers"
        },
        {
          "name": "Iraqi Comment",
          "description": "Popular social media page dedicated to showcasing satirical, comedic, and witty takes on daily Iraqi life, politics, religion, and society. The page often posts memes, humorous commentary, and viral jokes that resonate with younger audiences while occasionally addressing serious issues with sarcasm. It positions itself as a space for Iraqis to laugh at the absurdities of daily life and reflect on broader societal themes through humor.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Regional audiences, Policy and Governance Stakeholders, Journalists and Media Practitioners, Gen X"
        },
        {
          "name": "Basrah",
          "description": "A regional Facebook news and media page focusing on political, legal, and governance-related updates in Basra, Iraq. It shares official documents, judicial council reports, and political commentary, serving as a local watchdog on governance and accountability issues.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Regional audiences, Policy and Governance Stakeholders, Gen X, Journalists and Media Practitioners"
        },
        {
          "name": "Memories of the Good Generation",
          "description": "A nostalgic and community-oriented public figure page with over 2M followers, focusing on cultural memories, local initiatives, and civic updates. Posts often mix sentimental content with coverage of community development projects, social issues, and public concerns. The page blends emotional connection with informational updates, making it both a cultural and civic touchpoint for a large audience.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Culture And The Arts, Governance, Accountability, Civic Education"
        },
        {
          "name": "Al-Iraq",
          "description": "A public figure/community-style page focused on Iraqi identity, politics, and regional issues. It highlights stories on citizenship, governance, and social affairs, such as the Kuwaiti government’s withdrawal of citizenship from individuals of Iraqi origin and subsequent Iraqi citizenship applications. The page often amplifies nationalistic narratives while spotlighting policy decisions and their impacts on Iraqis.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Iraq",
          "partner_languages": "Arabic",
          "partner_audiences": "Regional audiences, Policy and Governance Stakeholders, Journalists and Media Practitioners, Gen X"
        },
        {
          "name": "Magda Boska Śmietnikoska",
          "description": "Centered on conscious consumption, anti-waste practices, and sustainable living. Content often highlights the problems of overconsumption, the benefits of reusing and exchanging items, and critiques of consumer culture. Posts mix personal reflections, lifestyle tips, and activism in an accessible, relatable tone.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Environmental and Climate Advocates, Civic and Human Rights Activists"
        },
        {
          "name": "Anna Pięta",
          "description": "Anna Pięta’s Instagram channel hello_pieta focuses on activism, communication, and advocacy. She shares content around environmental justice, social equality, women’s rights, and anti-greenwashing campaigns, often combining political commentary with creative visual storytelling. The account amplifies grassroots movements, highlights systemic inequalities, and engages in cultural and civic debates.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists, Environmental and Climate Advocates"
        },
        {
          "name": "Joanna Przetakiewicz",
          "description": "Joanna Przetakiewicz’s Instagram channel blends lifestyle, women’s empowerment, and activism. It showcases her initiatives around female solidarity, self-confidence, and emotional well-being, alongside glimpses of her luxury lifestyle, events, and motivational engagements.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Women, Gen X, Millennials, Civic and Human Rights Activists"
        },
        {
          "name": "Natalia Panchenko",
          "description": ": Ukrainian civic activist and public figure using Instagram to mobilize around Ukrainian independence, culture, and rights. The channel highlights activism in exile, diaspora organizing, national identity, and political advocacy, often centered on community events and solidarity with Ukraine.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish, Ukrainian, English",
          "partner_audiences": "Civic and Human Rights Activists, Civil Society, Journalists and Media Practitioners, Regional audiences"
        },
        {
          "name": "Miłosz Wiatrakowski-Bujacz",
          "description": "Miłosz Wiatrakowski-Bujacz uses his Instagram channel miłosz.między.innymi to discuss issues of solidarity, justice, and human rights, with strong focus on Palestine, anti-war activism, and progressive politics. He shares reflections, book recommendations, and political commentary, often contextualized within global conflicts and their social impact. His content blends intellectual discussion with activism and advocacy.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists, Journalists and Media Practitioners"
        },
        {
          "name": "Martyna Wojciechowska",
          "description": "Martyna Wojciechowska’s Instagram channel presents her as a journalist, filmmaker, writer, and activist. It combines personal storytelling with professional highlights, humanitarian initiatives, travel, and advocacy for women and at-risk communities. Her content bridges media, activism, and lifestyle, while also highlighting her foundation work and projects.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Journalists and Media Practitioners, Civic and Human Rights Activists"
        },
        {
          "name": "Katarzyna Błażejewska-Stuhr",
          "description": "This channel belongs to a nutritionist and psychodietitian who shares content focused on healthy eating, mental well-being, and lifestyle balance. The posts combine personal reflections, professional diet tips, recipes, and motivational insights. The creator emphasizes mindful eating, food as a source of health and joy, and holistic approaches to well-being.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Women, Education Institutions and Stakeholders"
        },
        {
          "name": "Łukasz Bogusławski",
          "description": "Łukasz Bogusławski’s Instagram is a personal and lifestyle-focused profile blending wellness, creativity, and everyday reflections. His content includes candid snapshots of daily life, artistic photography, music/concert scenes, casual fashion, and moments with friends, pets, and travel. The overall tone is intimate, authentic, and visually minimalistic, resonating with a younger audience interested in aesthetics, lifestyle, and relatable experiences.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Regional audiences, Men"
        },
        {
          "name": "Agnieszka Grzelak",
          "description": "Polish beauty and travel content creator who combines lifestyle vlogs, makeup tutorials, and explorations of global destinations. Her content is energetic, playful, and strongly rooted in aesthetics, often blending personal style with humor, fashion, and popular culture references. She also covers broader lifestyle topics and collaborates with international brands, bridging entertainment with personal expression.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Women, Journalists and Media Practitioners"
        },
        {
          "name": "Sofiia Blidchenko",
          "description": "Sofi Liabi shares lifestyle and personal content on TikTok, mixing humor, daily reflections, travel snippets, and fitness/acrobatics. Her style is relatable and authentic, often blending everyday experiences with light social commentary.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish, Ukrainian",
          "partner_audiences": "Gen Z, Millennials, Women, Regional audiences"
        },
        {
          "name": "Karolina Brzuszczyńska",
          "description": "Lifestyle, fitness, and empowerment-focused Instagram account mixing personal style, wellness routines, fitness content, and glimpses into everyday life. Strong emphasis on visual aesthetics, aspirational lifestyle, and community engagement.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Millennials, Gen Z, Women, Regional audiences"
        },
        {
          "name": "Anita Sokołowska",
          "description": "Actress and public figure sharing lifestyle, acting career highlights, cultural engagement, and occasional activism. Mix of personal life, entertainment, and social issue awareness.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Civic and Human Rights Activists, Civil Society, Journalists and Media Practitioners, Regional audiences"
        },
        {
          "name": "Maja Ostaszewska",
          "description": "Advocacy for human rights and social justice; outspoken voice on gender equality and LGBTQ+ inclusion; support for migrants and humanitarian issues; cultural influence through film and theatre.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Civic and Human Rights Activists, Gender and LGBTQ+ activists, Journalists and Media Practitioners, Migrants and At Risk Groups"
        },
        {
          "name": "Magda Łucyan",
          "description": "Reporting on climate change and environmental challenges; coverage of social and political issues in Poland; author of books on history, resilience, and human rights; journalism focused on connecting past lessons with present crises.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Education Institutions and Stakeholders, Environmental and Climate Advocates"
        },
        {
          "name": "Gdzie Bądź",
          "description": "Storytelling around sustainable travel and outdoor adventures; family-oriented content blending parenting with responsible tourism; promotion of environmental awareness and cultural exchange",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Environmental and Climate Advocates"
        },
        {
          "name": "Szymon Bożycki",
          "description": "Digital creator producing youth-oriented content through humor, lifestyle, and music; active in online culture and entertainment; engaging Gen Z audiences through creative expression and social media trends.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Journalists and Media Practitioners"
        },
        {
          "name": "Paulina Grabowska",
          "description": "Content creator blending lifestyle, pop culture, and fandom communities; engages large youth audiences with entertainment, reviews, and personal storytelling; promotes online community-building and digital creativity.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Gender and LGBTQ+ activists"
        },
        {
          "name": "Bartosz Suchowiak",
          "description": "Digital creator producing humorous and relatable lifestyle content; connects with youth through fashion, comedy, and everyday storytelling; cultivates online community around self-expression and entertainment.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Journalists and Media Practitioners"
        },
        {
          "name": "Olia Haponchukk",
          "description": "Ukrainian creator in Poland sharing personal stories of migration, adaptation, and family life; builds supportive digital spaces for displaced communities; content highlighting everyday resilience and cross-cultural experience",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish, Ukrainian",
          "partner_audiences": "Migrants and At Risk Groups, Women, Civic and Human Rights Activists, Gen Z, Millennials"
        },
        {
          "name": "Oksana Shevchenko",
          "description": "Ukrainian blogger in Poland documenting migrant life, parenting, and integration; provides guidance for fellow Ukrainians navigating education, work, and adaptation abroad; shares personal reflections on identity, displacement, and resilience",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish, Ukrainian",
          "partner_audiences": "Migrants and At Risk Groups, Women, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Oksana",
          "description": "Digital creator sharing candid lifestyle, motherhood, and personal storytelling; engages audiences with humorous and relatable content around daily challenges, family, and self-expression.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Women, Civic and Human Rights Activists"
        },
        {
          "name": "Daria Fetsiak",
          "description": "Ukrainian digital creator sharing motivational and lifestyle content; engages audiences with humor, personal reflections, and beauty-related storytelling; builds an online community around resilience and everyday empowerment.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Ukraine",
          "partner_languages": "Ukrainian",
          "partner_audiences": "Gen Z, Millennials, Women, Migrants and At Risk Groups"
        },
        {
          "name": "Aleksandra Dulkiewicz",
          "description": "Mayor of Gdańsk advocating for democratic governance, civic participation, and European values; vocal on human rights, equality, and inclusive policies; strong presence in promoting community resilience and accountable leadership.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners, Regional audiences"
        },
        {
          "name": "Magdalena Różczka",
          "description": "Actress and humanitarian ambassador engaged with UNICEF and adoption support initiatives; advocates for children’s rights, family welfare, and social inclusion; uses cultural influence to promote empathy and civic solidarity.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Civic and Human Rights Activists, Women, Education Institutions and Stakeholders, Policy and Governance Stakeholders"
        },
        {
          "name": "Joanna Racewicz",
          "description": "Journalist, author, and public speaking coach; known for commentary on politics, society, and women’s empowerment; uses media presence to address democratic values, human rights, and civic responsibility.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Women, Policy and Governance Stakeholders"
        },
        {
          "name": "Paulina Krupińska-Karpiel",
          "description": "TV presenter and journalist engaging wide audiences through mainstream media; combines lifestyle and cultural content with social dialogue; leverages her public profile to highlight community values and civic awareness.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Journalists and Media Practitioners, Civic and Human Rights Activists"
        },
        {
          "name": "Maciej Musiał",
          "description": "Actor and public figure using his platform to engage youth through culture, entertainment, and social commentary; connects popular media with reflections on history, identity, and contemporary civic values.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists, Journalists and Media Practitioners"
        },
        {
          "name": "Gorod",
          "description": "Gorod.ee is a Russian-language online news platform and weekly newspaper based in Narva, Estonia. It focuses on local and regional news, culture, and community affairs, serving the Russian-speaking population in Ida-Virumaa and across Estonia.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Estonia",
          "partner_languages": "Estonian",
          "partner_audiences": "Independent Journalism, Investigative Reporting, Human Rights, Freedom Of Expression, Culture And The Arts"
        },
        {
          "name": "Rusradio",
          "description": "A leading Russian-language radio station based in Moscow, operating since 1995. It offers a mix of chart-topping pop music, entertainment shows (like Русские Перцы and Golden Gramophone), celebrity interviews, and cultural programming across Russia and the CIS.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Russia",
          "partner_languages": "Russian",
          "partner_audiences": "Regional audiences, Gen X, Boomers, Journalists and Media Practitioners"
        },
        {
          "name": "Radio Raduga",
          "description": "A Russian-language FM radio station based in Klaipėda, Lithuania (100.8 FM), broadcasting from September 1, 2001 until January 17, 2024. It offered 24/7 programming featuring international pop, Russian hits from the ’80s to today, news bulletins, talk segments, and listener games. Operated online as well, serving Russian-speaking communities in Lithuania and beyond.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Lithuania",
          "partner_languages": "Lithuanian, Russian",
          "partner_audiences": "Regional audiences, Civil Society, Journalists and Media Practitioners, Policy and Governance Stakeholders"
        },
        {
          "name": "LTV.lv",
          "description": "Latvijas Televīzija (Latvian Television), the country’s public service broadcaster. It provides national and international news, analysis, original TV content, cultural programming, and educational initiatives aimed at informing and engaging the Latvian public.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Latvia",
          "partner_languages": "Latvian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Civil Society, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "ETV+",
          "description": "ETV+ is a Russian-language public TV and multimedia channel in Estonia. It provides a mix of news, entertainment, and educational programming aimed at the Russian-speaking community, highlighting both local Estonian issues and broader international topics. The channel focuses on inclusivity and ensuring minority audiences are engaged and represented.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Estonia",
          "partner_languages": "Estonian, Russian",
          "partner_audiences": "Independent Journalism, Investigative Reporting, Media Literacy, Critical Thinking, Culture And The Arts, International Relations And Communication"
        },
        {
          "name": "Raadio 4",
          "description": "Raadio 4 / Радио 4 is Estonia’s Russian-language public broadcasting radio channel, part of ERR. It provides news, talk shows, cultural programs, and music, focusing on the Russian-speaking community in Estonia. It covers social issues, local events, and international developments with emphasis on community integration and cultural diversity.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Estonia",
          "partner_languages": "Estonian, Russian",
          "partner_audiences": "Independent Journalism, Investigative Reporting, Media Literacy, Critical Thinking, Culture And The Arts, International Relations And Communication"
        },
        {
          "name": "TV3 Plus",
          "description": "TV3 Plus is a Russian-language television channel in Latvia that brands itself as a family entertainment network. It offers a mix of movies, TV series, cartoons, and news segments, focusing on Russian-speaking audiences. The channel highlights both international films and local content while providing Russian-language news coverage relevant to Latvia.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Latvia",
          "partner_languages": "Latvian, Russian",
          "partner_audiences": "Culture And The Arts, Independent Journalism, Investigative Reporting, Media Literacy, Critical Thinking"
        },
        {
          "name": "TavaRiga",
          "description": "TavaRiga.lv is a city portal project from Riga, Latvia, aimed at youth and civic activists. It covers local events, news, and cultural activities while providing a space for young people and communities to engage in social and urban issues.",
          "partner_entity_types": "CSO",
          "partner_countries": "Latvia",
          "partner_languages": "Latvian, Russian",
          "partner_audiences": "Civic Education, Youth Empowerment, Participation, Culture And The Arts"
        },
        {
          "name": "Novaya Gazeta – Baltia",
          "description": "An independent, censorship-free Russian-language news outlet covering the Baltic states (Estonia, Latvia, Lithuania), offering in-depth reporting, analytics, investigative journalism, and commentary on topics including human rights, migration, regional politics, and social issues. It operates across online portals and Europe editions.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Estonia",
          "partner_languages": "Russian",
          "partner_audiences": "Civic and Human Rights Activists, Journalists and Media Practitioners, Migrants and At Risk Groups, Civil Society"
        },
        {
          "name": "Alternatives and Analyzes",
          "description": "Analyses & Alternatives is a Bulgarian non-governmental organization founded by experienced analysts specializing in energy, geopolitics, diplomacy, international relations, and security. It publishes in-depth analytical content, convenes strategic discussions, and promotes media freedom to help civil society, institutions, and young researchers navigate complex information landscapes.",
          "partner_entity_types": "CSO",
          "partner_countries": "Bulgaria",
          "partner_languages": "Bulgarian, English",
          "partner_audiences": "Civic and Human Rights Activists, Education Institutions and Stakeholders, Civil Society, Policy and Governance Stakeholders"
        },
        {
          "name": "Atlatszo.hu",
          "description": "Átlátszó (Atlatszo.hu) is Hungary’s first nonprofit investigative journalism outlet and watchdog NGO, established in 2011. It promotes transparency, accountability, and freedom of information through investigative reporting, whistleblower platforms (MagyarLeaks), FOI request tools (Kimittud), legal actions, and data-driven journalism.",
          "partner_entity_types": "CSO",
          "partner_countries": "Hungary",
          "partner_languages": "Hungarian, English",
          "partner_audiences": "Civic and Human Rights Activists, Journalists and Media Practitioners, Education Institutions and Stakeholders, Civil Society"
        },
        {
          "name": "Center for European Policy Analysis (CEPA)",
          "description": "A nonprofit, nonpartisan public policy think tank headquartered in Washington, DC, with hubs in London and Brussels. CEPA strengthens the transatlantic alliance by delivering cutting-edge research, analysis, and programs focused on democracy, security, technology, and authoritarian threats from Central and Eastern Europe to North America.",
          "partner_entity_types": "CSO",
          "partner_countries": "United States",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "The Centre for East European Policy Studies (CEEPS)",
          "description": "A Latvian think tank established in 2006, CEEPS contributes to advancing Latvia’s foreign policy expertise, particularly on Russia’s development and foreign policy tools. Its research covers Russia’s regional influence, soft power, media policy, and ideological issues, while also building international partnerships and raising public awareness through seminars and publications.",
          "partner_entity_types": "CSO",
          "partner_countries": "Latvia",
          "partner_languages": "Latvian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Barcelona Centre for International Affairs",
          "description": "CIDOB is an international affairs research centre that, through excellence and relevance, seeks to analyse the global issues that affect political, social and governance dynamics, from the international to the local.",
          "partner_entity_types": "CSO",
          "partner_countries": "Spain",
          "partner_languages": "English, Spanish",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Defence 24",
          "description": "A leading Polish independent media portal offering expert-driven news, analysis, and commentary on defense policy, armed forces, the defense industry, NATO–EU cooperation, and transatlantic security, serving Central and Eastern Europe in both Polish and English,",
          "partner_entity_types": "CSO",
          "partner_countries": "Poland",
          "partner_languages": "English, Polish",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Education Institutions and Stakeholders, Civil Society"
        },
        {
          "name": "Demaskuok",
          "description": "A national Lithuanian initiative uniting media, civil society, and the state to combat disinformation using advanced technology and volunteer networks (“elves”) to detect and debunk false news effectively.",
          "partner_entity_types": "CSO",
          "partner_countries": "Lithuania",
          "partner_languages": "English, Lithuanian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Civil Society, Policy and Governance Stakeholders"
        },
        {
          "name": "European Values Center for Security Policy (EuropeanValues.cz)",
          "description": "A Prague-based non-governmental think tank founded in 2005, committed to defending liberal democracy and transatlantic cooperation. It specializes in exposing authoritarian influence—particularly from Russia and China through programs like Kremlin Watch and Red Watch, along with research, policy recommendations, conferences, and security training.",
          "partner_entity_types": "CSO",
          "partner_countries": "Czech Republic",
          "partner_languages": "English, Czech",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Fakenews.pl",
          "description": "A Polish fact‑checking portal run by the “Counteracting Disinformation” Foundation, it debunks fake news, rumors, and manipulations with detailed verifications, expert-backed analysis, and educational tools.",
          "partner_entity_types": "CSO",
          "partner_countries": "Poland",
          "partner_languages": "Polish",
          "partner_audiences": "Journalists and Media Practitioners, Education Institutions and Stakeholders, Civic and Human Rights Activists, Civil Society"
        },
        {
          "name": "GlobalFocus Center",
          "description": "An independent international studies think tank based in Bucharest, Romania, producing in-depth research and analysis on foreign policy, European affairs, good governance, security, and development. It builds regional expertise and supports cooperation across NGOs, experts, and public institutions.",
          "partner_entity_types": "CSO",
          "partner_countries": "Romania",
          "partner_languages": "Romanian",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Education Institutions and Stakeholders, Civil Society"
        },
        {
          "name": "Laisvės TV",
          "description": "An independent Lithuanian online television channel founded in 2016 by journalist Andrius Tapinas, funded by viewers. It produces satirical news, investigative journalism, civic initiatives (e.g., “SKAIDRINAM”, “Freedom Picnic”), and educational programming to promote civic engagement, transparency, and social responsibility.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Lithuania",
          "partner_languages": "Lithuanian, English",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists, Civil Society, Journalists and Media Practitioners"
        },
        {
          "name": "NATO Strategic Communications Centre of Excellence",
          "description": "A NATO-accredited multinational research and training hub based in Riga, Latvia. StratCom CoE enhances strategic communications capabilities for NATO and allied nations through expert analysis, doctrine development, public diplomacy, education, and innovation in counter-disinformation and hybrid threats.",
          "partner_entity_types": "CSO",
          "partner_countries": "Latvia",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Education Institutions and Stakeholders, Journalists and Media Practitioners, Civic and Human Rights Activists"
        },
        {
          "name": "University of Nicosia AI Lab",
          "description": "A research and teaching laboratory within the Computer Science Department at the University of Nicosia, focusing on advanced applications in AI, machine learning, data science, computational social science, smart cities, sentiment analysis, and social network analysis. The lab also hosts outreach events like AI Day for high schoolers and contributes to educational innovation and public seminars.",
          "partner_entity_types": "CSO",
          "partner_countries": "Cyprus",
          "partner_languages": "English",
          "partner_audiences": "Education Institutions and Stakeholders, Gen Z, Millennials, Civic and Human Rights Activists"
        },
        {
          "name": "Political Capital",
          "description": "An independent policy research, analysis, and consulting think tank founded in 2001 in Budapest. Political Capital focuses on democracy, human rights, authoritarian influence, disinformation, and political systems through evidence-based research, public debates, and media contributions.",
          "partner_entity_types": "CSO",
          "partner_countries": "Hungary",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Propastop",
          "description": "An independent Estonian blog run by volunteers dedicated to exposing propaganda, disinformation, and manipulative narratives in the media. It fact-checks misleading claims, analyzes hostile narratives, and explains the motives and tactics behind information operations in Estonia’s media space.",
          "partner_entity_types": "CSO",
          "partner_countries": "Estonia",
          "partner_languages": "English, Estonian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Civil Society, Policy and Governance Stakeholders"
        },
        {
          "name": "Vouliwatch",
          "description": "A Greek nonpartisan civic tech organization and parliamentary watchdog platform launched in 2014. It enhances democratic transparency by enabling citizens to track MPs’ votes (\"Votewatch\"), submit questions to representatives, and access public legislative and financial data—bridging the gap between citizens and parliament. It also advocates for open governance through FOI requests and legal action.",
          "partner_entity_types": "CSO",
          "partner_countries": "Greece",
          "partner_languages": "Greek",
          "partner_audiences": "Civic and Human Rights Activists, Civil Society, Journalists and Media Practitioners, Policy and Governance Stakeholders"
        },
        {
          "name": "Association of Independent Press",
          "description": "A non-commercial organization founded in 1997, API supports independent media and journalists across Moldova. It strengthens professional capacities, resilience, and media policy through training, psychological support, advocacy, fact-checking, and projects like media literacy campaigns and election monitoring.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Education Institutions and Stakeholders, Civil Society"
        },
        {
          "name": "Press Club Belarus",
          "description": "Founded in 2011 by Belarusian media professionals in exile, Press Club Belarus supports independent journalism through professional development, trainings, media ethics workshops, and the \"Press Under Pressure\" initiative that documents repression of journalists under the Lukashenko regime. It operates as a platform for dialogue, capacity building, and advocacy for press freedom amid authoritarian crackdowns.",
          "partner_entity_types": "CSO",
          "partner_countries": "Belarus",
          "partner_languages": "English, Belarusian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Education Institutions and Stakeholders, Policy and Governance Stakeholders"
        },
        {
          "name": "FIP.am",
          "description": "An independent Armenian fact-checking media outlet founded in 2016 by the Union of Informed Citizens. FIP.am specializes in exposing disinformation, manipulations by officials and media, and operates with editorial independence and adherence to journalistic ethics.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Armenia",
          "partner_languages": "Armenian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Education Institutions and Stakeholders, Civil Society"
        },
        {
          "name": "Gavigudet",
          "description": "Gavigudet is a civic movement based in Rustavi, Georgia, launched in 2018 to tackle severe air pollution and environmental degradation caused primarily by local industry. The movement advocates for stronger legislative frameworks, improved enforcement of environmental standards, and increased public awareness about air quality and health. Gavigudet promotes civic activism and responsibility to create a safer, healthier environment in Rustavi and across Georgia.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Environmental and Climate Advocates, Regional audiences, Policy and Governance Stakeholders, Migrants and At Risk Groups"
        },
        {
          "name": "Orbeliani Georgia",
          "description": "Empowering citizens across Georgia to identify local challenges and implement solutions through small grants, civic campaigns, and capacity-building; supporting grassroots activism and inclusive decision-making to strengthen democratic participation, social justice, and local accountability in underserved communities.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Education Institutions and Stakeholders, Policy and Governance Stakeholders"
        },
        {
          "name": "Guild – Independent Trade Unions in the Field of Culture and Media",
          "description": "Advocating for the rights and welfare of professionals working in Georgia’s cultural and media sectors; supporting freedom of expression, fair labour conditions, and unionisation in creative industries; promoting cultural workers’ social protections, policy inclusion, and independent media as pillars of democratic resilience.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders"
        },
        {
          "name": "Parents for Education (PFE)",
          "description": "Mobilising parents, educators, and communities to advocate for inclusive, child-centred, and rights-based education in Georgia; promoting transparency, participation, and accountability in education policy; challenging discrimination and working to ensure equal access to quality education for all children, regardless of background or ability.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Education Institutions and Stakeholders, Civic and Human Rights Activists, Policy and Governance Stakeholders"
        },
        {
          "name": "Tozu Gulmamedli",
          "description": "Tozu Gulmamedli is a passionate advocate for women’s rights within Georgia’s ethnic Azeri community. She challenges entrenched traditional gender roles that confine women to domestic spheres and actively speaks out against domestic violence, sexual harassment, and forced marriages. Her work promotes gender equality and empowers women to claim their rights in a culturally sensitive context.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English, Azerbaijani",
          "partner_audiences": "Women, Gender and LGBTQ+ activists, Civic and Human Rights Activists, Regional audiences, Policy and Governance Stakeholders"
        },
        {
          "name": "Esma Gumberidze",
          "description": "Esma Gumberidze is a prominent Georgian activist advocating for the rights of persons with disabilities. She serves on the board of the Georgian Network of Women with Disabilities and chairs the Platform for New Opportunities. Esma actively participates in government consultative councils and engages in international youth networks including Generation Democracy and the UN’s GRACE Initiative. She writes and contributes on key issues such as disability rights, corruption, women’s rights, peacebuilding, youth empowerment, and financial and media literacy. Esma holds a B.A. in law from Tbilisi State University.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian",
          "partner_audiences": "Civic and Human Rights Activists, Women, Migrants and At Risk Groups, Gen Z Millennials, Regional audiences"
        },
        {
          "name": "Nana Bagalishvili",
          "description": "Nana Bagalishvili is an experienced civil society professional with over 10 years in the sector, specializing in crowdfunding, community advocacy, social media, leadership training, and public speaking. She is the founder of Knowledge Cafe, a multifunctional educational center and social enterprise focused on fostering lifelong learning and active community engagement.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Education Institutions and Stakeholders, Gen Z, Millennials, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Mikheil Mumladze",
          "description": "Mishiko Mumladze is a digital creator and founder of the social movement \"We Stand With You,\" which supports the Ukrainian community in Kutaisi, Georgia. He is a social entrepreneur and community leader based in Kutaisi, actively engaged in civic activism and social support initiatives.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Education Institutions and Stakeholders, Regional audiences"
        },
        {
          "name": "Akaki Saghinadze",
          "description": "Akaki is a prominent activist advocating for democracy and human rights. He founded the movement “We Stand With You” to support Ukrainians in Georgia and currently serves as Deputy Chairperson of Regional Strengthening of Democracy – RED.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Civil Society, Migrants and At Risk Groups, Policy and Governance Stakeholders, Regional audiences, Youth Empowerment, Participation"
        },
        {
          "name": "Mariam Shekiladze",
          "description": "Mariam Shekiladze is an environmental activist and co-founder of the Museum of Environment Dighomi Meadows. She actively leads and participates in grassroots protests against ecological degradation in the Dighomi area. Mariam is passionate about environmental education, youth empowerment, and civic engagement, striving to protect natural habitats and raise public awareness about climate and ecological issues in Georgia.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Environmental and Climate Advocates, Civic and Human Rights Activists, Youth Empowerment, Participation, Regional audiences"
        },
        {
          "name": "Giga Bekauri",
          "description": "Giga Bekauri is a passionate defender of labour rights within the arts and culture sectors. As a founder member of the creative guild Guild, he works to empower artists and cultural workers, advocating for fair working conditions and stronger labour protections. Giga also previously led the Youth GTUC (Trade Union of Georgia), where he championed young workers’ rights, focusing on mobilizing and educating youth about labour issues and social justice.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Education Institutions and Stakeholders, Journalists and Media Practitioners, Civic and Human Rights Activists, Civil Society"
        },
        {
          "name": "Center for Civil Integration and Inter-Ethnic Relations (CCIIR)",
          "description": "Promoting civil integration and interethnic harmony in Georgia through inclusive education, teacher training, and policy reform; supporting minority language rights, multicultural curricula, and equal access to quality education; fostering dialogue and mutual respect among diverse communities to strengthen social cohesion and democratic participation.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Education Institutions and Stakeholders, Migrants and At Risk Groups, Policy and Governance Stakeholders"
        },
        {
          "name": "Curatio International Foundation",
          "description": "Advancing evidence-based health policy and system reform in Georgia and globally through applied research, capacity-building, and strategic consulting; addressing public health challenges including healthcare equity, pandemic response, and mental health services; promoting accountable governance and data-driven policymaking in health and social protection.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Tamar Jakeli",
          "description": "Tamar Jakeli is the Director of Tbilisi Pride, a leading LGBTQI+ rights organization in Georgia. She has been at the forefront of opposing the Georgian government's 2024 \"anti-LGBT propaganda\" law, which imposes severe restrictions on LGBTQI+ rights, including bans on public gatherings, gender-affirming care, and media representation. Jakeli's activism emphasizes the defense of freedom of expression, assembly, and bodily autonomy for LGBTQI+ individuals in an increasingly repressive environment. Her work involves mobilizing communities, advocating for policy change, and raising international awareness about the challenges faced by LGBTQI+ people in Georgia.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gender and LGBTQ+ activists, Civic and Human Rights Activists, Civil Society, Journalists and Media Practitioners, Policy and Governance Stakeholders"
        },
        {
          "name": "Samira Bayramova",
          "description": "Human rights defender and civic activist based in Marneuli, Georgia, advocating for ethnic minority rights, gender equality, and civic participation. Founder of the Journalists’ Network for Gender Equality, she actively campaigns against early and forced marriages, promotes women's empowerment, and challenges far-right extremism. Bairamova has faced threats and harassment for her activism, including protests against pro-Russian political groups and initiatives to support cross-border community ties between Georgia and Azerbaijan.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Gender and LGBTQ+ activists, Education Institutions and Stakeholders, Policy and Governance Stakeholders, Migrants and At Risk Groups"
        },
        {
          "name": "Luiza Mutoshvili",
          "description": "Civic educator and human rights advocate from Georgia’s Pankisi Valley, working to dismantle ethnic stigma, promote gender equality, and defend minority rights. As a history teacher and youth mentor, she has led programs through the Kakheti Regional Development Foundation (KRDF) to improve access to education and civic participation for Kist youth and women. Mutoshvili has been a vocal critic of state repression, including the militarization of Pankisi, the marginalization of ethnic minorities, and the construction of hydropower plants without community consent. She has faced threats for her work with Pankisi Radio and remains one of the few remaining local voices advocating for justice and inclusion in the region.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English, Russian",
          "partner_audiences": "Civic and Human Rights Activists, Education Institutions and Stakeholders, Migrants and At Risk Groups, Journalists and Media Practitioners, Environmental and Climate Advocates"
        },
        {
          "name": "Mariam Kvaratskhelia",
          "description": "Co-founder and former director of Tbilisi Pride, Mariam Kvaratskhelia is a leading LGBTQI+ rights activist in Georgia. She has been instrumental in organizing Pride events and advocating for LGBTQI+ visibility and rights, often facing significant opposition from conservative and far-right groups. Kvaratskhelia emphasizes the importance of peaceful assembly and freedom of expression as tools to combat homophobia and transphobia in Georgian society. Her activism includes community empowerment initiatives, public awareness campaigns, and international advocacy to align Georgia's human rights practices with European standards.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gender and LGBTQ+ activists, Civic and Human Rights Activists, Education Institutions and Stakeholders, Policy and Governance Stakeholders, Gen Z, Millennials"
        },
        {
          "name": "Archil Marshania",
          "description": "Physician, civic educator, and digital rights advocate in Georgia, Archil Marshania leverages his medical expertise to combat health-related disinformation and promote public health awareness. Through public lectures and social media platforms like TikTok, he addresses topics ranging from COVID-19 myths to the importance of vaccination. Marshania also engages in discussions on discrimination and human rights, aiming to foster critical thinking and resilience against misinformation in Georgian society.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Millennials, Education Institutions and Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners"
        },
        {
          "name": "Tamar Kuratishvili",
          "description": "Regional organizer and civic activist with Georgia’s Shame Movement, Tamar Kuratishvili has led grassroots mobilization in Batumi since 2020. With a background in journalism and human rights communications, she has coordinated protests against authoritarianism, Russian influence, and the erosion of democratic institutions. Kuratishvili has faced arrests and harassment for her activism, including during a 2024 protest defending the legacy of Georgian war heroes. She continues to play a central role in youth engagement and civil resistance across the Adjara region.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Gen Z, Education Institutions and Stakeholders, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Tamta Mikeladze",
          "description": "Human rights lawyer, academic, and co-founder of Georgia’s Social Justice Center (formerly EMC), Tamta Mikeladze leads the Equality Policy Programme, focusing on anti-discrimination, minority rights, and civic freedoms. Her work includes strategic litigation at the European Court of Human Rights, research on secularism and religious freedom, and advocacy for LGBTQI+ rights, ethnic minorities, and internally displaced persons. Mikeladze has been a vocal critic of state repression, including police violence, far-right extremism, and authoritarian legal reforms. She has faced state harassment, including interrogation by the State Security Service, for her activism. In 2022, she accepted the OSCE’s Max van der Stoel Award on behalf of the Social Justice Center for advancing minority rights in Georgia.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Policy and Governance Stakeholders, Education Institutions and Stakeholders, Gender and LGBTQ+ activists, Migrants and At Risk Groups, Journalists and Media Practitioners"
        },
        {
          "name": "Eastern European Centre for Multiparty Democracy (EECMD)",
          "description": "Promoting democratic development, political pluralism, and civic engagement across Eastern Europe through education, dialogue, and institutional support; delivering Democracy Schools, election integrity initiatives, and leadership training to empower active citizenship and accountable governance in transitional societies.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English, Ukrainian",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Education Institutions and Stakeholders"
        },
        {
          "name": "Social Justice Center",
          "description": "Advancing human rights, social equality, and democratic governance in Georgia through legal advocacy, strategic litigation, and community empowerment; challenging structural discrimination against minorities, women, and vulnerable groups; promoting participatory policymaking and accountability in state institutions.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English, Azerbaijani, Armenian",
          "partner_audiences": "Civic and Human Rights Activists, Policy and Governance Stakeholders, Migrants and At Risk Groups"
        },
        {
          "name": "Human Rights Center (HRC) – Georgia",
          "description": "Defending civil, political, and minority rights in Georgia through legal aid, strategic litigation, and human rights monitoring; advocating against torture, discrimination, and abuse of power while supporting victims of state violence and systemic injustice; promoting democratic reform, transparency, and access to justice.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Policy and Governance Stakeholders, Migrants and At Risk Groups"
        },
        {
          "name": "International Society for Fair Elections and Democracy (ISFED)",
          "description": "Promoting transparent, fair, and inclusive electoral processes in Georgia through independent observation, civic education, and legal advocacy; monitoring elections, political finance, and disinformation to safeguard democratic integrity; empowering citizens and civil society to hold institutions accountable and participate meaningfully in governance.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Education Institutions and Stakeholders"
        },
        {
          "name": "Sapari",
          "description": "Advancing women’s rights and gender equality through legal aid, strategic litigation, and public advocacy; supporting survivors of domestic and sexual violence with trauma-informed services; promoting feminist policy reform, anti-discrimination protections, and the empowerment of marginalised groups in Georgia’s legal and social systems.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Women, Gender and LGBTQ+ activists, Civic and Human Rights Activists"
        },
        {
          "name": "Women's Initiatives Supporting Group (WISG)",
          "description": "Advocacy and capacity-building for LGBTQI+ rights and gender equality in Georgia; public education on discrimination and human rights; intersectional feminist analysis in policy and media; community empowerment initiatives.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gender and LGBTQ+ activists, Civic and Human Rights Activists, Education Institutions and Stakeholders"
        },
        {
          "name": "Fund Sukhumi",
          "description": "Peacebuilding and conflict transformation initiatives in post-conflict regions of Georgia; psychosocial support for internally displaced persons (IDPs); violence prevention and gender equality training for youth and communities.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "IDPs, Women, Civic and Human Rights Activists"
        },
        {
          "name": "Institute for Development of Freedom of Information (IDFI)",
          "description": "Promoting open government and transparent public institutions in Georgia; supporting investigative journalism and access to information; combating corruption through civic monitoring and digital tools for accountability.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Civil Society"
        },
        {
          "name": "Europe-Georgia Institute (EGI)",
          "description": "Youth-focused civic engagement and democratic development initiatives across Georgia; countering authoritarian influence through education and activism; campaigns promoting European integration and media literacy.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Civic and Human Rights Activists, Education Institutions and Stakeholders"
        },
        {
          "name": "Georgian Young Lawyers Association (GYLA)",
          "description": "Legal advocacy and strategic litigation on human rights and rule of law in Georgia; civic education on constitutional rights and freedoms; monitoring of elections, public policy, and justice sector reforms.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners"
        },
        {
          "name": "Partnership for Human Rights (PHR)",
          "description": "Strategic litigation and advocacy for the rights of children, persons with disabilities, and survivors of gender-based violence in Georgia; capacity-building for inclusive public services; mental health and social protection reforms.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Women, Migrants and At Risk Groups"
        },
        {
          "name": "Center for Strategy and Development (CSD)",
          "description": "Research and policy analysis on regional security, governance, and disinformation threats; capacity-building for civil society and media on strategic communication; fostering democratic resilience and Euro-Atlantic integration.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civil Society, Journalists and Media Practitioners"
        },
        {
          "name": "Georgia's Reforms Associates (GRASS)",
          "description": "Evidence-based policy analysis and advocacy on democratic reforms and Euro-Atlantic integration; strategic communications to counter disinformation; civic education and training for youth, media, and governance stakeholders.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Gen Z"
        },
        {
          "name": "Tolerance and Diversity Institute (TDI)",
          "description": "Legal advocacy and public awareness on religious freedom, minority rights, and anti-discrimination in Georgia; civic education to promote tolerance and social cohesion; strategic litigation for marginalized groups.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Migrants and At Risk Groups, Civic and Human Rights Activists, Gender and LGBTQ+ activists"
        },
        {
          "name": "Soviet Past Research Laboratory (Sovlab)",
          "description": "Research and public engagement on Soviet-era repression, historical memory, and democratic values in Georgia; educational projects on totalitarianism, civic resistance, and transitional justice; exhibitions, publications, and youth outreach.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Democracy Research Institute (DRI)",
          "description": "Research and advocacy on democratic development, minority integration, and human rights in Georgia; monitoring hate speech, extremist narratives, and disinformation; civic education and inclusive policymaking support.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Migrants and At Risk Groups"
        },
        {
          "name": "Ana Kaulashvili",
          "description": "Lifestyle and food content creator sharing accessible recipes, daily routines, and relatable humor; creates engaging short-form videos highlighting Georgian food culture, budget-friendly tips, and personal vlogs with strong aesthetic appeal and authentic tone.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Women, Regional audiences"
        },
        {
          "name": "Anano Totiauri",
          "description": "Digital creator and youth lifestyle influencer producing content on wellness, daily routines, personal growth, and positivity; engages followers with vlogs, mental health reflections, and creative visuals aimed at empowering young women and building emotional resilience.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Women, Mental Health, Social Inclusion Advocates"
        },
        {
          "name": "Nini Gogichaishvili",
          "description": "Professional dancer and digital creator blending performance art with lifestyle content; showcases contemporary dance, body positivity, and youth creativity through expressive short-form videos and behind-the-scenes moments from the Georgian arts scene.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Culture And Arts Enthusiasts, Women"
        },
        {
          "name": "Elene Rukhadze (Foxy Eleniko)",
          "description": "Bold and comedic digital creator known for character-driven skits, social satire, and lifestyle content; explores themes of gender roles, everyday absurdities, and identity through humor and performance, resonating with a wide youth and feminist audience in Georgia.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Gender and LGBTQ+ activists, Civic and Human Rights Activists"
        },
        {
          "name": "Giorgi Danelia",
          "description": "Content creator blending humor, commentary, and lifestyle vlogs to engage youth on everyday challenges, societal observations, and personal growth; known for his relatable tone and sharp storytelling that often reflects on identity, culture, and social norms.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Men, Civic and Human Rights Activists"
        },
        {
          "name": "Giorgi Kalatozi",
          "description": "Sports commentator and content creator known for dynamic, entertaining coverage of football and trending sports events; produces high-energy reactions, match breakdowns, and commentary that resonate with younger audiences across TikTok, YouTube, and Instagram.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Men, Regional audiences"
        },
        {
          "name": "H1TA (Davit Alavidze)",
          "description": "Multi-platform digital creator and pop culture commentator known for comedic takes on trending news, sports, internet phenomena, and Georgian social quirks. Combines satire, reaction content, and guest interviews to engage a wide youth audience with humor and critical curiosity.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Regional audiences, Journalists and Media Practitioners"
        },
        {
          "name": "Hungryman",
          "description": "Trio of creators producing high-energy, challenge-based content, parody sports commentary, and social experiments; blends humor, pop culture, food reviews, and creative competitions to entertain and engage mass youth audiences across Georgia. Known for their dynamic group chemistry, storytelling, and relatability.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Regional audiences, Men"
        },
        {
          "name": "Ioane Romanadze (@iooane)",
          "description": "Philosophy student and content creator known for his humorous yet thoughtful takes on life, language, and society; engages followers with Q&A-style videos, commentary on Georgian culture, and intellectually playful dialogues that blur the lines between satire and sincerity.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Katsebi (\"Men\")",
          "description": "Popular Georgian comedy and commentary talk show blending satire, pop culture, and everyday absurdities from a male perspective. With a rotating group of charismatic hosts, Katsebi tackles social taboos, internet culture, and relationships through humor, parody, and candid discussions—building strong resonance with younger male and regional audiences.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Men, Regional audiences"
        },
        {
          "name": "Keta Bagashvili",
          "description": "Bold, confident digital creator known for empowering commentary on relationships, beauty standards, and personal boundaries. Blends lifestyle content with feminist humor and sharp social critique, speaking directly to young women navigating modern identity, love, and self-worth.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Women, Gender and LGBTQ+ activists"
        },
        {
          "name": "Korsizi (Giorgi Kordize)",
          "description": "Popular digital creator and social commentator blending sports culture, satire, and introspective humor. Through TikTok monologues and collaborations on Hamaki Studio, Giorgi tackles topics ranging from masculinity and identity to football fandom and generational struggles with wit and authenticity.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Men, Civic and Human Rights Activists"
        },
        {
          "name": "Lika Jorbenadze",
          "description": "Charismatic lifestyle and relationship content creator blending humor, storytelling, and fashion aesthetics. Lika's videos center around romantic dynamics, family moments, beauty, and food offering highly relatable and emotionally engaging content for a wide female and youth audience.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Women, Civic and Human Rights Activists"
        },
        {
          "name": "Linako (Lina Giunashvili)",
          "description": "Bright and expressive content creator blending humor, personal storytelling, and cultural commentary. Lina’s content ranges from comedic reflections on daily life to explorations of art spaces, festivals, and social awkwardness engaging young audiences with a distinctive blend of charm, honesty, and creativity.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Women, Civic and Human Rights Activists"
        },
        {
          "name": "Lukrecius Sitchinava",
          "description": "Creates engaging literary and cultural content in Georgian, blending book reviews, language jokes, and social commentary. His videos often explore national identity, civic values, and media consumption with humor and emotional resonance, particularly aimed at younger audiences. He contributes to informal civic education through popular formats, helping demystify complex topics like identity, propaganda, and history.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Millennials"
        },
        {
          "name": "Mamia Kublashvili",
          "description": "Produces fast-paced, culturally attuned video content combining humor, lifestyle commentary, and emotionally honest vignettes from contemporary Georgian life. His work oscillates between satire, pop-culture dissection, and gender role inversion, often poking fun at societal expectations, masculinity, and youth struggles. His storytelling style resonates particularly with younger viewers navigating identity, relationships, and digital culture.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Gender and LGBTQ+ activists, Millennials"
        },
        {
          "name": "Manana Gvritishvili",
          "description": "Co-creator of the family-friendly content brand \"oritertnairi,\" Manana Gvritishvili produces imaginative, empowering, and educational videos aimed at children and tweens. Blending humor, emotional intelligence, social learning, and playful role-play formats, the platform nurtures creativity, curiosity, and confidence in young audiences. With viral reach on TikTok and a clear mission to promote self-belief and inclusive imagination, her work helps normalize open dialogue, kindness, and expression among Georgian youth.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Education Institutions and Stakeholders"
        },
        {
          "name": "Mancho Nozadze",
          "description": "A prominent voice in Georgian digital culture, Mancho blends humor, vulnerability, and advocacy through storytelling on motherhood, societal expectations, and emotional resilience. Her direct-to-camera monologues and casual commentary confront issues such as parental burnout, women’s autonomy, and mental health in an accessible, often humorous tone. She creates a space for dialogue on gendered experiences and normalizes emotional expression and self-awareness, especially among women and young parents.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Women, Millennials, Gender and LGBTQ+ activists"
        },
        {
          "name": "Giorgi Nachkebia (Mandrein)",
          "description": "Giorgi Nachkebia creates dynamic street interviews, reaction content, and social commentary that reflect the pulse of Georgian youth culture. Blending sports fandom, tech trends, humor, and quickfire public Q&As, his content offers a window into generational attitudes on pop culture, civic knowledge, and digital literacy. While his tone remains light and engaging, his platform has potential as a vehicle for soft civic education and public awareness.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists"
        },
        {
          "name": "Mariam Jighaurishvili",
          "description": "Mariam Jighaurishvili uses a direct-to-camera, emotionally resonant storytelling style to discuss themes such as injustice, social exclusion, and the everyday experiences of young women in Georgia. Her content often touches on issues of systemic inequality, gender norms, and public accountability, mixing social critique with relatable personal reflections. Her voice is part of a growing ecosystem of digitally native commentary that resonates across gender-aware, socially conscious Gen Z audiences.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Women, Civic and Human Rights Activists"
        },
        {
          "name": "Mariam Napetvaridze",
          "description": "Mariam blends aesthetics, vulnerability, and unapologetic self-expression in her digital storytelling. Through fashion, wellness, and lifestyle content, she engages with themes of autonomy, body image, self-worth, and emotional resilience. Her calm confidence, paired with occasional direct audience address, positions her as a relatable micro-influencer for young women navigating empowerment, appearance politics, and inner strength in modern Georgian society.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Women, Gen Z, Gender and LGBTQ+ activists"
        },
        {
          "name": "Megan Beridze",
          "description": "Megan Beridze documents her experiences as a Georgian migrant in Europe, combining lifestyle vlogging, reflective video diaries, and family-centered content. Through gentle, narrative-driven storytelling, she touches on adaptation, career-building abroad, and emotional health. Her candid tone and multilingual storytelling style help normalize the migrant journey while promoting empathy and resilience among dispersed youth and families.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Migrants and At Risk Groups, Women, Gen Z"
        },
        {
          "name": "Misho Rostomiani",
          "description": "Misho Rostomiani blends construction site humor, everyday social critique, and physical labor into comedic yet relatable content that highlights working-class realities in Georgia. His distinctive mix of satire, masculinity, and absurdism bridges cultural commentary with blue-collar storytelling. By spotlighting economic precarity, generational frustration, and gender norms—often through self-deprecating skits—Misho resonates with male youth and underrepresented regional audiences.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Men, Gen Z, Regional audiences"
        },
        {
          "name": "Nana Aroshidze",
          "description": "Ti Machavariani is a digital storyteller and cultural commentator who blends fashion, philosophy, and poetic introspection across platforms. Her content is deeply aesthetic, often rooted in personal narrative, feminist perspective, and soft-spoken critique of social norms. Through visual metaphors and monologues, she explores topics such as self-expression, emotional agency, and women's autonomy—offering a powerful voice for youth seeking identity, beauty, and critical thought beyond algorithmic trends.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Women, Gender and LGBTQ+ activists"
        },
        {
          "name": "Sali Shubitidze",
          "description": "Sali Shubitidze combines her roles as a musician, producer, and digital creator to deliver content that merges creativity with thoughtful commentary on youth experiences, societal expectations, and cultural identity. Through humor, self-produced music, and direct dialogue with her audience, she fosters emotional resilience, individuality, and self-expression. Her voice bridges the creative arts with conversations around mental health and gender norms in contemporary Georgia.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Women, Gender and LGBTQ+ activists"
        },
        {
          "name": "Salome Lemonjava",
          "description": "Salome Lemonjava balances roles as a mother, journalist, and digital creator. Her content blends personal storytelling with a nuanced public voice on social issues, emotional wellbeing, and informal civic dialogue. As a business journalist and vocal critic of authoritarian politics, she also integrates subtle civic education and public accountability themes into her daily lifestyle content, resonating with millennial women navigating family, identity, and social responsibility.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Women, Millennials, Civic and Human Rights Activists"
        },
        {
          "name": "Salome Totchkua",
          "description": "Salome Totchkua produces highly personal, emotionally vulnerable video content focused on wellbeing, mental health, and life balance. She shares candid reflections on emotional struggles, self-care, relationships, and personal development, often breaking cultural taboos around open emotional dialogue in Georgia. Her audience connects with her authenticity, making her a relatable voice on mental health and gendered experiences for young women navigating anxiety, burnout, and identity formation.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Women, Gender and LGBTQ+ activists"
        },
        {
          "name": "Sandro Gotsiridze",
          "description": "Sandro Gotsiridze is a satirical content creator who uses exaggerated characters, role-play, and situational comedy to reflect on Georgian social dynamics, gender norms, and generational conflicts. Through humor rooted in everyday dialogue and exaggerated stereotypes, his skits address topics like family relations, regional stereotypes, and societal expectations. His content resonates widely across age groups, offering a unique format for informal social critique.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Regional audiences, Men"
        },
        {
          "name": "Tako Lochoshvili (@influtako)",
          "description": "Tako Lochoshvili creates intimate, candid video content combining emotional vulnerability, everyday reflection, and self-presentation. Her monologues often explore personal well-being, confidence, relationships, and emotional self-regulation, positioning her as a relatable voice for young women navigating identity formation, mental health, and emotional agency in Georgian digital culture. She represents a growing cohort of Gen Z influencers blending wellness content with informal peer-led civic dialogue.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Women, Gender and LGBTQ+ activists"
        },
        {
          "name": "Tato Batsikadze",
          "description": "Tato Batsikadze is one of Georgia’s leading sports commentators, widely recognized for his energetic, engaging, and culturally resonant coverage of both national and international sporting events. Beyond live commentary, his growing digital presence allows him to connect with younger audiences around national identity, collective pride, and civic values through the lens of sports. His public persona contributes to informal civic education by fostering dialogue around teamwork, resilience, public discourse, and community cohesion.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists, Regional audiences"
        },
        {
          "name": "Tako Kacharava",
          "description": "Tato Karchava produces lifestyle, career, and identity-driven digital content blending vlogging, cultural commentary, and personal storytelling. Living and studying abroad, her content often touches on the experience of navigating identity as a Georgian in Europe, career aspirations, youth mobility, and emotional wellbeing. She uses light humor and personal reflection to engage a young audience on topics of self-growth, adaptation, and belonging.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Migrants and At Risk Groups, Women"
        },
        {
          "name": "Tinatin Abuladze",
          "description": "Tikosha is a high-energy lifestyle and beauty content creator who combines humor, sibling dynamics, daily vlogging, and makeup tutorials into highly engaging videos. With her strong personal brand, she normalizes conversations around beauty standards, confidence, emotional vulnerability, and interpersonal relationships, particularly targeting young women navigating identity, appearance, and self-worth in contemporary Georgian society.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Women, Gender and LGBTQ+ activists"
        },
        {
          "name": "Zura Balanchivadze",
          "description": "Zura Balanchivadze blends journalism, cultural history, and storytelling to make Georgian history, religion, art, and politics accessible to young digital audiences. Through concise TikTok explainers, visual storytelling, and educational monologues, he fosters civic knowledge, historical awareness, and critical engagement with Georgia’s national identity. His accessible historical commentary bridges gaps between formal civic education and popular youth-oriented platforms.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Civic and Human Rights Activists, Education Institutions and Stakeholders"
        },
        {
          "name": "Lizi Khudjadze (Elizabeth Leps)",
          "description": "Elizabeth Leps creates visually rich, highly curated travel and lifestyle content centered on global luxury destinations, fashion, and wellness. While primarily positioned in the aesthetic and aspirational travel space, her content intersects with broader discussions around women's independence, global mobility, and aspirational identity-building among young women in Georgia. Her platform exemplifies how soft narratives of personal freedom, mobility, and self-confidence intersect with lifestyle storytelling.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Women, Millennials"
        },
        {
          "name": "David And Dogs",
          "description": "David And Dogs combines emotional storytelling, dog care education, and light humor to engage large audiences across Georgia and beyond. His videos humanize pet ownership, responsible animal care, and emotional bonding, while offering an informal platform for promoting empathy, emotional wellbeing, and responsible community values. His influence extends into broader youth emotional culture, where narratives of care, responsibility, and kindness circulate in accessible formats.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists"
        },
        {
          "name": "Escanor on Earth",
          "description": "Escanor On Earth crafts a visually striking persona combining rural Georgian landscapes, masculinity, rural labor, and fine arts. His content balances traditional shepherding, hyper-masculine imagery, and aesthetic art creation, offering a highly unique blend of cultural pride, physicality, and creative self-expression. He challenges stereotypical narratives of masculinity while elevating rural identity, nature, and emotional vulnerability through artistic formats.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Regional audiences, Men"
        },
        {
          "name": "Giorgi Mgaloblishvili (GI2GI)",
          "description": "GI2GI is one of the leading figures in Georgia’s digital gaming and streaming scene, producing long-form YouTube content, live streams, competitive game analysis, and interactive challenges. His platform serves as a cultural hub for Gen Z audiences interested in gaming culture, digital skills, tech literacy, and participatory entertainment. While primarily focused on entertainment, his platform indirectly cultivates digital competencies, online community engagement, and youth socialization in virtual environments.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Men, Regional audiences"
        },
        {
          "name": "George Sarishvili",
          "description": "George Sarishvili is one of Georgia’s leading automotive content creators, producing detailed car reviews, test drives, and motorsport commentary for a growing Gen Z and millennial audience. His long-form YouTube content combines technical expertise with entertainment, fostering interest in technology, innovation, mechanics, and digital production skills. His content also indirectly cultivates a culture of tech curiosity, responsible driving, and public conversation around innovation and transportation.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Millennials, Business community, Tech, Innovation audiences"
        },
        {
          "name": "Giviko Didia",
          "description": "Giviko Didia documents a deeply personal, multi-generational rural Georgian family life, sharing intimate portrayals of everyday care, resilience, and emotional warmth. His content creates a highly relatable narrative around family bonds, elder care, rural traditions, and emotional wellbeing, offering a gentle but powerful counter-narrative to fast-paced, urbanized digital culture. Through intergenerational storytelling, he contributes to civic narratives about empathy, caregiving, dignity, and social inclusion.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian",
          "partner_audiences": "Gen Z, Millennials, Migrants and At Risk Groups, Civic and Human Rights Activists"
        },
        {
          "name": "Omar Chitishvili (Go Let's Play)",
          "description": "GoLetsPlay produces hybrid gaming, automotive, and unboxing content targeted at a growing Georgian gaming and tech-interested audience. His multi-format content combines humor, detailed gaming walkthroughs, consumer electronics, car reviews, and playful tech commentary. While rooted primarily in entertainment, his platform contributes to the development of digital literacy, gaming culture, and youth tech engagement — providing informal exposure to technical knowledge, online community dynamics, and digital participatory culture.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian",
          "partner_audiences": "Gen Z, Millennials, Regional audiences"
        },
        {
          "name": "Gzadagza",
          "description": "GZADAGZA operates as a new generation digital media platform blending podcasting, satire, commentary, and humor to critically discuss social, political, cultural, and civic topics in Georgia. It serves as a safe space for complex dialogue, bringing younger audiences into discussions around governance, societal tensions, generational differences, gender roles, and media culture. GZADAGZA combines civic awareness with humor, irony, and approachable language, making difficult or politically sensitive topics digestible to younger audiences.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian",
          "partner_audiences": "Gen Z, Millennials, Journalists and Media Practitioners, Civic and Human Rights Activists, Gender and LGBTQ+ activists"
        },
        {
          "name": "Jano Jino Gossip",
          "description": "Jano Jino operates in the intersection of influencer culture, entertainment commentary, gossip, and humor with strong resonance among digital-native Gen Z and Millennial audiences. His style blends celebrity culture, pop-culture gossip, meme humor, and observational commentary—often parodying social dynamics, gender roles, and pop cultural events both internationally and within Georgian online discourse. While not overtly political, his content contributes to media literacy, digital culture awareness, and pop-cultural critique for a young, hyper-online audience.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian",
          "partner_audiences": "Gen Z, Millennials, Women, Gender and LGBTQ+ activists, Civic and Human Rights Activists"
        },
        {
          "name": "Nika Kakoishvili (Kako)",
          "description": "Human Kako is a highly popular Georgian travel content creator whose videos focus on cross-cultural experiences, global travel, food challenges, and societal observations. His humorous and relatable style draws large audiences, particularly among Georgian youth and families who are curious about global lifestyles and cultures. He showcases international travel destinations, economic comparisons, unusual cultural practices, and light social commentary. While primarily an entertainment creator, Kako also fosters cross-cultural understanding, international awareness, and critical thinking about global disparities.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian",
          "partner_audiences": "Regional audiences, Gen Z, Millennials"
        },
        {
          "name": "Kristaaph",
          "description": "Creative digital storytelling with a focus on daily lifestyle, dance, fashion, and cultural insights from Kazakhstan; engaging content promoting body positivity, self-expression, and youthful empowerment through accessible narratives on TikTok and Instagram.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian",
          "partner_audiences": "Gen Z, Millennials, Women, Regional audiences, Civic and Human Rights Activists"
        },
        {
          "name": "Night Sardafi",
          "description": "Creative digital content focused on humor, satire, and adventurous storytelling rooted in Georgian youth culture; videos highlighting outdoor survival challenges, comedic social commentary, and engaging narratives designed to foster critical thinking, media literacy, and youth participation.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian",
          "partner_audiences": "Gen Z, Millennials, Men, Regional audiences, Civic and Human Rights Activists"
        },
        {
          "name": "Nikusha Kalichava (NikaTMG)",
          "description": "Popular gaming and entertainment content creator from Georgia, specializing in interactive gameplay, challenges, humorous reactions, and digital culture; fostering community engagement and digital literacy through gaming experiences, social experiments, and relatable humor.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian",
          "partner_audiences": "Gen Z, Millennials, Men, Regional audiences"
        },
        {
          "name": "NikoLoz Kuparashvili",
          "description": "Popular Georgian gaming and sports content creator specializing in football simulations, game analysis, and interactive gameplay (FIFA, eFootball, racing games); promoting gaming culture, sports fandom, and digital community-building through engaging, commentary-rich videos and live streams.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian",
          "partner_audiences": "Gen Z, Millennials, Men, Regional audiences"
        },
        {
          "name": "Qimera",
          "description": "Georgian YouTube creator known for immersive and humorous gaming content, horror gameplay reactions, interactive challenges, and digital storytelling; engaging youth audiences through creative commentary, community interaction, and entertainment-focused narratives that enhance digital literacy and critical thinking.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian",
          "partner_audiences": "Gen Z, Millennials, Men, Regional audiences"
        },
        {
          "name": "Ruska Karkashadze",
          "description": "Georgian actress, TV host, and influencer creating engaging lifestyle, travel, and entertainment content; sharing personal experiences, fashion insights, and behind-the-scenes moments to empower young women and promote cultural awareness and inclusivity.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Millennials, Gen Z, Women, Regional audiences"
        },
        {
          "name": "Achi Jaiani",
          "description": "Georgian digital creator known for humorous and satirical short-form videos, trending challenges, and youth-focused entertainment content; employing comedy and cultural references to engage younger audiences, fostering digital literacy and youth participation.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Gen Z, Millennials, Regional audiences, Civic and Human Rights Activists"
        },
        {
          "name": "Ioseb Laliashvili",
          "description": "Georgian digital creator sharing engaging and creative culinary content, exploring popular foods, innovative cooking techniques, and relatable food experiences; promoting accessible culinary culture and digital storytelling through visually appealing, short-form videos.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Millennials, Gen Z, Regional audiences"
        },
        {
          "name": "Shmagi Samkharadze",
          "description": "Shmagi Samkharadze stands out with anti-Russian content and promotes Georgian values. Moreover, he strongly opposes the pro-Russian outlet \"Alt-info\" and tries to debunk Kremlin-related myths in an entertaining form which makes him a potentially good candidate for the project",
          "partner_entity_types": "Influencer",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Policy and Governance Stakeholders, Millennials, Gen Z, Regional audiences"
        },
        {
          "name": "Publica",
          "description": "A Georgian socio-political online publication committed to impartial, fact-based, and ethically rigorous journalism; offering in-depth reporting, analyses, and multimedia content aimed at enhancing civic education, media literacy, and democratic participation. Coverage includes socio-political affairs, culture, literature, science, and educational content.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Education Institutions and Stakeholders, Regional audiences, Millennials, Gen X"
        },
        {
          "name": "Batumelebi",
          "description": "Batumelebi is a regional media outlet based in the Adjara region of Georgia, providing independent, reliable, and locally focused news coverage. It offers in-depth reporting on social, political, economic, and cultural issues relevant to Adjara, supporting community awareness, regional development, and informed public discourse.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Regional audiences, Civic and Human Rights Activists, Journalists and Media Practitioners, Policy and Governance Stakeholders, Education Institutions and Stakeholders, Millennials, Gen X"
        },
        {
          "name": "Project 64",
          "description": "Project 64 is a Georgian multimedia platform focused on delivering well-researched storytelling that goes beyond mere facts to explain complex socio-political issues in an accessible, clear, and engaging way. The platform emphasizes clarity and understanding to help audiences grasp important narratives affecting society.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Millennials, Gen Z, Civic and Human Rights Activists, Education Institutions and Stakeholders, Journalists and Media Practitioners, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Democracy Defenders",
          "description": "Democratic Development (DEMDEF) is a Georgian non-governmental organization dedicated to strengthening democracy, promoting civic engagement, and supporting human rights through advocacy, research, and public education.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Policy and Governance Stakeholders, Education Institutions and Stakeholders, Regional audiences"
        },
        {
          "name": "The Center for Media, Information and Social Research (CMIS)",
          "description": "The Center for Media, Information, and Social Studies (CMIS) is a Georgian organization committed to promoting free media and a free society. CMIS works to protect journalists' rights and media organizations, monitors and evaluates the media landscape, conducts research, and provides training and advocacy to ensure media freedom and information integrity.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders"
        },
        {
          "name": "Center for Development and Democracy",
          "description": "CDD is a Georgian organization dedicated to advancing EU and Euro-Atlantic integration by fostering dialogue among stakeholders, raising community awareness, advocating for positive change, and empowering youth. It combats disinformation and promotes truth, democracy, rule of law, election observation, gender equality, and civic participation to build an open, inclusive, and consolidated society.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Civic and Human Rights Activists, Policy and Governance Stakeholders, Education Institutions and Stakeholders"
        },
        {
          "name": "Journalism Resource Center",
          "description": "Since 2011, the Journalism Resource Center (JRC) has been actively supporting the development of local democracies in Georgia through three main pillars: education, production, and development. JRC develops journalism education programs, partners with authoritative international organizations including DW, BBG, and Open Media Hub, and focuses on strengthening regional media by supporting regional journalism schools. JRC is an active participant in the Eastern Partnership Civil Society Forum, promoting quality journalism and media professionalism.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Journalists and Media Practitioners, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Netgazeti",
          "description": "Netgazeti.ge is a bilingual (Georgian and Russian) online news portal based in Tbilisi, providing timely and independent coverage of political developments, conflicts, and social issues in Georgia. It operates in a challenging media environment, delivering in-depth reporting to promote transparency, accountability, and informed public discourse.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "On.ge",
          "description": "on.ge is a Georgian online news media platform delivering up-to-date news and information on politics, society, economy, and culture. The platform aims to provide accessible, reliable journalism to inform the public and foster civic engagement across Georgia.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Formula",
          "description": "Objective, unbiased and fast information; Analytical socio-political talk-shows; All time best Georgian TV shows and entertainment programmes. Broadcasting company TV Formula was founded in 2019 with an ambition to be the first in Georgian TV-space.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Georgian Foundation for Strategic and International Studies (Rondeli Foundation)",
          "description": "Established in 1998, the Georgian Foundation for Strategic and International Studies (Rondeli Foundation) is an independent, non-profit policy think tank focused on enhancing public policy decision-making in Georgia through rigorous research, policy analysis, and education. It offers training for policymakers and analysts, facilitates public outreach, and fosters dialogue between government, academia, and civil society on key domestic and international strategic issues affecting Georgia and the Caucasus.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Education Institutions and Stakeholders, Journalists and Media Practitioners"
        },
        {
          "name": "444",
          "description": "444.hu is a Hungarian online news portal providing independent, timely, and in-depth coverage of politics, society, culture, and current events. Known for its investigative journalism and critical reporting, it serves as a key platform for fostering transparency and public discourse in Hungary.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Hungary",
          "partner_languages": "English, Hungarian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Partizán",
          "description": "Partizan.hu is a Hungarian media platform offering independent news, cultural commentary, and in-depth analysis of social and political issues. It focuses on providing alternative perspectives to mainstream media, supporting critical thinking and public engagement in Hungary.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Hungary",
          "partner_languages": "English, Hungarian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Outriders Klub",
          "description": "Outriders Klub is a Polish media platform dedicated to in-depth, investigative journalism and long-form storytelling on social, political, and environmental issues. It aims to foster critical public discourse, highlight underreported topics, and promote media literacy and civic engagement across Poland and the region.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Poland",
          "partner_languages": "English, Polish",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Direkt36",
          "description": "Direkt36 is a Hungarian investigative journalism platform dedicated to exposing abuse of power, corruption, negligence, and misuse of public resources. Committed to the highest professional standards, Direkt36 uses in-depth reporting to hold authorities accountable, raise public awareness, and strengthen democratic governance despite challenging external conditions.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Hungary",
          "partner_languages": "English, Hungarian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "OKO.press",
          "description": "OKO.press is a Polish investigative journalism portal focused on fact-checking, monitoring government and societal realities, and telling compelling human stories. It serves as a civic watchdog, holding those in power accountable through rigorous investigations and transparency advocacy.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Hungary",
          "partner_languages": "English, Polish",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "N1 Slovenija",
          "description": "N1 Info Slovenia is a regional news outlet providing independent, timely, and comprehensive coverage of political, social, and economic issues in Slovenia and the broader Balkan region. Known for its commitment to journalistic integrity, N1 Info offers investigative reporting, in-depth analysis, and live news broadcasts to inform and engage the public.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Slovenia",
          "partner_languages": "English, Slovenian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "PressOne",
          "description": "PressOne is a Romanian independent news platform dedicated to investigative journalism, in-depth reporting, and analysis of political, social, and cultural issues. It aims to promote transparency, accountability, and informed public debate through fact-based journalism and engaging storytelling.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Romania",
          "partner_languages": "English, Romanian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "HotNews",
          "description": "HotNews.ro is one of Romania’s leading online news platforms, delivering breaking news, in-depth analyses, and comprehensive coverage across politics, economy, society, and culture. Known for timely updates and broad reach, HotNews.ro aims to keep the public informed and engaged in critical national and international issues.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Romania",
          "partner_languages": "English, Romanian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Vecer",
          "description": "Večer is a leading Slovenian daily newspaper and online news platform providing comprehensive coverage of national and regional politics, social issues, economy, and culture. Known for its credible journalism and in-depth reporting, Večer plays a key role in informing and engaging the Slovenian public.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Slovenia",
          "partner_languages": "English, Slovenian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Association of European Journalists – Bulgaria (AEJ Bulgaria)",
          "description": "AEJ Bulgaria is a professional association dedicated to promoting high standards of journalism and protecting press freedom in Bulgaria. It supports journalists through training, advocacy, and networking, fostering independent reporting and ethical media practices in challenging political and social environments.",
          "partner_entity_types": "CSO",
          "partner_countries": "Bulgaria",
          "partner_languages": "English, Bulgarian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Education Institutions and Stakeholders, Regional audiences"
        },
        {
          "name": "G4Media",
          "description": "G4Media.ro is an independent Romanian news outlet focused on delivering investigative journalism, breaking news, and in-depth political and social analysis. It aims to promote transparency, accountability, and informed public debate by providing fact-based reporting and critical perspectives on national and international issues.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Romania",
          "partner_languages": "English, Romanian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Gospodari",
          "description": "Gospodari is a Romanian digital media platform known for its satirical and humorous take on current events, politics, and social issues. Through entertaining videos, memes, and commentary, it engages a younger audience while promoting critical thinking and media literacy in an accessible and engaging way.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Bulgaria",
          "partner_languages": "English, Bulgarian",
          "partner_audiences": "Gen Z, Millennials, Regional audiences, Civic and Human Rights Activists, Journalists and Media Practitioners"
        },
        {
          "name": "Toest",
          "description": "Toest s a Bulgarian independent online news platform focused on delivering timely news, investigative reporting, and in-depth analysis of political, social, and economic issues. It strives to promote transparency, accountability, and civic engagement through quality journalism that serves the public interest.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Bulgaria",
          "partner_languages": "English, Bulgarian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences, Millennials, Gen X"
        },
        {
          "name": "Govori Internet",
          "description": "Govori Internet is a Bulgarian digital platform dedicated to media literacy, fact-checking, and raising public awareness about disinformation and digital safety. The platform provides educational content, analysis, and tools to help citizens critically evaluate online information and strengthen resilience against misinformation.",
          "partner_entity_types": "Media outlet",
          "partner_countries": "Bulgaria",
          "partner_languages": "English, Bulgarian",
          "partner_audiences": "Education Institutions and Stakeholders, Civic and Human Rights Activists, Millennials, Gen Z, Journalists and Media Practitioners, Regional audiences"
        },
        {
          "name": "Funky Citizens",
          "description": "Romanian civil society organization using data, storytelling, and civic tech to promote transparency, anti-corruption, and citizen engagement; blends watchdog journalism, policy advocacy, and educational tools to empower informed participation, especially among youth.",
          "partner_entity_types": "CSO",
          "partner_countries": "Romania",
          "partner_languages": "Romanian, English",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists, Policy and Governance Stakeholders, Education Institutions and Stakeholders"
        },
        {
          "name": "Global Focus",
          "description": "Romanian think tank focused on foreign policy, democratic resilience, and security; conducts research and strategic analysis on hybrid threats, disinformation, and regional geopolitics; fosters dialogue between civil society, policymakers, and media on democratic values and global challenges.",
          "partner_entity_types": "CSO",
          "partner_countries": "Romania",
          "partner_languages": "Romanian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Civic and Human Rights Activists, Civil Society, Gen X"
        },
        {
          "name": "Faktyoxla",
          "description": "Azerbaijani fact-checking and verification platform working to counter disinformation and misinformation in the media and public discourse; publishes accessible analyses, trains journalists, and promotes critical thinking through public education and media monitoring.",
          "partner_entity_types": "CSO",
          "partner_countries": "Azerbaijan",
          "partner_languages": "Azerbaijani, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Education Institutions and Stakeholders, Gen Z, Civil Society"
        },
        {
          "name": "Restart Civic Youth Foundation",
          "description": "Youth-led organization in Armenia dedicated to promoting democratic values, civic engagement, and good governance through education, advocacy, and participatory projects; empowers young people to hold institutions accountable and become active citizens.",
          "partner_entity_types": "CSO",
          "partner_countries": "Armenia",
          "partner_languages": "Armenian, English",
          "partner_audiences": "University students, Youth activists, Educators, Policymakers"
        },
        {
          "name": "Media Initiatives Center (MIC)",
          "description": "Armenian media development organization advancing quality journalism, media literacy, and freedom of expression; offers training, content production support, and community initiatives to counter disinformation and strengthen public trust in media.",
          "partner_entity_types": "CSO",
          "partner_countries": "Armenia",
          "partner_languages": "Armenian, English",
          "partner_audiences": "Journalists and Media Practitioners, Education Institutions and Stakeholders, Civic and Human Rights Activists, Gen Z, Civil Society"
        },
        {
          "name": "Union of Informed Citizens (UIC)",
          "description": "Armenian CSO promoting transparency, democratic accountability, and informed civic participation through investigative journalism, media literacy, and policy advocacy; known for fact-checking, election monitoring, and access to information campaigns.",
          "partner_entity_types": "CSO",
          "partner_countries": "Armenia",
          "partner_languages": "Armenian, English, Russian",
          "partner_audiences": "Civic and Human Rights Activists, Journalists and Media Practitioners, Policy and Governance Stakeholders, Gen Z, Civil Society"
        },
        {
          "name": "Coda Story",
          "description": "Independent newsroom covering the roots of global crises through deep, narrative journalism; investigates disinformation, authoritarian tech, and the weaponization of culture, delivering cross-border reporting that connects local events to global systems.",
          "partner_entity_types": "Media",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Gen Z, Civil Society"
        },
        {
          "name": "Georgia’s Reforms Associates (GRASS)",
          "description": "Georgian think tank and watchdog organization focused on democratic reform, disinformation resilience, and Euro-Atlantic integration; conducts fact-checking, policy analysis, and civic education to promote transparency, informed debate, and public accountability.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners, Education Institutions and Stakeholders"
        },
        {
          "name": "iFact",
          "description": "Georgian investigative journalism outlet producing in-depth reporting on corruption, organized crime, human rights, and public accountability; part of regional and international networks advancing transparency, fact-checking, and cross-border investigations.",
          "partner_entity_types": "Media",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Civil Society"
        },
        {
          "name": "International Society for Fair Elections and Democracy (ISFED)",
          "description": "Georgian civil society organization promoting electoral integrity, democratic governance, and citizen participation; conducts election observation, disinformation monitoring, civic education, and legal advocacy to uphold transparency and public trust in democratic processes.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Education Institutions and Stakeholders, Gen Z, Civil Society"
        },
        {
          "name": "Media Development Foundation (MDF)",
          "description": "Georgian NGO focused on strengthening media integrity, countering disinformation, and promoting media literacy and democratic values; conducts monitoring of hate speech, foreign influence, and electoral coverage, along with civic education and fact-checking initiatives.",
          "partner_entity_types": "CSO",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Education Institutions and Stakeholders, Policy and Governance Stakeholders, Gen Z"
        },
        {
          "name": "SOVA.News",
          "description": "Russian-language independent media outlet based in Georgia, covering current affairs, politics, and society in the South Caucasus and beyond; known for accessible reporting, youth-oriented storytelling, and counter-narratives to propaganda and authoritarian discourse.",
          "partner_entity_types": "Media",
          "partner_countries": "Georgia",
          "partner_languages": "Georgian, English, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Gen Z, Civic and Human Rights Activists, Migrants and At Risk Groups, Civil Society"
        },
        {
          "name": "Association of Independent Press (API)",
          "description": "Moldovan media development organization supporting independent local and regional outlets through training, policy advocacy, and investigative reporting; leads initiatives on press freedom, disinformation monitoring, and transparent election coverage.",
          "partner_entity_types": "Media",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, English",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civic and Human Rights Activists, Education Institutions and Stakeholders, Civil Society"
        },
        {
          "name": "Newsmaker",
          "description": "Independent news outlet in Moldova publishing in Russian and Romanian, known for in-depth reporting, analysis, and fact-checking on politics, social issues, and regional affairs; plays a key role in countering disinformation and informing multilingual audiences.",
          "partner_entity_types": "Media",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, English , Russian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Migrants and At Risk Groups, Gen Z, Civil Society"
        },
        {
          "name": "Rise Moldova",
          "description": "Investigative journalism platform uncovering corruption, organized crime, illicit finances, and abuses of power in Moldova and the region; produces cross-border investigations, data-driven storytelling, and public interest reports in collaboration with international media networks.",
          "partner_entity_types": "Media",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, English , Russian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Civil Society"
        },
        {
          "name": "WatchDog.md",
          "description": "Moldovan think tank and watchdog organization focused on democratic governance, rule of law, and disinformation resilience; conducts policy analysis, public education campaigns, media monitoring, and election-related transparency initiatives.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners"
        },
        {
          "name": "Ziarul de Gardă",
          "description": "One of Moldova’s leading investigative journalism outlets, exposing corruption, human rights abuses, and public sector mismanagement; provides in-depth reporting, election coverage, and watchdog journalism to hold power to account and inform the public.",
          "partner_entity_types": "Media",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Civil Society, Gen Z"
        },
        {
          "name": "Delfi.ee",
          "description": "One of Estonia’s largest digital media platforms, offering comprehensive news coverage, investigative journalism, and multimedia reporting on domestic and international affairs; known for its role in countering disinformation and informing Estonian-speaking audiences.",
          "partner_entity_types": "Media",
          "partner_countries": "Estonia",
          "partner_languages": "Estonian, Russian, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Gen Z, Civil Society, Policy and Governance Stakeholders"
        },
        {
          "name": "The International Centre for Defence and Security (ICDS)",
          "description": "Estonia-based think tank specializing in security policy, defense strategy, and democratic resilience; conducts research and analysis on hybrid threats, NATO and EU affairs, disinformation, and regional security, bridging expert insight with policy impact.",
          "partner_entity_types": "CSO",
          "partner_countries": "Estonia",
          "partner_languages": "Estonian, Russian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners, Civil Society, Gen X"
        },
        {
          "name": "VitaTiim",
          "description": "Estonian youth organization empowering young people through non-formal education, intercultural exchange, and personal development programs; promotes civic participation, inclusion, and digital literacy in both local and cross-border youth communities.",
          "partner_entity_types": "CSO",
          "partner_countries": "Estonia",
          "partner_languages": "English, Estonian, Russian",
          "partner_audiences": "Gen Z, Education Institutions and Stakeholders, Civic and Human Rights Activists, Migrants and At Risk Groups, Millennials"
        },
        {
          "name": "The Centre for East European Policy Studies (CEEPS)",
          "description": "Latvia-based think tank focusing on regional security, foreign influence, and democratic resilience in Eastern Europe; conducts research, policy analysis, and strategic communication on Russian disinformation, hybrid threats, and the rule of law.",
          "partner_entity_types": "CSO",
          "partner_countries": "Latvia",
          "partner_languages": "English, Latvian",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners, Gen X, Civil Society"
        },
        {
          "name": "Providus",
          "description": "Latvia-based public policy think tank promoting evidence-based decision-making, democratic participation, and good governance; focuses on anti-corruption, citizen engagement, migration policy, and transparent electoral processes through research and advocacy.",
          "partner_entity_types": "CSO",
          "partner_countries": "Latvia",
          "partner_languages": "English, Latvian",
          "partner_audiences": "Policy and Governance Stakeholders, Civil Society, Civic and Human Rights Activists, Migrants and At Risk Groups, Education Institutions and Stakeholders"
        },
        {
          "name": "Krievu Balss Latvijai",
          "description": "Civic initiative promoting democratic engagement and media literacy among Latvia’s Russian-speaking population; focuses on countering disinformation, fostering dialogue, and supporting inclusion through accessible content and public outreach.",
          "partner_entity_types": "CSO",
          "partner_countries": "Latvia",
          "partner_languages": "English, Latvian, Russian",
          "partner_audiences": "Civic and Human Rights Activists, Migrants and At Risk Groups, Gen Z, Civil Society, Education Institutions and Stakeholders"
        },
        {
          "name": "Delfi Latvia",
          "description": "One of Latvia’s leading digital news platforms, offering independent reporting, investigative journalism, and multilingual content on politics, society, and international affairs; plays a key role in countering disinformation and ensuring transparent electoral coverage.",
          "partner_entity_types": "Media",
          "partner_countries": "Latvia",
          "partner_languages": "English, Latvian, Russian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Gen Z, Civil Society"
        },
        {
          "name": "Civic Resilience Initiative",
          "description": "Lithuania-based CSO focused on enhancing societal resilience to disinformation, propaganda, and hybrid threats; conducts research, public awareness campaigns, media literacy training, and policy advocacy to strengthen democratic security and civic participation.",
          "partner_entity_types": "CSO",
          "partner_countries": "Lithuania",
          "partner_languages": "Lithuanian, English",
          "partner_audiences": "Civic and Human Rights Activists, Policy and Governance Stakeholders, Education Institutions and Stakeholders, Gen Z, Civil Society"
        },
        {
          "name": "Debunk.org",
          "description": "Regional initiative operating in the Baltics and beyond to detect, analyze, and counter disinformation and information manipulation; combines OSINT, media monitoring, and public education to build societal resilience and protect democratic discourse.",
          "partner_entity_types": "CSO",
          "partner_countries": "Lithuania",
          "partner_languages": "English, Lithuanian, Latvian, Russian, Ukrainian",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Civic and Human Rights Activists, Gen Z, Civil Society"
        },
        {
          "name": "Delfi Lithuania",
          "description": "One of Lithuania’s most prominent independent news platforms, providing comprehensive reporting, investigative journalism, and multilingual content on national and international issues; actively counters disinformation and promotes transparent, ethical journalism.",
          "partner_entity_types": "Media",
          "partner_countries": "Lithuania",
          "partner_languages": "English, Lithuanian",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Civic and Human Rights Activists, Gen Z, Civil Society"
        },
        {
          "name": "European Values Center for Security Policy",
          "description": "Czech-based think tank advancing democratic security by countering authoritarian influence, disinformation, and hybrid threats; conducts strategic analysis, public education, and advocacy on rule of law, national security, and information integrity across Europe.",
          "partner_entity_types": "CSO",
          "partner_countries": "Czech Republic",
          "partner_languages": "English, Czech",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners, Civil Society, Gen X"
        },
        {
          "name": "Prague Security Studies Institute (PSSI)",
          "description": "Czech think tank focused on strengthening democratic institutions and countering hybrid threats through research, education, and strategic analysis; specializes in economic and space security, disinformation, and malign foreign influence in the transatlantic context.",
          "partner_entity_types": "CSO",
          "partner_countries": "Czech Republic",
          "partner_languages": "English, Czech",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners, Education Institutions and Stakeholders, Civil Society"
        },
        {
          "name": "Átlátszó",
          "description": "Hungarian investigative journalism outlet exposing corruption, abuses of power, and threats to press freedom; known for in-depth reporting, FOI-based investigations, and transparency tools that empower citizens to hold institutions accountable.",
          "partner_entity_types": "Media",
          "partner_countries": "Hungary",
          "partner_languages": "Hungarian, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Civil Society, Gen Z"
        },
        {
          "name": "Political Capital",
          "description": "Hungarian think tank conducting research and advocacy on democratic governance, political extremism, and foreign authoritarian influence; produces in-depth analysis on disinformation, populism, and rule of law challenges in Hungary and Central Europe.",
          "partner_entity_types": "CSO",
          "partner_countries": "Hungary",
          "partner_languages": "Hungarian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Civic and Human Rights Activists, Civil Society, Gen X"
        },
        {
          "name": "Casimir Pulaski Foundation",
          "description": "Poland-based foreign policy and security think tank focused on transatlantic cooperation, defense strategy, and democratic resilience; conducts research, high-level policy dialogue, and public engagement on hybrid threats, disinformation, and regional security.",
          "partner_entity_types": "CSO",
          "partner_countries": "Poland",
          "partner_languages": "Polish, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners, Gen X, Civil Society"
        },
        {
          "name": "Fakenews.pl",
          "description": "Polish fact-checking platform dedicated to identifying and debunking false information in media and public discourse; provides accessible verification, educational resources, and awareness campaigns to strengthen media literacy and online resilience.",
          "partner_entity_types": "CSO",
          "partner_countries": "Poland",
          "partner_languages": "Polish, English",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Education Institutions and Stakeholders, Gen Z, Civil Society"
        },
        {
          "name": "The Kościuszko Institute",
          "description": "Polish research institute focused on strategic security, cybersecurity, and transatlantic cooperation; conducts policy analysis and public engagement on disinformation, digital sovereignty, and the protection of democratic institutions against hybrid threats.",
          "partner_entity_types": "CSO",
          "partner_countries": "Poland",
          "partner_languages": "Polish, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners, Education Institutions and Stakeholders, Civil Society"
        },
        {
          "name": "Reporters’ Foundation (Fundacja Reporterów)",
          "description": "Polish investigative journalism organization producing cross-border investigations on corruption, organized crime, and human rights violations; supports collaborative reporting, journalist training, and public interest journalism across Central and Eastern Europe.",
          "partner_entity_types": "Media",
          "partner_countries": "Poland",
          "partner_languages": "Polish, English, Ukrainian",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Gen Z, Civil Society"
        },
        {
          "name": "Adapt Institute",
          "description": "Slovakia-based think tank focused on strategic defense, hybrid threats, and democratic resilience; conducts research and policy engagement on disinformation, civil preparedness, and national security in the context of emerging geopolitical challenges.",
          "partner_entity_types": "CSO",
          "partner_countries": "Slovakia",
          "partner_languages": "English, Slovak",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners, Education Institutions and Stakeholders, Civil Society"
        },
        {
          "name": "GLOBSEC",
          "description": "Slovakia-based global think tank committed to enhancing security, prosperity, and sustainability in Europe and beyond; drives strategic dialogue on defense, democratic resilience, disinformation, and emerging technologies through high-level research, convenings, and advocacy.",
          "partner_entity_types": "CSO",
          "partner_countries": "Slovakia",
          "partner_languages": "English, Slovak",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners, Civil Society, Education Institutions and Stakeholders"
        },
        {
          "name": "Institute for Public Affairs (IVO)",
          "description": "Slovak think tank focused on the promotion of democratic values, civil society development, and rule of law; conducts public policy research, monitors media and human rights, and advocates for transparency, civic engagement, and informed public discourse.",
          "partner_entity_types": "CSO",
          "partner_countries": "Slovakia",
          "partner_languages": "English, Slovak",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Education Institutions and Stakeholders"
        },
        {
          "name": "The Investigative Center of Ján Kuciak (ICJK)",
          "description": "Slovak investigative journalism center continuing the legacy of Ján Kuciak through cross-border reporting on corruption, organized crime, and abuses of power; promotes transparency, electoral integrity, and press freedom through fearless, evidence-based journalism.",
          "partner_entity_types": "CSO",
          "partner_countries": "Slovakia",
          "partner_languages": "English, Slovak",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Policy and Governance Stakeholders, Gen Z, Civil Society"
        },
        {
          "name": "MEMO98",
          "description": "Slovakia-based non-profit specializing in media monitoring, election observation, and strategic communication; works globally to analyze media environments, promote fair electoral coverage, and counter disinformation through evidence-based advocacy and training.",
          "partner_entity_types": "CSO",
          "partner_countries": "Slovakia",
          "partner_languages": "English, Slovak",
          "partner_audiences": "Policy and Governance Stakeholders, Journalists and Media Practitioners, Civic and Human Rights Activists, Education Institutions and Stakeholders, Civil Society"
        },
        {
          "name": "Institute for European Policies and Reforms (IPRE)",
          "description": "Policy research and advocacy on European integration and democratic governance in Moldova; monitoring of hybrid threats and disinformation; public engagement on rule of law and reform processes.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Millennials, Civic and Human Rights Activists, Civil Society, Policy and Governance Stakeholders"
        },
        {
          "name": "IDIS “Viitorul”",
          "description": "Research and analysis on economic development, good governance, and public policy in Moldova; initiatives countering disinformation and promoting media literacy; civic dialogue on transparency and democratic reform.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Education Institutions and Stakeholders, Civic and Human Rights Activists, Civil Society, Policy and Governance Stakeholders"
        },
        {
          "name": "Expert-Grup",
          "description": "Independent economic and policy analysis on Moldova’s development; evidence-based reporting on governance, fiscal transparency, and social equity; public outreach on countering misinformation and promoting informed civic participation.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Millennials, Civil Society, Policy and Governance Stakeholders"
        },
        {
          "name": "Gender-Centru (Gender-Center)",
          "description": "Programs and advocacy on gender equality, women’s empowerment, and non-discrimination in Moldova; training and support services for survivors of gender-based violence; civic initiatives promoting feminist leadership and inclusive policy reforms.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Women, Gender and LGBTQ+ activists, Civic and Human Rights Activists"
        },
        {
          "name": "GDM – Genderdoc-M",
          "description": "Advocacy, support services, and public education on LGBTQI+ rights in Moldova; legal assistance, community building, and anti-discrimination campaigns; visibility initiatives to challenge stigma and promote inclusive social change.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Gender and LGBTQ+ activists, Migrants and At Risk Groups, Civic and Human Rights Activists"
        },
        {
          "name": "Nokta.md",
          "description": "Independent journalism outlet reporting on political, social, and minority issues in Gagauzia and Moldova; investigations into governance, corruption, and disinformation; bilingual content aimed at strengthening informed civic engagement in underserved communities.",
          "partner_entity_types": "Media",
          "partner_countries": "Moldova",
          "partner_languages": "Russian, Gagauz",
          "partner_audiences": "Journalists and Media Practitioners, Civic and Human Rights Activists, Migrants and At Risk Groups"
        },
        {
          "name": "CCF Moldova",
          "description": "Programs focused on child protection, family reintegration, and inclusive education in Moldova; advocacy against institutionalization and for children’s rights; support services for vulnerable families and awareness campaigns on social inclusion.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Education Institutions and Stakeholders, Migrants and At Risk Groups, Civic and Human Rights Activists"
        },
        {
          "name": "Diaconia",
          "description": "Faith-based social service organization supporting vulnerable communities in Moldova; initiatives on food security, housing, youth empowerment, and family support; advocacy for social justice and community resilience through local partnerships.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Migrants and At Risk Groups, Civic and Human Rights Activists, Education Institutions and Stakeholders"
        },
        {
          "name": "Center for Legal Resources of Moldova (CRJM)",
          "description": "Strategic litigation, policy advocacy, and monitoring of the justice sector in Moldova; initiatives promoting the rule of law, judicial independence, and human rights; research and civic engagement on governance, anti-corruption, and legal reform.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civic and Human Rights Activists, Journalists and Media Practitioners"
        },
        {
          "name": "Soros Foundation Moldova",
          "description": "Grantmaking and policy support for democratic governance, human rights, and open society values in Moldova; initiatives advancing media independence, justice reform, civic education, and inclusion of marginalized communities.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civil Society, Journalists and Media Practitioners"
        },
        {
          "name": "Terre des hommes Moldova (Tdh Moldova)",
          "description": "Child protection and psychosocial support programs for vulnerable children and youth in Moldova; initiatives on justice for children, gender-based violence prevention, and safe migration; training and advocacy to strengthen child- and youth-friendly systems.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Migrants and At Risk Groups, Education Institutions and Stakeholders, Gender and LGBTQ+ activists"
        },
        {
          "name": "Child Rights Information Center (CRIC Moldova)",
          "description": "Advocacy and education to promote children’s rights and meaningful participation in Moldova; development of child-friendly resources, civic education curricula, and teacher training; monitoring of policy implementation and promotion of inclusive education.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Education Institutions and Stakeholders, Civil Society, Gen Z"
        },
        {
          "name": "CONTACT Center Moldova",
          "description": "Capacity-building and support services for civil society organizations across Moldova; programs focused on community development, good governance, and civic participation; training and resources to strengthen local NGOs and grassroots initiatives.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Civil Society, Policy and Governance Stakeholders, Education Institutions and Stakeholders"
        },
        {
          "name": "Partnerships for Every Child (P4EC Moldova)",
          "description": "Programs supporting child and family welfare through deinstitutionalization, inclusive education, and social services reform in Moldova; advocacy for children’s rights and participation; community-based initiatives to protect and empower vulnerable families.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Education Institutions and Stakeholders, Migrants and At Risk Groups, Civic and Human Rights Activists"
        },
        {
          "name": "The Moldova Project",
          "description": "Holistic support for vulnerable families and children in Moldova through education access, housing, healthcare, and social inclusion programs; community outreach focused on breaking the cycle of poverty and empowering families for long-term resilience.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, English",
          "partner_audiences": "Migrants and At Risk Groups, Education Institutions and Stakeholders, Women"
        },
        {
          "name": "People in Need Moldova (PIN Moldova)",
          "description": "Comprehensive humanitarian and development programs addressing social inclusion, education, livelihoods, and crisis response in Moldova; initiatives promoting civic engagement, media literacy, and support for refugees and vulnerable groups.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Migrants and At Risk Groups, Civil Society, Education Institutions and Stakeholders"
        },
        {
          "name": "East Europe Foundation Moldova (EEF Moldova)",
          "description": "Programs advancing democratic governance, economic opportunity, and civic engagement in Moldova; initiatives supporting local NGOs, social entrepreneurship, digital innovation, and community resilience through participatory decision-making.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Civil Society, Policy and Governance Stakeholders, Millennials"
        },
        {
          "name": "Solidarity Fund PL in Moldova",
          "description": "Support for local development and community resilience in Moldova through participatory planning, rural revitalization, and citizen engagement; partnerships with public authorities and civil society to strengthen local governance and inclusive growth.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Policy and Governance Stakeholders, Civil Society, Education Institutions and Stakeholders"
        },
        {
          "name": "Promo-LEX Association",
          "description": "Monitoring, advocacy, and legal assistance to promote democracy, human rights, and the rule of law in Moldova; civic education campaigns, election observation missions, and strategic litigation to strengthen justice and democratic institutions.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Civic and Human Rights Activists, Policy and Governance Stakeholders, Journalists and Media Practitioners"
        },
        {
          "name": "Center for Independent Journalism (CJI Moldova)",
          "description": "Media development and press freedom advocacy in Moldova; training programs for journalists, media literacy campaigns, and legal support for independent media; initiatives addressing disinformation, ethics, and transparency in journalism.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Journalists and Media Practitioners, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Association of Electronic Press of Moldova (APEL)",
          "description": "Promotion of pluralism and quality standards in Moldovan broadcasting; media policy advocacy, content monitoring, and support for independent audiovisual outlets; initiatives enhancing transparency, ethical journalism, and public interest media.",
          "partner_entity_types": "CSO",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Journalists and Media Practitioners, Policy and Governance Stakeholders, Education Institutions and Stakeholders"
        },
        {
          "name": "Chiril-Adam Macari",
          "description": "Content creator and civic voice spotlighting political accountability, social justice, and youth engagement in Moldova; uses satire, commentary, and investigative storytelling to challenge disinformation and mobilize digital audiences.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists"
        },
        {
          "name": "Vitalie Eșanu / Blog Forum Moldova",
          "description": "Civic activist and media literacy influencer promoting critical thinking, digital resilience, and civic responsibility in Moldova; creates accessible content on disinformation, online manipulation, and fact-checking for youth and digital audiences.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, Russian, English",
          "partner_audiences": "Gen Z, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Savciuc Lucian",
          "description": "Youth influencer and digital content creator known for relatable Moldovan humor, lifestyle commentary, and motivational videos; engages young audiences through social trends, daily challenges, and messages of personal growth and positivity.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian",
          "partner_audiences": "Gen Z, Millennials, Youth Empowerment, Participation"
        },
        {
          "name": "Violeta Ciuprin",
          "description": "Youth lifestyle influencer creating content that inspires self-confidence, educational ambition, and personal expression; combines fashion, motivation, and advocacy to empower young Moldovans to pursue growth and civic-minded leadership.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian, English",
          "partner_audiences": "Gen Z, Women, Education Institutions and Stakeholders"
        },
        {
          "name": "Morgoci Official (Andrei Morgoci)",
          "description": "Youth humor influencer known for comedic sketches and satire reflecting Moldovan daily life; uses humor and light civic commentary to engage young audiences, spark dialogue on social norms, and promote relatable civic awareness.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists"
        },
        {
          "name": "Banca de Bancuri",
          "description": "Popular digital humor platform sharing comedic sketches, viral jokes, and culturally rooted satire; engages Moldovan youth through humor while subtly addressing everyday social themes and generational experiences.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian",
          "partner_audiences": "Gen Z, Millennials, Men"
        },
        {
          "name": "Nanu Danu",
          "description": "Entertainer and content creator known for Moldovan humor, relatable social commentary, and comedic storytelling; blends cultural references, satire, and youth trends to engage digital audiences with light civic awareness and local identity.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian",
          "partner_audiences": "Gen Z, Millennials, Civic and Human Rights Activists"
        },
        {
          "name": "Emilian Crețu",
          "description": "Actor, comedian, and digital creator known for sharp satire, character-driven sketches, and advocacy through humor; blends entertainment with commentary on social issues, gender norms, and civic values to engage wide Moldovan audiences.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian",
          "partner_audiences": "Gen Z, Gender and LGBTQ+ activists, Civic and Human Rights Activists"
        },
        {
          "name": "Sergiu Coșnician",
          "description": "Content creator and satirist known for his sharp takes on politics, media, and everyday Moldovan life; uses humor, parody, and relatable scenarios to promote critical thinking, civic awareness, and media literacy among digital audiences.",
          "partner_entity_types": "Influencer",
          "partner_countries": "Moldova",
          "partner_languages": "Romanian",
          "partner_audiences": "Gen Z, Millennials, Journalists and Media Practitioners"
        },
        {
          "name": "Keya Health",
          "description": "Keya Health is a digital health platform using telehealth tools like virtual care, remote monitoring, and health information services to promote accessible and affordable preventive healthcare.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Women, Men, Regional audiences, Migrants and At Risk Groups"
        },
        {
          "name": "HealthEdu Ltd",
          "description": "HealthEdu is a digital health education platform providing evidence-based online and offline training for health professionals and community health workers.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English, Arabic, French, Kinyarwanda",
          "partner_audiences": "Education Institutions and Stakeholders, Regional audiences"
        },
        {
          "name": "Check Me",
          "description": "Check Me is a health tech startup using digital platforms and AI tools to promote breast cancer awareness and early detection among African women, especially in underserved areas. Its solution includes a mobile/web app, AI assistant, and upcoming portable screening device.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Women, Regional audiences, Migrants and At Risk Groups"
        },
        {
          "name": "WelTel Rwanda",
          "description": "WelTel is a secure, evidence-based digital health platform integrated into Rwanda’s health system that uses SMS and AI to enhance patient engagement and virtual care across diseases, including Ebola and chronic conditions.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Regional audiences, Migrants and At Risk Groups, Policy and Governance Stakeholders"
        },
        {
          "name": "Viebeg Technologies",
          "description": "Viebeg is a health tech company using AI to optimize medical supply chains in Central and East Africa, ensuring that healthcare providers maintain consistent, cost-effective access to essential medical supplies.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Regional audiences, Business community, Policy and Governance Stakeholders"
        },
        {
          "name": "University of Global Health Equity",
          "description": "The University of Global Health Equity in Rwanda trains future health professionals and leaders, while supporting medical education, research, and medtech innovation to improve healthcare quality and access in Africa.",
          "partner_entity_types": "Academic Institution",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Women, Policy and Governance Stakeholders, Regional audiences, Civic and Human Rights Activists"
        },
        {
          "name": "Health Builders",
          "description": "Health Builders is a non-profit strengthening Rwanda’s health systems by providing management frameworks, infrastructure, and essential resources to primary care facilities serving over 1 million people.",
          "partner_entity_types": "CSO",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Regional audiences, Policy and Governance Stakeholders, Civic and Human Rights Activists, Education Institutions and Stakeholders"
        },
        {
          "name": "Centre for AI Policy and Innovation Ltd",
          "description": "The Centre for AI Policy and Innovation Ltd drives AI-enabled health innovation in Rwanda by developing governance frameworks, supporting scalable AI solutions, and establishing health data trusts to improve public health outcomes.",
          "partner_entity_types": "CSO",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Regional audiences, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "Society for Family Health",
          "description": "Society for Family Health empowers health leaders and communities in malaria-endemic countries through data-driven decision-making and evidence-based social behavior change communication.",
          "partner_entity_types": "CSO",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Regional audiences, Education Institutions and Stakeholders, Civic and Human Rights Activists"
        },
        {
          "name": "King Faisal Hospital Rwanda Foundation (KFHRF)",
          "description": "KFHRF supports medical research, training, and education in Rwanda, focusing on maternal and child health, non-communicable diseases, and improving access to surgical care.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English, French",
          "partner_audiences": "Education Institutions and Stakeholders, Regional audiences, Policy and Governance Stakeholders, Women, Migrants and At Risk Groups"
        },
        {
          "name": "Ministry of Health, Rwanda",
          "description": "The Ministry of Health, Rwanda, leads the country’s health sector modernization with a focus on innovation, digitalization, research, and building a resilient healthcare system to achieve universal health coverage by 2030.",
          "partner_entity_types": "Public Institution",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Regional audiences, Civic and Human Rights Activists, Education Institutions and Stakeholders"
        },
        {
          "name": "African Institute for Mathematical Sciences - Next Einstein Initiative Foundation (AIMS-NEI)",
          "description": "AIMS-NEI is a pan-African network that builds STEM capacity and supports health research, including disease modeling and outbreak characterization, to advance scientific innovation and public health across Africa.",
          "partner_entity_types": "Academic Institution",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Education Institutions and Stakeholders, Regional audiences, Policy and Governance Stakeholders, Gen Z, Millennials"
        },
        {
          "name": "HISP Ltd",
          "description": "HISP Ltd develops customizable digital health information systems to improve immunization planning and healthcare delivery across Rwanda and Africa.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Regional audiences, Education Institutions and Stakeholders"
        },
        {
          "name": "AKADEMIYA2063",
          "description": "AKADEMIYA2063 is a pan-African research organization building advanced data and analytical capacities to support evidence-based policymaking aligned with Africa’s Agenda 2063.",
          "partner_entity_types": "CSO",
          "partner_countries": "Rwanda",
          "partner_languages": "English, French",
          "partner_audiences": "Policy and Governance Stakeholders, Regional audiences, Education Institutions and Stakeholders, Business community"
        },
        {
          "name": "Imbuto Foundation",
          "description": "Imbuto Foundation improves maternal health by enhancing obstetric care through early diagnosis and timely referral of high-risk pregnancies, while also addressing HIV/AIDS and broader community wellbeing.",
          "partner_entity_types": "CSO",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Women, Policy and Governance Stakeholders, Regional audiences, Migrants and At Risk Groups"
        },
        {
          "name": "National Council for Science and Technology",
          "description": "NCST promotes research and innovation at the intersection of climate change and public health to foster a healthier population and sustainable development in Rwanda.",
          "partner_entity_types": "Public Institution",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Education Institutions and Stakeholders, Environmental and Climate Advocates, Regional audiences"
        },
        {
          "name": "TKMD Rwanda Ltd",
          "description": "TKMD Rwanda Ltd manufactures safety and auto-disable syringes and other medical consumables to ensure stable, high-quality supply for COVID-19 and routine immunization across Africa.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Regional audiences, Policy and Governance Stakeholders, Business community, Education Institutions and Stakeholders"
        },
        {
          "name": "BK TecHouse Limited",
          "description": "BK TecHouse leverages digital innovation to scale integrated platforms that support agricultural and health-related services through public-private partnerships in Rwanda.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Business community, Policy and Governance Stakeholders, Regional audiences, Education Institutions and Stakeholders"
        },
        {
          "name": "Irembo Limited",
          "description": "Irembo Limited enhances the efficiency and accessibility of digital health services by supporting government-led digital transformation initiatives in Rwanda.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Regional audiences, Civic and Human Rights Activists, Education Institutions and Stakeholders"
        },
        {
          "name": "University of Rwanda",
          "description": "The University of Rwanda conducts research on digital health and telemedicine effectiveness in low-income settings, supporting innovation in health service delivery.",
          "partner_entity_types": "Academic Institution",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Education Institutions and Stakeholders, Policy and Governance Stakeholders, Regional audiences, Gen Z, Millennials"
        },
        {
          "name": "Rwanda Biomedical Centre",
          "description": "Rwanda Biomedical Centre is the country’s central health agency implementing innovative, evidence-based health interventions, including digital monitoring for services like COVID-19 response, family planning, etc.",
          "partner_entity_types": "Public Institution",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Regional audiences, Women, Migrants and At Risk Groups, Education Institutions and Stakeholders"
        },
        {
          "name": "Rwanda Agriculture Board",
          "description": "RAB integrates research, extension, and policy to modernize agriculture and improve land use, including digital tools like soil information services for smallholder farmers.",
          "partner_entity_types": "Public Institution",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Migrants and At Risk Groups, Civic and Human Rights Activists, Policy and Governance Stakeholders, Regional audiences"
        },
        {
          "name": "Pit Vidura",
          "description": "Pit Vidura develops SMS-based platforms and technologies to improve coordination and reduce costs for safe fecal waste collection in underserved urban communities.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Regional audiences, Environmental and Climate Advocates, Migrants and At Risk Groups"
        },
        {
          "name": "Government of Rwanda, Ministry of Infrastructure",
          "description": "The Ministry of Infrastructure supports water, sanitation, and hygiene (WASH) initiatives like AfricaSan to improve public health and quality of life across Rwanda.",
          "partner_entity_types": "Public Institution",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Women, Men, Gender and LGBTQ+ activists, Migrants and At Risk Groups, Environmental and Climate Advocates, Regional audiences, Civic and Human Rights Activists"
        },
        {
          "name": "Send a Cow Rwanda",
          "description": "Send a Cow Rwanda promotes gender equity and improved household health by educating communities on gender roles and encouraging the use of energy-saving stoves to reduce time, labor, and health risks.",
          "partner_entity_types": "CSO",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Women, Men, Business community, Civil Society, Education Institutions and Stakeholders"
        },
        {
          "name": "Lifesten Health Limited",
          "description": "Lifesten Health is a Rwandan digital wellness platform that integrates physical activity, nutrition, and mental health through personalized, incentive-based programs aimed at preventing lifestyle diseases like cardiovascular conditions.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Migrants and At Risk Groups, Gen Z, Millennials, Civic and Human Rights Activists, Civil Society, Education Institutions and Stakeholders"
        },
        {
          "name": "Mizero Care LTD",
          "description": "Mizero Care Ltd provides online psychotherapy services to address mental health challenges stemming from trauma, particularly related to the Genocide against the Tutsi, with a focus on reducing isolation.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Women, Gen Z, Millennials, Migrants and At Risk Groups"
        },
        {
          "name": "Tantine Group",
          "description": "Tantine Group offers a digital health app that supports women’s reproductive health by tracking menstruation, fertility, and pregnancy, while delivering daily baby development updates and health advice.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "Kinyarwanda",
          "partner_audiences": "Policy and Governance Stakeholders, Education Institutions and Stakeholders, Business community, Civil Society, Migrants and At Risk Groups, Regional audiences"
        },
        {
          "name": "Kapsule",
          "description": "Kapsule is a health tech company improving the affordability, accessibility, and authenticity of healthcare in low-resource settings by digitizing healthcare processes and delivering actionable data insights.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Women, Men, Migrants and At Risk Groups, Business community, Regional audiences"
        },
        {
          "name": "Afiapharma",
          "description": "AFIAPHARMA is an FDA-certified online pharmacy platform in Rwanda that delivers affordable medications to patients’ homes with just a few clicks, improving access to essential medicines across Africa.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Education Institutions and Stakeholders, Civic and Human Rights Activists, Civil Society, Policy and Governance Stakeholders, Regional audiences, Business community"
        },
        {
          "name": "TIP Global Health",
          "description": "TIP Global Health developed E-Heza, a digital data collection system that enables healthcare workers in Rwanda to record and analyze patient data in real time, improving care quality and the use of evidence-based clinical protocols in resource-limited settings.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Education Institutions and Stakeholders, Journalists and Media Practitioners, Civic and Human Rights Activists, Civil Society, Policy and Governance Stakeholders, Business community"
        },
        {
          "name": "Eden Care",
          "description": "Eden Care is a digital health insurance platform that equips employers with a smart HR dashboard and provides members with a mobile app and concierge team to manage and access healthcare services efficiently.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Education Institutions and Stakeholders, Journalists and Media Practitioners, Civic and Human Rights Activists, Civil Society, Policy and Governance Stakeholders, Business community"
        },
        {
          "name": "KarisimbiTech",
          "description": "KarisimbiTech is a Kigali-based startup transforming healthcare in Africa through its electronic medical records platform, XanaHealth, which connects patients, providers, insurers, and policymakers to eliminate data inefficiencies and improve care.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Gen Z, Millennials, Education Institutions and Stakeholders, Journalists and Media Practitioners, Civic and Human Rights Activists, Civil Society, Policy and Governance Stakeholders, Business community"
        },
        {
          "name": "eFiche",
          "description": "eFiche is a health-tech company transforming healthcare in Africa with an AI-powered electronic medical records (EMR) system that connects patients, providers, and facilities to improve access, efficiency, and equity in care.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Education Institutions and Stakeholders, Civil Society, Policy and Governance Stakeholders, Gen Z, Millennials, Business community"
        },
        {
          "name": "Dynasoft",
          "description": "Dynasoft is a Rwandan health-tech company behind Medisoft, an advanced EMR platform that digitizes healthcare workflows and integrates with national health systems, including RSSB-CBHI and OpenHIE, to improve care coordination and efficiency",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Civil Society, Policy and Governance Stakeholders, Business community, Millennials, Migrants and At Risk Groups"
        },
        {
          "name": "Dot Glasses",
          "description": "Dot Glasses is a social enterprise innovating affordable vision care through a patented modular eyeglasses system and a portable vision-testing toolkit, enabling rapid, low-cost diagnosis and distribution in underserved communities.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Civil Society, Business community, Millennials"
        },
        {
          "name": "The Ministry of Information Communication Technology and Innovation",
          "description": "MINICT drives Rwanda’s economic growth and poverty reduction by developing and coordinating national ICT and innovation policies, empowering citizens, and enabling digital solutions that can enhance health systems and service delivery.",
          "partner_entity_types": "Public Institution",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Business community"
        },
        {
          "name": "HealthTech Hub",
          "description": "HealthTech Hub Africa is a Kigali-based pan-African accelerator supporting the development and fast-tracking of innovative health technologies by fostering collaboration between startups, governments, and global health funders to address critical public health challenges in underserved populations.",
          "partner_entity_types": "CSO",
          "partner_countries": "Rwanda",
          "partner_languages": "Arabic, Dutch, French, English, German, Italian, Portuguese, Russian, Spanish, Swahili",
          "partner_audiences": "Policy and Governance Stakeholders, Business community"
        },
        {
          "name": "Insightiv Technologies",
          "description": "Insightiv develops AI-powered teleradiology solutions to expand access to remote medical imaging diagnostics in Rwanda and Africa.",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Business community"
        },
        {
          "name": "The Global Health Network Africa",
          "description": "The Global Health Network Africa strengthens health research and data science capabilities through regional training and partnerships.",
          "partner_entity_types": "CSO",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Business community, Migrants and At Risk Groups"
        },
        {
          "name": "Zipline",
          "description": "Zipline operates autonomous drone delivery systems to rapidly transport medical supplies and healthcare products to remote and underserved communities",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Business community, Migrants and At Risk Groups"
        },
        {
          "name": "Audere",
          "description": "Audere develops AI-powered digital health platforms that support disease detection, treatment adherence, and real-time monitoring to improve healthcare delivery in low-resource settings.",
          "partner_entity_types": "CSO",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Men, Women, Gen Z, Millenials, Policy and Governance Stakeholders, Business community, Migrants and At Risk Groups"
        },
        {
          "name": "Babyl",
          "description": "Babyl leverages mobile technology to provide accessible, affordable, and personalized digital healthcare services, including online consultations, diagnostics, and prescription delivery in Rwanda",
          "partner_entity_types": "Private company",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Education Institutions and Stakeholders, Business community"
        },
        {
          "name": "Rwanda Health Informatics Alliance (RHIA)",
          "description": "RHIA promotes the adoption and advancement of health informatics in Rwanda to improve healthcare delivery, data accuracy, and public health through innovative use of information and communication technologies",
          "partner_entity_types": "CSO",
          "partner_countries": "Rwanda",
          "partner_languages": "English",
          "partner_audiences": "Policy and Governance Stakeholders, Education Institutions and Stakeholders, Business community"
        }
      ]
    }
  
    db.query AUDIENCE {
      return = {type: "list"}
    } as $AUDIENCES
  
    var $to_map {
      value = {}
    }
  
    foreach ($AUDIENCES) {
      each as $i {
        var.update $to_map {
          value = $to_map|set:($i.name|to_lower):$i.id
        }
      }
    }
  
    var.update $AUDIENCES {
      value = $to_map
    }
  
    db.query ENTITY_TYPE {
      return = {type: "list"}
    } as $ENTITY_TYPES
  
    var $to_map {
      value = {}
    }
  
    foreach ($ENTITY_TYPES) {
      each as $i {
        var.update $to_map {
          value = $to_map|set:($i.name|to_lower):$i.id
        }
      }
    }
  
    var.update $ENTITY_TYPES {
      value = $to_map
    }
  
    db.query COUNTRY {
      return = {type: "list"}
    } as $COUNTRIES
  
    var $to_map {
      value = {}
    }
  
    foreach ($COUNTRIES) {
      each as $i {
        var.update $to_map {
          value = $to_map|set:($i.name|to_lower):$i.id
        }
      }
    }
  
    var.update $COUNTRIES {
      value = $to_map
    }
  
    db.query LANGUAGE {
      return = {type: "list"}
    } as $LANGUAGES
  
    var $to_map {
      value = {}
    }
  
    foreach ($LANGUAGES) {
      each as $i {
        var.update $to_map {
          value = $to_map|set:($i.name|to_lower):$i.id
        }
      }
    }
  
    var.update $LANGUAGES {
      value = $to_map
    }
  
    var $TO_UPDATE {
      value = []
    }
  
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
      
        function.run "Migration/Get Ids from Map" {
          input = {
            databaseIds: $AUDIENCES
            string     : $item.partner_audiences
            separator  : ","
          }
        } as $partner_audiences
      
        function.run "Migration/Get Ids from Map" {
          input = {
            databaseIds: $LANGUAGES
            string     : $item.partner_languages
            separator  : ","
          }
        } as $partner_languages
      
        function.run "Migration/Get Ids from Map" {
          input = {
            databaseIds: $COUNTRIES
            string     : $item.partner_countries
            separator  : ","
          }
        } as $partner_countries
      
        function.run "Migration/Get Ids from Map" {
          input = {
            databaseIds: $ENTITY_TYPES
            string     : $item.partner_entity_types
            separator  : ","
          }
        } as $partner_entity_types
      
        array.push $TO_UPDATE {
          value = {}
            |set:"id":$PARTNER_ID
            |set:"partner_entity_types":$partner_entity_types
            |set:"partner_countries":$partner_countries
            |set:"partner_languages":$partner_languages
            |set:"partner_audiences":$partner_audiences
        }
      }
    }
  
    !db.bulk.patch PARTNER {
      items = $TO_UPDATE
    } as $PARTNER
  }

  response = $TO_UPDATE
}