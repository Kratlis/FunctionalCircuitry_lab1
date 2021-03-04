# FunctionalCircuitry_lab1

## The first lab on functional circuitry subject

### Task
1. Опишите на Verilog HDL на вентильном уровне модуль, реализующий функцию БОЭ в указанном логическом базисе согласно варианту задания.
2. Разработайте тестовое окружение для созданного модуля.
3. Проведите моделирование работы схемы.
4. Составьте отчет по результатам выполнения заданий второй части лабораторной работы.

Логический базис - NAND

БОЭ - дешифратор трехразрядного кода Грея

### Код разработанного модуля БОЭ
```
`timescale 1ns / 1ps

module gray_decoder(
    input g3,
    input g2,
    input g1,
    output x3,
    output x2,
    output x1
    );
    
    wire nx3, nx2, ng2, ng1, nx2ng1, nx2g1, nx3ng2, nx3g2;
    
    assign x3 = g3;
    
    nand(nx3, x3, x3);
    nand(nx2, x2, x2);
    nand(ng2, g2, g2);
    nand(ng1, g1, g1);
    
    nand(nx2ng1, x2, ng1);
    nand(nx2g1, nx2, g1);
    
    nand(nx3ng2, x3, ng2);
    nand(nx3g2, nx3, g2);
    
    nand(x2, nx3ng2, nx3g2);
    nand(x1, nx2ng1, nx2g1);
endmodule
```
### Код разработанного тестового окружения БОЭ 
```
module tb();

reg g2, g1, g0;
wire x2, x1, x0;

gate_function gf0(g2, g1, g0, x2, x1, x0);
    initial begin
        g2 = 0; g1 = 0; g0 = 0;
        #1 g2 = 0; g1 = 0; g0 = 1;
        #1 g2 = 0; g1 = 1; g0 = 1;
        #1 g2 = 0; g1 = 1; g0 = 0;
        #1 g2 = 1; g1 = 1; g0 = 0;
        #1 g2 = 1; g1 = 1; g0 = 1;
        #1 g2 = 1; g1 = 0; g0 = 1;
        #1 g2 = 1; g1 = 0; g0 = 0;
    end
endmodule
```
### Временная диаграмма процесса тестирования БОЭ
![image](https://user-images.githubusercontent.com/48138888/109940930-a30eab00-7ce3-11eb-840f-75838229b1a9.png)

