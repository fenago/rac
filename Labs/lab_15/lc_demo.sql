create or replace procedure lcdemo is
  begin
for i in 1 ..100000 loop
  dbms_lock.sleep (1);
  end loop;
  end;
  /
