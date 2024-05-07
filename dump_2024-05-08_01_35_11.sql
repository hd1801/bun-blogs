--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE blogs;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:qCVn3x0drw8DjwprDZcgFw==$dC6Mqw5/nms0NmDROF9MRkLzMjBCOCdzehc1gVj/QIg=:L0g2aXB/Fu9LPM1TDtFmcrPAOqZSUHoI1wCHwJy0X9o=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "blogs" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: blogs; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE blogs WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE blogs OWNER TO postgres;

\connect blogs

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: Blog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Blog" (
    id integer NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    "bannerImage" text,
    "AuthorId" integer NOT NULL,
    "publishedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Blog" OWNER TO postgres;

--
-- Name: BlogTag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BlogTag" (
    id integer NOT NULL,
    "BlogId" integer NOT NULL,
    "TagId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."BlogTag" OWNER TO postgres;

--
-- Name: BlogTag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."BlogTag_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."BlogTag_id_seq" OWNER TO postgres;

--
-- Name: BlogTag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."BlogTag_id_seq" OWNED BY public."BlogTag".id;


--
-- Name: Blog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Blog_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Blog_id_seq" OWNER TO postgres;

--
-- Name: Blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Blog_id_seq" OWNED BY public."Blog".id;


--
-- Name: RefreshToken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RefreshToken" (
    id integer NOT NULL,
    "UserId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."RefreshToken" OWNER TO postgres;

--
-- Name: RefreshToken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RefreshToken_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."RefreshToken_id_seq" OWNER TO postgres;

--
-- Name: RefreshToken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RefreshToken_id_seq" OWNED BY public."RefreshToken".id;


--
-- Name: Tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tag" (
    id integer NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Tag" OWNER TO postgres;

--
-- Name: Tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tag_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Tag_id_seq" OWNER TO postgres;

--
-- Name: Tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tag_id_seq" OWNED BY public."Tag".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email text NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: UserPassword; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserPassword" (
    id integer NOT NULL,
    "UserId" integer NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."UserPassword" OWNER TO postgres;

--
-- Name: UserPassword_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."UserPassword_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."UserPassword_id_seq" OWNER TO postgres;

--
-- Name: UserPassword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."UserPassword_id_seq" OWNED BY public."UserPassword".id;


--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_id_seq" OWNER TO postgres;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: Blog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Blog" ALTER COLUMN id SET DEFAULT nextval('public."Blog_id_seq"'::regclass);


--
-- Name: BlogTag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlogTag" ALTER COLUMN id SET DEFAULT nextval('public."BlogTag_id_seq"'::regclass);


--
-- Name: RefreshToken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RefreshToken" ALTER COLUMN id SET DEFAULT nextval('public."RefreshToken_id_seq"'::regclass);


--
-- Name: Tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tag" ALTER COLUMN id SET DEFAULT nextval('public."Tag_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Name: UserPassword id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPassword" ALTER COLUMN id SET DEFAULT nextval('public."UserPassword_id_seq"'::regclass);


--
-- Data for Name: Blog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Blog" (id, title, content, "bannerImage", "AuthorId", "publishedAt", "createdAt", "updatedAt") FROM stdin;
1	I'm a programmer and I'm stupid	I've been writing code for money for 15 years. I've tried other roles — product management, analytics, testing — but they didn't stick. And over the years, I've learned that I'm pretty dumb. Unfortunately.\r\n\r\nI haven't been diagnosed with any specific medical condition, but my mental capacity is very limited. I find even easier Leetcode problems challenging. Reading about a basic consensus algorithm makes my head explode. I can't really follow complex dependencies in a code base. I can't learn a fancy language like Rust (I tried, but honestly, it's too much). I hate microservices and modern frontends because there are so many moving parts, I can't keep track of them all.\r\n\r\nSo what do I do about it?\r\n\r\nI use the simplest mainstream language available (Go) and very basic Python. I write simple (though sometimes verbose) code that is easy to understand and maintain. I avoid deep abstractions and always choose composition over inheritance or mixins. I only use generics when absolutely necessary. I prefer flat data structures whenever possible.\r\n\r\nI introduce as few external dependencies as possible (ideally zero[1](https://antonz.org/stupid/?ref=dailydev#fn:1)). I design modules with clear APIs (not in a Robert Martin's definition of "clear"), but almost never extract them into microservices. I use JSON-over-HTTP APIs, but never GraphQL. I took the time to learn SQL and use it a lot[2](https://antonz.org/stupid/?ref=dailydev#fn:2). I apply basic resilience patterns like timeouts, circuit breakers, and backpressure.\r\n\r\nI try to use as few software components as possible. Ideally, just the application itself, SQLite or PostgreSQL for data storage, and Docker with a sprinkle of shell for deployments. Nginx/HAProxy as needed. No API gateways, no sharding, no distributed caches, no message queues, no NoSQL/NewSQL/Graph/whatever databases, no service discovery, no federation, no cloud native, no FAANG-level best practices.\r\n\r\nI draw dependency graphs and sequence diagrams to understand legacy code. I write comments to remind future me why a certain function does what it does, or why a certain if branch is necessary. I write documentation, trying to make it concise and readable. I write examples, lots of them. Sometimes even interactive[3](https://antonz.org/stupid/?ref=dailydev#fn:3).\r\n\r\nThe software I build seems to work okay. It won't impress a Google engineer, that's for sure. But it serves its users and the business reasonably well.\r\n\r\nSo being stupid kind of works for me.\r\n\r\n\r\n1. [Zero dependency club](https://github.com/nalgeon/zero) [↩︎](https://antonz.org/stupid/?ref=dailydev#fnref:1)\r\n2. [SQL window functions explained](https://antonz.org/sql-window-functions-ranking/) [↩︎](https://antonz.org/stupid/?ref=dailydev#fnref:2)\r\n3. [Interactive code examples for fun and profit](https://antonz.org/code-examples/) [↩︎](https://antonz.org/stupid/?ref=dailydev#fnref:3)\r\n\r\n\r\n\r\n1.	https://plus.unsplash.com/premium_photo-1674939148088-d71acc1541ff?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8	1	2024-05-06 18:09:52.74	2024-05-06 18:09:52.741	2024-05-06 18:09:52.741
2	Fixing the Git Blame Beachball	We had just finished making the change, I ran `git commit`, and immediately Zed froze, started to [beachball…](https://en.wikipedia.org/wiki/Spinning_pinwheel), and 10 seconds later it was back.\r\n\r\n\r\n\r\nI tried again: make a change, `git commit`, see a beachball. Uh Oh.\r\n\r\nZed is supposed to be fast. What's going on?\r\n\r\n\r\n\r\nWe pulled open [Instruments](https://help.apple.com/instruments/mac/current/#/dev7b09c84f5) and ran a CPU profile:\r\n\r\n\r\n\r\n![macOS Instruments showing a Severe Hang, and no CPU usage.](https://zed.dev/img/post/git-blame-beachball/cpu-profile.png)macOS Instruments showing a Severe Hang, and no CPU usage.\r\n\r\nHmm... our process is doing... nothing...? That doesn't make sense. At least Instruments agrees that this is a "Severe Hang".\r\n\r\nMikayla did some searching and found [this post](https://www.wwdcnotes.com/notes/wwdc23/10248/), that suggested we try the "Thread State" instrument:\r\n\r\n![Thread State instruments showing the main thread is blocked.](https://zed.dev/img/post/git-blame-beachball/thread-state.png)Thread State instruments showing the main thread is blocked.\r\n\r\nWell, that's interesting, the main thread is indeed blocked (and indeed so are almost all our backgrount threads). But why?\r\n\r\nStumbling across the "OS Fundamentals" sub-instrument in the drop-down on the left led us to the answer.\r\n\r\n![OS Fundamentals sub-instrument showing a psynch\\_cvwait syscall](https://zed.dev/img/post/git-blame-beachball/psynch-cvwait.png)\r\n\r\n\r\n\r\nOS Fundamentals sub-instrument showing a psynch\\_cvwait syscall\r\n\r\nIt's stuck in a syscall [`psynch_cvwait`](https://pubs.opengroup.org/onlinepubs/7908799/xsh/pthread_cond_wait.html). That's a condition variable wait, but what's it waiting for? None of our background threads seem to be doing anything either...\r\n\r\nLooking at the stack-trace by clicking the bottom-most right-most icon gives us a glimmer of a clue, but more of a "that shouldn't happen".\r\n\r\n\r\n\r\n![Backtrace from the main thread](https://zed.dev/img/post/git-blame-beachball/backtrace.png)\r\n\r\nBacktrace from the main thread\r\n\r\n\r\n\r\nIt looks like the main thread is blocking deliberately, in a `block_with_timeout`. We do this in a few places to ensure that if we can do a user-visible task quickly the result shows up on the next frame. That said the timeout is set to `5ms` so that if the task takes longer than expected we don't block the UI thread. In this case we blocked for `4550ms` which is, checks notes, about 1000 times too long.\r\n\r\n\r\n\r\nPushing that question to the side: Why isn't the main thread being woken up after 5ms? We continued clicking around in Instruments.\r\n\r\n\r\n\r\nLooking at the Narrative view in the bottom right, we get our first real hint:\r\n\r\n\r\n\r\n![The Narrative around the time the thread was unblocked](https://zed.dev/img/post/git-blame-beachball/narrative.png)The Narrative around the time the thread was unblocked\r\n\r\n"The thread was made runnable by `git`". Interesting. Given that I was triggering this with a `git commit` it wasn't surprising that git was running, but it was surprising that it'd be blocking Zed.\r\n\r\nFiltering the Narrative view by `git` reveals something even more interesting. It looks like almost every time our app is woken, it's being woken by git, and not just that, it's a different git process each time. We have 257 git processes running?!\r\n\r\n\r\n\r\n![A large number of git process-swaps in the Narrative](https://zed.dev/img/post/git-blame-beachball/git.png)\r\n\r\n\r\n\r\nA large number of git process-swaps in the Narrative\r\n\r\nThe most recent feature we added in this space was [Inline Git Blame](https://zed.dev/docs/configuring-zed#inline-git-blame), so that was the prime suspect. Sure enough, disabling that eliminated the problem.\r\n\r\n\r\n\r\nFrom there it was relatively easy to track down. When we'd added the `git blame` code it was to power the gutter, and so the assumption was that it would be open in one or two files at a time. We set up a bunch of event listeners so that if the git index changed, then the blame would update.\r\n\r\nUnfortunately, because git blame is now enabled for every file, and we had 257 files open, every time I changed the git index by committing, Zed would spawn 257 git processes simultaneously. Oops! ([now fixed…](https://github.com/zed-industries/zed/pull/11274)).\r\n\r\n\r\n\r\nThat leaves only the mystery of why the main thread wasn't being woken up after 5ms. I think part of the problem here is contention – our process tree is using as much CPU as it can spawning git processes - but that's not the whole story.\r\n\r\n\r\n\r\nIn order to wake up the main thread after a few milliseconds, we spawn a background task that sleeps for the required time, and then signals (via the condition variable) the main thread to resume. Unfortunately GPUI timers on macOS were being run with a lower priority than background tasks. A classic priority inversion: The main thread was waiting on the lowest-priority task, which was in turn blocked by all our git processes. Oops again! ([also now fixed…](https://github.com/zed-industries/zed/pull/11269)).\r\n\r\n\r\n\r\nWe take great pride in making Zed fast, and it's a little embarrassing when we accidentally make it slow. That said, it's always fun to dig in and figure out what's going on.\r\n\r\nThese fixes shipped in v0.133.7, along with fixes for a few other hangs that we discovered using our [new monitoring tool](https://github.com/zed-industries/zed/pull/11190) (blog post to follow!).\r\n\r\n\r\n\r\nIf your Zed beachballs, please file an issue, we'd love to dig in with you and figure it out.\r\n\r\n***	https://zed.dev/img/post/git-blame-beachball/thread-state.png	1	2024-05-06 18:40:49.327	2024-05-06 18:40:49.328	2024-05-06 18:40:49.328
3	Array.shift optimizations in Firefox's JS Engine	When working with arrays in Javascript, there's two sets of functions if you want to add or remove items to an array to a certain end of the array.\r\n\r\n* `shift` / `unshift`: remove / add items at the front of the array.\r\n* `pop` / `push`: remove / add items at the end of an array.\r\n\r\nI had a scenario where using `shift` acted differently than I expected and lead to some interesting results.\r\n\r\n## How Array.shift works\r\n\r\nBy definition on [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift):\r\n\r\n> The shift method removes the element at the zeroeth index and shifts the values at consecutive indexes down, then returns the removed value. If the length property is 0, undefined is returned.\r\n\r\nIt will take an item off the array and shift every other item over.\r\n\r\nLet's have an example with a simple array of size 6 counting the numbers 0-5.\r\n\r\n![Illustration of an array](https://res.cloudinary.com/dcqugs1mm/image/upload/f_auto,q_auto/portfolio-11ty/array.png)\r\n\r\nIf you ran this code on it:\r\n\r\n`let arr = [0, 1, 2, 3, 4, 5];`\r\n`array.shift();`\r\n\r\nIt would return the number `0` and the array remaining would be `[1, 2, 3, 4, 5]`. Now that's fine for a small array as it shifted the 5 remaining items over.\r\n\r\n![Illustration of a shift where all items have to move over to the left by one each](https://res.cloudinary.com/dcqugs1mm/image/upload/f_auto,q_auto/portfolio-11ty/shift-slow.png)\r\n\r\nbut what if we had an array of size 100,000? Or what if the items of the array were complex objects? Thinking about this algorithm simply, it does not scale as you would need to traverse a large amount of data every time you ran `array.shift()`.\r\n\r\nI was working on a codebase that ran into this bottleneck, but what perplexed me was how in Firefox it ran almost instantly while in Node / Chrome it took seconds to complete. To figure out how this actually worked, I dug around and found some inner workings of how Firefox implements this function which gives it a huge performance boost.\r\n\r\n## Perf Boost with Pointers\r\n\r\nWhen thinking about JavaScript runtimes which the JS will be run on, not all work the same. JS that runs in Chrome may run faster or slower in Firefox, Safari, etc. There is standards around the JS language and how it should behave, but how each function or algorithm is implemented is up to the people building these JS runtimes.\r\n\r\nIn the case of Firefox, their engine is called SpiderMonkey which is mainly written in C / C++. With that being the case, arrays in C are pointers that tell a computer at what memory address is the beginning of an array. Up till 2017, the `array.shift` method that was implemented in SpiderMonkey was a slow implementation that it had to move items one by one. In 2017, though, some engineers at Mozilla had [an idea](https://jandemooij.nl/blog/2017/12/06/some-spidermonkey-optimizations-in-firefox-quantum/): what if instead of moving the items one by one in a shift, you just move the pointer or tell the computer a new address to where the array starts.\r\n\r\n![Illustration of a shift where only the pointer is moved over one to the right](https://res.cloudinary.com/dcqugs1mm/image/upload/f_auto,q_auto/portfolio-11ty/shift-fast.png)\r\n\r\nSo now there is just 2 computations in the end.\r\n\r\n1. Moving the first item off the array.\r\n2. Move the pointer of the front of the array over by one.\r\n\r\nIn terms of time complexity, this reduces a linear process to a constant process (O(n) to O(1)). So no matter the size of the array, on average the shift would happen instantly.\r\n\r\n## End Results\r\n\r\nSo we found out that `array.shift` is now fast in Firefox, so we can stick with it and move on with our day? It would be great, but sadly no. As this project that lead me to discover these details is a universal JS package, it should be able to run on any JS runtime with comparable performance. Chrome has a similar algorithm, but it only works for arrays under size of ~50k items (A story for another day). So in the end, `shift` wasn't going to pan out when working with large arrays in this case, but the sleuthing I did provided an example that programming language specifications and implementations can differ and give the creative freedoms for the engineers building these runtimes or compilers to highly optimize these internal functions to great extents.	https://res.cloudinary.com/dcqugs1mm/image/upload/f_auto,q_auto,w_800/portfolio-11ty/shift-fast.png	1	2024-05-07 15:41:15.752	2024-05-07 15:41:15.753	2024-05-07 15:41:15.753
4	Alibaba's Yitian 710 is the fastest Arm-based CPU for cloud servers, study claims	A recent study [published in the IEEE's *Transactions on Cloud Computing*](https://www.computer.org/csdl/journal/cc/5555/01/10509007/1WslxL3gwwM) journal has demonstrated that Alibaba Cloud's 128-core Yitian 710 processor, developed in 2021, is currently the most efficient Arm-based server processor for database tasks in large-scale cloud environments, reports [*The Register*](https://www.theregister.com/2024/04/29/arm_cloud_server_database_performance/). The research conducted by Dumitrel Loghin from the National University of Singapore, showcases the Yitian 710 outperforming other Arm-based processors and even surpassing Intel's Xeon Platinum in some specific tests.\r\n\r\n\r\n\r\nThe research assessed a variety of Arm server CPUs and compared them against the Intel Xeon Platinum 8488C, which was launched in the first quarter of 2023. This comparative analysis was performed across eight different cloud platforms to determine which CPU handles database-related tasks most effectively. Among the Arm processors evaluated  — [Amazon](https://www.tomshardware.com/tag/amazon)'s 64-coreGraviton 2/3, Huawei's 60-core Kunpeng 920, and Ampere's Altra 80-core processor — the Yitian 710 emerged as a standout performer, especially noteworthy given its newer technological underpinnings. As for workloads, they included Dhrystone and Whetstone [benchmarks](https://www.tomshardware.com/tag/benchmark), measuring the number of kernel system calls and execl calls each system made, testing file copy speeds, assessing the overall UnixBench score, and conducting RSA 2048 signing and verification tasks.\r\n\r\n\r\n\r\nAlibaba's Yitian 710 was ahead of its rivals in synthetic Dhrystone and Whetstone benchmarks and significantly challenged Intel's Xeon 8488C, which demonstrates its huge potential. The Yitian 710 also outperformed its competitors in File Copy, UnixBench, and RSA 2048 signing and verification tests.\r\n\r\n\r\n\r\nDespite the strengths of the Yitian 710, AWS's Graviton 3 surpassed it in the Redis benchmark. However, the Yitian 710 maintained its advantage in handling memcached throughput and in two out of three RocksDB throughput tasks, the report says.\r\n\r\n\r\n\r\nThe study also highlighted the Yitian 710's technological advantages, such as its use of the latest Arm instruction set architecture (ISA) and DDR5 SDRAM in 2021, which contributed significantly to its high performance. On the other hand, Huawei's cloud offers a unique feature where two Kunpeng 920 CPUs can run in a Non-Uniform Memory Access (NUMA) topology, a capability unmatched by any other cloud provider's Arm servers.\r\n\r\n\r\n\r\nCost efficiency was another focal point of the research. Although Arm servers require more system calls than their Intel counterparts (which is potentially inefficient), they still offer better value in some scenarios. This is particularly relevant as cloud providers continue to optimize for cost-effectiveness without compromising\r\nThe study suggests that with incremental improvements, such as slight increases in clock speeds and optimizations in Linux kernel system calls, Arm servers like the Yitian 710 could become even more competitive. The research recommends leveraging Arm-specific features like Scalable Vector Extensions to boost performance in respective workloads, potentially positioning Arm servers as a viable alternative to more established AMD EPYC and Intel Xeon servers in [cloud computing](https://www.tomshardware.com/tag/cloud-computing) scenarios.	https://cdn.mos.cms.futurecdn.net/M9s4X395kDajV9RZQYMxnX-970-80.png.webp	1	2024-05-07 15:43:50.179	2024-05-07 15:43:50.18	2024-05-07 15:43:50.18
5	4 Software Design Principles I Learned the Hard Way	I recently built and designed a massive service that (finally) launched successfully last month. During the design and implementation process, I found that the following list of “rules” kept coming back up over and over in various scenarios.\r\n\r\nThese rules are common enough that I daresay that at least one of them will be useful for a project that any software engineers reading this are *currently* working on. But if you can’t apply it directly now, I hope that these principles are a useful thought exercise that you are free to comment on below or challenge directly too.\r\n\r\nOne thing I will note here is that of course - each “principle” has a time and place. Nuance is necessary, as always. These are conclusions that I find myself erring towards *in general* because oftentimes, *the opposite that is the default* that I see when I’m reviewing code or reading design docs.\r\n\r\n\r\n\r\n## **1. Maintain one source of truth.**\r\n\r\n\r\n\r\nIf there’s two sources of truth, one is probably wrong. If it’s not wrong, it’s not wrong… yet. \r\n\r\nBasically, if you’re trying to maintain a piece of state in two different locations within the same service… just don’t. It’s better to try to just reference the same state wherever you can. For example, if you’re maintaining a frontend application and have a bank balance that is from the server, I’ve seen enough sync bugs in my time that I always want to get that balance from the server. If there is some balance that is derived from that, such as “spendable balance” versus “total” (for example, some banks make you keep a minimum balance), then that “spendable balance” should be derived on-the-fly rather than stored separately. Else, you’ll now have to update both balances whenever a transaction happens.\r\n\r\nIn general, if there is a piece of data that is derived from another value, then that value should be derived rather than stored. Storing that value leads to synchronization bugs. (Yes, I know this isn’t always possible. There will always be other factors in play, like the expense of the derivation. At the end of the day, it’s a tradeoff.)\r\n\r\n\r\n\r\n## **2. Yes, please repeat yourself.**\r\n\r\n\r\n\r\nWe’ve heard of DRY (Don’t Repeat Yourself) and now I present to you PRY (Please Repeat Yourself).\r\n\r\n\r\n\r\nFar too many times I’ve seen code that looks *mostly* the same try to get abstracted out into a “re-usable” class. The problem is, this “re-usable” class gets one method added to it, then a special constructor, then a few more methods, until it’s this giant Frankenstein of code that serves multiple different purposes and the original purpose of the abstraction no longer exists.\r\n\r\n\r\n\r\nA pentagon may be *similar-looking* to a hexagon, but there is still enough of a difference that they are *absolutely not the same*. \r\n\r\nI’m also guilty of spending way too much time trying to make things reusable, when a bit of code duplication works perfectly fine. (Yes, you have to write more tests and it doesn’t scratch the “refactoring” itch, but oh well.)\r\n\r\n\r\n\r\n## **3. Don’t overuse mocks.**\r\n\r\n\r\n\r\nMocks. I have a love-hate relationship with mocks. My favorite one-liner from a [Reddit](https://www.reddit.com/r/programming/comments/1cckf07/comment/l1b66ok/) discussion about this post was “with mocks, we sell test fidelity for ease of testing.”\r\n\r\n\r\n\r\nMocks are great when I have to write unit tests to test something quickly and don’t want to mess with “prod-level” code. Mocks are not great when prod breaks because as it turns out - something you mocked broke deeper down the stack, even though that “deeper down the stack” is owned by another team. It doesn’t matter because it was your service that broke so it's your responsibility to fix it.\r\n\r\n\r\n\r\nWriting tests is hard. The line between unit tests and integration tests is blurrier than you think. Knowing what to mock and not mock is subjective.\r\n\r\nIt’s much nicer to find things while developing rather than in prod. As I continue writing software, I try to stay away from mocks if possible. Tests being a bit more heavyweight is completely worthwhile when it comes to a much higher reliability. If mocks are really required by my code reviewer, I’d rather write more (and maybe even redundant) tests rather than skip out on tests. Even if I can’t use a real dependency in a test, I will still try to use other options first before mocks, like a local server.\r\n\r\n[Google’s “Testing on the Toilet” has a good note on this from 2013.](https://testing.googleblog.com/2013/05/testing-on-toilet-dont-overuse-mocks.html) They note that overusing mocks causes:\r\n\r\n* Tests can be harder to understand because now you have this extra code someone has to understand along with the actual production code.\r\n* Tests can be harder to maintain because you have to tell a mock how to behave, which means you leak implementation details into your test.\r\n* Tests overall provide less assurance now because the reliability of your software now is only guaranteed IF your mocks behave exactly like your real implementations (which is hard to guarantee and often ends up out of sync).\r\n*\r\n\r\n## **4. Minimize mutable state.**\r\n\r\n\r\n\r\nComputers are VERY fast. In the optimization game, it’s super popular to instantly throw caching and store everything in a database immediately. I think this is probably the *end state* of most successful software products and services. Of course, most services will need some sort of state, but it’s important to figure out what is truly necessary storage-wise versus what can be derived on-the-fly. \r\n\r\nIn the “v1” of something, I’ve found that minimizing as much mutable state as possible gets you pretty far. It lets you develop faster because you don’t have to worry about sync bugs, conflicting data, and stale state. It also lets you develop functionality piece-by-piece, rather than introducing too much at once. Machines are fast enough today where doing a few redundant calculations is totally fine. If machines are supposedly “replacing us” soon, then they can handle a few extra work units of calculations.	https://substackcdn.com/image/fetch/w_320,h_213,c_fill,f_webp,q_auto:good,fl_progressive:steep,g_auto/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb8497dc0-e5fc-4a8b-8938-7b0c4bcf4f5d_1004x351.png	1	2024-05-07 15:46:28.838	2024-05-07 15:46:28.839	2024-05-07 15:46:28.839
6	The Advantages of Upgrading to MariaDB: Improved Performance, Better Security, and Modern Updates	MariaDB Merge is an open database system that offers a superior solution for organizations looking to upgrade their database system. With MariaDB, users can enjoy improved performance, better security, and modern updates compared to MySQL.\r\n\r\n\r\n\r\nFor startups and small businesses, MariaDB provides a cost-effective solution that is freely accessible and open-source. It maintains compatibility with MySQL, ensuring a seamless transition for users.\r\n\r\n\r\n\r\nOne of the key advantages of MariaDB Merge is its improved performance. With optimized storage engines and query execution, MariaDB offers faster response times and increased scalability, making it ideal for businesses with growing data needs.\r\n\r\n\r\n\r\nIn addition to performance, MariaDB also enhances security. It includes advanced security features such as encryption at rest and in transit, as well as robust user access controls. These measures help protect sensitive data and ensure compliance with data privacy regulations.\r\n\r\n\r\n\r\nFurthermore, MariaDB offers modern updates that are not available in MySQL. This includes support for JSON data types, allowing users to easily store and query JSON documents. Additionally, MariaDB incorporates new SQL features and optimizations that further improve performance and productivity.\r\n\r\n\r\n\r\nOverall, upgrading to MariaDB Merge provides numerous benefits for organizations. It combines improved performance, better security, and modern updates in a cost-effective and accessible package. With its compatibility with MySQL, organizations can seamlessly transition to MariaDB without hassle. Upgrade your database system to MariaDB Merge today and experience the ultimate open database system.	https://i.ytimg.com/vi/Vx4UVIaCbK8/sddefault.jpg	1	2024-05-07 15:48:14.67	2024-05-07 15:48:14.671	2024-05-07 15:48:14.671
7	The 5 Must-Know Backend Frameworks in 2024	Hey there fellow developers! 🌟 Today, let's dive into the buzzing world of Node.js and uncover the top 5 backend frameworks making waves in 2024. Buckle up for a rollercoaster of coding fun! 🎢\r\n\r\n\r\n\r\nIntroduction: Unveiling the Backend Marvels\r\n\r\nSince 2009, Node.js has been stealing the spotlight, becoming the go-to choice for backend developers. With big players like Netflix and PayPal on board, it's like the rockstar of web development. 🤘\r\n[<img height="381" width="709" alt="Top 5 Node.js Frameworks for Building Awesome APIs in 2024" src="https://res.cloudinary.com/practicaldev/image/fetch/s--1sOOXm-5--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:1400/format:webp/0%2AUU13NDpv5jqgj0z-.png" />](https://res.cloudinary.com/practicaldev/image/fetch/s--1sOOXm-5--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:1400/format:webp/0%2AUU13NDpv5jqgj0z-.png)\r\n\r\nThe reason for the increase in popularity is the reduction in loading time and performance improvements. Therefore, it is crucial to analyze the top 5 Node.js Backend frameworks for 2024.\r\n\r\nHence, this article will cover the top 5 Node.js backend frameworks for 2024, their features, and common use cases.\r\n[<img height="501" width="800" alt="Top 5 Node.js Frameworks for Building Awesome APIs in 2024" src="https://res.cloudinary.com/practicaldev/image/fetch/s--5nzfjaln--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:1400/format:webp/0%2Ad7dpAQv4C4WVf8lN.png" />](https://res.cloudinary.com/practicaldev/image/fetch/s--5nzfjaln--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:1400/format:webp/0%2Ad7dpAQv4C4WVf8lN.png)\r\n\r\n[<img height="706" width="800" alt="Top 5 Node.js Frameworks for Building Awesome APIs in 2024" src="https://res.cloudinary.com/practicaldev/image/fetch/s--7B-1WKTY--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:2000/format:webp/0%2A_G7NuFUCxsx4VLH8.png" />](https://res.cloudinary.com/practicaldev/image/fetch/s--7B-1WKTY--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:2000/format:webp/0%2A_G7NuFUCxsx4VLH8.png)\r\n\r\n## **Express.js: Where Minimalism Meets Power 💪**\r\n\r\n[<img height="450" width="800" alt="Express.js" src="https://res.cloudinary.com/practicaldev/image/fetch/s--GGKf0iUj--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:1400/format:webp/0%2AZlNBy_nduVHVmDot.png" />](https://res.cloudinary.com/practicaldev/image/fetch/s--GGKf0iUj--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:1400/format:webp/0%2AZlNBy_nduVHVmDot.png)\r\nExpress.js, the heartthrob of Node.js frameworks. Open-source, freely available, and a favorite among both newbie and seasoned developers. Perfect for crafting web applications and snazzy RESTful APIs.\r\n\r\n## Key Features: The Express.js Showtime 🎬\r\n\r\n**1. Efficient Routing: Handling HTTP requests like a boss! 🚀**\r\nExpress.js makes handling HTTP requests a breeze. Picture it like a GPS for your code, efficiently directing requests to specific tasks. 🗺️ Let's break it down with a quick example:\r\n\r\n\r\n// app.js\r\nconst express = require('express');\r\nconst app = express();\r\nconst port = 3000;\r\n\r\n// Homepage Route\r\napp.get('/', (req, res) => {\r\n&#x20; res.send('Welcome to the homepage!');\r\n});\r\n\r\n// User Profile Page Route\r\napp.get('/user/:id', (req, res) => {\r\n&#x20; const userId = req.params.id;\r\n&#x20; res.send(\\`User Profile Page - ID: ${userId}\\`);\r\n});\r\n\r\n\r\n**2. Middleware Support 🦸‍♂️**\r\n\r\nExpress.js allows middleware support for handling HTTP requests. Let’s look at a simple example of creating a middleware for logging HTTP request details.\r\n\r\n\r\nconst express = require('express');\r\nconst app = express();\r\nconst port = 3000;\r\n\r\napp.use((req, res, next) => {\r\n&#x20; console.log(\\`\\[${new Date().toLocaleString()}] ${req.method} ${req.url}\\`);\r\n&#x20; next();\r\n});\r\n\r\n\r\n**3. Easy Database Integration: It's the Tinder of databases.**\r\n**Express.js swipes right for all! 💑**\r\n\r\nExpress.js offers remarkable flexibility in the realm of databases. It doesn't limit you to a specific database, but instead, it allows developers the liberty to select their preferred database system. This flexibility is made possible by the modular and adaptable nature of Express.js. The smooth integration with databases is achieved through its modular design and the abundance of npm packages dedicated to database connectivity. This lively ecosystem provides developers with the tools to seamlessly link Express.js with various databases, guaranteeing a streamlined and efficient development journey. 🚀\r\n\r\n**4. Beginner-Friendly Brilliance:**\r\nExpress.js takes the crown for its straightforward and minimalist design, making it a breeze for developers to grasp, especially if they're well-versed in JavaScript and Node.js.\r\n\r\nGetting started with Express.js is a walk in the park, thanks to tools like Bit. For the uninitiated, Bit is a cutting-edge build system tailored for creating modular software.\r\n\r\nInterestingly, Express.js itself is inherently composable. It behaves like building blocks that you can effortlessly plug and play anywhere in your application. 🧩✨\r\n\r\nYou can see two components: an Authorizer as well as an API app. These two components have been implemented as independent Bit components and are maintained and versioned in its isolated space.\r\n[<img height="456" width="800" alt="Top 5 Node.js Frameworks for Building Awesome APIs in 2024" src="https://res.cloudinary.com/practicaldev/image/fetch/s--Slk8VpvZ--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:1400/format:webp/0%2AMhvEyUZL4OHvz-5I.png" />](https://res.cloudinary.com/practicaldev/image/fetch/s--Slk8VpvZ--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:1400/format:webp/0%2AMhvEyUZL4OHvz-5I.png)\r\nBy doing so, you’re able to design your app in a composable manner, quickly!\r\n\r\n## **2.NestJS: A Fresh and Structured Approach**\r\n\r\n[<img height="400" width="800" alt="NestJS" src="https://res.cloudinary.com/practicaldev/image/fetch/s--mV7s5eA1--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:1400/format:webp/0%2AucNWZhhsmIORW9V9.png" />](https://res.cloudinary.com/practicaldev/image/fetch/s--mV7s5eA1--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:1400/format:webp/0%2AucNWZhhsmIORW9V9.png)\r\nNestJS stands out as a framework designed for crafting scalable and efficient server-side applications in Node.js. Its approach incorporates progressive JavaScript and offers the flexibility to code in TypeScript. Despite its full support for TypeScript, it accommodates pure JavaScript and embraces Object-Oriented Programming, Functional Programming, and Functional Reactive Programming.\r\n\r\n## Key Features: What makes it stand out\r\n\r\n**1. Modular Brilliance**\r\nNest.js excels in breaking down code into manageable modules, enhancing maintainability. Take a glance at the example module below:\r\n\r\n\r\nimport { Module } from '@nestjs/common';\r\n\r\n@Module({\r\n&#x20;imports: \\[\r\n&#x20; CacheModule\r\n&#x20;],\r\n&#x20;controllers: \\[PaymentController],\r\n&#x20;providers: \\[PaymentService],\r\n})\r\nexport class PaymentModule {}\r\n\r\n\r\nThis payment module can be seamlessly exported to other modules. In this instance, the common cache module is exported within the payment module. Nest.js' module structure simplifies maintenance, making it a standout feature. 🌐🧩\r\n**2. Scalable Synergy**\r\nNest.js takes scalability to the next level by breaking down applications into manageable modules. It supports flexible component replacement, seamlessly handles high traffic through microservices, and excels in asynchronous operations. This ensures the efficient handling of increased workloads while maintaining the utmost reliability and performance.\r\n\r\n**3.Dependency Injection Dance**\r\nDependency injection in Nest.js involves adding an external dependency to a class rather than creating it within the class itself. Let's dive into an example:\r\n\r\n\r\nimport { HttpException, Injectable, NotFoundException } from '@nestjs/common';\r\n\r\n@Injectable()\r\nexport class PaymentService {\r\n&#x20; constructor() {}\r\n\r\n&#x20; getReceipt() {\r\n&#x20;   return 'Payment Receipt';\r\n&#x20; }\r\n}\r\n\r\n\r\nIn this snippet, the PaymentService is created and marked with the @Injectable() annotation, making it injectable. Now, let's see how we can use this service:\r\n\r\n\r\nimport { Controller, Get, Post, Body } from '@nestjs/common';\r\nimport { PaymentService } from './payment.service';\r\n\r\n@Controller('payment')\r\nexport class PaymentController {\r\n&#x20; constructor(private readonly paymentService: PaymentService) {}\r\n\r\n&#x20; @Get()\r\n&#x20; getPaymentReceipt() {\r\n&#x20;   return this.paymentService.getReceipt();\r\n&#x20; }\r\n}\r\n\r\n\r\nThis example showcases the injection of the PaymentService into the PaymentController, allowing seamless access to its functionality. 🕺💡\r\n**4. Shielded by TypeScript Armor**\r\nNest.js leverages TypeScript to provide robust type safety, acting as a vigilant guardian against potential errors during development. This not only enhances the overall reliability of the code but also contributes to its maintainability. Let's explore an example:\r\n\r\n\r\nexport class PaymentDto {\r\n&#x20; @IsNotEmpty()\r\n&#x20; @IsEnum(SERVICE\\_PROVIDER\\_SLUG, {\r\n&#x20;   message: \\`Invalid serviceProvider. Valid options are: ${Object.values(SERVICE\\_PROVIDER\\_SLUG).join(', ')}\\`,\r\n&#x20; })\r\n&#x20; serviceProvider: string;\r\n\r\n&#x20; @IsNotEmpty()\r\n&#x20; @IsNumber()\r\n&#x20; value: number;\r\n\r\n&#x20; @IsNotEmpty()\r\n&#x20; @IsString()\r\n&#x20; validityPeriod: string;\r\n\r\n&#x20; @IsNotEmpty()\r\n&#x20; @IsArray()\r\n&#x20; @ArrayNotEmpty()\r\n&#x20; @ValidateNested()\r\n&#x20; @Type(() => PaymentAttributesDto)\r\n&#x20; paymentAttributes: PaymentAttributesDto\\[];\r\n}\r\n\r\n\r\nIn this example, we've crafted a Data Transfer Object (DTO) called PaymentDto, equipped with various parameters. The annotations, such as @IsNumber() and @IsString(), serve as guardians, ensuring that each parameter adheres to the specified type. For instance, attempting to assign a string value to the "value" parameter will trigger an error, adding an extra layer of protection to your application. 🛡️🚧\r\n\r\n## **Koa.js: Elegant and Lightweight**\r\n\r\n[<img height="300" width="300" alt="Koa.js" src="https://media.dev.to/cdn-cgi/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2F9syg6wmcneytaqngh6u6.png" />](https://media.dev.to/cdn-cgi/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2F9syg6wmcneytaqngh6u6.png)\r\nKoa.js, a creation of the Express.js team, emerges as a compact and expressive web framework. It provides a departure from callbacks, opting for the sophistication of async functions to handle errors seamlessly.\r\n\r\n## Key Features: What makes it stand out\r\n\r\n**1. Contextual Power (ctx)**\r\nKoa.js introduces the concept of ctx (context) to capture intricate details of requests and responses. This context gracefully flows through each middleware. Observe the example below:\r\n\r\n\r\nconst Koa = require('koa');\r\nconst app = a new Koa();\r\n\r\napp.use(async (ctx) => {\r\n&#x20; const { method, url, request, response } = ctx;\r\n&#x20; console.log('Method: ' + method + ' Request: ' + request);\r\n});\r\n\r\n\r\napp.listen(3000);\r\nHere, the ctx object encapsulates crucial information like the HTTP method, URL, request, and response, offering developers a comprehensive view of the ongoing process.\r\n\r\n**2.Middleware Composition**\r\nSimilar to Express.js, Koa.js embraces the concept of middleware functions to handle HTTP requests and responses. Behold a simple middleware example:\r\n\r\njavascript\r\nCopy code\r\nconst Koa = require('koa');\r\nconst app = new Koa();\r\n\r\napp.use(async (ctx, next) => {\r\nawait next();\r\n});\r\n\r\napp.listen(3000);\r\nIn this snippet, a basic middleware is created, showcasing Koa's affinity for handling middleware in a manner reminiscent of its predecessor, Express.js. 🌟🚀\r\n**3. Async/Await Support**\r\n\r\nKoa uses the async/await syntax for writing asynchronous code in a more synchronous-looking way. The below example consists of using async/await keywords.\r\n\r\n\r\nconst Koa = require('koa');\r\nconst app = new Koa();\r\n\r\napp.use(async (ctx) => {\r\n&#x20; const data = await fetchData();\r\n&#x20; ctx.body = Data: ${data} ;\r\n});\r\n\r\napp.listen(3000);\r\n\r\n\r\n**4. Error Handling**\r\n\r\nKoa.Js supports various types of error handling. We can use app.emit() or ctx.throw() to handle errors. The below example consists of mentioned error-handling methods.\r\n\r\nconst koa = require('koa');\r\nconst app = new koa();\r\n\r\n\r\n//Error Handling Method 1\r\napp.use(async (ctx, next) => {\r\n&#x20; try {\r\n&#x20;   await Promise.reject('Something went wrong');\r\n&#x20; } catch (err) {\r\n&#x20;   ctx.status = err.status || 500;\r\n&#x20;   ctx.body = err.message;\r\n&#x20;   ctx.app.emit('error', err, ctx);\r\n&#x20; }\r\n});\r\n\r\n\r\n//Error Handling Method 2\r\napp.use(async (ctx, next) => {\r\nctx.throw(500, 'error');\r\n});\r\n\r\napp.on('error', (err, ctx) => {\r\nconsole.log(err);\r\n});\r\n\r\napp.listen(3000);\r\n\r\n## **Hapi.js**\r\n\r\n[<img height="560" width="800" alt="Hapi.js" src="https://res.cloudinary.com/practicaldev/image/fetch/s--Ig1C34P_--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:1400/format:webp/0%2AOIQ1aef7lOU63mAK.png" />](https://res.cloudinary.com/practicaldev/image/fetch/s--Ig1C34P_--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:1400/format:webp/0%2AOIQ1aef7lOU63mAK.png)\r\nHapi.js, an open-source framework with a nifty abbreviation (short for Http-API), stands tall as a powerhouse for developing scalable web applications. Its forte includes crafting REST APIs, and it earned its stripes at Walmart Labs, handling the massive online shopping traffic surge during events like Black Friday.\r\n\r\n## Key Features: What makes it stand out\r\n\r\n**1. Design by Configuration**\r\nHapi.js adopts a configuration-driven design, allowing developers to effortlessly set up routes, define settings, and integrate plugins using a configuration object. Feast your eyes on this example:\r\n\r\n\r\nconst Hapi = require('@hapi/hapi');\r\n\r\nconst server = Hapi.server({\r\n&#x20; port: 3000,\r\n&#x20; routes: {\r\n&#x20;   cors: true,\r\n&#x20; },\r\n});\r\n\r\nserver.route({\r\n&#x20; method: 'GET',\r\n&#x20; path: '/',\r\n&#x20; handler: (request, h) => {\r\n&#x20;   return 'Hello, Hapi!';\r\n&#x20; },\r\n});\r\n\r\nasync function start() {\r\n&#x20; await server.start();\r\n&#x20; console.log(\\`Server running at ${server.info.uri}\\`);\r\n}\r\n\r\nstart();\r\n\r\n\r\nIn this snippet, the power of configuration shines as the server is set up, routes are defined, and CORS support is seamlessly configured.\r\n\r\n**2. Powerful Plugin System**\r\nHapi.js boasts a powerful plugin system, allowing easy integration without breaking a sweat. Witness this example:\r\n\r\n\r\nconst start = async function () {\r\n&#x20;   const server = Hapi.server();\r\n\r\n&#x20;   await server.register(\\[{\r\n&#x20;       plugin: require('plugin1'),\r\n&#x20;       options: {}\r\n&#x20;   }, {\r\n&#x20;       plugin: require('plugin2'),\r\n&#x20;       options: {}\r\n&#x20;   }]);\r\n};\r\n\r\n\r\nThis snippet demonstrates the effortless integration of two plugins, with the ability to pass options to each plugin through the options key.\r\n\r\n**3. Authentication and Authorization**\r\n\r\nHapi.js stands as a fortress with built-in support for various authentication strategies and a simple approach to defining access control policies. Observe the authentication prowess in this example:\r\n\r\n\r\nserver.route({\r\n&#x20; method: 'GET',\r\n&#x20; path: '/private-data',\r\n&#x20; handler: (request, h) => {\r\n&#x20;   // Access private data only if authenticated\r\n&#x20;   const user = request.auth.credentials;\r\n&#x20;   return \\`Welcome, ${user.username}!\\`;\r\n&#x20; },\r\n&#x20; options: {\r\n&#x20;   auth: 'jwt', // Use JWT authentication strategy\r\n&#x20; },\r\n});\r\n\r\n\r\nIn this scenario, the authentication strategy is elegantly defined as 'jwt', ensuring secure access to private data.\r\n\r\n**4. Input Validation**\r\n\r\nHapi.js places great emphasis on input validation. In the route's options object, developers can define which inputs need validation. The default validate object includes checks for headers, params, query, payload, state, and a fail action strategy.\r\n\r\n## **Adonis.js**\r\n\r\nAdonis.js excels in routing, providing a seamless and intuitive way to define routes for your application. The routing system is designed to be expressive and powerful, making it easy for developers to define and manage the various endpoints of their application.\r\n\r\n## Key Features: What makes it stand out\r\n\r\n**1. Full-stack MVC framework**\r\n\r\nAdonis.js follows the MVC architectural pattern. Having a MVC framework helps organize code and makes it easier to maintain and scale.\r\n\r\n**2. Integrated ORM (Lucid) for database interactions**\r\n\r\nAdonis.js incorporates Lucid, its own Object-Relational Mapping (ORM) system. Lucid simplifies database interactions by providing an expressive query builder and supporting various database systems.\r\n\r\nHere's a glimpse into how you can use Lucid to interact with the database:\r\n\r\n\r\nconst Model = use('Model');\r\n\r\nclass User extends Model {\r\n}\r\n\r\nmodule.exports = User;\r\n\r\n\r\nIn this example, the User model is defined using Lucid, and it becomes a powerful tool for reading and writing to the database. The route below demonstrates how effortlessly you can fetch all\r\n\r\n\r\nconst Route = use('Route');\r\nconst User = use('App/Models/User');\r\n\r\nRoute.get('users', async () => {\r\n&#x20; return await User.all();\r\n});\r\n\r\n\r\nBy using User.all(), Adonis.js simplifies the process of fetching users from the database.\r\n\r\n**3. Authentication system**\r\n\r\nAdonis.js doesn't stop at just being an MVC framework; it brings a robust authentication system to the table. With built-in support for user authentication and authorization, Adonis.js makes it a breeze to handle user sessions, password hashing, and access control.\r\n\r\nTake a look at this example illustrating the simplicity of fetching users:\r\n\r\n\r\nconst Route = use('Route');\r\nconst User = use('App/Models/User');\r\n\r\nRoute.get('users', async () => {\r\n&#x20; return await User.all();\r\n}).middleware(\\['auth']);\r\n\r\n\r\nIn this scenario, the middleware(\\['auth']) ensures that only authenticated users can access the route for fetching users. Adonis.js streamlines the authentication process, making it an integral part of your application's security. 🛡️🔐\r\n\r\n\r\n\r\n\r\n\r\n[](https://res.cloudinary.com/practicaldev/image/fetch/s--hXWgGFY4--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:2000/format:webp/0%2AGUQgwaGps17ZrB8f.png)	https://res.cloudinary.com/practicaldev/image/fetch/s--hXWgGFY4--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_800/https://miro.medium.com/v2/resize:fit:2000/format:webp/0%2AGUQgwaGps17ZrB8f.png	1	2024-05-07 15:49:56.879	2024-05-07 15:49:56.881	2024-05-07 15:49:56.881
8	Why This JCON Europe Talk Is Unmissable (Part 2)	[**JCON Europe**](https://2024.europe.jcon.one/) **in Cologne is around the corner (**[**and here are your free Foojay JCON tickets**](https://bit.ly/3xv9yfT)**), May 13 to 16. Why should you go? Well, one reason is that the talks will be awesome. Here's the start of a series of reasons why some of them are absolutely unmissable!**\r\n\r\n\r\n\r\n<img height="682" width="1024" src="https://foojay.io/wp-content/uploads/2024/05/image.png" />\r\n\r\n\r\n\r\n### Jakarta EE 11 - Performance and Developer Productivity - Ivar Grimstad\r\n\r\nThursday, 16 May 2024 9:00 am - 9:45 am - Cinema 7\r\n\r\n\r\n\r\nJakarta EE 11 will be the first release of Jakarta EE after the new release cadence was introduced. The goal is to release a version of Jakarta EE around six to nine months after an LTS release of Java SE. With Java 21 released in September 2023, Jakarta EE 11 is scheduled to be released around June/July of 2024.\r\n\r\n\r\n\r\nWhat are the updates? Are there any new specifications introduced? What about removals? Will there be another namespace change? How will the impact of this release be on other frameworks and technologies, such as Spring, Apache Tomcat, Hibernate, and more?\r\n\r\nCome to this session to get all these questions and more answered to be prepared for Jakarta EE 11.\r\n\r\n\r\n\r\n## Why your talk is unmissable?\r\n\r\nMy talk titled "Jakarta EE 11 - Performance and Developer Productivity" will give you a full overview of what to expect from the upcoming Jakarta EE 11 release. By attending the talk, you will have the advantage of getting this knowledge first-hand before it reaches your code.\r\n\r\n\r\n\r\nThis even applies to Spring developers. If you haven't noticed yet, a lot of the Jakarta EE technologies are exposed to Spring developers through the dependence Spring has on Jakarta EE. It will be there before you know it!	https://foojay.io/wp-content/uploads/2024/05/image.png	1	2024-05-07 15:51:15.93	2024-05-07 15:51:15.931	2024-05-07 15:51:15.931
9	No Need For Nodemon: Native File Watching In Node.Js	Native file watching offers several benefits that streamline development processes and project management. These are some reasons why you should embrace the native file watcher in Node.js applications:\r\n\r\n* **Improved Development Workflow:** By utilizing the native watcher, you can automate the process of monitoring file changes and restarting your Node.js application, leading to a more efficient and productive development workflow.\r\n* **Reduced Dependencies:** By leveraging native file watching, you minimize the number of external dependencies in your projects. This reduces the complexity of the project’s dependency tree, making it easier to manage and maintain in the long run.\r\n* **Future-Proofing:** Native file-watching features ensure that projects remain compatible with future versions of Node.js. While third-party tools may introduce breaking changes or become outdated over time, the Node.js ecosystem maintains and updates the native file watcher, providing a more sustainable solution in the long term.\r\n* **Enhanced Performance:** Leveraging native features can often result in better performance than third-party solutions, ensuring that your Node.js applications run smoothly and respond quickly to changes.\r\n\r\n## Overview of the Native File Watcher\r\n\r\nNative file watcher is a built-in Node.js feature that enables efficient monitoring of file and directory changes within our applications. To leverage this functionality, use the `node—-watch` command-line flag.\r\n\r\nThis feature was first introduced in [Node.js version 18.11.0](https://nodejs.org/en/blog/release/v18.11.0#watch-mode-experimental) as an experimental feature, and it has undergone significant improvements in subsequent releases.\r\n\r\nNotably, the watch mode for the Node.js test runner was introduced in versions 18.13.0 and 19.2.0. This feature supports running tests in watch mode, which helps monitor changes in test files. (more on this later)\r\n\r\nDespite still being labeled as experimental, the native file watcher remains a valuable feature in the latest versions of Node.js. It offers a reliable and efficient method for streamlining development workflows by automating file changes monitoring.\r\n\r\n## Advantages and Disadvantages of the Native File Watcher\r\n\r\nLet’s explore some of the advantages and disadvantages of using the native file watcher in Node.js:\r\n\r\n### Advantages\r\n\r\nThe advantages of native file watcher include:\r\n\r\n* **Simplicity:** The `--watch` flag is a built-in feature, making it straightforward to implement. You do not need any additional libraries or complex setups.\r\n* **Efficiency:** Native file watching leverages the operating system’s capabilities for monitoring file changes, potentially leading to efficient resource utilization.\r\n\r\n### Disadvantages\r\n\r\nThe disadvantages of native file watcher include:\r\n\r\n* **Limited Functionality:** The `--watch` flag offers basic file-watching functionality, like monitoring files and directories. Nodemon, on the other hand, provides a more comprehensive solution with features like automatic and manual restarting, file extension detection, and configuration options.\r\n* **Cross-Platform Limitations:** Certain file-watching commands like the `--watch-path` command are only available on specific operating systems like Windows and macOS. (more on this later)\r\n* **Scalability Limitations:** The native approach might not be optimal for large-scale applications with numerous files to monitor.\r\n\r\n## Implementing Native File Watcher in Node.js\r\n\r\nBefore you get started, ensure that you are running at least [Node.js version 18.11.0 or higher](https://nodejs.org/en/download). You can check your Node.js version by running the `node -v` command in your terminal.\r\n\r\nTo implement native file watching, follow these basic steps:\r\n\r\nFirst, open a terminal and navigate to the directory where your Node.js project is located.\r\n\r\nThen, determine the file or directory you want to watch for changes.\r\n\r\nFinally, use the `node --watch` command and the path to the file you want to keep in watch mode. For example, to watch changes in a file named `index.js`, you can run the following command:\r\n\r\n`node --watch index.js`\r\n\r\nTo stop file-watching, you can terminate the Node.js process running in your terminal by pressing `Ctrl + C` or `Cmd + C` on your keyboard.\r\n\r\n### Using Watch Mode with Node.js Test Runner\r\n\r\nWhen using the Node.js test runner from the command line interface (CLI), you can enable watch mode to automatically monitor changes in test files. To activate watch mode, use the following command:\r\n\r\n`node --test --watch`\r\n\r\nThis command instructs the Node.js test runner to enter watch mode, allowing it to detect changes in test files and their dependencies. It will automatically rerun affected tests whenever a change is detected.\r\n\r\n### Watching Changes in Directories\r\n\r\nNode.js offers a convenient method for monitoring a specific directory and automatically rerunning a file when a change occurs within that directory.\r\n\r\nThis functionality can be achieved using the `--watch-path` flag. For example, consider a scenario where you have a directory named `src`, and you aim to watch for changes in this directory and trigger the execution of a file named `index.js` when any change occurs. In such a case, you can utilize the following command:\r\n\r\n`node --watch-path=./src index.js`\r\n\r\nNow that you’ve learned how to implement the native file watcher in your Node.js project and explored its functionalities, such as watching changes in directories and test files, let’s delve into a use-case scenario where we will apply it to a web server.\r\n\r\n## Auto-restarting a Web Server with Native File Watching\r\n\r\nConsider a scenario where you have a `server.js` file containing the code for a simple web server using Express.js:\r\n\r\n`// Importing required modules`\r\n`const express = require("express");`\r\n\r\n`// Creating an instance of Express`\r\n`const app = express();`\r\n`// Define a route`\r\n`app.get("/", (req, res) => {`\r\n`  res.send("Hello World");`\r\n`});`\r\n\r\n`// Set up the server to listen on port 8000`\r\n`const port = 8000;`\r\n`app.listen(port, () => {`\r\n``  console.log(`Server is running on http://localhost:${port}`);``\r\n`});`\r\n\r\nWith the native file watcher, you can start the server using the following command:\r\n\r\n`node --watch server.js`\r\n\r\nNow, whenever you save changes to the `server.js` file, the server will automatically restart, reflecting those updates instantly. This feature streamlines the development process by eliminating the need to manually restart the server after making changes, ensuring a seamless and efficient workflow.\r\n\r\n## Best Practices and Tips for Efficient File Watching in Node.js\r\n\r\nLet’s explore some practices and tips for efficient file-watching in Node.js:\r\n\r\n### Update Your Start Script\r\n\r\nTo enhance your development workflow, updating the start script in your `package.json` file is important. This script serves as the entry point for running your Node.js application.\r\n\r\nBy configuring the start script to include file watching, you can automate monitoring file changes and restarting your application as needed. This improves convenience and centralizes the file-watching configuration within your project structure, making it easier to manage and maintain in the long run.\r\n\r\nTo update the start script, open your `package.json` file and locate the “scripts” section. Within this section, modify the “start” script to include the `--watch` flag and specify the entry point file, e.g., `index.js`. Here’s an example of how the updated start script might look:\r\n\r\n`"scripts": {`\r\n`  "start": "node --watch index.js"`\r\n`}`\r\n\r\nAfter updating the script, you can now start the application with file watching enabled using the following simple command:\r\n\r\n`npm start`\r\n\r\nThis approach streamlines launching your application by watching files during development.\r\n\r\n### Documentation and Updates\r\n\r\nStay updated with [Node.js documentation](https://nodejs.org/api/cli.html#--watch) and [community resources](https://nodejs.org/en/about/get-involved) to learn about new features and improvements related to file-watching. Continuous learning ensures that you can make the most of native file-watching, regardless of your level of expertise.\r\n\r\n## Conclusion\r\n\r\nNative file watching in Node.js, facilitated by the `--watch` flag, offers us a powerful tool for monitoring file system changes within our applications. By leveraging this built-in feature, you can streamline your development workflow and automate processes in your applications. At the same time, it reduces reliance on external tools and minimizes dependencies, leading to cleaner and more efficient development environments. Overall, native file watching in Node.js empowers us to create applications with ease.	https://blog.openreplay.com/images/no-need-for-nodemon--native-file-watching-in-node/images/hero.png	1	2024-05-07 15:52:45.155	2024-05-07 15:52:45.156	2024-05-07 15:52:45.156
10	AMD Posts Patches For Improving Heterogeneous Core Type CPUs On Linux	AMD engineers posted a new set of Linux driver patches on Tuesday that "*addresses critical issues and enhances performance settings for CPUs with heterogeneous core types*" while using the AMD P-State CPU frequency scaling driver.\r\n\r\nAMD has yet more amd\\_pstate driver patches on the way for the Linux kernel. AMD Linux engineer Perry Yuan explained of [the new patches](https://lore.kernel.org/linux-pm/cover.1715065568.git.perry.yuan@amd.com/):\r\n\r\n\r\n> "This patchset addresses critical issues and enhances performance settings for CPUs with heterogeneous core types in the AMD pstate driver. Specifically, it resolves problems related to calculating the highest performance and frequency on the latest CPUs with preferred cores. Additionally, the patchset includes documentation improvements in amd-pstate.rst, offering a comprehensive guide covering topics such as recommended reboot requirements during driver switching, debugging procedures for driver loading failures."\r\n\r\nThe patches help improve the debugging when encountering broken ACPI CPPC tables, making use of a CPU bit for detecting AMD heterogeneous core topology, This AMD heterogeneous core topology is for CPUs that have a mix of say Zen 4 and Zen 4C cores.\r\n\r\n\r\n\r\n\r\n![Heterogeneous Core Topology](https://www.phoronix.net/image.php?id=2024\\&image=hetero_core_topo)\r\n\r\n\r\n\r\nThis patch series is noted to fix [the AMD Ryzen 7 7840HS never boosting to max frequency](https://bugzilla.kernel.org/show_bug.cgi?id=218759) and related problems like [amd\\_pstate not loading on some hardware](https://bugzilla.kernel.org/show_bug.cgi?id=218705).	https://www.phoronix.com/assets/categories/amd.webp	1	2024-05-07 15:54:25.549	2024-05-07 15:54:25.55	2024-05-07 15:54:25.55
11	“You Can’t Protect What You Can’t See” Still Rings True. Why Observability Now.	Remember the old saying: “You can’t protect what you can’t see”? When I started preaching about it as part of the marketing launch for Real-time Network Awareness (RNA) it seemed pretty obvious that we needed more visibility in order to protect our environments more effectively. But in the intervening years, as an industry, we’ve managed to go in the opposite direction – making it increasingly difficult to gain a comprehensive understanding of our modern networks.\r\n\r\nHere’s what happened…\r\n\r\nFirst, we saw the increasing use of encryption in networks and that was a problem because being able to analyze the cleartext traffic once it’s encrypted gets computationally, operationally, and therefore, financially expensive. As of TLS 1.3’s release in 2018 you also have problems with Perfect Forward Secrecy which generates a unique session key for every session initiated which makes post-facto analysis also problematic. As network encryption continues to evolve the tricks that we play become increasingly unwieldy and less effective at the same time.\r\n\r\nThis was followed by the problem posed by data centers and workloads moving to the cloud where the classic appliance-based models don’t translate effectively. Generally speaking, cloud environments really don’t want you doing deep packet inspection at scale in the old model of using a few powerful sensors to observe large swathes of the network. As a result, workloads essentially have to defend themselves somehow; every workload is an island responsible for its own integrity, defense, and reporting in the event of a successful compromise. Having worked in security for almost 30 years I find this to be a dubious proposition but it’s the road we, as an industry, decided to embark upon.\r\n\r\nWe have also seen the fallout from the traditional [threat-centric](https://netography.com/why-its-time-to-evolve-from-threat-centric-to-compromise-centric-security/) approach to detection and response, in terms of the immense amount of cost and complexity involved to find a security event warranting a response. Security teams now talk about millions of event logs per day that go into their expensive pipeline of people, process and technology to figure out which events they need to worry about. As it turns out, when you do the analysis, in most circumstances there’s a vanishingly small number of events that actually indicate a compromise or other security issue that should elicit a response. \r\n\r\nThe time has come to ask ourselves why we continue to try to protect our enterprise networks this way. Isn’t the definition of madness doing the same thing over and over again and expecting different results?\r\n\r\n#### Getting to observability\r\n\r\nWhen I started looking at solutions to the problem of being able to provide useful observability and detection capabilities to cloud users and other architecture analogs that could help move us in the right direction, the architecture that came to the fore was similar to the architecture that was pioneered to do cloud-based antimalware. Known today as endpoint detection and response (EDR), these products are architected to collect metadata about the endpoint and its processes that are under threat and then forward that data to a cloud backend that does the heavy lifting of detection and sends out response information. \r\n\r\nI brought these three threads together: the limitations of operating deep packet inspection (DPI) and the poor fit of the appliance-based form factor in the cloud and in heavily encrypted environments, along with the potential havoc wrought by poorly configured or curated threat-centric security approaches. And I began to imagine what an EDR-like architecture would look like in a network defense platform (NDP). \r\n\r\nFast forward to today, and what that looks like is our cloud-native Netography Fusion![™](https://s.w.org/images/core/emoji/15.0.3/72x72/2122.png) platform. \r\n\r\nNetography Fusion collects metadata in real-time from your multi-cloud VPCs as well as your existing on-prem network infrastructure. That data is brought into a cloud-based analytics backend where enrichment, analytics, and detection happen. If a response is warranted it signals out to the infrastructure or your tech stack utilizing our dozens of integrations. And one of the most powerful aspects is that Fusion works everywhere – in any cloud and on-prem, and in IT and OT environments – equally well because it leverages information about activity in the environment and the participants in those activities instead of trying to decompose packet streams and protocols.  \r\n\r\nDoing metadata-based analysis of activities and the participants elevates the conversation from threat-centric: “Tell me whenever you see a Log4j attack” to [compromise-centric](https://netography.com/why-its-time-to-evolve-from-threat-centric-to-compromise-centric-security/): “I want to look for a containment failure in my Zero Trust environment.” \r\n\r\nYou can ask and get answers to more meaningful questions, for example:  \r\n\r\n* Are trust boundaries being violated?\r\n* Are there communication patterns that shouldn’t be happening, like dev talking to prod?\r\n* Are there changes to device communication patterns?\r\n* Are applications exhibiting novel behaviors?\r\n* Are users talking to things they shouldn’t be talking to?\r\n\r\nInstead of looking at every packet that comes across the wire to detect a specific attack and letting you know – regardless of whether or not that detection means anything in your environment – Netography Fusion observes activities to detect actual signs of abuse, misuse, misconfiguration, or compromise.\r\n\r\n#### Reversing the trajectory from less to more/See what matters\r\n\r\nIt’s not surprising that “you can’t protect what you can’t see” still rings true. Yes, within packets and protocols you look at activities within the content being sent. But as you try to scale this approach to large organizations you also incur immense computational costs which translates into immense financial costs because of the requirements to perform decryption and stateful packet inspection as well as having to deploy an appliance in the right place to be able to see this traffic to do something about it. [Trying to do DPI](https://netography.com/useful-challenging-ineffectual-three-ways-to-look-at-dpi/) across an entire enterprise that has dozens to hundreds of points of presence on the internet is cost prohibitive – and still leaves blind spots in and between clouds and out to OT environments. \r\n\r\nShifting to a model that is architected for today’s diverse, dispersed, and encrypted environments, means you can instrument your entire network because you are leveraging data coming from the infrastructure you already have and, therefore, move in the direction of more visibility, not less. With Netography Fusion, you can observe the entirety of your enterprise network and all its points of presence – multi-cloud and on-prem, in IT and OT environments. And you can observe and respond to the handful of activities that absolutely matter, instead of sifting through the thousands of events that do not.	https://securityboulevard.com/wp-content/uploads/2017/09/SBNIcon4_512px.png	1	2024-05-07 15:58:22.556	2024-05-07 15:58:22.557	2024-05-07 15:58:22.557
\.


--
-- Data for Name: BlogTag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BlogTag" (id, "BlogId", "TagId", "createdAt", "updatedAt") FROM stdin;
1	1	1	2024-05-06 18:09:52.756	2024-05-06 18:09:52.756
2	1	2	2024-05-06 18:09:52.76	2024-05-06 18:09:52.76
3	2	3	2024-05-06 18:40:49.335	2024-05-06 18:40:49.335
4	2	4	2024-05-06 18:40:49.339	2024-05-06 18:40:49.339
5	2	2	2024-05-06 18:40:49.342	2024-05-06 18:40:49.342
6	3	5	2024-05-07 15:41:15.768	2024-05-07 15:41:15.768
7	3	2	2024-05-07 15:41:15.772	2024-05-07 15:41:15.772
8	4	1	2024-05-07 15:43:50.192	2024-05-07 15:43:50.192
9	4	6	2024-05-07 15:43:50.197	2024-05-07 15:43:50.197
10	4	7	2024-05-07 15:43:50.2	2024-05-07 15:43:50.2
11	5	2	2024-05-07 15:46:28.845	2024-05-07 15:46:28.845
12	5	8	2024-05-07 15:46:28.848	2024-05-07 15:46:28.848
13	6	9	2024-05-07 15:48:14.683	2024-05-07 15:48:14.683
14	6	10	2024-05-07 15:48:14.69	2024-05-07 15:48:14.69
15	6	11	2024-05-07 15:48:14.697	2024-05-07 15:48:14.697
16	7	2	2024-05-07 15:49:56.892	2024-05-07 15:49:56.892
17	7	12	2024-05-07 15:49:56.895	2024-05-07 15:49:56.895
18	8	2	2024-05-07 15:51:15.935	2024-05-07 15:51:15.935
19	8	13	2024-05-07 15:51:15.938	2024-05-07 15:51:15.938
20	9	2	2024-05-07 15:52:45.162	2024-05-07 15:52:45.162
21	9	12	2024-05-07 15:52:45.167	2024-05-07 15:52:45.167
22	10	7	2024-05-07 15:54:25.556	2024-05-07 15:54:25.556
23	11	1	2024-05-07 15:58:22.564	2024-05-07 15:58:22.564
\.


--
-- Data for Name: RefreshToken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RefreshToken" (id, "UserId", token, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tag" (id, name, "createdAt", "updatedAt") FROM stdin;
1	general	2024-05-06 18:09:52.751	2024-05-06 18:09:52.751
2	programming	2024-05-06 18:09:52.758	2024-05-06 18:09:52.758
3	debugging	2024-05-06 18:40:49.331	2024-05-06 18:40:49.331
4	zed	2024-05-06 18:40:49.338	2024-05-06 18:40:49.338
5	arrays	2024-05-07 15:41:15.764	2024-05-07 15:41:15.764
6	servers	2024-05-07 15:43:50.194	2024-05-07 15:43:50.194
7	processors	2024-05-07 15:43:50.198	2024-05-07 15:43:50.198
8	life	2024-05-07 15:46:28.846	2024-05-07 15:46:28.846
9	infrastructure	2024-05-07 15:48:14.679	2024-05-07 15:48:14.679
10	database	2024-05-07 15:48:14.685	2024-05-07 15:48:14.685
11	performance	2024-05-07 15:48:14.692	2024-05-07 15:48:14.692
12	javascript	2024-05-07 15:49:56.893	2024-05-07 15:49:56.893
13	java	2024-05-07 15:51:15.936	2024-05-07 15:51:15.936
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, email, name, "createdAt", "updatedAt") FROM stdin;
1	hardikdhawan01@gmail.com	Hardik Dhawan	2024-05-06 17:57:00.006	2024-05-06 17:57:00.006
\.


--
-- Data for Name: UserPassword; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserPassword" (id, "UserId", password, "createdAt", "updatedAt") FROM stdin;
1	1	$2b$10$nc7PwJqoMZRuFTC0N1gEJO2vhnsnb/D4xDDG6HYWD.RqoS1RUjqW6	2024-05-06 17:57:00.006	2024-05-06 17:57:00.006
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
a86fed59-e26b-46d0-a263-e3a8c9fd1fb1	7154d3e287929ddda321bb916a48eb813d794e09b471f74e26797b27587b0f72	2024-05-06 17:56:06.866972+00	20240504141650_init	\N	\N	2024-05-06 17:56:06.832905+00	1
\.


--
-- Name: BlogTag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BlogTag_id_seq"', 23, true);


--
-- Name: Blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Blog_id_seq"', 11, true);


--
-- Name: RefreshToken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RefreshToken_id_seq"', 1, false);


--
-- Name: Tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tag_id_seq"', 13, true);


--
-- Name: UserPassword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UserPassword_id_seq"', 1, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, true);


--
-- Name: BlogTag BlogTag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlogTag"
    ADD CONSTRAINT "BlogTag_pkey" PRIMARY KEY (id);


--
-- Name: Blog Blog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Blog"
    ADD CONSTRAINT "Blog_pkey" PRIMARY KEY (id);


--
-- Name: RefreshToken RefreshToken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_pkey" PRIMARY KEY (id);


--
-- Name: Tag Tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tag"
    ADD CONSTRAINT "Tag_pkey" PRIMARY KEY (id);


--
-- Name: UserPassword UserPassword_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPassword"
    ADD CONSTRAINT "UserPassword_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Tag_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Tag_name_key" ON public."Tag" USING btree (name);


--
-- Name: UserPassword_UserId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UserPassword_UserId_key" ON public."UserPassword" USING btree ("UserId");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: BlogTag BlogTag_BlogId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlogTag"
    ADD CONSTRAINT "BlogTag_BlogId_fkey" FOREIGN KEY ("BlogId") REFERENCES public."Blog"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: BlogTag BlogTag_TagId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlogTag"
    ADD CONSTRAINT "BlogTag_TagId_fkey" FOREIGN KEY ("TagId") REFERENCES public."Tag"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Blog Blog_AuthorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Blog"
    ADD CONSTRAINT "Blog_AuthorId_fkey" FOREIGN KEY ("AuthorId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RefreshToken RefreshToken_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserPassword UserPassword_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPassword"
    ADD CONSTRAINT "UserPassword_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

