select C.* from [Comment] C
full outer join [Subscribe] S on C.Username = S.Username;