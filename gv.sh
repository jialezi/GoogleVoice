#!/bin/bash
keyerrorlogo='
==================================================================

           --------- Google Voice申请脚本 ----------
		   		   
                                                 -----  jaz 
==================================================================';

clear
echo "$keyerrorlogo";
echo "请确保填写的信息准确，填错了脚本不会有任何提示。";
echo "按Enter继续";
read

echo "请输入你的cURL(bash)"
read curl

echo "请输入你要申请的GV号（纯数字10位，如：3859998880）"
read gv

echo $curl > gv.txt

sed -i 's/mid=2/mid=6/' gv.txt
sed -i 's/true%5D/%22%2B1'$gv'%22%2Ctrue%2C%22%22%5D/' gv.txt

echo "按Enter开始刷号";
read



for (( i=1; i>0; i++ ))
    do
	a=`bash gv.txt`;
        b='[[null,null,"There was an error with your request. Please try again."]]';
	if [[ "$a" != "$b" ]];
        then
        echo "执行失败/申请成功";
        echo "共执行 $i 次";
        exit 0;
        else
        echo "第 $i 次尝试 "`date`;
	fi
    sleep 0.5s;
done
