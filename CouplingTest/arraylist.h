#ifndef ARRAYLIST_H_INCLUDED
#define ARRAYLIST_H_INCLUDED

#include "CommonFunc.h"

typedef struct arraylist
{
    PSendCommRecord E; //����java�еķ���
    void **pItemList; //ָ��ָ���ָ��,����Ҫʵ������java�е�<E>����Ч��,����ʹ�� void ����ָ��
    int capacity; //��ǰ����
    int factor; //��չ����,���ռ䲻����ʱ
    int size; //��ǰԪ�ص�����

} *ArrayList;

enum ArrayList_E{E_STRING,E_INT}; //ö������


ArrayList arraylist_init(PSendCommRecord E); //��ʼ��

void arraylist_add(ArrayList items,void *pItem); //��ָ����Ԫ��׷�ӵ����б��β����

int arraylist_insert(ArrayList items,int index,void *pItem); //��ָ����Ԫ�ز�����б��е�ָ��λ��

int arraylist_indexOf(ArrayList items,void * pItem); //��������������һ�γ��ֵ�λ��

int arraylist_lastIndexOf(ArrayList items, void *pItem); //����ָ���Ķ������б������һ�γ��ֵ�λ������

int arraylist_remove(ArrayList items, void *pItem); //�Ӵ��б����Ƴ�ָ��Ԫ�صĵ���ʵ����������ڣ�

void *arraylist_removeIndex(ArrayList items,int index); //�Ƴ����б���ָ��λ���ϵ�Ԫ��

void arraylist_set(ArrayList items,int index,void *pItem); //��ָ����Ԫ��������б���ָ��λ���ϵ�Ԫ��

void *arraylist_get(ArrayList items,int index); //���ش��б���ָ��λ���ϵ�Ԫ��

void arraylist_clear(); //�Ƴ����б��е�����Ԫ�ء�

#endif // ARRAYLIST_H_INCLUDED

