--此為預設程序檔案--
------------------------------------(6.客戶資料表)
-- 新增
\d #
create procedure add6(
    in cname varchar(20), 
    in cphone varchar(10), 
    in cemail varchar(100), 
    in caddress varchar(100)  
)
begin
    insert into `客戶資料表` (`姓名`, `電話`, `email`, `address`)
    values (cname, cphone, cemail, caddress);
end #
\d ; 


-- 修改
\d #
create procedure update6(
    in cid int,
    in cname varchar(20), 
    in cphone varchar(10), 
    in cemail varchar(100), 
    in caddress varchar(100)
)
begin
    if cname = ''  then 
         select `姓名` into @v_cname from `客戶資料表`  where `id` = cid;
    else set @v_cname = cname; 
    end if;

    if cphone = '' then 
         select `電話` into @v_cphone from `客戶資料表` where `id` = cid;
    else set @v_cphone = cphone; 
    end if;

    if cemail = ''  then 
         select `email` into @v_cemail from `客戶資料表` where `id` = cid;
    else set @v_cemail = cemail; 
    end if;

    if caddress = ''  then 
         select `address` into @v_caddress from `客戶資料表` where `id` = cid;
    else set @v_caddress = caddress; 
    end if;

    update `客戶資料表` set
    `姓名` = @v_cname,
    `電話` = @v_cphone,
    `email` = @v_cemail,
    `caddress` = @v_caddress
    where `id` = cid;
end #
\d ;


-- 刪除
\d #
create procedure delete6(in cid int)
begin
    delete from `客戶資料表` where `id` = cid;
end #
\d ;


-- 查詢
\d #  
create procedure rese6(in cphone int , in cname varchar(10)  ) 
begin  
 if cphone=' ' or  cname= ' '  then  select * from  `客戶資料表`;
 else SELECT `電話`, `姓名`  FROM  `客戶資料表`  
      where `電話` like concat(cphone,'%')  and `姓名` like concat(cname,'%');
 end if; 
end #
\d ;   




------------------------------------(7.供應商)
-- 新增 
\d #
create procedure add7(
    in sname varchar(50),
    in sphone varchar(10),
    in saddress varchar(100) 
)
begin
    insert into `供應商` (`名稱`, `電話`, `地址`)
    values (sname, sphone, saddress);    
end #
\d ;

-- 修改 --
\d #
create procedure update7(
    in supid int,
    in sname varchar(50),
    in sphone varchar(10),
    in saddress varchar(100)
)
begin
    if sname = '' then
        select `名稱` into @v_sname from `供應商`  where `id` = supid;
    else set @v_sname = sname; 
    end if;

    if sphone = '' then 
         select `supplierPhone` into @v_sphone from `供應商` where `id` = supid;
    else set @v_sphone = sphone ; 
    end if;

    if saddress = '' then
         select `supplierAddress` into @v_saddress from `供應商` where `id` = supid;
    else set @v_saddress = saddress ; 
    end if;
    update `供應商` set
    `名稱` = @v_sname,
    `電話` = @v_sphone,
    `地址` = @v_saddress
    where `id` = supid;
end #
\d ;

-- 刪除 
create procedure delete7(in supid int)
begin
    delete from `供應商` where `id` = supid;
end #


-- 查詢
\d #  
create procedure rese7(in sname varchar(10), in sphone int) 
begin  
 if sname=' ' or  sphone= ' ' then  select * from  `供應商`;
 else  select `名稱`,`電話`  from  `供應商`
       where `名稱` like concat(sname,'%')  and `電話` like concat(sphone,'%');
 end if;   
end #
\d ;   


------------------------------------(8.商品)
-- 新增 
\d #
create procedure add8(
    in pname varchar(50),
    in pNum varchar(10),
    in pprice int,
    in sphone varchar(100)
)
begin
    insert into `商品表` (`名稱`, `編號`, `建議售價`, `供應商電話`)
    values (pname, pNum, pprice, sphone);
end #
\d ;


-- 修改 
\d #
create procedure update8(
    in pNum varchar(10),
    in pname varchar(50),
    in pprice int
)
begin
    if pname = '' then
        select `名稱` into @v_pname from `商品` where `編號` = pNum;
    else set @v_pname = pname; 
    end if;

    if pprice = 0 then
        select `建議售價` into @v_pprice from `商品` where `編號` = pNum;
    else set @v_pprice = pprice; 
    end if;
    update `商品` set 
    `名稱` = @v_pname,
    `建議售價` = @v_pprice
    where `編號` = pNum;
end #
\d ;

-- 刪除 --
\d # 
create procedure delete8(in pNum varchar(10))
begin
    delete from `商品` where `編號` = pNum;
end #
\d ;

-- 查詢
\d #  
create procedure rese8( in pname varchar(10) ) 
begin  
  if pname=' ' then  select * from  `商品表`;    desc  `商品表`;
  else   select `名稱`  from  `商品表`  where `名稱` like concat(pname,'%') ;
  end if;    
end #
\d ;   


------------------------------------(9.訂單)

\d #  
create procedure insertO9( in oNum varchar(100), in cName varchar(10)) 
begin  
   
 if oNum=' ' and  cName='' then  select * from  `訂單`;  
 else  insert into `訂單` (`編號`, `客戶`) value ( oNum,cName ); 
 end if;

end #
\d ; 

-- 刪除 
\d #
create procedure deleteO9(in oNum varchar(10))
begin
    delete from `訂單` where `編號` = oNum;
end #
\d ;
  


------------------------------------(10.訂單細項)
-- 新增 
\d #  
create procedure addOD10(
    in oNum varchar(10),
    in cid int,
    in pNum varchar(10),
    in pprice int,
    in quantity int
)
begin
    set @v_oNum = oNum;
    set @v_cid = cid;
    insert into `訂單細項` (`訂單編號`, `商品編號`, `實際售價`, `數量`)
    values (oNum, pNum, pprice, quantity);
end #
\d ;


-- 修改 --
\d #  
create procedure updateOD10(
    in oNum varchar(10),
    in pNum varchar(10),
    in pprice int,
    in qua int
)
begin
    if pprice = 0 then
        select `實際售價` into @v_pprice from `訂單細項` 
        where `訂單編號` = oNum  and `商品編號` = pNum;
    else set @v_pprice = pprice; 
    end if;
    
    if qua = 0 then
        select `數量` into @v_quantity from `訂單細項` 
        where `訂單編號` = oNum  and `商品編號` = pNum;
    else set @v_quantity = qua; 
    end if;
    update `訂單細項` set 
    `實際售價` = @v_pprice, 
    `數量` = @v_quantity 
    where `訂單編號` = oNum  and `商品編號` = pNum;
end #
\d ;


-- 刪除 --
\d #  
create procedure deleteOD10(
    in oNum varchar(10),
    in pNum varchar(10)
)
begin
    select oNum, pNum;
    delete from `訂單細項` where `商品編號` = pNum  and `訂單編號` = oNum;
    select count(*) into @count from `訂單細項` where `訂單編號` = oNum;
    select @count;
    if @count = 0 then  delete from `訂單` where `訂單編號` = oNum;
    end if;
end #
\d ;
















