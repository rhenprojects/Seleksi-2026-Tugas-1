--
-- PostgreSQL database dump
--

\restrict q95beaEIzG80a2OcsR0BBDXx5VcSdkfFEnMl0WeGa7QGx1OzDtxsbESvcAqJDiz

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: designation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.designation (
    designation_id integer NOT NULL,
    designation_name character varying(50) NOT NULL
);


--
-- Name: designation_designation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.designation_designation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: designation_designation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.designation_designation_id_seq OWNED BY public.designation.designation_id;


--
-- Name: park; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.park (
    park_id integer NOT NULL,
    name character varying(100) NOT NULL,
    date_established date,
    area_acres numeric(12,2) NOT NULL,
    recreation_visitors integer NOT NULL,
    description text NOT NULL
);


--
-- Name: park_designation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.park_designation (
    park_id integer NOT NULL,
    designation_id integer NOT NULL
);


--
-- Name: park_park_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.park_park_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: park_park_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.park_park_id_seq OWNED BY public.park.park_id;


--
-- Name: park_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.park_state (
    park_id integer NOT NULL,
    state_id integer NOT NULL
);


--
-- Name: state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.state (
    state_id integer NOT NULL,
    state_name character varying(50) NOT NULL,
    is_territory boolean DEFAULT false NOT NULL
);


--
-- Name: state_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.state_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: state_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.state_state_id_seq OWNED BY public.state.state_id;


--
-- Name: visit_record; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.visit_record (
    visit_id integer NOT NULL,
    park_id integer NOT NULL,
    visit_year smallint NOT NULL,
    visitor_count integer NOT NULL
);


--
-- Name: visit_record_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.visit_record_visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: visit_record_visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.visit_record_visit_id_seq OWNED BY public.visit_record.visit_id;


--
-- Name: designation designation_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designation ALTER COLUMN designation_id SET DEFAULT nextval('public.designation_designation_id_seq'::regclass);


--
-- Name: park park_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.park ALTER COLUMN park_id SET DEFAULT nextval('public.park_park_id_seq'::regclass);


--
-- Name: state state_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.state ALTER COLUMN state_id SET DEFAULT nextval('public.state_state_id_seq'::regclass);


--
-- Name: visit_record visit_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visit_record ALTER COLUMN visit_id SET DEFAULT nextval('public.visit_record_visit_id_seq'::regclass);


--
-- Data for Name: designation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.designation (designation_id, designation_name) FROM stdin;
1	World Heritage Site
2	Biosphere Reserve
\.


--
-- Data for Name: park; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.park (park_id, name, date_established, area_acres, recreation_visitors, description) FROM stdin;
1	Acadia	1919-02-26	49071.40	4079318	Covering most of Mount Desert Island and other coastal islands, Acadia features the tallest mountain on the Atlantic coast of the United States, granite peaks, ocean shoreline, woodlands, and lakes. There are freshwater, estuary, forest, and intertidal habitats.
2	American Samoa	1988-10-31	8256.67	43258	The southernmost national park is on three Samoan islands in the South Pacific. It protects coral reefs, rainforests, volcanic mountains, and white beaches. The area is also home to flying foxes, brown boobies, sea turtles, and 900 species of fish.
3	Arches	1971-11-12	76678.98	1511740	This site features more than 2,000 natural sandstone arches, with some of the most popular arches in the park being Delicate Arch, Landscape Arch and Double Arch. Millions of years of erosion have created these structures in a desert climate where the arid ground has life-sustaining biological soil crusts and potholes that serve as natural water-collecting basins. Other geologic formations include stone pinnacles, fins, and balancing rocks.
4	Badlands	1978-11-10	242755.94	1139361	The Badlands are a collection of buttes, pinnacles, spires, and mixed-grass prairies within the drainage basin of the White River, in southwestern South Dakota. They contain the largest known assemblage of late Eocene and Oligocene mammal fossils. Wildlife includes bison, bighorn sheep, black-footed ferrets, and prairie dogs.
5	Big Bend	1944-06-12	801163.21	568104	Named for the prominent bend in the Rio Grande along the U.S.–Mexico border, this park encompasses a large and remote part of the Chihuahuan Desert. Its main attraction is backcountry recreation in the arid Chisos Mountains and in canyons along the river. A wide variety of Cretaceous and Tertiary fossils as well as cultural artifacts of Native Americans also exist within its borders. (BR)
6	Biscayne	1980-06-28	172971.11	486567	The central part of Biscayne Bay, this mostly underwater park at the north end of the Florida Keys has four interrelated marine ecosystems: mangrove forest, the Bay, the Keys, and coral reefs. Threatened animals include the West Indian manatee, American crocodile, various sea turtles, and the peregrine falcon.
7	Black Canyon of the Gunnison	1999-10-21	30779.83	250086	The park protects a quarter of the Gunnison River, which slices sheer canyon walls from dark Precambrian -era rock. The canyon features some of the steepest cliffs and oldest rock in North America, and is a popular site for river rafting and rock climbing. The deep, narrow canyon is composed of gneiss and schist, which appears black when in shadow.
8	Bryce Canyon	1928-02-25	35835.08	1967367	Bryce Canyon is a geological amphitheater on southern Utah's Paunsaugunt Plateau with hundreds of tall, multicolored sandstone hoodoos formed by erosion. The region was originally settled by Native Americans and later by Mormon pioneers.
9	Canyonlands	1964-09-12	337597.83	796057	This landscape was eroded into a maze of canyons, buttes, and mesas by the combined efforts of the Colorado River, Green River, and their tributaries, which divide the park into three districts. The park contains thousands of rock pinnacles and arches, as well as artifacts from Ancient Pueblo peoples.
10	Capitol Reef	1971-12-18	241904.50	1388476	The park's Waterpocket Fold is a 100-mile (160 km) monocline that exhibits the earth's diverse geologic layers. Other natural features include monoliths, eroded buttes, and sandstone domes, including one shaped like the United States Capitol.
11	Carlsbad Caverns	1930-05-14	46766.45	410778	Carlsbad Caverns has 117 caves, the longest of which is over 120 miles (190 km) long. The Big Room is almost 4,000 feet (1,200 m) long, and the caves are home to over 400,000 Mexican free-tailed bats and sixteen other species. Above ground are the Chihuahuan Desert and Rattlesnake Springs. (WHS)
12	Channel Islands	1980-03-05	249561.00	227186	Five of the eight Channel Islands are protected, with half of the park's area underwater. The islands have a unique Mediterranean ecosystem originally settled by the Chumash people. They are home to over 2,000 species of land plants and animals, 145 endemic to them, including the island fox. Ferry services offer transportation to the islands from the mainland. (BR)
13	Congaree	2003-11-10	26692.60	287833	On the Congaree River, this park is the largest portion of old-growth floodplain forest left in North America. Some of the trees are the tallest in the eastern United States. An elevated walkway called the Boardwalk Loop guides visitors through the swamp. (BR)
14	Crater Lake	1902-05-22	183224.05	632242	Crater Lake lies in the caldera of an ancient volcano called Mount Mazama that collapsed 7,700 years ago. The lake is the deepest in the United States and is noted for its vivid blue color and water clarity. Wizard Island and the Phantom Ship are more recent volcanic formations within the caldera. As the lake has no inlets or outlets, it is replenished only by precipitation.
15	Cuyahoga Valley	2000-10-11	32571.89	3025325	This park along the Cuyahoga River has waterfalls, hills, trails, and exhibits on early rural living. The Ohio and Erie Canal Towpath Trail follows the Ohio and Erie Canal, where mules towed canal boats. The park has numerous historic homes, bridges, and structures, and also offers a scenic train ride.
16	Death Valley	1994-10-31	3408395.63	1320134	Death Valley is the hottest, lowest, and driest place in the United States, with daytime temperatures that have exceeded 130 °F (54 °C). The park protects Badwater Basin and its vast salt flats at the lowest elevation in North America, −282 ft (−86 m), This geologic graben also protects numerous canyons, badlands, sand dunes, mountain ranges, historic mines, springs, and more than 1,000 species of plants that grow. (BR)
17	Denali	1917-02-26	4740911.16	543300	Centered on Denali, the tallest and most prominent mountain in North America, the park is serviced by a single road leading to Wonder Lake, most of which can only be accessed via scheduled tour buses. Denali and other peaks of the Alaska Range are covered with long glaciers and boreal forest. Wildlife includes grizzly bears, Dall sheep, moose, caribou, and wolves. (BR)
18	Dry Tortugas	1992-10-26	64701.22	89355	The islands of the Dry Tortugas, at the westernmost end of the Florida Keys, are the site of Fort Jefferson, a Civil War -era fort that is the largest masonry structure in the Americas. The park is home to undisturbed coral reefs and shipwrecks, and is only accessible by plane or boat. (BR)
19	Everglades	1934-05-30	1508938.57	778198	The Everglades are the largest tropical wilderness in the United States. This mangrove and tropical rainforest ecosystem and marine estuary is home to 36 protected species, including the Florida panther, American crocodile, and West Indian manatee. Some areas have been drained and developed; restoration projects aim to restore the ecology. (WHS) (BR)
20	Gates of the Arctic	1980-12-02	7523897.45	14923	The country's northernmost park protects an expanse of pure wilderness in Alaska's Brooks Range and has no park facilities. The land is home to Alaska Natives who have relied on the land and caribou for 11,000 years.
40	Lake Clark	1980-12-02	2619816.49	19778	The region around Lake Clark features four active volcanoes, including Mount Redoubt, as well as an abundance of rivers, glaciers, and waterfalls. Temperate rainforests, a tundra plateau, and three mountain ranges complete the landscape.
21	Gateway Arch	2018-02-22	192.83	2209028	The Gateway Arch is a 630-foot (192 m) (both high and wide) catenary arch built in the 1960s to commemorate the Lewis and Clark Expedition, initiated by Thomas Jefferson, and the subsequent westward expansion of the country. The nearby Old Courthouse, across a greenway to the west of the arch, was the original site of the landmark Dred Scott case about slavery. An underground museum describes the arch's construction and the country's westward expansion.
22	Glacier	1910-05-11	1013126.39	3136557	The U.S. half of Waterton-Glacier International Peace Park, this park includes 26 rapidly receding glaciers and 130 named lakes surrounded by Rocky Mountain peaks. Historic hotels and the landmark Going-to-the-Sun Road accommodate visitors. The local mountains, formed by an overthrust, expose Paleozoic fossils including trilobites, mollusks, giant ferns and dinosaurs. The park is also home to Triple Divide Peak, which forms the boundary between the watersheds of the Atlantic, Pacific, and Arctic Oceans. (WHS) (BR)
23	Glacier Bay	1980-12-02	3223383.43	740044	Glacier Bay contains tidewater glaciers, mountains, fjords, and a temperate rainforest, and is home to large populations of grizzly bears, mountain goats, whales, seals, and eagles. When discovered in 1794 by George Vancouver, the entire bay was covered by ice, but the glaciers have since receded more than 65 miles (105 km). (WHS) (BR)
24	Grand Canyon	1919-02-26	1201647.03	4430653	The Grand Canyon, carved by the mighty Colorado River, is 277 miles (446 km) long, up to 1 mile (1.6 km) deep, and up to 15 miles (24 km) wide. Millions of years of erosion have resulted in a massive three-tiered canyon, exposing the multicolored layers of the Colorado Plateau in mesas and canyon walls, visible from trails that descend into the canyon from the north and south rims. (WHS)
25	Grand Teton	1929-02-26	310044.36	3800648	Grand Teton is the tallest mountain in the scenic Teton Range. The park's historic Jackson Hole and reflective piedmont lakes teem with endemic wildlife, with a backdrop of craggy mountains that rise abruptly from the sage-covered valley below. (BR)
26	Great Basin	1986-10-27	77180.00	161210	Based around Nevada's second tallest mountain, Wheeler Peak, Great Basin National Park protects 5,000-year-old bristlecone pines, a rock glacier, and the limestone Lehman Caves. Due to its remote location, the park is home to some of the country's darkest night skies. Wildlife includes the Townsend's big-eared bat, pronghorn, and Bonneville cutthroat trout.
27	Great Sand Dunes	2004-09-24	107345.73	432498	The tallest sand dunes in North America, up to 750 feet (230 m) tall, were formed by deposits of the ancient Rio Grande in the San Luis Valley. Abutting a variety of grasslands, shrublands, and wetlands, the park also features alpine lakes, six 13,000-foot mountains, and old-growth forests.
28	Great Smoky Mountains	1934-06-15	522426.88	11527939	The Great Smoky Mountains, part of the Appalachian Mountains, span a wide range of elevations, making them home to over 400 vertebrate species, 100 tree species, and 5,000 plant species. Hiking is the park's main attraction, with over 800 miles (1,300 km) of trails, including 70 miles (110 km) of the Appalachian Trail. Other activities include fishing, horseback riding, and touring nearly 80 historic structures. (WHS) (BR)
29	Guadalupe Mountains	1972-09-30	86367.10	206423	This park contains Guadalupe Peak, the highest point in Texas, as well as the scenic McKittrick Canyon filled with bigtooth maples, a corner of the arid Chihuahuan Desert, and a fossilized coral reef from the Permian era.
30	Haleakalā	1961-07-01	33488.98	853711	The Haleakalā volcano on Maui features a very large crater with numerous cinder cones, a grove of non-native trees, the Kipahulu section's scenic pools of freshwater fish, and the endemic Hawaiian goose. The park protects the greatest number of endangered species within a U.S. national park. (BR)
31	Hawaiʻi Volcanoes	1916-08-01	344812.18	1877854	This park on the Big Island protects the Kīlauea and Mauna Loa volcanoes, two of the world's most active geological features. Diverse ecosystems range from tropical forests at sea level to barren lava beds at more than 13,000 feet (4,000 m). (WHS) (BR)
32	Hot Springs	1921-03-04	5554.15	2494611	Hot Springs was originally established by Congress as a federal reserve on April 20, 1832, making it the oldest area managed by the National Park Service. Natural thermal springs flow out of the Ouachita Mountains, providing opportunities for relaxation in a historic setting. Bathhouse Row preserves examples of 19th-century architecture. Hot Springs is the first national park within a city and was the smallest national park until 2018.
33	Indiana Dunes	2019-02-15	15349.08	2629497	Previously designated a national lakeshore, parts of this 20-mile (32 km) stretch of the southern shore of Lake Michigan have sandy beaches and tall dunes. The park includes grassy prairies, peat bogs, and marsh wetlands home to over 2,000 species.
34	Isle Royale	1940-04-03	571790.30	29091	The largest island in Lake Superior is a place of isolation and wilderness. Along with its many shipwrecks, waterways, and hiking trails, the park also includes over 400 smaller islands within 4.5 miles (7.2 km) of its shores. There are only 20 mammal species on the island, though the relationship between its wolf and moose populations is especially unique. (BR)
35	Joshua Tree	1994-10-31	795155.85	2932644	Covering large areas of the Colorado and Mojave Deserts and the Little San Bernardino Mountains, this desert landscape is populated by vast stands of Joshua trees. Large changes in elevation reveal various contrasting environments including bleached sand dunes, dry lakes, rugged mountains, and maze-like clusters of monzogranite monoliths. (BR)
36	Katmai	1980-12-02	3674529.33	34479	This park on the Alaska Peninsula protects the Valley of Ten Thousand Smokes, an ash flow formed by the 1912 eruption of Novarupta, and the stratovolcano Mount Katmai. Over 2,000 grizzly bears come here each year to catch spawning salmon. Other wildlife includes caribou, wolves, moose, and wolverines.
37	Kenai Fjords	1980-12-02	669650.05	425369	Near Seward on the Kenai Peninsula, this park protects the Harding Icefield and at least 38 glaciers and fjords stemming from it. The only area accessible to the public by road is the rapidly shrinking Exit Glacier. Boat and kayak tours offer views of tidewater glaciers, whales, sea lions, and marine birds.
38	Kings Canyon	1940-03-04	461901.20	779791	Home to several giant sequoia groves and the General Grant Tree, the world's second largest measured tree, this park also features part of the Kings River, sculptor of the dramatic granite canyon that is its namesake, and the San Joaquin River, as well as Boyden Cave. Although Kings Canyon National Park was designated as such in 1940, it subsumed General Grant National Park, which had been established on October 1, 1890, as the United States' fourth national park. (BR)
39	Kobuk Valley	1980-12-02	1750716.16	7786	Kobuk Valley protects 61 miles (98 km) of the Kobuk River and three regions of sand dunes. Created by glaciers, the Great Kobuk, Little Kobuk, and Hunt River Sand Dunes can reach 100 feet (30 m) high and 100 °F (38 °C), and they are the largest dunes in the Arctic. Twice a year, half a million caribou migrate through the dunes and across river bluffs that expose well-preserved ice age fossils.
41	Lassen Volcanic	1916-08-09	106589.02	504777	Lassen Peak, the largest lava dome volcano in the world, is joined by all three other types of volcanoes in this park: shield, cinder cone, and composite. Though Lassen itself last erupted in 1915, most of the rest of the park is continuously active. Numerous hydrothermal features, including fumaroles, boiling pools, and bubbling mud pots, are heated by molten rock from beneath the peak.
42	Mammoth Cave	1941-07-01	72472.87	660734	With more than 400 miles (640 km) of passageways explored, Mammoth Cave is the world's longest known cave system. Subterranean wildlife includes eight bat species, Kentucky cave shrimp, Northern cavefish, and cave salamanders. Above ground, the park provides recreation on the Green River, 70 miles of hiking trails, and plenty of sinkholes and springs. (WHS) (BR)
43	Mesa Verde	1906-06-29	52485.17	463130	This area constitutes over 4,000 archaeological sites of the Ancestral Puebloan people, who lived here and elsewhere in the Four Corners region for at least 700 years. Cliff dwellings built in the 12th and 13th centuries include Cliff Palace, which has 150 rooms and 23 kivas, and the Balcony House, with its many passages and tunnels. (WHS)
44	Mount Rainier	1899-03-02	236381.64	1635342	Mount Rainier, an active stratovolcano, is the most prominent peak in the Cascades and is covered by 26 named glaciers including Carbon Glacier and Emmons Glacier, the longest and largest in the contiguous United States respectively. The mountain is popular for climbing, and more than half of the park is covered by subalpine and alpine forests and meadows seasonally in bloom with wildflowers. Paradise on the south slope is among the snowiest places on Earth. The Longmire visitor center is the start of the Wonderland Trail, which encircles the mountain.
45	New River Gorge	2020-12-27	7021.00	1958440	The New River Gorge is the deepest river gorge east of the Mississippi River. The park primarily covers the lower gorge area around the New River Gorge Bridge, which features some of the country's best whitewater rafting. Smaller noncontiguous sections showcase the ghost town of Thurmond, the scenic Grandview vista, and Sandstone Falls. The other 65,165 acres (263.71 km 2 ) of the redesignated national river is now a national preserve, spanning 53 miles (85 km) of the New River.
46	North Cascades	1968-10-02	504780.94	46925	The highly glaciated mountains of the North Cascades Range exhibit a spectacular and complex geologic history. Between the river valleys and high peaks there are eight diverse life zones with 75 mammal and 1,600 vascular plant species. Popular hiking and climbing areas of the Stephen Mather Wilderness include Cascade Pass, Mount Shuksan, Mount Triumph, and Eldorado Peak. Ross Lake and Lake Chelan National Recreation Areas adjoin the two segments of the park and are all administered together.
47	Olympic	1938-06-29	922649.41	3584187	This park on the Olympic Peninsula includes a wide range of ecosystems from Pacific shoreline to temperate rainforests to the glaciated alpine peaks of the Olympic Mountains, the tallest of which is Mount Olympus. The Hoh and Quinault Rainforests are the wettest areas in the contiguous United States, with the Hoh receiving an average of almost 12 ft (3.7 m) of rain every year. (WHS) (BR)
48	Petrified Forest	1962-12-09	221390.21	315951	This portion of the Chinle Formation has a large concentration of 225-million-year-old petrified wood. The surrounding Painted Desert features eroded cliffs of red-hued volcanic rock called bentonite. Dinosaur fossils and over 350 Native American sites are also protected in this park.
49	Pinnacles	2013-01-10	26685.73	343208	Named for the eroded leftovers of a portion of an extinct volcano, the park's massive black and gold monoliths of andesite and rhyolite are a popular destination for rock climbers. Hikers have access to trails crossing the Coast Range wilderness. The park is one of the few locations where the endangered California condor can be seen in the wild. Pinnacles also supports a dense population of prairie falcons and more than 13 species of bat that populate its talus caves.
50	Redwood	1968-10-02	138999.37	1202480	This park and the co-managed state parks protect almost half of all remaining coastal redwoods, the tallest trees on earth. There are three large river systems in this very seismically active area, and 37 miles (60 km) of protected coastline reveal tide pools and seastacks. The prairie, estuary, coast, river, and forest ecosystems contain a wide variety of animal and plant species. (WHS)
51	Rocky Mountain	1915-01-26	265847.74	4171431	Bisected north to south by the Continental Divide, this portion of the Rockies has ecosystems varying from over 150 riparian lakes to montane and subalpine forests to treeless alpine tundra. Wildlife including elk, moose, mule deer, bighorn sheep, black bears, and cougars inhabit its igneous mountains and glacial valleys. Longs Peak, a classic Colorado fourteener, and the scenic Bear Lake are popular destinations, as well as the historic Trail Ridge Road, which reaches an elevation of more than 12,000 feet (3,700 m). (BR)
52	Saguaro	1994-10-14	92876.75	847749	Split into the separate Rincon Mountain and Tucson Mountain districts, this park is evidence that the dry Sonoran Desert is still home to a great variety of life spanning six biotic communities. Beyond the namesake giant saguaro cacti, there are barrel cacti, chollas, and prickly pears, as well as lesser long-nosed bats, spotted owls, and javelinas.
53	Sequoia	1890-09-25	404062.63	1378337	This park protects the Giant Forest, which boasts some of the world's largest trees, the General Sherman being the largest measured tree in the park. Other features include over 240 caves, a long segment of the Sierra Nevada including the tallest mountain in the contiguous United States, and Moro Rock, a large granite dome. (BR)
54	Shenandoah	1935-12-26	200445.92	1682152	Shenandoah's Blue Ridge Mountains are covered by hardwood forests that teem with a wide variety of wildlife. The Skyline Drive and Appalachian Trail run the entire length of this narrow park, along with more than 500 miles (800 km) of hiking trails passing scenic overlooks and cataracts of the Shenandoah River.
55	Theodore Roosevelt	1978-11-10	70446.89	729893	This region that enticed and influenced President Theodore Roosevelt consists of a park of three units in the northern badlands. Besides Roosevelt's historic cabin, there are numerous scenic drives and backcountry hiking opportunities. Wildlife includes American bison, pronghorn, bighorn sheep, and wild horses.
56	Virgin Islands	1956-08-02	15052.33	471074	This island park on Saint John preserves pristine beaches surrounded by mangrove forests, seagrass beds, and coral reefs. It also has Taíno archaeological sites and the ruins of sugar plantations from Columbus 's time.
57	Voyageurs	1975-04-08	218222.35	206326	This park protecting four lakes near the Canada–US border is a site for canoeing, kayaking, and fishing. The park also preserves a history populated by Ojibwe Native Americans, French fur traders called voyageurs, and gold miners. Formed by glaciers, the region features tall bluffs, rock gardens, islands, bays, and several historic buildings.
58	White Sands	2019-12-20	146344.31	659742	Located in the mountain-ringed Tularosa Basin, White Sands consists of the southern part of a 275-square-mile (710 km 2 ) field of white sand dunes composed of gypsum crystals—the world's largest gypsum dunefield. The park is completely within the White Sands Missile Range and is subject to closure when tests are conducted.
59	Wind Cave	1903-01-09	33970.84	606258	Wind Cave is distinctive for its calcite fin formations called boxwork, a unique formation rarely found elsewhere, and needle-like growths called frostwork. It is one of the longest caves in the world and creates a wind as air pressure changes. Above ground is a mixed-grass prairie with animals such as bison, black-footed ferrets, and prairie dogs and ponderosa pine forests home to cougars and elk. The cave is culturally significant to the Lakota people as a creation site.
60	Wrangell–St. Elias	1980-12-02	8323146.48	108840	The largest national park in the system protects the convergence of the Alaska, Chugach, Wrangell, and Saint Elias Ranges, which include many of the continent's tallest mountains and volcanoes, including the 18,008-foot Mount Saint Elias. More than a quarter of the park is covered with glaciers, including the tidewater Hubbard Glacier, piedmont Malaspina Glacier, and valley Nabesna Glacier. (WHS)
61	Yellowstone	1872-03-01	2219790.71	4762988	Situated on the Yellowstone Caldera, the park has an expansive network of geothermal areas including boiling mud pots, vividly colored hot springs such as Grand Prismatic Spring, and regularly erupting geysers, the best-known being Old Faithful. The yellow-hued Grand Canyon of the Yellowstone River contains several high waterfalls, and four mountain ranges traverse the park. More than 60 mammal species including timber wolves, grizzly bears, black bears, lynxes, bison, and elk make this park one of the best wildlife viewing spots in the country. (WHS) (BR)
62	Yosemite	1890-10-01	761747.50	4278413	Yosemite features sheer granite cliffs, exceptionally tall waterfalls, and old-growth forests at a unique intersection of geology and hydrology. Half Dome and El Capitan rise from the park's centerpiece, the glacier-carved Yosemite Valley, and from its vertical walls drop Yosemite Falls, one of North America's tallest waterfalls at 2,425 feet (739 m) high. Three giant sequoia groves, along with a pristine wilderness in the heart of the Sierra Nevada, are home to a wide variety of rare plant and animal species. (WHS)
63	Zion	1919-11-19	147242.66	4984525	Located at the junction of the Colorado Plateau, Great Basin, and Mojave Desert, this park contains sandstone features such as mesas, rock towers, and canyons, including the Virgin River Narrows. The various sandstone formations and the forks of the Virgin River create a wilderness divided into four ecosystems: desert, riparian, woodland, and coniferous forest.
\.


--
-- Data for Name: park_designation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.park_designation (park_id, designation_id) FROM stdin;
5	2
11	1
12	2
13	2
16	2
17	2
18	2
19	1
19	2
22	1
22	2
23	1
23	2
24	1
25	2
28	1
28	2
30	2
31	1
31	2
34	2
35	2
38	2
42	1
42	2
43	1
47	1
47	2
50	1
51	2
53	2
60	1
61	1
61	2
62	1
\.


--
-- Data for Name: park_state; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.park_state (park_id, state_id) FROM stdin;
1	12
2	2
3	28
4	24
5	26
6	7
7	6
8	28
9	28
10	28
11	18
12	5
13	23
14	22
15	21
16	5
16	17
17	1
18	7
19	7
20	1
21	15
22	16
23	1
24	3
25	32
26	17
27	6
28	19
28	25
29	26
30	8
31	8
32	4
33	10
34	13
35	5
36	1
37	1
38	5
39	1
40	1
41	5
42	11
43	6
44	30
45	31
46	30
47	30
48	3
49	5
50	5
51	6
52	3
53	5
54	29
55	20
56	27
57	14
58	18
59	24
60	1
61	32
61	16
61	9
62	5
63	28
\.


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.state (state_id, state_name, is_territory) FROM stdin;
1	Alaska	f
2	American Samoa	t
3	Arizona	f
4	Arkansas	f
5	California	f
6	Colorado	f
7	Florida	f
8	Hawaii	f
9	Idaho	f
10	Indiana	f
11	Kentucky	f
12	Maine	f
13	Michigan	f
14	Minnesota	f
15	Missouri	f
16	Montana	f
17	Nevada	f
18	New Mexico	f
19	North Carolina	f
20	North Dakota	f
21	Ohio	f
22	Oregon	f
23	South Carolina	f
24	South Dakota	f
25	Tennessee	f
26	Texas	f
27	U.S. Virgin Islands	t
28	Utah	f
29	Virginia	f
30	Washington	f
31	West Virginia	f
32	Wyoming	f
\.


--
-- Data for Name: visit_record; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.visit_record (visit_id, park_id, visit_year, visitor_count) FROM stdin;
1	1	2025	4079318
2	2	2025	43258
3	3	2025	1511740
4	4	2025	1139361
5	5	2025	568104
6	6	2025	486567
7	7	2025	250086
8	8	2025	1967367
9	9	2025	796057
10	10	2025	1388476
11	11	2025	410778
12	12	2025	227186
13	13	2025	287833
14	14	2025	632242
15	15	2025	3025325
16	16	2025	1320134
17	17	2025	543300
18	18	2025	89355
19	19	2025	778198
20	20	2025	14923
21	21	2025	2209028
22	22	2025	3136557
23	23	2025	740044
24	24	2025	4430653
25	25	2025	3800648
26	26	2025	161210
27	27	2025	432498
28	28	2025	11527939
29	29	2025	206423
30	30	2025	853711
31	31	2025	1877854
32	32	2025	2494611
33	33	2025	2629497
34	34	2025	29091
35	35	2025	2932644
36	36	2025	34479
37	37	2025	425369
38	38	2025	779791
39	39	2025	7786
40	40	2025	19778
41	41	2025	504777
42	42	2025	660734
43	43	2025	463130
44	44	2025	1635342
45	45	2025	1958440
46	46	2025	46925
47	47	2025	3584187
48	48	2025	315951
49	49	2025	343208
50	50	2025	1202480
51	51	2025	4171431
52	52	2025	847749
53	53	2025	1378337
54	54	2025	1682152
55	55	2025	729893
56	56	2025	471074
57	57	2025	206326
58	58	2025	659742
59	59	2025	606258
60	60	2025	108840
61	61	2025	4762988
62	62	2025	4278413
63	63	2025	4984525
\.


--
-- Name: designation_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.designation_designation_id_seq', 2, true);


--
-- Name: park_park_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.park_park_id_seq', 63, true);


--
-- Name: state_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.state_state_id_seq', 32, true);


--
-- Name: visit_record_visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.visit_record_visit_id_seq', 63, true);


--
-- Name: designation designation_designation_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designation
    ADD CONSTRAINT designation_designation_name_key UNIQUE (designation_name);


--
-- Name: designation designation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designation
    ADD CONSTRAINT designation_pkey PRIMARY KEY (designation_id);


--
-- Name: park_designation park_designation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.park_designation
    ADD CONSTRAINT park_designation_pkey PRIMARY KEY (park_id, designation_id);


--
-- Name: park park_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.park
    ADD CONSTRAINT park_name_key UNIQUE (name);


--
-- Name: park park_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.park
    ADD CONSTRAINT park_pkey PRIMARY KEY (park_id);


--
-- Name: park_state park_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.park_state
    ADD CONSTRAINT park_state_pkey PRIMARY KEY (park_id, state_id);


--
-- Name: state state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (state_id);


--
-- Name: state state_state_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_state_name_key UNIQUE (state_name);


--
-- Name: visit_record visit_record_park_id_visit_year_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visit_record
    ADD CONSTRAINT visit_record_park_id_visit_year_key UNIQUE (park_id, visit_year);


--
-- Name: visit_record visit_record_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visit_record
    ADD CONSTRAINT visit_record_pkey PRIMARY KEY (visit_id);


--
-- Name: park_designation park_designation_designation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.park_designation
    ADD CONSTRAINT park_designation_designation_id_fkey FOREIGN KEY (designation_id) REFERENCES public.designation(designation_id) ON DELETE CASCADE;


--
-- Name: park_designation park_designation_park_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.park_designation
    ADD CONSTRAINT park_designation_park_id_fkey FOREIGN KEY (park_id) REFERENCES public.park(park_id) ON DELETE CASCADE;


--
-- Name: park_state park_state_park_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.park_state
    ADD CONSTRAINT park_state_park_id_fkey FOREIGN KEY (park_id) REFERENCES public.park(park_id) ON DELETE CASCADE;


--
-- Name: park_state park_state_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.park_state
    ADD CONSTRAINT park_state_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.state(state_id) ON DELETE CASCADE;


--
-- Name: visit_record visit_record_park_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visit_record
    ADD CONSTRAINT visit_record_park_id_fkey FOREIGN KEY (park_id) REFERENCES public.park(park_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict q95beaEIzG80a2OcsR0BBDXx5VcSdkfFEnMl0WeGa7QGx1OzDtxsbESvcAqJDiz

