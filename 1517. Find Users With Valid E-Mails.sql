select *
from users
where mail REGEXP "^[A-Za-z][A-Za-z0-9_.-]*@leetcode[.]com$"