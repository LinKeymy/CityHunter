//
//  main.c
//  blockTEst
//
//  Created by 林荣安 on 15/11/22.
//  Copyright © 2015年 Family. All rights reserved.
//

#include <stdio.h>


int global_val = 1;
static int static_global_val = 2;

int main(int argc, const char * argv[]) {
    int b = 5;
    static int static_val = 3;
    void (^blk) (void) = ^{
        global_val *= 2;
        static_global_val *= 2;
        static_val *= 3;
       int *a = &b;
        printf("b = %d\n",b);
        
        *a = 3;
        printf("b = %d\n",b);

    };
    //执行该block的时候没有传递参数，block里面使用的变量如果不是全局变量，都不能直接访问，对于一般的局部变量，block直接copy它的值到block实例的结构体里面，如果是静态的局部变量，由于该变量指初始化一次，block就只是copy它的地址过来，间接引用该值。
    blk();
    printf("static_val : %d\n",global_val);
     printf("static_val : %d\n",static_val);
     printf("static_val : %d\n",static_global_val);
    printf("b = %d\n",b);
    return 0;
}


