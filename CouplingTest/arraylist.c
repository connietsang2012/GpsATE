						   #include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "arraylist.h"

//��ʼ��
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

//��������,����������������ʱ,�Զ�����3��
//static ��������java�е�private
static void arraylist_resize_capacity(ArrayList items)
{
    if(items->size == items->capacity)
    {
        //printf("�ռ�������,����ռ� -> %d\n",items->size);

        items->capacity = items->size + items->factor; //��������

        void **newItemList = malloc(sizeof(void *) * items->capacity);

        //��ԭ����ָ��ָ������ݸ��Ƶ��µĿռ���
        memcpy(newItemList,items->pItemList,sizeof(void *) * items->size);

        free(items->pItemList); //�ͷ�ԭ��ָ��Ŀռ�

        items->pItemList = newItemList; //ָ���¿ռ�
    }
}

//��ָ����Ԫ��׷�ӵ����б��β����
void arraylist_add(ArrayList items,void *pItem)
{
    arraylist_resize_capacity(items);

    *(items->pItemList + items->size) = pItem;
    items->size++; //size + 1
}

//��ָ����Ԫ�ز�����б��е�ָ��λ��,�ɹ�����1,ʧ�ܷ���0
int arraylist_insert(ArrayList items,int index,void *pItem)
{
    if(index <= items->size)
    {
        arraylist_resize_capacity(items);

        void **pItemList = items->pItemList;

        //�ƶ�ָ��ָ��ĵ�ַ,���������е�Ԫ�ش�index��ʼ����ƶ�һλ
        int i;
        for(i = items->size; i>index; i--)
        {
            *(pItemList+i) = *(pItemList+i-1);
        }

        *(pItemList+index) = pItem;  //���µ�Ԫ�ز��뵽���λ��

        items->size++; //size + 1

        return 1;
    }
    else
    {
        return 0;
    }
}


//��������������һ�γ��ֵ�λ��,�ҵ�����index,�Ҳ�������-1
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
            //���ָ���ֵ��ָ��ָ������ձ�����ֵ��һ����
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
            //���ָ���ֵ��ָ��ָ������ձ�����ֵ��һ����
            if(*pItemList == pItem)
            {
                return i;
            }

            pItemList++;
        }
    }


    return -1;
}

//����ָ���Ķ������б������һ�γ��ֵ�λ������,�ҵ�����index,�Ҳ�������-1
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

//�Ӵ��б����Ƴ�ָ��Ԫ�صĵ���ʵ��,������ھͷ���1,��֮����0
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
                //�ƶ�ָ��ָ��ĵ�ַ,���������е�Ԫ�ش�index��ʼ��ǰ�ƶ�һλ
                int m;
                for(m = i; m<size-1; m++)
                {
                    *(pItemList + m) = *(pItemList + m + 1);
                }

                *(pItemList + size - 1) = NULL;  //���µ�Ԫ�ز��뵽���λ��

                items->size--; //size - 1

                return i;
            }
        }
        else if(items->E == E_INT)
        {
            if(*(pItemList+i) == pItem || *(int *)(pItemList + i) == *(int *)pItem)
            {
                //�ƶ�ָ��ָ��ĵ�ַ,���������е�Ԫ�ش�index��ʼ��ǰ�ƶ�һλ
                int m;
                for(m = i; m<size-1; m++)
                {
                    *(pItemList + m) = *(pItemList + m + 1);
                }

                *(pItemList + size - 1) = NULL;  //���µ�Ԫ�ز��뵽���λ��

                items->size--; //size - 1

                return i;
            }
        }
        else
        {
            if(*(pItemList+i) == pItem)
            {
                //�ƶ�ָ��ָ��ĵ�ַ,���������е�Ԫ�ش�index��ʼ��ǰ�ƶ�һλ
                int m;
                for(m = i; m<size-1; m++)
                {
                    *(pItemList + m) = *(pItemList + m + 1);
                }

                *(pItemList + size - 1) = NULL;  //���µ�Ԫ�ز��뵽���λ��

                items->size--; //size - 1

                return i;
            }
        }
    }

    return -1;
}

//�Ƴ����б���ָ��λ���ϵ�Ԫ��,���ر��Ƴ���Ԫ��
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

        void *pItem = *(pItemList + index); //ȡ��indexλ�õ�ָ���ֵ


        //�ƶ�ָ��ָ��ĵ�ַ,���������е�Ԫ�ش�index��ʼ��ǰ�ƶ�һλ
        int m;
        for(m = index; m<size-1; m++)
        {
            *(pItemList + m) = *(pItemList + m + 1);
        }

        *(pItemList + size - 1) = NULL;  //��β����ָ���ֵ����ΪNULL

        items->size--; //size - 1

        return pItem;
    }
}

//��ָ����Ԫ��������б���ָ��λ���ϵ�Ԫ��,����: ��ǰλ�ڸ�ָ��λ���ϵ�Ԫ��
void arraylist_set(ArrayList items,int index,void *pItem)
{
    int size = items->size;

    if(index <= size && size > 0)
    {
        *(items->pItemList + index) = pItem;
    }
}


//���ش��б���ָ��λ���ϵ�Ԫ��
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

//�Ƴ����б��е�����Ԫ��
void arraylist_clear(ArrayList items)
{
    free(items->pItemList); //�ͷ��ڴ�

    //���³�ʼ��
    items->capacity = 10;
    items->factor = 3;
    items->size = 0;
    items->pItemList = malloc(sizeof(void *) * items->capacity);

}
