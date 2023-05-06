## Test setup
if(FALSE) {
  library("RUnit")
  library("gdata")
}

test.drop.levels <- function()
{
  f <- factor(c("A", "B", "C", "D"))[1:3]
  fDrop <- factor(c("A", "B", "C"))

  l <- list(f=f, i=1:3, c=c("A", "B", "D"))
  lDrop <- list(f=fDrop, i=1:3, c=c("A", "B", "D"))

  df <- as.data.frame(l)
  dfDrop <- as.data.frame(lDrop)

  checkIdentical(drop.levels(f), fDrop)
  checkIdentical(drop.levels(l), lDrop)
  checkIdentical(drop.levels(df), dfDrop)
}
