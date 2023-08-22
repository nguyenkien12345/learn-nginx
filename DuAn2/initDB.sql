CREATE DATABASE IF NOT EXISTS stack_overflow;
USE stack_overflow;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: stack_overflow
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `post_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES ('30f9e438-e11a-48f5-9c69-ce2a5fd75c06','<p>&nbsp;With a sorted array, the condition <strong>data[c] &gt;= 128</strong> is first <strong>false </strong>for a streak of values, then becomes <strong>true </strong>for all later values. That easy to predict. With an unsorted array, you pay for the branching cost.&nbsp;</p>','2022-02-22 18:04:14','2022-02-22 18:04:14','a210dae5-20f5-42bf-9bba-03433f7e1fc8','621b42d0-718d-407b-9198-cda575a2b184'),('9af5ca1c-875b-4fbe-898a-9f9e85f73d9d','<p>&nbsp;</p>\n<p>To understand what <code>yield</code> does, you must understand what <em>generators</em> are. And before you can understand generators, you must understand <em>iterables</em>.</p>\n<h2>Iterables</h2>\n<p>When you create a list, you can read its items one by one. Reading its items one by one is called iteration:</p>\n<pre><code>&gt;&gt;&gt; mylist = [1, 2, 3]<br>\n&gt;&gt;&gt; for i in mylist:<br>\n... &nbsp;&nbsp;&nbsp;print(i)<br>\n1<br>\n2<br>\n3<br>\n</code></pre>\n<p><code>mylist</code> is an <em>iterable</em>. When you use a list comprehension, you create a list, and so an iterable:</p>\n<pre><code>&gt;&gt;&gt; mylist = [x*x for x in range(3)]<br>\n&gt;&gt;&gt; for i in mylist:<br>\n... &nbsp;&nbsp;&nbsp;print(i)<br>\n0<br>\n1<br>\n4<br>\n</code></pre>\n<p>Everything you can use \"<code>for... in...</code>\" on is an iterable; <code>lists</code>, <code>strings</code>, files...</p>\n<p>These iterables are handy because you can read them as much as you wish, but you store all the values in memory and this is not always what you want when you have a lot of values.</p>\n<h2>Generators</h2>\n<p>Generators are iterators, a kind of iterable <strong>you can only iterate over once</strong>. Generators do not store all the values in memory, <strong>they generate the values on the fly</strong>:</p>\n<pre><code>&gt;&gt;&gt; mygenerator = (x*x for x in range(3))<br>\n&gt;&gt;&gt; for i in mygenerator:<br>\n... &nbsp;&nbsp;&nbsp;print(i)<br>\n0<br>\n1<br>\n4<br>\n</code></pre>\n<p>It is just the same except you used <code>()</code> instead of <code>[]</code>. BUT, you <strong>cannot</strong> perform <code>for i in mygenerator</code> a second time since generators can only be used once: they calculate 0, then forget about it and calculate 1, and end calculating 4, one by one.</p>\n<h2>Yield</h2>\n<p><code>yield</code> is a keyword that is used like <code>return</code>, except the function will return a generator.</p>\n<pre><code>&gt;&gt;&gt; def create_generator():<br>\n... &nbsp;&nbsp;&nbsp;mylist = range(3)<br>\n... &nbsp;&nbsp;&nbsp;for i in mylist:<br>\n... &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;yield i*i<br>\n...<br>\n&gt;&gt;&gt; mygenerator = create_generator() # create a generator<br>\n&gt;&gt;&gt; print(mygenerator) # mygenerator is an object!<br>\n&lt;generator object create_generator at 0xb7555c34&gt;<br>\n&gt;&gt;&gt; for i in mygenerator:<br>\n... &nbsp;&nbsp;&nbsp;&nbsp;print(i)<br>\n0<br>\n1<br>\n4<br>\n</code></pre>\n<p>Here it a useless example, but it handy when you know your function will return a huge set of values that you will only need to read once.</p>','2022-02-22 18:07:07','2022-02-22 18:07:07','f39238a4-90df-4cf6-9ab1-fdd43a380532','f6c5f9b6-6021-4668-bc35-60aeba5f56ff'),('b99f017c-342a-487b-9068-c0aa9e67b529','<p><strong>For JSON:</strong></p>\n<pre><code>Content-Type: application/json<br>\n</code></pre>\n<p><strong>For</strong> <a href=\"http://en.wikipedia.org/wiki/JSONP\" rel=\"noreferrer\"><u><strong>JSON-P</strong></u></a><strong>:</strong></p>\n<pre><code>Content-Type: application/javascript</code></pre>','2022-02-22 18:06:10','2022-02-22 18:06:10','f39238a4-90df-4cf6-9ab1-fdd43a380532','ba8f4f96-8446-4007-8467-d389bb99c9cf'),('e0493ab5-b65b-4224-b81d-498e80de13c6','<p><a href=\"http://www.iana.org/\" rel=\"noreferrer\"><u>IANA</u></a> has registered the official MIME Type for JSON as <code><strong>application/json</strong></code>.</p>\n<p>When asked about why not <code>text/json</code>, Crockford seems to have said JSON is not really JavaScript nor text and also IANA was more likely to hand out <code>application/*</code> than <code>text/*</code>.</p>\n<p>More resources:</p>\n<ul>\n  <li><a href=\"http://www.iana.org/assignments/media-types/application/\" rel=\"noreferrer\"><u>Media Types</u></a></li>\n  <li><a href=\"http://www.ietf.org/rfc/rfc4627.txt\" rel=\"noreferrer\"><u>Request for Comments 4627</u></a></li>\n  <li><a href=\"http://bluesmoon.livejournal.com/227190.html\" rel=\"noreferrer\"><u>bluesmoon: JSON has a type</u></a></li>\n</ul>','2022-02-22 18:05:18','2022-02-22 18:05:18','a210dae5-20f5-42bf-9bba-03433f7e1fc8','ba8f4f96-8446-4007-8467-d389bb99c9cf');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-22 23:39:47

-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: stack_overflow
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `post_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES ('66dbf1df-f80e-415a-b05b-e07c61e9e0d7','This piece of code was written by Jochen Schulz (jrschulz), who made a great Python library for metric spaces. This is the link to the complete source\\','2022-02-22 18:06:38','2022-02-22 18:06:38','f39238a4-90df-4cf6-9ab1-fdd43a380532','f6c5f9b6-6021-4668-bc35-60aeba5f56ff'),('67d2f9db-a5e8-47ea-8a5d-323ffba8f518','For the record, your data need not be sorted, only partitioned which is a much faster operation','2022-02-22 18:02:27','2022-02-22 18:02:27','483198ed-01de-4aff-9c55-a819271e46a7','621b42d0-718d-407b-9198-cda575a2b184'),('cb9104dc-4829-474f-8b5b-3ae464ec8fef','Another observation is that you don need to sort the array, but you just need to partition it with the value 128. Sorting is n*log(n), whereas partitioning is just linear. Basically it is just one run of the quick sort partitioning step with the pivot chosen to be 128. Unfortunately in C++ there is just nth_element function, which partition by position, not by value','2022-02-22 18:02:55','2022-02-22 18:02:55','a210dae5-20f5-42bf-9bba-03433f7e1fc8','621b42d0-718d-407b-9198-cda575a2b184');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-22 23:39:47

-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: stack_overflow
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(250) NOT NULL,
  `body` text NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('621b42d0-718d-407b-9198-cda575a2b184','Here is a piece of C++ code that shows some very peculiar behavior. For some strange reason, sorting the data (before the timed region) miraculously makes the loop almost six times faster.','<pre><code>#include &lt;algorithm&gt;</code></pre>\n<pre><code>#include &lt;ctime&gt;</code></pre>\n<pre><code>#include &lt;iostream&gt;</code></pre>\n<pre><code>int main()</code></pre>\n<pre><code>{</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;// Generate data</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;const unsigned arraySize = 32768;</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;int data[arraySize];</code></pre>\n<pre><code><br></code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;for (unsigned c = 0; c &lt; arraySize; ++c)</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data[c] = std::rand() % 256;</code></pre>\n<pre><code><br></code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;// !!! With this, the next loop runs faster.</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;std::sort(data, data + arraySize);</code></pre>\n<pre><code><br></code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;// Test</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;clock_t start = clock();</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;long long sum = 0;</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;for (unsigned i = 0; i &lt; 100000; ++i)</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;{</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for (unsigned c = 0; c &lt; arraySize; ++c)</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{ &nbsp;&nbsp;// Primary loop</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (data[c] &gt;= 128)</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sum += data[c];</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;}</code></pre>\n<pre><code><br></code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;double elapsedTime = static_cast&lt;double&gt;(clock()-start) / CLOCKS_PER_SEC;</code></pre>\n<pre><code><br></code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;std::cout &lt;&lt; elapsedTime &lt;&lt; \'\\n\';</code></pre>\n<pre><code>&nbsp;&nbsp;&nbsp;&nbsp;std::cout &lt;&lt; \"sum = \" &lt;&lt; sum &lt;&lt; \'\\n\';</code></pre>\n<pre><code>}</code></pre>\n<ul>\n  <li>&nbsp;the code runs in 11.54 seconds&nbsp;</li>\n  <li>&nbsp;With the sorted data, the code runs in 1.93 seconds&nbsp;</li>\n</ul>',2,'2022-02-22 17:55:10','2022-02-22 18:02:51','c9fa9727-c3bf-4823-b918-73300ab67afa'),('70355387-ddb2-46b5-96a0-8e221826aa84','How do I undo the most recent local commits in Git?','<p>&nbsp;I accidentally <strong>committed the wrong files</strong> to <a href=\"https://en.wikipedia.org/wiki/Git\" rel=\"noreferrer\"><u>Git</u></a> but didn\'t push the commit to the index yet.</p>\n<p>How can I <strong>undo those commits from the local repository</strong>?</p>\n<p>The only way seems to be to copy the edits in some kind of GUI text editor, then wipe the whole local clone, then re-clone the repository, then re-applying the edits. However,<br>\n</p>\n<ul>\n  <li>This can cause data loss.</li>\n  <li>It\'s very hard to do this when only an accidental was run.</li>\n</ul>\n<p>Is there a better way?</p>',0,'2022-02-22 17:56:03','2022-02-22 17:56:03','c9fa9727-c3bf-4823-b918-73300ab67afa'),('9db4e466-85bd-4fca-a1c0-4e15f070a0a5','How do I delete a Git branch locally and remotely?','<p>I want to delete a branch both locally and remotely.</p>\n<h3>Failed Attempts to Delete a Remote Branch</h3>\n<p>&nbsp;What should I do differently to successfully delete the branch both locally and remotely?&nbsp;</p>',0,'2022-02-22 17:57:21','2022-02-22 17:57:21','c9fa9727-c3bf-4823-b918-73300ab67afa'),('ba8f4f96-8446-4007-8467-d389bb99c9cf','What is the correct JSON content type?','<p>I\'ve been messing around with <a href=\"http://en.wikipedia.org/wiki/JSON\" rel=\"noreferrer\"><u>JSON</u></a> for some time, just pushing it out as text and it hasn\'t hurt anybody (that I know of), but I\'d like to start doing things properly.</p>\n<p>I have seen <em>so</em> many purported \"standards\" for the JSON content type:<br>\n<br>\nBut which one is correct, or best? I gather that there are security and browser support issues varying between them.&nbsp;</p>\n<p>I know there\'s a similar question, <a href=\"https://stackoverflow.com/questions/404470/what-mime-type-if-json-is-being-returned-by-a-rest-api\"><u><em>What MIME type if JSON is being returned by a REST API?</em></u></a>, but I\'d like a slightly more targeted answer.&nbsp;</p>',2,'2022-02-22 18:02:04','2022-02-22 18:06:03','483198ed-01de-4aff-9c55-a819271e46a7'),('f6c5f9b6-6021-4668-bc35-60aeba5f56ff','What does the \"yield\" keyword do?','<p>&nbsp;What is the use of the yield keyword in Python? What does it do?</p>\n<p>For example, I\'m trying to understand this code</p>\n<p>And this is the caller:&nbsp;</p>\n<p>&nbsp;What happens when the method is called? Is a list returned? A single element? Is it called again? When will subsequent calls stop?&nbsp;</p>',2,'2022-02-22 18:00:40','2022-02-22 18:06:35','907a2032-ba37-4784-aad4-bd2764d631e8'),('f86b89aa-4948-47f4-a144-2ef48044f516','What is the difference between \'git pull\' and \'git fetch\'?','<p>&nbsp;What are the differences between&nbsp;</p>\n<pre><code>git pull</code></pre>\n<p>and&nbsp;</p>\n<pre><code>git fetch</code></pre>',0,'2022-02-22 17:58:54','2022-02-22 17:58:54','b3fd5056-fd6b-4453-91cf-d1c015333867');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-22 23:39:47

-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: stack_overflow
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posttag`
--

DROP TABLE IF EXISTS `posttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `posttag` (
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `post_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tag_id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `posttag_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posttag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posttag`
--

LOCK TABLES `posttag` WRITE;
/*!40000 ALTER TABLE `posttag` DISABLE KEYS */;
INSERT INTO `posttag` VALUES ('2022-02-22 17:55:10','2022-02-22 17:55:10','621b42d0-718d-407b-9198-cda575a2b184','0b2d3b9e-3d45-437e-84b5-3ba1f72589be'),('2022-02-22 17:56:03','2022-02-22 17:56:03','70355387-ddb2-46b5-96a0-8e221826aa84','77a72351-f064-4230-b154-1070bc86c2ae'),('2022-02-22 17:57:21','2022-02-22 17:57:21','9db4e466-85bd-4fca-a1c0-4e15f070a0a5','77a72351-f064-4230-b154-1070bc86c2ae'),('2022-02-22 18:02:04','2022-02-22 18:02:04','ba8f4f96-8446-4007-8467-d389bb99c9cf','c8ca90d6-231a-4ff9-b148-f92f0397da4d'),('2022-02-22 18:00:40','2022-02-22 18:00:40','f6c5f9b6-6021-4668-bc35-60aeba5f56ff','79b243fe-ecbb-4d67-9089-09c8e91a7b19'),('2022-02-22 17:58:54','2022-02-22 17:58:54','f86b89aa-4948-47f4-a144-2ef48044f516','9b6fe43f-1342-4fe0-b63f-3c005ce474cb');
/*!40000 ALTER TABLE `posttag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-22 23:39:47

-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: stack_overflow
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tagname` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagname` (`tagname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES ('0b2d3b9e-3d45-437e-84b5-3ba1f72589be','java','Java is a high-level object oriented programming language. Use this tag when you&#39;re having problems using or understanding the language itself. This tag is frequently used alongside other tags for libraries and/or frameworks used by Java developers.','2022-02-22 17:55:10','2022-02-22 17:55:10'),('77a72351-f064-4230-b154-1070bc86c2ae','git','Git is an open-source distributed version control system (DVCS). Use this tag for questions related to Git usage and workflows. DO NOT USE the [github] tag for Git-related issues simply because a repository happens to be hosted on GitHub. Also, do not use this tag for general programming questions that happen to involve a Git repository.\r\n','2022-02-22 17:56:03','2022-02-22 17:56:03'),('79b243fe-ecbb-4d67-9089-09c8e91a7b19','python','Python is a multi-paradigm, dynamically typed, multi-purpose programming language. It is designed to be quick to learn, understand, and use, and enforces a clean and uniform syntax. Please note that Python 2 is officially out of support as of 2020-01-01. For version-specific Python questions, add the [python-2.7] or [python-3.x] tag. When using a Python variant (e.g. Jython, PyPy) or library (e.g. Pandas, NumPy), please include it in the tags.','2022-02-22 18:00:40','2022-02-22 18:00:40'),('9b6fe43f-1342-4fe0-b63f-3c005ce474cb','version-control','Version control is the management of changes to documents, programs, and other information stored as computer files. Use this tag to mark general questions about usage and applicability of version control, VCS comparison. For most commands and techniques specific to each particular VCS there are specific tags, which should be preferred.','2022-02-22 17:58:54','2022-02-22 17:58:54'),('c8ca90d6-231a-4ff9-b148-f92f0397da4d','json','JSON (JavaScript Object Notation) is a serializable data interchange format intended to be machine and human readable. Do not use this tag for native JavaScript objects or JavaScript object literals. Before you ask a question, validate your JSON using a JSON validator such as JSONLint (https://jsonlint.com).','2022-02-22 18:02:04','2022-02-22 18:02:04');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-22 23:39:47

-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: stack_overflow
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gravatar` varchar(255) NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('483198ed-01de-4aff-9c55-a819271e46a7','shubh','$2a$10$z6O1Rpd6wlDKt03dePOTo.PMxH2VvDXy4itjcdk6FH/Fictrh660W','https://secure.gravatar.com/avatar/77?s=164&d=identicon',0,'2022-02-22 17:49:41','2022-02-22 17:49:41'),('64d34159-52cc-4ff8-8609-b8eef9d42d69','harshal','$2a$10$4jKcvNX24bYggNvkOtqOKOPdMOJhoq/EontgTY0JXPHuIy/JD6W5W','https://secure.gravatar.com/avatar/5?s=164&d=identicon',0,'2022-02-22 17:49:31','2022-02-22 17:49:31'),('88a24a94-8a6f-41cb-968d-0f7bb9e70e9d','aarsh','$2a$10$J33YX./Y6egb2knTJYPAlOYXXOkhERlpVamvQTIyPSKaWcklePT6a','https://secure.gravatar.com/avatar/88?s=164&d=identicon',0,'2022-02-22 17:50:16','2022-02-22 17:50:16'),('907a2032-ba37-4784-aad4-bd2764d631e8','rithik','$2a$10$K423U2rlf.b9.FIj70g54ei9MtKkcA0f9cPvm7UO2ajFy.7wqXZfO','https://secure.gravatar.com/avatar/60?s=164&d=identicon',0,'2022-02-22 17:49:22','2022-02-22 17:49:22'),('9969539d-1057-4b59-b03a-c73cffbe575d','hritik','$2a$10$EgCWewInvCKj5s4qbVXohe5P3kLcCqbIHwguv40Xe7mhE5Ou5Na2u','https://secure.gravatar.com/avatar/8?s=164&d=identicon',0,'2022-02-22 17:51:05','2022-02-22 17:51:05'),('a210dae5-20f5-42bf-9bba-03433f7e1fc8','rajarshee','$2a$10$fTeDXhR0jLqUpoOW42vSLu6EcBa5eWvtjjyr0pSzk5Bxb5z4.CvJC','https://secure.gravatar.com/avatar/80?s=164&d=identicon',0,'2022-02-22 17:50:00','2022-02-22 17:50:00'),('b3fd5056-fd6b-4453-91cf-d1c015333867','jaidev','$2a$10$.N6tBKw5/prwHFYVC5Y3iufqqqzJOFt9tf6/k7NrMJBa7v1BnUqNe','https://secure.gravatar.com/avatar/78?s=164&d=identicon',0,'2022-02-22 17:49:50','2022-02-22 17:49:50'),('c9fa9727-c3bf-4823-b918-73300ab67afa','mayank','$2a$10$hX6pNZYhaoTCsHKlJXWqDuFTaU1VNE0RLOV/XxGkzQSXvMZhm3Ci.','https://secure.gravatar.com/avatar/71?s=164&d=identicon',0,'2022-02-21 18:40:07','2022-02-21 18:40:07'),('f39238a4-90df-4cf6-9ab1-fdd43a380532','vansh','$2a$10$U4VwWNpizmMujrnUHpan0OIMxd9qLXhD8CY/XpwkJaY/PAbHOsVcK','https://secure.gravatar.com/avatar/98?s=164&d=identicon',0,'2022-02-22 17:50:09','2022-02-22 17:50:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-22 23:39:47
