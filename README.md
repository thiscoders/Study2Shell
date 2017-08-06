## Linux Shell
### 进行linux正则表达式的练习

### 1. 基础正则表达式
1. 符号:
	1. *:前一个字符匹配0次或者任意多次
	2. .:匹配除换行符的任意字符
	3. ^:匹配行首
	4. $:匹配行尾
	5. []:匹配括号中任意一个字符
	6. \[^\]:匹配非括号中的任意一个字符
	7. \:转义字符
	8. \{n\}:其前面字符出现恰好n次
	9. \{n,\}:其前面字符出现至少n次
	10. \{n,m\}:其前面出现的字符出现的次数介于n和m之间
	* example:
		* "[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}":匹配日期

2. grep命令:截取行

3. cut命令:截取列，默认按tab截取

4. printf/print命令:(awk可以识别此语法)
	* 格式化输出文件内容:printf '%s\t%s\t%s\t%s\t%s\t%s\t\n' $(cat student.txt)


5. awk命令:截取列，按任意的字符截取(语法：awk '条件{动作}' 文件名)
	* 选取student.txt中的2，4，6列:awk '{printf $2 "\t" $4 "\t" $6 "\n"}' student.txt
		* 示例01:df -h | awk '{printf $5 "\n"}' | cut -d "%" -f 1
	* 打印student.txt中的2，6行，并打印开始和结束
		* awk 'BEGIN{printf "begin\n"}{printf $2 "\t" $6 "\n"}END{printf "end\n"}' student.txt
	* 打印/etc/passwd 中的用户并获取其第1,3列的数据
		* cat /etc/passwd | grep "/bin/bash"  | awk 'BEGIN{FS=":"}{printf $1 "\t" $3 "\n"}'
	* 打印出student.txt中成绩大于80的行的第1，2，5列
		* cat student.txt | grep -v "NAME" | awk '$5>80{printf $1 "\t" $2 "\t" $5 "\n"}'

6. sed命令:完成字符串的查找，替换(主要)，修改，添加等操作(sed)
	1. 选项:
		* -n:将命令的结果输出到屏幕
		* -e:允许对输入数据应用多条sed命令编辑
		* -i:将sed的修改结果直接写入文件，而不在屏幕显示
	2. 动作:
		* -a:在当前行之后添加一行或者多行
		* -c:用c后面的字符串替换原数据行
		* -i:插入
		* -d:删除指定的行
		* -p:在屏幕上显示指定的行
		* -s:用一个字符串替换另一个字符串，语法格式与vim替换类似
	3. example:
		1. sed -n '4p' student.txt 将student.txt的第4行打印两遍
		2. sed '1a haha' student.txt  给student.txt的第一行之后插入haha
		3. sed '1,3d'  student.txt 删除student.txt的第一行到第三行并显示
		4. sed '4s/89/99/g' student.txt  将student.txt的第四行的89替换为99，g代表替换所有的89,如果不加g则代表只替换匹配到的第一个89'4s/89/89/'

7. 字符处理命令sort/wc

8. shell流程控制语句
	1. 单分支if条件句
	```shell
		if [条件01]
			then
				#do something
		fi
	```
			or
	```shell
		if [条件01];then
			#do something
		fi
	```
	2. 多分支if条件句
	```shell
		if [条件01]
			then
				#do something
		elif [条件02]
			then
				#do something
                ...
		else
				#所有条件都不满足时执行这个语句
		fi	
	```

9. 格式化输出
	* printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
	* printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 

---

1. 算数运算
* \+  is  加
* \-  is  减
* \*  is  乘
* /   is  除
* %   is  取余
* =   is  赋值
* ==  is  相等？
* !=  is  不相等？


				
2. 大小判断		
* -eq  is  =
* -ne  is  !=
* -gt  is  >
* -lt  is  <
* -ge  is  >=
* -le  is  <=

3. 布尔运算
* -a  is  and
* -o  is  or
* !   is  非

4. 逻辑运算
* &&  is  逻辑AND
* ||  is  逻辑OR

5. 字符串运算
* =   相等为true
* !=  不相等为true
* -z  字符串长度为0返回True
* -n  字符串长度不为0返回True
* str 字符串不为空返回True

6. 文件测试运算符(栗子: [-b $file])
* -b 块设备文件
* -c 字符设备文件
* -d 是否是目录
* -f 是否是普通文件
* -g 文件是否设置了 SGID 位
* -k 文件是否设置了粘着位(Sticky Bit)
* -p 文件是否是有名管道
* -u 是否设置了 SUID 位
* -r 是否可读
* -w 是否可写
* -x 是否可执行
* -s 是否为空（文件大小是否大于0）
* -e 文件是否存在


7. 函数相关
* $# 传递到函数的参数个数
* $* 以一个单字符串显示所有向脚本传递的参数
* $$ 脚本运行的当前进程ID号
* $! 后台运行的最后一个进程的ID号
* $@ 与$*相同，但是使用时加引号，并在引号中返回每个参数
* $- 显示Shell使用的当前选项，与set命令功能相同
* $? 显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。