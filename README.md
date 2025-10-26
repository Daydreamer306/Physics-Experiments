# 大物实验电子版

## 模板说明

模板参考了 cc98（【学习天地】大二物理实验报告 LaTeX 模版 <https://www.cc98.org/topic/6284556> 复制本链接到浏览器或者打开【CC98】微信小程序查看~）的模板，进行了一些修改和功能性宏包的添加

## 使用方法

复制本仓库根目录下的`template.tex`目录至一个新目录，并在同级文件夹下创建`figures/`文件夹以存放实验报告所需要的
图片资源。

复制完成之后如有需要请更改`template.tex`中的前两行，以便可以找到模板所在的位置。

如果不方便使用 $\LaTeX$ , 可以在[release](https://github.com/YuNa-Zju/phy_exp/releases/latest)中下载到最新编译的实验报告。

## 资源整理

[Typst 模板](https://www.cc98.org/topic/6286687)

[LaTeX 模板](https://www.cc98.org/topic/6284556)

[cc98 其一：大学物理实验报告（大物实验报告）](https://www.cc98.org/topic/6076104)

[咸鱼暄](https://xuan-insr.github.io/other_courses/big_physics_exp/)

## $\LaTeX$模板

```tex
\documentclass[]{../template/Report}%方括号内写yuxi即生成预习报告\documentclass[yuxi]{../template/Report}
\settemplatedir{../template/}%设置模板路径

\exname{} %实验名称
\extable{} %实验桌号
\instructor{} %指导教师
\class{} %班级
\name{} %姓名
\stuid{} %学号

\nyear{} %年
\nmonth{} %月
\nday{} %日
\nweekday{} %星期几，e.g. \nweekday{三}
\daypart{}%上午/下午

\redate{} %如有实验补做，补做日期
\resitu{} %情况说明：

\begin{document}
\makecover%输出封面

\section{预习报告（10分）}
（注：将已经写好的“物理实验预习报告”内容拷贝过来）

\subsection{实验综述（5分）}
（自述实验现象、实验原理和实验方法，包括必要的光路图、电路图、公式等。不超过500字。）

\subsection{实验重点（3分）}
（简述本实验的学习重点，不超过100字。）

\subsection{实验难点（2分）}
（简述本实验的实现难点，不超过100字。）

\begin{fullreportonly}
\section{原始数据（20分）}
（将有老师签名的“自备数据记录草稿纸”的扫描或手机拍摄图粘贴在下方，完整保留姓名，学号，教师签字和日期。）

\section{结果与分析（60分）}
\subsection{数据处理与结果（30分）}
（列出数据表格、选择适合的数据处理方法、写出测量或计算结果。）

\subsection{误差分析（20分）}
（运用测量误差、相对误差或不确定度等分析实验结果，写出完整的结果表达式，并分析误差原因。）

\subsection{实验探讨（10分）}
（对实验内容、现象和过程的小结，不超过100字。）

\section{思考题（10分）}
（解答教材或讲义或老师布置的思考题，请先写题干，再作答。）
\end{fullreportonly}
\insertnotes
\end{document}
```

三线表/自动换行的表格使用方法：

```tex
\begin{table}[H]
  \centering
  \caption{}
  \begin{tabular}{C{.3\textwidth}C{.3\textwidth}C{.3\textwidth}}
  \toprule
  读取值  & 测量值  & 计算误差 \\
  \midrule
  10000$\Omega$  & 10001$\Omega$  & 0.01\%  \\
  100$\Omega$    & 100.4$\Omega$  & 0.40\%  \\
  100k$\Omega$ & 100.25k$\Omega$ & 0.25\%  \\
  \bottomrule
  \end{tabular}
\end{table}
```

一行多图：

```tex
\begin{figure}[htbp]
    \centering
    \begin{subfigure}[b]{0.45\textwidth}
        \includegraphics[width=\textwidth]{duoliangchengdianliu.png}
        \caption{多量程电流表设计电路}
        \label{duoliangchengdianliu}
    \end{subfigure}
    \hfill
    \begin{subfigure}[b]{0.45\textwidth}
        \includegraphics[width=\textwidth]{duoAjiaoyan.png}
        \caption{多量程电流表校验电路}
        \label{duoAjiaoyan}
    \end{subfigure}
\caption{多量程电流表相关电路}
\end{figure}
```

引用：

```tex
\cref{duoliangchengdianliu}
```

单位：

```tex
\SI{10}{mA}
\si{\meter\per\second}
\si{\degreeCelsius}
\SI{9.8}{\meter\per\second\squared}
\SI{1.23e-4}{\pascal\second}
```
