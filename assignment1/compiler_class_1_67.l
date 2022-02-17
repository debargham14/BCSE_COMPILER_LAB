%{
    int answer = 0, prev_sym_val = 0, curr_sym_val = 0, res = 0;   
    int symbol, neg = 0;
%}

one             ("I"|"i")
five            ("V"|"v")
ten             ("X"|"x")

%%
"+"         {if (neg) res -= answer ; else res += answer; answer = 0; prev_sym_val = 0; curr_sym_val = 0; neg = 0; symbol = 0;}
"-"         {if (neg) res -= answer ; else res += answer; answer = 0; prev_sym_val = 0; curr_sym_val = 0;neg = 1; symbol = 1;}
"*"         {res += answer ; answer = 0; prev_sym_val = 0; curr_sym_val = 0; symbol = 2; symbol = 2;}
"/"         {res += answer ; answer = 0; prev_sym_val = 0; curr_sym_val = 0; symbol = 3; symbol = 3;}
"\n"        {
            if (symbol == 0)
                res += answer;
            if (symbol == 1)
                res -= answer;
            if (symbol == 2)
                res *= answer;
            if (symbol == 3)
                res /= answer;
            printf("Integer value is : %d\n",res);answer=0;prev_sym_val=0;curr_sym_val=0; neg = 0, res=0;}
{one}       {curr_sym_val = 1;
             if(curr_sym_val > prev_sym_val)
             {
                 answer -= (2*prev_sym_val);
             }
             answer += curr_sym_val;
             prev_sym_val = curr_sym_val;
            }
            
{five}      {curr_sym_val = 5;
             if(curr_sym_val > prev_sym_val)
             {
                 answer -= (2*prev_sym_val);
             }
             answer += curr_sym_val;
             prev_sym_val = curr_sym_val;
            }
            
{ten}       {curr_sym_val = 10;
             if(curr_sym_val > prev_sym_val)
             {
                 answer -= (2*prev_sym_val);
             }
             answer += curr_sym_val;
             prev_sym_val = curr_sym_val;
            }
        
. ;            
%%

int yywrap(void){}

int main()
{
    yylex();
    return 0;
}