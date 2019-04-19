//### tlist.cpp #
//###############
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <string.h>
#include <iomanip>
#include <time.h>
#include <pthread.h>
#include <sys/types.h>
#include <unistd.h>
#include <linux/unistd.h>
#include <stdarg.h>
#include <fcntl.h>
#include <errno.h>
#include "myclass.h"
using namespace std;
/*Thing(商品基本信息) 构造函数 time函数获取时间*/
Thing:: Thing(const long num,const char *ch)
{
	time_t logtime;
	tm *timeinfo;
	logtime=time(NULL);
	code=logtime;                 //总共秒时间将作为商品二维码
	timeinfo=localtime(&logtime);
	strncpy(strtime,asctime(timeinfo),24);  //将秒时间转换为字符串
	strtime[24]='\0';
	this->num=num;
	strncpy(character,ch,16);
	character[15]='\0';
}
/*=赋值拷贝*/
Thing& Thing:: operator =( Thing& th)
{
	num=th.num;
	code=th.code;
	strcpy(strtime,th.strtime);
	strcpy(character,th.character);
	return *this;

}
/*链表析构函数*/
Tlist::~Tlist()
{
	Node *temp;
	while(head!=NULL)
	{	
		temp=head->next;
		delete head;
		head=temp;
	}
}
/*节点构造函数-带参数*/
Tlist::Node::Node(const Thing& th):thing(th.num,th.character)
{
	next=NULL;
}
/*默认无参构造*/
Tlist::Node::Node()
{
	next=NULL;
}
/*阻塞式加读锁（整个文件）*/
int Tlist::readw_lock(int fd)
{
	struct flock lock;
	lock.l_type=F_RDLCK;
	lock.l_start=0;
	lock.l_whence=SEEK_SET;
	lock.l_len=0;
	return (fcntl(fd,F_SETLKW,&lock));
}
/*阻塞式加写锁（整个文件）*/
int Tlist::writew_lock(int fd)
{
	struct flock lock;
	lock.l_type=F_WRLCK;
	lock.l_start=0;
	lock.l_whence=SEEK_SET;
	lock.l_len=0;
	return (fcntl(fd,F_SETLKW,&lock));
}
/*解锁*/
int Tlist::un_lock(int fd)
{
	struct flock lock;
	lock.l_type=F_UNLCK;
	lock.l_start=0;
	lock.l_whence=SEEK_SET;
	lock.l_len=0;
	return (fcntl(fd,F_SETLK,&lock));
}

/*由于需要动态打印商品，故需要不断读取文件，这可能造成与其他进程的读写冲突*/
/*将文件读入链表，系统调用read()*/
/*读文件前先上锁，读完之后解锁*/
void Tlist::readfile(const char *file)
{
	/*
	ifstream inf(flie,ios::binary);
	if(inf.bad())
	{
		cout<<"open error"<<endl;
		exit(1);
	}
	*/
	int fd_read;
	fd_read=open(file,O_RDONLY);
	if(fd_read==-1)
	{
		perror("open error of thing");
		exit(1);
	}
	readw_lock(fd_read);
	Thing t1;
	while(read(fd_read,(void*)&t1,(size_t)sizeof(Thing))==sizeof(Thing))
	{
	//	Thing t1;
	//	inf.read((char*)&t1,sizeof(Thing));
	//	if(!inf.eof())
	//	{
			Node *temp =new Node;
			temp->thing=t1;
			if(head==NULL)
			{
				head=temp;
				tail=temp;
				continue;
			}
			tail->next=temp;
			tail=temp;
	//	}
    //		else
	//	{
	//		return;
	//	}
	}
	un_lock(fd_read);
	close(fd_read);
}
/*将链表顺序写入文件*/
/*
void Tlist::write(const char *file)
{
	Node *temp=head;
	ofstream outf(file,ios::binary);
	while(temp)
	{
		outf.write((char*)&temp->thing,sizeof(Thing));
		temp=temp->next;
	}
}
*/
/*将链表顺序写入文件系统调用write()*/
/*读文件前上锁，读完解锁*/
void Tlist::writefile(const char *file)
{
	int fd_write;
	fd_write=open(file,O_WRONLY|O_TRUNC);
	writew_lock(fd_write);
	Node *temp=head;
	while(temp)
	{
		write(fd_write,(void*)&temp->thing,sizeof(Thing));
		temp=temp->next;
	}
	un_lock(fd_write);
	close(fd_write);

}	
/*链表加入节点（商品入库）*/
void Tlist::add(const Thing& thing)
{
	Node *p = new Node(thing);
	char q[50];
	/*在相对子目录产生二维码后6为为名的png图片*/
	sprintf(q,"qrencode -o ./qrencode/%ld.png %ld",(p->thing).code%1000000,(p->thing).code);
	system(q);
	p->next=head;
	head=p;
}
/*删除节点（商品出库）*/
bool Tlist::del(const long code)
{
	Node *current,**link=&head;
	char q[50];
	while((current=*link)!=NULL)
	{
		if(current->thing.code==code)
		{
			*link=current->next;
			delete current;
			/*删除相对子目录的二维码*/
			sprintf(q,"rm  ./qrencode/%ld.png",code%1000000);
			system(q);
			return true;
		}
		link=&current->next;
	}
	return false;
}
/*查找节点（根据快递单号查找商品）*/
Thing* Tlist::find(const long num)
{
	Node *temp=head;
	while(temp)
	{
		if(temp->thing.num==num)
			return &temp->thing;
		temp=temp->next;
	}
	return NULL;
}
/*显示单个节点（显示商品）*/
void Tlist::display_one(Thing *t)
{
	system("clear");
	cout<<"\t\t\033[32m        商品信息 "<<endl;
	cout<<"\t\t************************\033[33m"<<endl;
	cout<<"\t\t  商品属性："<<t->character<<endl;
	cout<<"\t\t  快递单号："<<t->num<<endl;
	cout<<"\t\t    二维码："<<t->code<<endl;
	cout<<"\t\t  入库时间："<<t->strtime<<"\033[0m"<<endl;

}
/*接收输入退出线程*/
void* Tlist::getexit_thread(void *a)
{
	cin.getline((char*)a,20);
	*(char*)a='1';
	cout<<"\n\t\033[32mWait for extiing...\033[0m"<<endl;
}
/*动态打印链表（列出全部商品）*/
/*循环打印，故需要另一个线程在接受输入来退出循环*/
void Tlist::display_all()
{
	pthread_t id;
	int ret;
	char ch[20]={0};
	ret=pthread_create(&id,NULL,getexit_thread,(void*)ch); //创建线程
	if(ret!=0)
	{
		cout<<"create pthread error\n"<<endl;
		exit(1);
	}
	while(*ch=='\0')
	{

		Node *temp;
		/*先释放已有节点*/
		while(head!=NULL)
		{	
			temp=head->next;
			delete head;
			head=temp;
		}
		readfile("thing");
		system("clear");
		temp=head;
		int i=1;
		cout<<"\n\n\t\033[32m"<<setw(4)<<"*序号"<<setw(14)<<"快递单号"<<setw(14)<<"二维码"\
		<<"\t属性\t入库时间\033[0m"<<endl;
		while(temp)
		{
			cout<<"\t*"<<i<<setw(13)<<temp->thing.num<<setw(15)<<temp->thing.code<<\
			"\t"<<temp->thing.character<<"\t"<<temp->thing.strtime<<endl;
			temp=temp->next;
			i++;
		}
		cout<<"\t\033[32mPress Enter key to continue...\033[0m"<<endl;
		sleep(1); //每隔一秒读一次文件并打印出来
	}
}
/*
 ##调试main
int main()
{
	Thing t1(100003,"Other");
	Thing t2(100004,"Other");
	Tlist list;
	list.read("thing");
	list.add(t1);
	list.add(t2);
	list.display_all();
	list.display_one(list.find(100001));
	list.write("thing");
	return 0;
}
*/
