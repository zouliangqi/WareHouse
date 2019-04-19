/*### admin.cpp ###*/
/*#################*/
/*本文件主要是管理员的操作函数，调用底层函数结合菜单的交互界面*/

#include <iostream>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include "myclass.h"
using namespace std;
/*构造函数，读取所有的人员*/
Admin::Admin()
{
	list.read("people");
}
/*人员查找*/
void Admin::find_mans()
{
	char ch[10];
	system("clear");
	cout<<"\n\n\t\t\033[32m       查找人员"<<endl;
	cout<<"\t\t**********************\033[33m"<<endl;
	cout<<"\n\t\t    1.按部门查找"<<endl;
	cout<<"\n\t\t    2.按姓名查找"<<endl; 
	cout<<"\n\t\t    3.按工号查找\033[0m"<<endl;
	cout<<"\n\t请选择：";
	cin.getline(ch,10);
	switch(ch[0])
	{
		case '1':
			cout<<"\n\t    请输入部门：";
			cin.getline(this->department,16);
			list.find(*this,0);
			list.display('f');
			GPAUSE
			break;
		case '2':
			cout<<"\n\t    请输入姓名：";
			cin.getline(this->name,16);
			list.find(*this,1);
			list.display('f');
			GPAUSE
			break;
		case '3':
			cout<<"\n\t    请输入工号：";
			cin>>this->num;
			cin.get();          //取掉换行符
			list.find(*this,2);
			list.display('f');
			GPAUSE
			break;
		default:
			break;
	}
}
/*添加录入人员基本信息交互*/
void Admin::add_man()
{
	system("clear");
	char ch[20];
	cout<<"\n\n\t\t\033[32m       添加人员"<<endl;
	cout<<"\t\t************************\033[33m"<<endl;
	cout<<"\t\t     姓名：";cin.getline(this->name,16);
	if(strlen(this->name)>12||strlen(this->name)<1)
	{
		cout<<"\n\t\033[31m名字不能超过12个字符，添加失败！\033[0m"<<endl;
		RPAUSE
		return;
	}
	cout<<"\n\t\t     年龄：";cin.getline(ch,20);this->age=atoi(ch);
	if(this->age<=0||this->age>150)
	{
		cout<<"\n\t\033[31m输入有误，添加失败！\033[0m"<<endl;
		RPAUSE
		return;
	}
	cout<<"\n\t\t     性别：";cin.getline(this->sex,8);
	if(strcmp(this->sex,"男")!=0&&strcmp(this->sex,"女")!=0)
	{
		cout<<"\n\t\033[31m输入有误，添加失败！\033[0m"<<endl;
		RPAUSE
		return;
	}
	cout<<"\n\t\t     工号：";cin.getline(ch,20);this->num=atoi(ch);
	if(this->num<100000||this->num>999999)
	{
		cout<<"\n\t\033[31m工号必须是六位数字，添加失败！\033[0m"<<endl;
		RPAUSE
		return;
	}
	cout<<"\n\t\t     部门：";cin.getline(this->department,16);
	if(strcmp(this->department,"INDP")!=0&&strcmp(this->department,"OUTDP")!=0&&strcmp(this->department,"COMDP")!=0)
	{
		cout<<"\n\t\033[31m部门只有“INDP”,“OUTDP”,“COMDP”，添加失败！\033[0m"<<endl;
		RPAUSE
		return;
	
	}
	cout<<"\n\t\t     电话：";cin.getline(this->phone,20);cout<<"\033[0m";
	if(strlen(this->phone)!=11)
	{
		cout<<"\n\t\033[31m电话号码必须为11位数字，添加失败！\033[0m"<<endl;
		RPAUSE
		return;
	
	}
	if(list.find(*this,2)!=NULL)
	{
		cout<<"\n\t  \033[31m工号不能重复，添加失败！\033[0m"<<endl;
	}
	else
	{
		*this->priortime='\0';
		strcpy(this->password,"00000000");
		list.add(*this);
		cout<<"\n\t  \033[32m添加成功！\033[0m"<<endl;
	}
	GPAUSE
}
/*删除操作菜单*/
void Admin::del_man()
{
	char ch[10];
	People *p=NULL;
	system("clear");
	cout<<"\n\n\t\t\033[32m       删除人员"<<endl;
	cout<<"\t\t**********************\033[33m"<<endl;
	cout<<"\n\t\t    1.按部门删除"<<endl;
	cout<<"\n\t\t    2.按姓名删除"<<endl; 
	cout<<"\n\t\t    3.按工号删除\033[0m"<<endl;
	cout<<"\n\t请选择：";
	cin.getline(ch,10);
	switch(ch[0])
	{
		case '1':
			cout<<"\n\t\t请输入部门：";
			cin.getline(this->department,16);
			p=list.find(*this,0);
			list.display('f');
			break;
		case '2':
			cout<<"\n\t\t请输入姓名：";
			cin.getline(this->name,16);
			p=list.find(*this,1);
			list.display('f');
			break;
		case '3':
			cout<<"\n\t\t请输入工号：";
			cin>>this->num;
			cin.get();
			p=list.find(*this,2);
			list.display('f');
			break;
		default:
			return;

	}
	if(p)
	{
		cout<<"\n\n\t\t\033[33m1.确定删除\t     o.放弃返回\033[0m"<<endl;
		cout<<"\n\t请选择：";cin.getline(ch,10);
		if(*ch=='1')
		{
			list.del_find();
			cout<<"\n\n\t\033[32m成功删除！\033[0m"<<endl;
			GPAUSE
			}
	}
	else
	{
		cout<<"\n\n\t\033[31m未找到符合条件的对象.."<<endl;
		RPAUSE
	}

}
/*修改选择及交互*/
void Admin::mchange(People *p)
{
	char ch[30];
	char str[50];
	int temp;
	People p1;
	system("clear");
	cout<<"\n\n\t\t\033[32m            修改信息"<<endl;
	cout<<"\t\t**********************************\033[33m"<<endl;
	cout<<"\t\t1.姓名 2.性别 3.年龄 4.工号 5.部门\033[0m"<<endl;
	cout<<"\n  请选择：";
	cin.getline(ch,30);
	switch(*ch)
	{
		case '1':
			cout<<"\t\t\t\033[34m姓名：";
			cin.getline(str,50);
			if(strlen(str)<12)
			{	
				p->setName(str);
				cout<<"\n\n\t\t\033[32m修改成功！"<<endl;
				GPAUSE
			}
			else
			{
				cout<<"\n\n\t\033[31m名字不能超过12个字符，修改失败！"<<endl;
				RPAUSE
				mchange(p);
			}
			break;
		case '2':
			cout<<"\t\t\t\033[34m性别：";
			cin.getline(str,20);
			if(strcmp(str,"男")==0||strcmp(str,"女")==0)
			{	
				p->setSex(str);
				cout<<"\n\n\t\t\033[32m修改成功！"<<endl;
				GPAUSE
			}
			else
			{
				cout<<"\n\n\t\033[31m输入有误，修改失败！"<<endl;
				RPAUSE
				mchange(p);
			}
			break;
		case '3':
			cout<<"\t\t\t\033[34m年龄：";
			cin.getline(str,6);temp=atoi(str);
			if(temp>0&&temp<100)
			{	
				p->setAge(temp);
				cout<<"\n\n\t\t\033[32m修改成功！"<<endl;
				GPAUSE
			}
			else
			{
				cout<<"\n\n\t\033[31m输入有误，修改失败！"<<endl;
				RPAUSE
				mchange(p);
			}
			break;
		case '4':
			cout<<"\t\t\t\033[34m工号：";
			cin.getline(str,8);temp=atoi(str);p1.setNum(temp);
			if(temp>99999&&temp<999999&&list.find(p1,2)==NULL)  //用查找检测是否学号重复
			{	
				p->setNum(temp);
				cout<<"\n\n\t\t\033[32m修改成功！"<<endl;
				GPAUSE
			}
			else
			{
				cout<<"\n\n\t\033[31m工号应为为6位数字，且不能重复，修改失败！"<<endl;
				RPAUSE
				mchange(p);
			}
			list.find(*this,2);
			break;
		case '5':
			cout<<"\t\t\t\033[34m部门：";
			cin.getline(str,20);
			if(strcmp(str,"INDP")==0||strcmp(str,"OUTDP")==0||strcmp(str,"COMDP")==0)
			{	
				p->setDepartment(str);
				cout<<"\n\n\t\t\033[32m修改成功！"<<endl;
				GPAUSE
			}
			else
			{
				cout<<"\n\t\033[31m部门只有“INDP”,“OUTDP”,“COMDP”，修改失败！\033[0m"<<endl;
				RPAUSE
				mchange(p);
			}
			break;
		default:
			break;
	}
}       
void Admin::man_menu(People *p)
{
	while(1)
	{
		p->display();
		char ch[10];
		cout<<"\n\t\t\033[33m1.修改信息  2.保存返回\033[0m"<<endl;
		cout<<"\n\t请选择：";
		cin.getline(ch,10);
		switch(*ch)
		{
			case '1':
				mchange(p);
				break;
			case '2':
				return;
			default:
				break;
		}
	}
}
void Admin::change_man()
{
	char ch[20];
	cout<<"\n\t\t\033[34m    请输入工号：";
	cin.getline(ch,20);
	cout<<"\033[0m";
	this->num=atoi(ch);
	People *p=list.find(*this,2);
	if(p!=NULL)
		man_menu(p);
	else
	{
		cout<<"\n\t\033[31m工号不存在！"<<endl;
		RPAUSE
	}
}
void Admin::save_operate()
{
	char ch[20];
	cout<<"\n\t\t\033[32m  是否保存操作（Y/N）：\033[0m";
	cin.getline(ch,20);
	if(*ch=='y'||*ch=='Y')
	{
		list.write("people");
		cout<<"\n\t\t\033[32m      保存成功！\033[0m"<<endl;
		sleep(1);
	}
	system("clear");

}
/*管理员操作菜单*/
void Admin::display_operate()
{
	while(1)
	{
		char ch[10];
		system("clear");
		cout<<"\n\n\t\t\033[32m      欢迎管理员登入系统"<<endl;
		cout<<"\t\t******************************\033[33m"<<endl;
		cout<<"\n\t\t   1.所有人员   2.查找人员"<<endl;
		cout<<"\n\t\t   3.添加人员   4.删除人员"<<endl;
		cout<<"\n\t\t   5.修改信息   6.查看商品"<<endl;
		cout<<"\n\t\t   7.退出系统\033[0m"<<endl;
		cout<<"\n    请选择：";
		cin.getline(ch,10);
		switch(*ch)
		{
			case '1':
				list.print_sort();
				break;
			case '2':
				find_mans();
				break;
			case '3':
				add_man();
				break;
			case '4':
				del_man();
				break;
			case '5':
				change_man();
				break;
			case '6':
				tlist.display_all();
				break;
			case '7':
				save_operate();
				return;
			default:
				break;
		}
	}
}
