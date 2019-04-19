//### plist.cpp #
//###############
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <string.h>
#include "myclass.h"
using namespace std;
/*将文件内容读出并建立链表*/
void Plist::read(const char *str)
{
	ifstream inf(str,ios::binary);
	if(inf.bad())
	{
		cout<<"open error"<<endl;
		exit(1);
	}
	while(1)
	{
		People p1;
		inf.read((char*)&p1,sizeof(People));
		if(!inf.eof())
		{
			People *peo=(People* )malloc(sizeof(People));
			*peo=p1;
			pNode *temp =new pNode;
			temp->p=peo;
			temp->next=NULL;
			if(head==NULL)
			{
				head=temp;
				tail=temp;
				continue;
			}
			tail->next=temp;
			tail=temp;
		}
		else
			return;
	}
}
/*将链表顺序写入文件*/
void Plist::write(const char *str)
{
	pNode *temp=head;
	ofstream outf(str,ios::binary);
	while(temp)
	{
		outf.write((char*)temp->p,sizeof(People));
		temp=temp->next;
	}
}
/*析构释放堆空间*/
Plist::~Plist()
{
	find_free();
	pNode *temp;
	while(head)
	{
		temp=head->next;
		delete head->p;
		delete head;
		head=temp;
	}
}
/*按工号插入链表-将插入工号大于它的前面*/
void Plist::add(People &p)
{
	People *pt = new People; 
	pNode *temp = new pNode; 
	temp->p=pt;
	*pt=p;
	pNode *current,**link=&head;
	/*找到该节点，包含了在头尾的情况*/
	while((current=*link)!=NULL&&People::numcmp(*pt,*current->p)>0)
		link=&current->next;
	temp->next=current;
	*link=temp;
}


/*建立查到链表*/
/*群体查找时建立查找链表，但是并没有重新分配空间，指向同一块资源（人）*/
void Plist::find_list(People* &p)
{
	pNode **temp=&FindHead,*current;
	pNode *ptr = new pNode;
	ptr->p = p;
	while((current=*temp)!=NULL)
		temp=&current->next;
	ptr->next = current;
	*temp = ptr;
}
/*释放查找链表*/
void Plist::find_free()
{
	pNode *temp;
	while(FindHead)
	{
		temp=FindHead->next;
		delete FindHead;
		FindHead=temp;
	}
}
/*多功能查找，群体查找将会建立一个新链表，但是指向同一块内容*/
People* Plist::find(const People& man,int style)
{
	pNode *temp=head;
	find_free();
	switch(style)
	{
		case 0:
			while(temp)             //部门查找
			{
				if(People::samedepartment(*temp->p,man))
					find_list(temp->p);
				temp=temp->next;
			}
			break;
		case 1:
			while(temp)             //姓名查找
			{
				if(People::samename(*temp->p,man))
					find_list(temp->p);
				temp=temp->next;
			}
			break;
		case 2:
			while(temp)             //工号查找
			{
				if(People::samenum(*temp->p,man))
				{
					find_list(temp->p);
					return FindHead->p;
				}
				temp=temp->next;
			}
			break;
		case 3:
			while(temp)             //登入查找
			{
				if(*temp->p==man)
				{
					find_list(temp->p);
					return FindHead->p;
				}
				temp=temp->next;
			}
			break;
		default:
			break;
	}
	if(FindHead)
		return FindHead->p;
	else
		return NULL;
}
/*单体查找删除*/
void Plist::del(People p)
{
	pNode **link=&head;
	pNode *current;
	while((current=*link)!=NULL)
	{
		if(People::samenum(*current->p,p))
		{
			*link=current->next;
			delete current;
			return;
		}
		else
			link=&current->next;
	}
}
/*群体删除（将查找到的全部删除）*/
/*根据查找链表不断调用单体查找来删除*/
void Plist::del_find()
{
	pNode *temp=FindHead;
	while(temp)
	{
		del(*temp->p);
		temp=temp->next;
	}
	find_free();     //释放查找链表
}

/*返回最大的结点，并将其从链表中移除*/
/*根据选择排序的思想，作为选择排序的调用函数*/
Plist::pNode* Plist:: del_max(bool (*fun)(People *p1,People *p2))
{
	pNode **link=&head,*current=head;
	pNode **maxadad,*maxad;
	People *max;
	if(current)
	{
		max=current->p;
		link=&current->next;
		maxadad=&head;
	}
	else
		return NULL;
	while((current=*link)!=NULL)
	{
	//	if(current->value>max)
		if(fun(current->p,max))  //true
		{
			maxadad=link;
			max=current->p;	
		}
		link=&current->next;
	}
	maxad=*maxadad;
	*maxadad=(*maxadad)->next;
	return maxad;
}
/*
 *  built a new head and add the node 
 *	to the new head from max to min
 *	return the new head
 */
void Plist::psort(bool (*fun)(People *p1, People *p2))
{
	pNode *newhead=NULL,*temp;
	while((temp=del_max(fun))!=NULL)
	{
		temp->next=newhead;
		newhead=temp;
	}
	head=newhead;
}
/*排序的查找菜单*/
void Plist::print_sort()
{
	while(1)
	{
		display('h');
		cout<<"\n\t\t\033[33m 1.按最近登入时间排序\t     2.按工号排序\t     3.按部门排序"<<endl;
		cout<<"\t请选择：\033[0m";
		char ch[20];
		cin.getline(ch,20);
		switch(*ch)
		{
			case '1':
				psort(People::TimeSort);
				break;
			case '2':
				psort(People::NumSort);
				break;
			case '3':
				psort(People::DepartmentSort);
				break;
			default:
				return;
		}
	}
}
/*打印链表*/
void Plist::display(char style)
{
	pNode *temp=NULL;
	int i=1;
	if(style=='h')    //打印全部的人
		temp=head;
	else if(style=='f')//打印找到的人
		temp=FindHead;
	system("clear");
	cout<<"\n\n\t\033[32m*序号\t姓名\t年龄\t性别\t工号\t部门\t电话\t\t最近登入时间\033[0m"<<endl;
	while(temp)
	{
		cout<<"\t*\033[33m"<<i<<"\033[0m";
		temp->p->lineprint();
		temp=temp->next;
		i++;
	}
}

