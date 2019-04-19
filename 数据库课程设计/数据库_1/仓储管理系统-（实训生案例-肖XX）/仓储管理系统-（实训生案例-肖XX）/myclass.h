#ifndef _MYCLASS_H
#define _MYCLASS_H
#include <iostream>
#include <vector>
class Inman;
class Outman;
class Comman;
class People;
/*登入类*/
class Login
{
	public:
		Login(){wrongtimes=0;}
/*该类及login.cpp中成员函数注释掉的部分原先想用于记录登入者的信息，来实现对其限制登入*/
//	~Login();
//		void readrecord(const char*);
//		void writerecord(const char*);
		void logmenu();
		void peoplelog(const People& p1);
		void adminlog();
	protected:
		People menu();
//		struct Node
//		{
//			int num;
//			char name[20];
//			long time;
//		};
//		vector<Node> vec;
		 int wrongtimes;

};
/*基本人员类*/
class People
{
	public:
		People(){}
		People(int num,const char *name,int age,const char *sex,const char *phone,const char *department,const char *password);
		void display();
		void display_operate();
		void gettime();
		void setName(const char *str);
		void setPassword(const char *str);
		void setPhone(const char *str);
		void setSex(const char *str);
		void setNum(const long);
		void setDepartment(const char *str);
		void setAge(const int);
		People& operator = (People& man);
		bool operator == ( const People& p1);
		void lineprint();
		friend class Inman;//非管理权限人员构造需要People类对象的保护数据成员
		friend class Outman;
		friend class Comman;
		bool samedepartment(const char *str);
		static bool TimeSort(People *p1, People *p2);
		static bool NumSort(People *p1, People *p2);
		static bool DepartmentSort(People *p1, People *p2);
		static int numcmp(const People& p1,const People& p2);
		static bool samename(const People& p1,const People& p2);
		static bool samepeople(const People& p1,const People& p2);
		static bool samenum(const People& p1,const People& p2);
		static bool samedepartment(const People& p1,const People& p2);
	protected:
		void change();
		void display_menu();
		int num;
		char name[16];
		int age;
		char sex[8];
		char phone[12];
		char department[16];
		char password[24];
		char priortime[32];
		long ptime;
};

/*人员集合类（单向链表）*/
class Plist
{
	private:
		void find_list(People* &p);
		void find_free();
		struct pNode
		{
			People *p;
			pNode *next;
		};
		pNode *head;
		pNode *tail;
		pNode *FindHead;
		pNode* del_max(bool (*fun)(People *p1,People *p2));
		void psort(bool (*fun)(People *p1, People *p2));
	public:
		Plist(){head=NULL;tail=NULL;FindHead=NULL;}
		~Plist();
		void read(const char*);
		void write(const char*);
		void add(People &p);
		void del(People p);
		void del_find();
		void display(char style='h');
		People* find(const People &p,int style=3);
		void print_sort();
};
/*基本商品货物类*/
class Thing
{
	public:
	Thing(){}
	Thing(const long num,const char *ch);
	Thing& operator = (Thing& th);
	long code;
	char strtime[32];
	long num;
	char character[16];
};
/*货物集合类（单向链表）*/
class Tlist
{
	protected:
		class Node
		{
			public:
			Node();
			Node(const Thing& th);
			Thing thing;
			Node *next;
		};
		Node *head,*tail;
		static void* getexit_thread(void *a);//作为display_all的线程函数用于获取输入退出
		int readw_lock(int fd);//文件的阻塞式读锁
		int writew_lock(int fd);//文件的阻塞式写锁
		int un_lock(int fd);//文件解锁
	public:
		Tlist(){head=NULL;tail=NULL;}
		~Tlist();
		void readfile(const char *file);
		void writefile(const char *file);
		void add(const Thing& thing);
		bool del(const long code);
		Thing* find(const long num);
		static void display_one(Thing *t);
		void display_all();//不断读文件动态显示商品
};
/*管理员类*/
class Admin: public People
{
	public:
		Admin();
		void display_operate();
	private:
		void add_man();
		void del_man();
		void find_mans();
		void change_man();
		void save_operate();
		void mchange(People*);
		void man_menu(People*);
		Plist list;
		Tlist tlist;

};
/*入库人员类*/
class Inman: public People
{
	public:
		Inman(People& p1);
		void display_operate();
		void add_th();
	private:
		Tlist tlist;

};
/*出库人员类*/
class Outman: public People
{	
	public:
		Outman(People& p1);
		void display_operate();
		void del_th();
	private:
		Tlist tlist;

};
/*普通人员类*/
class Comman: public People
{
	public:
		Comman(People& p1);
		void display_operate();
		void find_th();
	private:
		Tlist tlist;
};

/*用于暂停，等待输入*/
#endif
#ifndef GPAUSE
#define GPAUSE std::cout<<"\n\t\033[32mPress Enter key to continue...\033[0m";std::cin.get();
#endif
#ifndef RPAUSE
#define RPAUSE std::cout<<"\n\t\033[31mPress Enter key to continue...\033[0m";std::cin.get();
#endif

