						   #include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "arraylist.h"

//初始化
ArrayList arraylist_init(int E)
{
    ArrayList items = malloc(sizeof(struct arraylist));
    items->E = E;
    items->capacity = 10;
    items->factor = 3;
    items->size = 0;
    items->pItemList = malloc(sizeof(void *) * items->capacity);


    return items;
}

//重置容量,当可用容量不够用时,自动扩大3个
//static 作用类似java中的private
static void arraylist_resize_capacity(ArrayList items)
{
    if(items->size == items->capacity)
    {
        //printf("空间用完了,扩大空间 -> %d\n",items->size);

        items->capacity = items->size + items->factor; //扩大容量

        void **newItemList = malloc(sizeof(void *) * items->capacity);

        //将原来的指针指向的内容复制到新的空间中
        memcpy(newItemList,items->pItemList,sizeof(void *) * items->size);

        free(items->pItemList); //释放原来指向的空间

        items->pItemList = newItemList; //指向新空间
    }
}

//将指定的元素追加到此列表的尾部。
void arraylist_add(ArrayList items,void *pItem)
{
    arraylist_resize_capacity(items);

    *(items->pItemList + items->size) = pItem;
    items->size++; //size + 1
}

//将指定的元素插入此列表中的指定位置,成功返回1,失败返回0
int arraylist_insert(ArrayList items,int index,void *pItem)
{
    if(index <= items->size)
    {
        arraylist_resize_capacity(items);

        void **pItemList = items->pItemList;

        //移动指针指向的地址,即将数组中的元素从index开始向后移动一位
        int i;
        for(i = items->size; i>index; i--)
        {
            *(pItemList+i) = *(pItemList+i-1);
        }

        *(pItemList+index) = pItem;  //将新的元素插入到这个位置

        items->size++; //size + 1

        return 1;
    }
    else
    {
        return 0;
    }
}


//搜索给定参数第一次出现的位置,找到返回index,找不到返回-1
int arraylist_indexOf(ArrayList items, void *pItem)
{
    int i=0;
    int size = items->size;

    void **pItemList = items->pItemList;

    if(items->E == E_STRING)
    {
        for(; i<size; i++)
        {
            if(*pItemList == pItem || strcmp(*pItemList,pItem) == 0)
            {
                return i;
            }

            pItemList++;
        }

    }
    else if(items->E == E_INT)
    {
        //printf("------- %d,%d\n",*(int *)pItemList,*(int *)pItem);

        for(; i<size; i++)
        {
            //如果指针的值或指针指向的最终变量的值是一样的
            if(*pItemList == pItem || *(int *)pItemList == *(int *)pItem)
            {
                return i;
            }

            pItemList++;
        }

    }
    else
    {
        for(; i<size; i++)
        {
            //如果指针的值或指针指向的最终变量的值是一样的
            if(*pItemList == pItem)
            {
                return i;
            }

            pItemList++;
        }
    }


    return -1;
}

//返回指定的对象在列表中最后一次出现的位置索引,找到返回index,找不到返回-1
int arraylist_lastIndexOf(ArrayList items, void *pItem)
{
    int i;
    int size = items->size;

    void **pItemList = items->pItemList;

    if(items->E == E_STRING)
    {
        for(i=size-1; i>-1; i--)
        {
            if(*(pItemList+i) == pItem || strcmp(*(pItemList+i),pItem) == 0)
            {
                return i;
            }
        }

    }
    else if(items->E == E_INT)
    {
        //printf("------- %d,%d\n",*(int *)pItemList,*(int *)pItem);

        for(i=size-1; i>-1; i--)
        {
            if(*(pItemList+i) == pItem || *(int *)(pItemList + i) == *(int *)pItem)
            {
                return i;
            }
        }
    }
    else
    {
        for(i=size-1; i>-1; i--)
        {
            if(*(pItemList+i) == pItem)
            {
                return i;
            }
        }
    }



    return -1;
}

//从此列表中移除指定元素的单个实例,如果存在就返回1,反之返回0
int arraylist_remove(ArrayList items, void *pItem)
{
    int i=0;
    int size = items->size;

    void **pItemList = items->pItemList;

    for(; i<size; i++)
    {
        if(items->E == E_STRING)
        {
            if(*(pItemList+i) == pItem || strcmp(*(pItemList+i),pItem) == 0)
            {
                //移动指针指向的地址,即将数组中的元素从index开始向前移动一位
                int m;
                for(m = i; m<size-1; m++)
                {
                    *(pItemList + m) = *(pItemList + m + 1);
                }

                *(pItemList + size - 1) = NULL;  //将新的元素插入到这个位置

                items->size--; //size - 1

                return i;
            }
        }
        else if(items->E == E_INT)
        {
            if(*(pItemList+i) == pItem || *(int *)(pItemList + i) == *(int *)pItem)
            {
                //移动指针指向的地址,即将数组中的元素从index开始向前移动一位
                int m;
                for(m = i; m<size-1; m++)
                {
                    *(pItemList + m) = *(pItemList + m + 1);
                }

                *(pItemList + size - 1) = NULL;  //将新的元素插入到这个位置

                items->size--; //size - 1

                return i;
            }
        }
        else
        {
            if(*(pItemList+i) == pItem)
            {
                //移动指针指向的地址,即将数组中的元素从index开始向前移动一位
                int m;
                for(m = i; m<size-1; m++)
                {
                    *(pItemList + m) = *(pItemList + m + 1);
                }

                *(pItemList + size - 1) = NULL;  //将新的元素插入到这个位置

                items->size--; //size - 1

                return i;
            }
        }
    }

    return -1;
}

//移除此列表中指定位置上的元素,返回被移除的元素
void *arraylist_removeIndex(ArrayList items,int index)
{
    int size = items->size;

    if(index >= size || index < 0)
    {
        return NULL;
    }
    else
    {

        void **pItemList = items->pItemList;

        void *pItem = *(pItemList + index); //取得index位置的指针的值


        //移动指针指向的地址,即将数组中的元素从index开始向前移动一位
        int m;
        for(m = index; m<size-1; m++)
        {
            *(pItemList + m) = *(pItemList + m + 1);
        }

        *(pItemList + size - 1) = NULL;  //将尾部的指针的值设置为NULL

        items->size--; //size - 1

        return pItem;
    }
}

//用指定的元素替代此列表中指定位置上的元素,返回: 以前位于该指定位置上的元素
void arraylist_set(ArrayList items,int index,void *pItem)
{
    int size = items->size;

    if(index <= size && size > 0)
    {
        *(items->pItemList + index) = pItem;
    }
}


//返回此列表中指定位置上的元素
void *arraylist_get(ArrayList items,int index)
{
    int size = items->size;
    if(index >= 0 && index <= size && size > 0)
    {
        return *(items->pItemList+index);
    }
    else
    {
        return NULL;
    }
}

//移除此列表中的所有元素
void arraylist_clear(ArrayList items)
{
    free(items->pItemList); //释放内存

    //重新初始化
    items->capacity = 10;
    items->factor = 3;
    items->size = 0;
    items->pItemList = malloc(sizeof(void *) * items->capacity);

}
