
x <- c(1:5)
y <- c(1:5)
z = 1:20

df1 <- data.frame("Row One"=x, "Row Two"=y)
df2 <- data.frame("Row Two"=y,"Row One"=x)
dfList <- list(df1,df2)

DF2 <- data.frame(x=1:3, y=c(1:2, NA), z=NA) 
DF1 <- data.frame(x=1:3, y=NA, z=c(1:2, NA))

lista = unlist(list(ls()[sapply(ls(), function(x) class(get(x))) == 'data.frame']))

res <- lapply(mget(lista), 
              function(DF)
                DF[!sapply(DF, function(x) all(is.na(x)))]
)

invisible(list2env(res, globalenv())) # overwrites original DFs
