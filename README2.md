==============================
那就坚持一年先了，搞点起步资金
git 的连接方式分为四种:ssh连接、HTTPS 连接、SVN 连接和SVN + ssh 连接。
==============================
void BubbleSort(vector<int> &vi)
{
    int i, j, temp;
    for(i = 0; i < vi.size()-1; i++)
    {
        for(j = vi.size()-2; j >= i; j--)
        {
            if(vi[j] >vi[j+1])
            {
                temp = vi[j];
                vi[j] = vi[j+1];
                vi[j+1] = temp;
            }
        }   
    }           
}
==============================
void BubbleSort2(vector<int> &vi)
{       
int i, j, temp;
bool flag = true;
for(i = 0; i < vi.size()-1 && flag; i++) //若无发生交换，则说明序列已经是有序的，flag=false退出
{   
flag = false;
for(j = vi.size()-2; j >= i; j--)
{
if(vi[j] >vi[j+1])
{
temp = vi[j];
vi[j] = vi[j+1];
vi[j+1] = temp;
flag = true;
}
}
}
}
=============================
void BubbleSort2(vector<int> &vi)
{       
int i, j, temp;
bool flag = true;
for(i = 0; i < vi.size()-1 && flag; i++) //若无发生交换，则说明序列已经是有序的，flag=false退出
{   
flag = false;
for(j = vi.size()-2; j >= i; j--)
{
if(vi[j] >vi[j+1])
{
temp = vi[j];
vi[j] = vi[j+1];
vi[j+1] = temp;
flag = true;
}
}
}
}
那就坚持一年先了，搞点起步资金
git 的连接方式分为四种:ssh连接、HTTPS 连接、SVN 连接和SVN + ssh 连接。
=============================
