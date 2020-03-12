/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.19 : Database - song
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`song` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `song`;

/*Table structure for table `alembic_version` */

DROP TABLE IF EXISTS `alembic_version`;

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `alembic_version` */

insert  into `alembic_version`(`version_num`) values ('1a6bc3fa113e');

/*Table structure for table `answer` */

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `question_id` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `answer` */

insert  into `answer`(`id`,`content`,`question_id`,`author_id`,`create_time`) values (2,'太强了！',1,1,'2020-02-14 15:10:21'),(3,'赞',2,1,'2020-02-14 14:10:26'),(4,'强强强',2,1,'2020-02-15 15:38:56');

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `question` */

insert  into `question`(`id`,`title`,`content`,`create_time`,`author_id`) values (1,'Python代码练习(一)：基础','Python代码练习(一)：基础\r\n七月在线课程的练习题\r\n\r\n练习1\r\n求从1到100的数字中所有能既能被3整除，又能被5整除的数字有哪些。\r\n左闭右开原则range(1,101)\r\n整除：%\r\n代码：\r\nfor x in range(1,101):\r\n    if x%3==0 and x%5==0:\r\n        print(x)\r\n    else:\r\n        pass\r\n\r\n练习2：\r\n输入一个字符串返回满足以下条件的字符串\r\n■ 如果字符串长度大等于3，添加 ‘ing’ 到字符串的末尾\r\n■ 如果字符串是以 ‘ing’ 结尾的，就在末尾添加 ‘ly’\r\n■ 如果字符串长度小于3，返回原字符串\r\nif else\r\n代码：\r\nstr=input()\r\nif len(str)>=3:\r\n    if str.endswith(\"ing\"):\r\n        str+=\"ly\"\r\n    else: \r\n        str+=\"ing\"\r\nelse:\r\n    pass\r\n\r\nprint(str)\r\n\r\n\r\n练习3\r\n▪ 判断回文\r\n■ 输入一个数字，如果是回文数字，返回 True，否则 返回False\r\n■ 提示:回文:62426是回文数字\r\n接受键盘输入：input()\r\n判断回文序列: 倒置字符串str[::-1]\r\n\r\n代码：\r\nstr=input()\r\nif str==str[::-1]:\r\n    print(\"True\")\r\nelse:\r\n    print(\"Flase\")\r\n','2020-02-14 15:28:40',1),(2,'程序员必备的九种算法（C语言实现）','（一） BFPRT算法\r\n世界十大经典算法之一，由Blum 、 Floyd 、 Pratt 、 Rivest 、 Tarjan提出，故称为BFPRT算法。\r\n\r\n该算法解决的事是如何在n个数中找出第二大的数，抽象下就是求n个数中第k大（小）的数。当时想到的算法是取前k个排序，保存在数组中，然后遍历后n-k，并将每次遍历的数与数组中的k个值比较并重新排序。时间复杂度o(kn)，如果k小还好说，但是k大了就不好办了。而BFPRT则在线性时间解决了这个问题。\r\n\r\n①将整个数组array[] 5个5个分组，共有n/5组\r\n\r\n②在组内使用插入排序\r\n\r\n③找到每个组的中位数，组成新的数组（长度为n/5） newArray[]\r\n\r\n④递归调用bfprt(newArray, newArray.length/2) 求出其中位数 num\r\n\r\n⑤然后利用num进行3方法中进行partition\r\n\r\n<num =num >num\r\n⑥若在=num区域时，则返回，否则，选择其中的一半进行后续的partition\r\n\r\n代码：\r\n#include <stdio.h>\r\n#include <stdlib.h>\r\n//另类快速排序算法\r\nint compInc(const void *a, const void *b)\r\n{\r\nreturn *(int *)a - *(int *)b;\r\n}\r\n\r\nint main()\r\n{\r\nfloat k; 注意输出格式\r\nint a[1001];\r\nint len ;\r\n\r\nwhile(scanf(\"%d “,&len)!=EOF){ //要注意输入的终止条件\r\nfor(i=0;i<len;i++) //输入\r\nscanf(”%d\",&a[i]);\r\n// printf(“递增排序结果:\\n”);\r\nqsort(a, len, sizeof(a[0]), compInc);\r\nif(len%2==0) { //奇偶取中位数的方法不一样\r\nk=(a[(len/2)-1]+a[(len/2)]);\r\nprintf(\"%.2f\\n\",k/2.00);\r\n}\r\nelse {\r\nk=a[len/2];\r\nprintf(\"%.2f\\n\",k);\r\n}\r\n// break;\r\n\r\n}\r\nreturn 0;\r\n}\r\n\r\n（二）朴素贝叶斯分类算法\r\n1.1 概述\r\n贝叶斯分类算法时一大类分类算法的总称。贝叶斯分类算法以样本可能属于某类的概率来作为分类依据。朴素贝叶斯分类算法时贝叶斯分类算法中最简单的一种。\r\n注：朴素的意思时条件概率独立性（建议大家对概率中的独立重复事件有所了解）\r\n\r\n1.2 算法思想\r\n朴素贝叶斯的思想是这样的：如果一个事物在一些属性条件发生的情况下，事物属于A的概率>属于B的概率，则判定事物属于A。\r\n通俗来说比如，在某条大街上，有100人，其中有50个美国人，50个非洲人，看到一个讲英语的黑人，那么我们是怎么去判断他来自哪里？\r\n提取特征：\r\n肤色：黑，语言：英语\r\n\r\n先验知识：\r\nP(黑色|非洲人) = 0.8\r\nP(讲英语|非洲人)=0.1\r\nP(黑色|美国人)= 0.2\r\nP(讲英语|美国人)=0.9\r\n要判断的概率是：\r\nP(非洲人|(讲英语，黑色) )\r\nP(美国人|(讲英语，黑色) )\r\n\r\n思考过程：\r\n\r\nP(非洲人|(讲英语，黑色) ) 的 分子= 0.1 * 0.8 *0.5 =0.04\r\nP(美国人|(讲英语，黑色) ) 的 分子= 0.9 *0.2 * 0.5 = 0.09\r\n从而比较这两个概率的大小就等价于比较这两个分子的值，可以得出结论，此人应该是：美国人。\r\n其蕴含的数学原理如下：\r\np(A|xy)=p(Axy)/p(xy)=p(Axy)/p(x)p(y)=p(A)/p(x)p(A)/p(y) p(xy)/p(xy)=p(A|x)p(A|y)\r\n（案例借鉴于 CSDN博主「xujing123qwe」）\r\n由于朴素贝叶斯分类算法代码用C语言实现十分复杂，故不在此处展示\r\n\r\n（三） 堆排序\r\n堆排序的基本思想是：将待排序序列构造成一个大顶堆，此时，整个序列的最大值就是堆顶的根节点。将其与末尾元素进行交换，此时末尾就为最大值。然后将剩余n-1个元素重新构造成一个堆，这样会得到n个元素的次小值。如此反复执行，便能得到一个有序序列了\r\n　我们知道，堆分为\"最大堆\"和\"最小堆\"。最大堆通常被用来进行\"升序\"排序，而最小堆通常被用来进行\"降序\"排序。\r\n鉴于最大堆和最小堆是对称关系，理解其中一种即可。本文将对最大堆实现的升序排序进行详细说明。\r\n\r\n最大堆进行升序排序的基本思想：\r\n① 初始化堆：将数列a[1…n]构造成最大堆。\r\n② 交换数据：将a[1]和a[n]交换，使a[n]是a[1…n]中的最大值；然后将a[1…n-1]重新调整为最大堆。 接着，将a[1]和a[n-1]交换，使a[n-1]是a[1…n-1]中的最大值；然后将a[1…n-2]重新调整为最大值。 依次类推，直到整个数列都是有序的。\r\n\r\n实现中用到了\"数组实现的二叉堆的性质\"。\r\n在第一个元素的索引为 0 的情形中：\r\n性质一：索引为i的左孩子的索引是 (2i+1);\r\n性质二：索引为i的左孩子的索引是 (2i+2);\r\n性质三：索引为i的父结点的索引是 floor((i-1)/2);\r\n\r\n代码如下\r\n#include <stdio.h>\r\n#include <malloc.h>\r\nvoid HeapAdjust(int a[],int s,int m)//一次筛选的过程\r\n{\r\nint rc,j;\r\nrc=a[s];\r\nfor(j=2s;j<=m;j=j2)//通过循环沿较大的孩子结点向下筛选\r\n{\r\nif(j<m&&a[j]<a[j+1]) j++;//j为较大的记录的下标\r\nif(rc>a[j]) break;\r\na[s]=a[j];s=j;\r\n}\r\na[s]=rc;//插入\r\n}\r\nvoid HeapSort(int a[],int n)\r\n{\r\nint temp,i,j;\r\nfor(i=n/2;i>0;i–)//通过循环初始化顶堆\r\n{\r\nHeapAdjust(a,i,n);\r\n}\r\nfor(i=n;i>0;i–)\r\n{\r\ntemp=a[1];\r\na[1]=a[i];\r\na[i]=temp;//将堆顶记录与未排序的最后一个记录交换\r\nHeapAdjust(a,1,i-1);//重新调整为顶堆\r\n}\r\n}\r\nint main()\r\n{\r\nint n,i;\r\nscanf(\"%d\",&n);\r\nint a[n+1];\r\nfor(i=1;i<=n;i++)\r\n{\r\nscanf(\"%d\",&a[i]);\r\n}\r\nHeapSort(a,n);\r\n}\r\n\r\n注：mac需要改变malloc.h头文件（血的教训！）\r\n\r\n（四）归并排序\r\n归并排序（MERGE-SORT）是建立在归并操作上的一种有效的排序算法,该算法采用经典的分治（divide-and-conquer）策略（分治法将问题分(divide)成一些小的问题然后递归求解，而治(conquer)的阶段则将分的阶段得到的各答案\"修补\"在一起，即分而治之)，将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序，若将两个有序表合并成一个有序表，称为二路归并\r\n\r\n1、归并排序的基本思想\r\n将待排序序列R[0…n-1]看成是n个长度为1的有序序列，将相邻的有序表成对归并，得到n/2个长度为2的有序表；将这些有序序列再次归并，得到n/4个长度为4的有序序列；如此反复进行下去，最后得到一个长度为n的有序序列\r\n\r\n2、归并排序的算法描述\r\n第一步：申请空间，使其大小为两个已经排序序列之和，该空间用来存放合并后的序列\r\n\r\n第二步：设定两个指针，最初位置分别为两个已经排序序列的起始位置\r\n\r\n第三步：比较两个指针所指向的元素，选择相对小的元素放入到合并空间，并移动指针到下一位置\r\n\r\n重复步骤3直到某一指针超出序列尾，将另一序列剩下的所有元素直接复制到合并序列尾\r\n\r\n归并排序其实要做两件事：\r\n\r\n（1）“分解”——将序列每次折半划分（递归实现）\r\n\r\n（2）“合并”——将划分后的序列段两两合并后排序\r\n\r\n如何合并？\r\n\r\n在每次合并过程中，都是对两个有序的序列段进行合并，然后排序。\r\n\r\n这两个有序序列段分别为 R[low, mid] 和 R[mid+1, high]。\r\n\r\n先将他们合并到一个局部的暂存数组R2中，带合并完成后再将R2复制回R中。\r\n\r\n我们称 R[low, mid] 第一段，R[mid+1, high] 为第二段。\r\n\r\n每次从两个段中取出一个记录进行关键字的比较，将较小者放入R2中，最后将各段中余下的部分直接复制到R2中。\r\n\r\n经过这样的过程，R2已经是一个有序的序列，再将其复制回R中，一次合并排序就完成了。\r\n\r\n3、代码实现\r\n（借鉴于蓝海人作者）\r\n/* 将序列对半拆分直到序列长度为1*/\r\nvoid MergeSort_UptoDown(int *num, int start, int end)\r\n{\r\nint mid = start + (end - start) / 2;\r\n\r\nif (start >= end)\r\n{\r\nreturn;\r\n}\r\n\r\nMergeSort_UptoDown(num, start, mid);\r\nMergeSort_UptoDown(num, mid + 1, end);\r\n\r\nMerge(num, start, mid, end);\r\n}\r\n\r\nvoid Merge(int *num, int start, int mid, int end)\r\n{\r\nint *temp = (int *)malloc((end-start+1) * sizeof(int)); //申请空间来存放两个有序区归并后的临时区域\r\nint i = start;\r\nint j = mid + 1;\r\nint k = 0;\r\n\r\nwhile (i <= mid && j <= end)\r\n{\r\nif (num[i] <= num[j])\r\n{\r\ntemp[k++] = num[i++];\r\n}\r\nelse\r\n{\r\ntemp[k++] = num[j++];\r\n}\r\n}\r\n\r\nwhile (i <= mid)\r\n{\r\ntemp[k++] = num[i++];\r\n}\r\nwhile (j <= end)\r\n{\r\ntemp[k++] = num[j++];\r\n}\r\n\r\n//将临时区域中排序后的元素，整合到原数组中\r\nfor (i = 0; i < k; i++)\r\n{\r\nnum[start + i] = temp[i];\r\n}\r\n\r\nfree(temp);\r\n}\r\n\r\n（五）快速排序\r\n1.\r\n快排是对冒泡排序的一种改进，在快速排序中，元素的比较和移动是从两端向中间进行的，关键码较大的元素一次就能从前面移动到后面，关键码较小的元素一次就能从后面移动到前面，元素移动距离的较远，从而减少了总的比较次数和移动次数\r\n\r\n2\r\n.快速排序是基于分治法设计的，其分治策略是：\r\n①、划分：选定一个元素作为轴值，以轴值为基准将整个序列划分为两个子序列。轴值的位置在划分的过程中确定，并且前一个子序列的元素均小于或者等于轴值，后一个子序列的元素大于或者等于轴值\r\n\r\n②、求解子问题：分别对划分后的每一个子序列递归处理\r\n③、合并：由于对子序列的排序是就地进行的，所以合并并不需要执行任何操作\r\n\r\n代码示范\r\n#include <stdlib.h>\r\n\r\n#include <stdio.h>\r\n\r\nif (end > begin) {\r\n\r\nint l = begin + size;\r\n\r\nint r = end;\r\n\r\nwhile(l < r) {\r\n\r\nif (cmp(array+l,pivot) <= 0) {\r\n\r\nl += size;\r\n\r\n} else {\r\n\r\nr -= size;\r\n\r\nswap(array+l, array+r, size);\r\n\r\n}\r\n\r\n}\r\n\r\n}\r\n\r\ntypedef int type;\r\n\r\nint num_list[]={5,4,3,2,1};\r\n\r\nint len=sizeof(num_list)/sizeof(type);\r\n\r\nint i;\r\n\r\nqsort(num_list,len,sizeof(type),type_cmp);\r\n\r\nprintf(“sorted_num_list={”);\r\n\r\nfor(i=0; i<len; i++){\r\n\r\nprintf(\"%s%d\",sep,num_list[i]);\r\n\r\n}\r\n\r\nprintf(\"};n\");\r\n\r\n}\r\n\r\n（六）二分查找算法\r\n简析：\r\n二分法查找适用于数据量较大时，但是数据需要先排好顺序。\r\n主要思想是：（设查找的数组区间为array[low, high]）\r\n确定该区间的中间位置K将查找的值T与array[k]比较。若相等，查找成功返回此位置；否则确定新的查找区域，继续二分查找。\r\n区域确定如下：a.array[k]>T 由数组的有序性可知array[k,k+1,……,high]>T;故新的区间为array[low,……，K-1]b.array[k]<T 类似上面查找区间为array[k+1,……，high]。每一次查找与中间值比较，可以确定是否查找成功，不成功当前查找区间将缩小一半，递归查找即可。\r\n\r\n代码如下：（强推php中文网的代码规范 超赞 如下）\r\n#include <stdio.h>\r\nint binary_search(int key,int a[],int n) //自定义函数binary_search()\r\n{\r\nint low,high,mid,count=0,count1=0;\r\nlow=0;\r\nhigh=n-1;\r\nwhile(low<high) //査找范围不为0时执行循环体语句\r\n{\r\ncount++; //count记录査找次数\r\nmid=(low+high)/2; //求中间位置\r\nif(key<a[mid]) //key小于中间值时\r\nhigh=mid-1; //确定左子表范围\r\nelse if(key>a[mid]) //key 大于中间值时\r\nlow=mid+1; //确定右子表范围\r\nelse if(key= =a[mid]) //当key等于中间值时，证明查找成功\r\n{\r\nprintf(“查找成功!\\n 查找 %d 次!a[%d]=%d”,count,mid,key); //输出査找次数及所査找元素在数组中的位置\r\ncount1++; //count1记录查找成功次数\r\nbreak;\r\n}\r\n}\r\nif(count1==0) //判断是否查找失敗\r\nprintf(“查找失敗!”); //査找失敗输出no found\r\nreturn 0;\r\n}\r\nint main()\r\n{\r\nint i,key,a[100],n;\r\nprintf(“请输入数组的长度：\\n”);\r\nscanf(\"%d\",&n); //输入数组元素个数\r\nprintf(“请输入数组元素：\\n”);\r\nfor(i=0;i<n;i++)\r\nscanf(\"%d\",&a[i]); //输入有序数列到数组a中\r\nprintf(“请输入你想查找的元素：\\n”);\r\nscanf(\"%d\",&key); //输入要^找的关键字\r\nbinary_search(key,a,n); //调用自定义函数\r\nprintf(\"\\n\");\r\nreturn 0;\r\n}\r\n\r\n（七）动态规划\r\n简介：\r\n动态规划(dynamic programming)是运筹学的一个分支，是求解决策过程(decision process)最优化的数学方法。20世纪50年代初美国数学家R.E.Bellman等人在研究多阶段决策过程(multistep decision process)的优化问题时，提出了著名的最优化原理(principle of optimality)，把多阶段过程转化为一系列单阶段问题，利用各阶段之间的关系，逐个求解，创立了解决这类过程优化问题的新方法——动态规划。\r\n\r\n首先，动态规划最重要的是掌握他的思想，动态规划的核心思想是把原问题分解成子问题进行求解，也就是分治的思想。\r\n\r\n动态规划问题，大致可以通过以下四部进行解决。\r\n\r\n我们通过一个现实中的例子，来理解这个问题。大家可能在公司里面都有一定的组织架构，可能有高级经理、经理、总监、组长然后才是小开发，今天我们通过这个例子，来讲讲什么问题适合使用动态规划。又到了一年一度的考核季，公司要挑选出三个最优秀的员工。一般高级经理会跟手下的经理说，你去把你们那边最优秀的3个人报给我，经理又跟总监说你把你们那边最优秀的人报给我，经理又跟组长说，你把你们组最优秀的三个人报给我，这个其实就动态规划的思想（素材来源于沙茶敏碎碎念）\r\n\r\n1.划分状态，即划分子问题，例如上面的例子，我们可以认为每个组下面、每个部门、每个中心下面最优秀的3个人，都是全公司最优秀的3个人的子问题\r\n2.状态表示，即如何让计算机理解子问题。上述例子，我们可以实用f[i][3表示第i个人，他手下最优秀的3个人是谁。\r\n3.状态转移，即父问题是如何由子问题推导出来的。上述例子，每个人大Leader下面最优秀的人等于他下面的小Leader中最优秀的人中最优秀的几个。\r\n4.确定边界，确定初始状态是什么？最小的子问题？最终状态又是什么。例如上述问题，最小的子问题就是每个小组长下面最优秀的人，最终状态是整个企业，初始状态为每个领导下面都没有最优名单，但是小组长下面拥有每个人的评分。\r\n#include<stdio.h>\r\n#define V 1500\r\nint f[10][V];//全局变量，自动初始化为0\r\nint weight[10];\r\nint value[10];\r\n#define max(x,y) (x)>(y)?(x):(y)\r\nint main()\r\n{\r\n\r\nf[i+1][j]=max{f[i][j],f[i][j-weight[i+1]+value[i+1]}\r\nint N,M;\r\nfreopen(“1.txt”,“r”,stdin);\r\nscanf(\"%d%d\",&N,&M);//N物品个数 M背包容量\r\nfor (int i=1;i<=N; i++)\r\n{\r\nscanf(\"%d%d\",&weight[i],&value[i]);\r\n}\r\n//动态规划\r\nfor (int i=1; i<=N; i++)\r\nfor (int j=1; j<=M; j++)\r\n{\r\nif (weight[i]<=j)\r\n{\r\nf[i][j]=max(f[i-1][j],f[i-1][j-weight[i]]+value[i]);\r\n}\r\nelse\r\nf[i][j]=f[i-1][j];\r\n}\r\nprintf(\"%d\\n\",f[N][M]);//输出最优解\r\n}\r\n\r\n（八）深度优先搜索算法\r\n简介：\r\n事实上，深度优先搜索属于图算法的一种，英文缩写为DFS即Depth First Search.其过程简要来说是对每一个可能的分支路径深入到不能再深入为止，而且每个节点只能访问一次.\r\n深度优先的基本原则：按照某种条件往前试探搜索，如果前进中遭到失败（正如老鼠遇到死胡同）则退回头另选通路继续搜索，直到找到满足条件的目标为止。\r\n\r\n代码来源于百度知道\r\n#include <stdlib.h>\r\n#include <stdio.h>\r\n\r\nstruct node /* 图顶点结构定义 /\r\n{\r\nint vertex; / 顶点数据信息 */\r\nstruct node nextnode; / 指下一顶点的指标 */\r\n};\r\ntypedef struct node graph; / 图形的结构新型态 /\r\nstruct node head[9]; / 图形顶点数组 /\r\nint visited[9]; / 遍历标记数组 */\r\n\r\n/根据已有的信息建立邻接表/\r\nvoid creategraph(int node[20][2],int num)/num指的是图的边数/\r\n{\r\ngraph newnode; /指向新节点的指针定义/\r\ngraph ptr;\r\nint from; /* 边的起点 /\r\nint to; / 边的终点 /\r\nint i;\r\nfor ( i = 0; i < num; i++ ) / 读取边线信息，插入邻接表*/\r\n{\r\nfrom = node[i][0]; /* 边线的起点 /\r\nto = node[i][1]; / 边线的终点 */\r\n\r\n/* 建立新顶点 /\r\nnewnode = ( graph ) malloc(sizeof(struct node));\r\nnewnode->vertex = to; / 建立顶点内容 /\r\nnewnode->nextnode = NULL; / 设定指标初值 /\r\nptr = &(head[from]); / 顶点位置 /\r\nwhile ( ptr->nextnode != NULL ) / 遍历至链表尾 /\r\nptr = ptr->nextnode; / 下一个顶点 /\r\nptr->nextnode = newnode; / 插入节点 */\r\n}\r\n}\r\n\r\n/********************** 图的深度优先搜寻法********************/\r\nvoid dfs(int current)\r\n{\r\ngraph ptr;\r\nvisited[current] = 1; /* 记录已遍历过 /\r\nprintf(“vertex[%d]\\n”,current); / 输出遍历顶点值 /\r\nptr = head[current].nextnode; / 顶点位置 /\r\nwhile ( ptr != NULL ) / 遍历至链表尾 /\r\n{\r\nif ( visited[ptr->vertex] == 0 ) / 如过没遍历过 /\r\ndfs(ptr->vertex); / 递回遍历呼叫 /\r\nptr = ptr->nextnode; / 下一个顶点 */\r\n}\r\n}\r\n\r\n/****************************** 主程序******************************/\r\nint main()\r\n{\r\ngraph ptr;\r\nint node[20][2] = { {1, 2}, {2, 1}, /* 边线数组 /\r\n{1, 3}, {3, 1},\r\n{1, 4}, {4, 1},\r\n{2, 5}, {5, 2},\r\n{2, 6}, {6, 2},\r\n{3, 7}, {7, 3},\r\n{4, 7}, {4, 4},\r\n{5, 8}, {8, 5},\r\n{6, 7}, {7, 6},\r\n{7, 8}, {8, 7} };\r\nint i;\r\n//clrscr();\r\nfor ( i = 1; i <= 8; i++ ) / 顶点数组初始化 /\r\n{\r\nhead[i].vertex = i; / 设定顶点值 /\r\nhead[i].nextnode = NULL; / 指针为空 /\r\nvisited[i] = 0; / 设定遍历初始标志 /\r\n}\r\ncreategraph(node,20); / 建立邻接表 /\r\nprintf(“Content of the gragh’s ADlist is:\\n”);\r\nfor ( i = 1; i <= 8; i++ )\r\n{\r\nprintf(“vertex%d ->”,head[i].vertex); / 顶点值 /\r\nptr = head[i].nextnode; / 顶点位置 /\r\nwhile ( ptr != NULL ) / 遍历至链表尾 /\r\n{\r\nprintf(\" %d \",ptr->vertex); / 印出顶点内容 /\r\nptr = ptr->nextnode; / 下一个顶点 /\r\n}\r\nprintf(\"\\n\"); / 换行 /\r\n}\r\nprintf(\"\\nThe end of the dfs are:\\n\");\r\ndfs(1); / 打印输出遍历过程 /\r\nprintf(\"\\n\"); / 换行 */\r\nputs(\" Press any key to quit…\");\r\n// getch();\r\n}\r\n\r\n（九）广度优先搜索算法\r\n宽度优先搜索算法（又称广度优先搜索）是最简便的图的搜索算法之一，这一算法也是很多重要的图的算法的原型。Dijkstra单源最短路径算法和Prim最小生成树算法都采用了和宽度优先搜索类似的思想。其别名又叫BFS，属于一种盲目搜寻法，目的是系统地展开并检查图中的所有节点，以找寻结果。换句话说，它并不考虑结果的可能位置，彻底地搜索整张图，直到找到结果为止。\r\n代码如下（借鉴CSDN博主「waectr」的原代码）：\r\n#include<stdio.h>\r\n\r\nstruct note{\r\nint x;//横坐标\r\nint y;//纵坐标\r\nint f;//父在队列中的编号\r\nint s;//步数\r\n};\r\n\r\nint main(){\r\nstruct note que[2501];//创建队列\r\nint a[51][51]={0},book[51][51]={0};\r\n//定义方向的数组\r\nint next[4][2]={{0,1},{1,0},{0,-1},{-1,0}};\r\nint head,tail;\r\nint i,j,m,n,startx,starty,p,q,tx,ty,flag;\r\nscanf(\"%d %d\",&n,&m);\r\nfor(i=1;i<=n;i++){\r\nfor(j=1;j<=m;j++){\r\nscanf(\"%d\",&a[i][j]);\r\n}\r\n}\r\n\r\n//输入出发点和要到达的点\r\nscanf(\"%d %d %d %d\",&startx,&starty,&p,&q);\r\n\r\n//初始化队列\r\nhead=1;tail=1;\r\nque[tail].x=startx;\r\nque[tail].y=starty;\r\nque[tail].f=0;\r\nque[tail].s=0;\r\ntail++;\r\nbook[startx][starty]=1;\r\n\r\nflag=0;//用来标记是否到达\r\n\r\n//判断队列\r\nwhile(head<tail){\r\n\r\n//向着四个方向出发\r\nfor(i=0;i<4;i++){\r\n\r\ntx=que[head].x+next[i][0];\r\nty=que[head].y+next[i][1];\r\n\r\nif(tx<1||tx>n||ty<1||ty>m){\r\ncontinue;\r\n}\r\n\r\nif(a[tx][ty]= =0&&book[tx][ty]= =0){\r\nbook[tx][ty]=1;\r\nque[tail].x=tx;\r\nque[tail].y=ty;\r\nque[tail].f=head;\r\nque[tail].s=que[head].s+1;\r\ntail++;\r\n}\r\nif(tx= =p&&ty= =q){\r\nflag=1;\r\nbreak;\r\n}\r\n}\r\nif(flag==1){\r\nbreak;\r\n}\r\nhead++;\r\n}\r\n\r\nprintf(\"%d\",que[tail-1].s);','2020-02-14 15:58:17',1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `telephone` varchar(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`telephone`,`username`,`password`) values (1,'15874664801','chen','111111');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
