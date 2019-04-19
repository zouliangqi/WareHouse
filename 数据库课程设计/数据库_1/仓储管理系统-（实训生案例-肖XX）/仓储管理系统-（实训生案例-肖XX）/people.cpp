/*### people.cpp #*/
/*################*/
/*本文件函数是个人类的基本函数*/

#include <iostream>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "myclass.h"
using namespace std;

/*带参构造函数*/
People::People(int num,const char *name,int age,const char *sex,const char *phone,const char *department,const char *password)
{
	this->num=num;
	strcpy(this->name,name);
	this->age=age;
	strcpy(this->sex,sex);
	strcpy(this->phone,phone);
	strcpy(this->department,department);
	strcpy(this->password,password);
	*this->priortime='\0';
	this->ptime=0;
}

/*赋值操作符重载*/
People& People::operator = (People& man)
{
	this->num=man.num;
	strcpy(this->name,man.name);
	this->age=man.age;
	this->ptime=man.ptime;
	strcpy(this->sex,man.sex);
	strcpy(this->phone,man.phone);
	strcpy(this->department,man.department);
	strcpy(this->password,man.password);
	strcpy(this->priortime,man.priortime);
	return *this; 
	
}
/*排序所需要调用的函数 1.登入时间排序 2.工号排序 3.部门归类排序*/
bool People::TimeSort(People *p1, People *p2)
{
	return p1->ptime<p2->ptime;
}
bool People::NumSort(People *p1, People *p2)
{
	return p1->num>p2->num;
}
bool People::DepartmentSort(People *p1, People *p2)
{
	if(strcmp(p1->department,p2->department)>=0)
		return true;
	else
		return false;
}

/*查找所需判断函数*/
bool People::operator ==(const People& p1 )
{
	if(p1.num==num&&strcmp(p1.name,name)==0&&strcmp(p1.password,password)==0)
		return true;
	else
		return false;
}
bool People::samepeople(const People& p1,const People& p2 )
{
	if(p1.num==p2.num&&strcmp(p1.name,p2.name)==0&&strcmp(p1.password,p2.password)==0)
		return true;
	else
		return false;
}

bool People::samename(const People& p1,const People& p2)
{
	if(strcmp(p1.name,p2.name)==0)
		return true;
	else
		return false;
}
bool People::samenum(const People& p1,const People& p2)
{
	if(p1.num==p2.num)
		return true;
	else
		return false;
}
bool People::samedepartment(const People& p1,const People& p2)
{
	if(strcmp(p1.department,p2.department)==0)
		return true;
	else
		return false;
}
int People::numcmp(const People& p1,const People& p2)
{
	return p1.num-p2.num;
}
bool  People:: samedepartment(const char *str)
{
	if(strcmp(department,str)==0)
		return true;
	else
		return false;
}




/*修改基本信息的SET函数*/
void People::setName(const char *str)
{   
	strcpy(name,str);
}

void People::setPassword(const char *str)
{
	strcpy(password,str);
}
void People::setPhone(const char *str)
{
	 strcpy(phone,str);
}
void People::setSex(const char *str)
{
	strcpy(sex,str);
}
void People::setNum(const long m)
{
	 num=m;
}
void People::setDepartment(const char *str)
{
	strcpy(department,str);
}
void People::setAge(const int n)
{
	age=n;
}

void People::display_menu()
{
	char ch[10];
	cout<<"\n\t\t\033[33m1.修改信息  2.保存返回\033[0m"<<endl;
	cout<<"\n\t请选择：";
	cin.getline(ch,10);
	if(*ch=='1')
	{
		change();
		display_operate();
	}
	else if(*ch=='2')
		return;
	else
		display_operate();
}

/*个人信息行打印*/
void People::lineprint()
{
	cout<<"\t"<<name<<"\t"<<age<<"\t"<<sex<<"\t"<<\
		num<<"\t"<<department<<"\t"<<phone<<"\t"<<priortime<<endl;
}
/*显示个人的基本信息*/
void People::display()
{
	system("clear");
	cout<<"\n\t\t\033[32m        基本信息"<<endl;
	cout<<"\t\t************************\033[0m"<<endl;
	cout<<"\t\t     工号："<<num<<endl;
	cout<<"\t\t     部门："<<department<<endl;
	cout<<"\t\t     姓名："<<name<<endl;
	cout<<"\t\t     年龄："<<age<<endl;
	cout<<"\t\t     性别："<<sex<<endl;
	cout<<"\t\t     电话："<<phone<<endl;
}

/*个体的修改操作函数*/
void People::display_operate()
{
	display();          //显示基本信息
	display_menu();		//操作菜单
}

/*个人所具有的修改操作只有修改自身密码与电话*/
void People::change()
{
	system("clear");
	char ch[10];
	char temp[50];
	cout<<"\t\t\033[32m         修改信息"<<endl;
	cout<<"\t\t**************************\033[33m"<<endl;
	cout<<"\t\t1.电话 2.密码 o.任意键返回\033[0m"<<endl;
	cout<<"\n请选择：";
	cin.getline(ch,10);
	if(*ch=='1')
	{
		cout<<"\t\t   新电话：";
		cin.getline(temp,50);
		if(strlen(temp)==11)
		{
			setPhone(temp);
			cout<<"\n\n\t\t\033[32m修改成功！"<<endl;
			GPAUSE
		}
		else
		{
			cout<<"\n\n\t\033[31m修改失败！电话号码应为11位数字！"<<endl;
			RPAUSE
			change();
		}
	}
	else if(*ch=='2')
	{
		cout<<"\t\t   新密码：";
		cin.getline(temp,50);
		if(strlen(temp)>7)
		{
			setPassword(temp);
			cout<<"\n\n\t\t\033[32m修改成功！"<<endl;
			GPAUSE
		}
		else
		{
			cout<<"\n\n\t\033[31m修改失败！密码不得少于8个字符！"<<endl;
			RPAUSE
			change();
		}
	}
	else
		return;
}  
/*获取时间包括字符串时间与总共秒时间*/     
void People:: gettime()
{
	time_t logtime;
	tm *timeinfo;
	logtime=time(NULL);
	timeinfo=localtime(&logtime);
	strncpy(priortime,asctime(timeinfo),24);
	priortime[24]='\0';
	this->ptime=logtime;
}

