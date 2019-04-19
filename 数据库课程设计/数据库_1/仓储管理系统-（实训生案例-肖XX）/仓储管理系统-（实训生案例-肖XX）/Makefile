main:=sys
OBJECT:=main.o login.o man.o people.o tlist.o plist.o admin.o
CC:=g++
OPTION:=-g -Wall -lm -lpthread
$(main):$(OBJECT)
		  $(CC) $^ -o $@ $(OPTION)
.c.o:
	 $(CC) -c $<
clean:
	  rm -rf *.o 
