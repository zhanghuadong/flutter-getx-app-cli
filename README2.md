1:这里测试一下git
1.5修改
2：测试其他
==============================
那就坚持一年先了，搞点起步资金
git 的连接方式分为四种:ssh连接、HTTPS 连接、SVN 连接和SVN + ssh 连接
=============================

void bubble_sort(int arr[],int sz)
{
int i = 0;
//确定冒泡排序的趟数
for (i = 0; i < sz - 1; i++)
{
int j = 0;
flag = 1;
//对两个数比大小
for (j = 0; j < sz - 1 - i; j++)
{
//调换前后数据
if (arr[j] >arr[j + 1])
{
int tap = arr[j];
arr[j] = arr[j+1];
arr[j+1] = tap;
}
}
}
==============================
那就坚持一年先了，搞点起步资金
git 的连接方式分为四种:ssh连接、HTTPS 连接、SVN 连接和SVN + ssh 连接。
=============================

int main()
{
	int arr[] = { 9，8，7，6，5，4，3，2，1，0};
	int i = 0;
	int sz = sizeof(arr) / sizeof(arr[0]);
	bubble_sort(arr,sz);//冒泡排列
	for (i = 0;i < sz;i++)
	{
		printf("%d ", arr[i]);//打印排列好的数组
	}
		return 0;
}
