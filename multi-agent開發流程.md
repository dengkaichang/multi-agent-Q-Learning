## To do list

- [x] 建置第二個Q-Table
- [ ] Uncoordinated to Uncoordinated
- [ ] Uncoordinated to Coordinated
- [ ] Coordinated to Uncoordinated
- [x] Coordinated to Coordinated



## Multi-agent Q-Learning for two Uncoordinated to Uncoordinated states

1. 在 [全域變數](initialization) 中，新增[第二台UAV位置](stParameters.LocUAV_1)與[第二個Q-Table](stParameters.Q_TABLE_1)

   ~~~matlab
   stParameters.LocUAV_1     = [80 375]; 
   stParameters.Q_TABLE_1  = 0*ones(10,8);
   ~~~

2. 定義四個新變數方便給第二台無人機使用

   ```matlab
   ObjObstacle_1='FindObstacle_1';
   path_1 = [];
   obstacles_1 = [];
   Prec3=[-140 -140 -140];
   ```


3. 新增一[函數](Q_learning_1)給第二台無人機 Update Q-Table
4. 即可完成 two Uncoordinated to Uncoordinated states

## Multi-agent Q-Learning for two Uncoordinated to Coordinated states

## Multi-agent Q-Learning for two Coordinated to Uncoordinated states

## Multi-agent Q-Learning for two Coordinated to Coordinated states

1. 新增兩個[全域變數 1](initialization_1)、[全域變數 2](initialization_2) 

   全域變數 1: 代表第二台 UAV 的所有變數

   全域變數 2: 代表將兩台UAV的Q-table做結合

   ~~~matlab
   stParameters_2=Q_learning_2((Prec(1)-sum(Prec2)/3)+(Prec_1(1)-sum(Prec3)/3),stParameters_2,(Prec(1)+Prec_1(1))/2);
       stParameters_2.Action = stParameters.Action;
       stParameters_2.Action = stParameters_1.Action;
       stParameters_2.S_Current = stParameters.S_Current;
       stParameters_2.S_Current = stParameters_1.S_Current;
   ~~~

2. 即可完成 Coordinated to Coordinated states

