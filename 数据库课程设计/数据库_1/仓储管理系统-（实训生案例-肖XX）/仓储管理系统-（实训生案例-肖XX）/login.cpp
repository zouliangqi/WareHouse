/*### login.cpp ###*/
/*#################*/
/*Longin 类主要用于不同人员登入的协调，负责登入及登入后不同人员有不同的函数调用*/

#include <iostream>
#include <fstream>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <vector>
#include "myclass.h"
using namespace std;
/*
void Login::readrecord(const char *str)
{
	ifstream inf(str,ios::binary);
	if(inf.bad())
	{
		cout<<"open error of "<<str<<endl;
		exit(1);
	}
	Login::Node n1;
	while(1)
	{
		inf.read((char*)&n1,sizeof(Login::Node));
		if(!inf.eof())
		{
			vec.push_back(n1);
		}
		else
			return;
	}
}

void Login::writerecord(const char *str)
{
	ofstream outf(str,ios::binary);
	for(vector<Login::Node>::iterator itr=vec.begin();itr!=vec.end();itr++)
	{
		outf.write((char*)itr,sizeof(Login::Node));
	}
}

Login::Login()
{
	readrecord("loginrecord");
	falsetimes=0;
}
Login::~Login()
{
	writerecord("loginrecord");
}
*/
/*登入菜单界面*/
void Login::logmenu()
{
	wrongtimes=0;//非法登入次数，累计三次自动退出
	while(1)
	{
		system("clear");
		char ch[30];
		cout<<"\n\n\t\t\033[32m            欢迎登入仓库管理系统"<<endl;
		cout<<"\t\t||————————————————————————————————————————||"<<endl;
		cout<<"\t\t||\033[33m            1.  员工登入                \033[32m||"<<endl;
		cout<<"\t\t||\033[33m            2.  管理员登入              \033[32m||"<<endl;
		cout<<"\t\t||\033[33m            3.  退出系统                \033[32m||"<<endl;
		cout<<"\t\t||————————————————————————————————————————||\033[0m"<<endl;
		cout<<"\t\t\033[33m请选择数字\033[31m（1~3）\033[33m进行登入或退出：\033[0m";
		cin.getline(ch,30);
		switch(ch[0])
		{
			case '1':
				peoplelog(menu());
				break;
			case '2':
				adminlog();         
				break;
			case '3':
				return;
			default:
				continue;
		}
	}
	
}
/*非管理员登入信息获取函数*/
People Login::menu()
{
	People man;
	char ch[30];
	cout<<"\n\t\t\t\033[33m  请输入姓名： ";cin.getline(ch,16);
	man.setName(ch);
	cout<<"\n\t\t\t  请输入工号： ";cin.getline(ch,12);
	man.setNum(atoi(ch));
	cout<<"\n\t\t\t  请输入密码： \033[8m";cin.getline(ch,24);cout<<"\033[0m";
	man.setPassword(ch);
	return man;

}
/*非管理员登入后，根据不同的部门赋予不同的权限（出库，入库，普通）*/
/*用于保存人员的链表与个人相对独立，所以完成操作需要链表对象，人的个体对象*/
void Login::peoplelog(const People& man)
{
	char ch[30];
	Plist list;//创建保存所有人员基本信息的链表
	list.read("people");
	People *ptr;
	ptr=list.find(man,3);//登入查找
	if(ptr!=NULL)
	{
		/*入库权限*/
		if(ptr->samedepartment("INDP"))  
		{
			Inman inman(*ptr);//构造有入库权限的副本
			inman.display_operate();//操作
			*ptr=inman;//保存(内存链表中)
		}
		/*出库权限*/
		else if(ptr->samedepartment("OUTDP"))
		{
			Outman outman(*ptr);
			outman.display_operate();
			*ptr=outman;
		}
		/*普通查找权限*/
		else
		{
			Comman comman(*ptr);
			comman.display_operate();
			*ptr=comman;
		}
		ptr->gettime();//取退出时间
		list.write("people");//写文件保存
	}
	else
	{
		wrongtimes++;//非法登入次数累加
		if(wrongtimes>2)
		{
			cout<<"\n\t\t\033[31m三次密码错误！自动退出系统！\033[0m"<<endl;
			sleep(2);exit(0);
		}
		cout<<"\n\t\t\033[31m用户不存在，或密码错误！\033[0m"<<endl;;
		sleep(2);
	}
}
/*管理员登入*/
void Login::adminlog()
{
	char ch[30];
	cout<<"\n\t\t\t\033[33m    管理员： Admin"<<endl;
	cout<<"\n\t\t\t请输入密码： \033[8m";cin.getline(ch,24);
	cout<<"\033[0m";
	if(strcmp(ch,"123456")==0)
	{
		Admin admin;//创建管理员对象
		admin.display_operate();//操作
	}
	else
	{
		cout<<"\n\t\033[31m密码错误！"<<endl;
		sleep(2);
	}
}
