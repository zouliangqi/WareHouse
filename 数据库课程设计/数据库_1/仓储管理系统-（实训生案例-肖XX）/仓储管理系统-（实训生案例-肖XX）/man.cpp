/*### man.cpp ###*/
/*###############*/
/*本文件主要是普通，出库，入库人员通过底层调用的操作函数及交互界面*/

#include "myclass.h"
#include <iostream>
#include <stdlib.h>
#include <string.h>
using namespace std;
/*拷贝构造函数*/
Inman::Inman(People& p1)
{
	this->num=p1.num;
	strcpy(this->name,p1.name);
	this->age=p1.age;
	strcpy(this->sex,p1.sex);
	strcpy(this->phone,p1.phone);
	strcpy(this->department,p1.department);
	strcpy(this->password,p1.password);
	strcpy(this->priortime,p1.priortime);
	tlist.readfile("thing");

}

/*添加货物商品*/
void Inman::add_th()
{
	system("clear");
	char ch[10];
	char sh[20];
	cout<<"\n\n\t\t\033[32m          商品入库"<<endl;
	cout<<"\t\t****************************\033[33m"<<endl;
	cout<<"\n\t\t（8位）快递单号：";cin.getline(sh,12);
	if(strlen(sh)!=8)
	{
		cout<<"\n\t\033[31m快递单号为8位数字，入库失败!"<<endl;
		RPAUSE
		return;
	}
	cout<<"\n\t\t       商品属性：";cin.getline(ch,10);cout<<"\033[0m"<<endl;
	if(strcmp(ch,"USE")!=0&&strcmp(ch,"FOOD")!=0&&strcmp(ch,"OTHER")!=0)
	{
		cout<<"\n\t\033[33m商品属性为“USE”，“FOOD”，“OTHER”，入库失败！"<<endl;
		RPAUSE
		return;
	}
	Thing th(atoi(sh),ch);          //货物构造
	tlist.add(th);					//添加到货物链表
	tlist.writefile("thing");        //保存写到文件里
	cout<<"\n\n\t\t\033[32m成功入库！"<<endl;
	GPAUSE
}
/*入库人员操作界面菜单*/
void Inman::display_operate()
{
	while(1)
	{
		system("clear");
		char ch[20];
		cout<<"\n\t\033[34m上次登入时间： "<<priortime<<"\033[0m"<<endl;
		cout<<"\n\n\t\t\033[32m  欢迎 "<<name<<" 登入系统"<<endl;
		cout<<"\t\t**************************\033[33m"<<endl;
		cout<<"\n\t\t       1.个人信息"<<endl;
		cout<<"\n\t\t       2.商品入库"<<endl;
		cout<<"\n\t\t       3.退出系统"<<endl;
		cout<<"\t请选择：\033[0m";
		cin.getline(ch,20);
		switch(*ch)
		{
			case '1':
				People::display_operate();
				break;
			case '2':
				add_th();
				break;
			case '3':
				return;
			default:
				break;
		}
	}
}
/*出库人员拷贝构造函数*/
Outman::Outman(People& p1)
{
	this->num=p1.num;
	strcpy(this->name,p1.name);
	this->age=p1.age;
	strcpy(this->sex,p1.sex);
	strcpy(this->phone,p1.phone);
	strcpy(this->department,p1.department);
	strcpy(this->password,p1.password);
	strcpy(this->priortime,p1.priortime);
	tlist.readfile("thing");

}
/*商品出库（删除）*/
void Outman::del_th()
{
	system("clear");
	char sh[20];
	long code;
	cout<<"\n\n\t\t\033[32m          商品出库"<<endl;
	cout<<"\t\t****************************\033[33m"<<endl;
	cout<<"\n\t\t    二维码：";cin.getline(sh,20);
	code=atoi(sh);
	if(tlist.del(code)==true)             //判断是否删除成功
	{
		tlist.writefile("thing");        //删除后写文件保存
		cout<<"\n\n\t\t\033[32m成功出库！\033[0m"<<endl;
		GPAUSE
	}
	else
	{
		cout<<"\n\n\t\033[31m错误二维码！出库失败"<<endl;
		RPAUSE
	}
}
/*出库人员操作界面菜单*/
void Outman::display_operate()
{
	while(1)
	{
		system("clear");
		char ch[20];
		cout<<"\n\t\033[34m上次登入时间： "<<priortime<<"\033[0m"<<endl;
		cout<<"\n\n\t\t\033[32m  欢迎 "<<name<<" 登入系统"<<endl;
		cout<<"\t\t**************************\033[33m"<<endl;
		cout<<"\n\t\t       1.个人信息"<<endl;
		cout<<"\n\t\t       2.商品出库"<<endl;
		cout<<"\n\t\t       3.退出系统"<<endl;
		cout<<"\t请选择：\033[0m";
		cin.getline(ch,20);
		switch(*ch)
		{
			case '1':
				People::display_operate();
				break;
			case '2':
				del_th();
				break;
			case '3':
				return;
			default:
				break;
				
		}
	}
}
/*普通人员拷贝构造函数*/
Comman::Comman(People& p1)
{
	this->num=p1.num;
	strcpy(this->name,p1.name);
	this->age=p1.age;
	strcpy(this->sex,p1.sex);
	strcpy(this->phone,p1.phone);
	strcpy(this->department,p1.department);
	strcpy(this->password,p1.password);
	strcpy(this->priortime,p1.priortime);
	tlist.readfile("thing");

}
void Comman::find_th()
{
	system("clear");
	char sh[20];
	long num;
	Thing *p;
	cout<<"\n\n\t\t\033[32m          查找商品"<<endl;
	cout<<"\t\t****************************\033[33m"<<endl;
	cout<<"\n\t\t（8位）快递单号：";cin.getline(sh,11);
	num=atoi(sh);
	p=tlist.find(num);
	if(p!=NULL)
	{
		Tlist::display_one(p);
		GPAUSE
	}
	else
	{
		cout<<"\n\n\t\033[31m该单号商品不存在！"<<endl;
		RPAUSE
	}
}

void Comman::display_operate()
{
	while(1)
	{
		system("clear");
		char ch[20];
		cout<<"\n\t\033[34m上次登入时间： "<<priortime<<"\033[0m"<<endl;
		cout<<"\n\n\t\t\033[32m  欢迎 "<<name<<" 登入系统"<<endl;
		cout<<"\t\t**************************\033[33m"<<endl;
		cout<<"\n\t\t       1.个人信息"<<endl;
		cout<<"\n\t\t       2.查找商品"<<endl;
		cout<<"\n\t\t       3.退出系统"<<endl;
		cout<<"\t请选择：\033[0m";
		cin.getline(ch,20);
		switch(*ch)
		{
			case '1':
				People::display_operate();
				break;
			case '2':
				find_th();
				break;
			case '3':
				return;
			default:
				break;
				
		}
	}
}
