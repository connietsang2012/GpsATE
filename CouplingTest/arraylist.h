#ifndef ARRAYLIST_H_INCLUDED
#define ARRAYLIST_H_INCLUDED

#include "CommonFunc.h"

typedef struct arraylist
{
    PSendCommRecord E; //类似java中的泛型
    void **pItemList; //指向指针的指针,由于要实现类似java中的<E>泛型效果,这里使用 void 类型指针
    int capacity; //当前容量
    int factor; //扩展因子,当空间不够用时
    int size; //当前元素的数量

} *ArrayList;

enum ArrayList_E{E_STRING,E_INT}; //枚举类型


ArrayList arraylist_init(PSendCommRecord E); //初始化

void arraylist_add(ArrayList items,void *pItem); //将指定的元素追加到此列表的尾部。

int arraylist_insert(ArrayList items,int index,void *pItem); //将指定的元素插入此列表中的指定位置

int arraylist_indexOf(ArrayList items,void * pItem); //搜索给定参数第一次出现的位置

int arraylist_lastIndexOf(ArrayList items, void *pItem); //返回指定的对象在列表中最后一次出现的位置索引

int arraylist_remove(ArrayList items, void *pItem); //从此列表中移除指定元素的单个实例（如果存在）

void *arraylist_removeIndex(ArrayList items,int index); //移除此列表中指定位置上的元素

void arraylist_set(ArrayList items,int index,void *pItem); //用指定的元素替代此列表中指定位置上的元素

void *arraylist_get(ArrayList items,int index); //返回此列表中指定位置上的元素

void arraylist_clear(); //移除此列表中的所有元素。

#endif // ARRAYLIST_H_INCLUDED

