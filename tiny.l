/*
I pledge my Honor that I have not
cheated, and will not cheat, on This
assignment.

Mark Schweitzer
*/

%option yylineno
%option noyywrap

%{
  #define DEBUG 1
  typedef YYTOKENTYPE Token;
  Token scanned(Token t);
%}

%%
ENDFILE   {return scanned(ENDFILE);}
ERROR    {return scanned(ERROR);}
if    {return scanned(IF);}
then  {return scanned(THEN);}
else  {return scanned(ELSE);}
END   {return scanned(END);}
repeat   {return scanned(REPEAT);}
until {return scanned(UNTIL);}
read  {return scanned(READ);}
write {return scanned(WRITE);}
":="    {return scanned(ASSIGN);}
"="    {return scanned(EQ);}
"<"    {return scanned(LT);}
"+"  {return scanned(PLUS);}
"-" {return scanned(MINUS);}
"*" {return scanned(TIMES);}
"/"  {return scanned(OVER);}
"{"  { char i = input();while(i!='}' && i!=EOF){ i=input();}}   
";"  {return scanned(SEMI);}
[a-zA-Z]+ {return scanned(ID);}
"-"?[0-9]+   {return scanned(NUM);}
%%

Token scanned(Token t){
    if(DEBUG==0) return t;
    switch(t){
      case ERROR: printf("ERROR "); return t;
      case IF: printf("IF "); return t;
      case THEN: printf("THEN "); return t;
      case ELSE: printf("ELSE "); return t;
      case END: printf("END "); return t;
      case REPEAT: printf("REPEAT "); return t;
      case UNTIL: printf("UNTIL "); return t;
      case READ: printf("READ "); return t;
      case WRITE: printf("WRITE "); return t;
      case ID: printf("ID(%s) ",yytext); return t;
      case NUM: printf("NUM(%s) ",yytext); return t;
      case ASSIGN: printf("ASSIGN "); return t;
      case EQ: printf("EQ "); return t;
      case LT: printf("LT "); return t;
      case PLUS: printf("PLUS "); return t;
      case MINUS: printf("MINUS "); return t;
      case TIMES: printf("TIMES "); return t;
      case OVER: printf("OVER "); return t;
      case SEMI: printf("SEMI "); return t;
      case ENDFILE: printf("ENDFILE \n"); return t;
      default: printf("ERROR: invalid token "); exit(-1);
    }
}
