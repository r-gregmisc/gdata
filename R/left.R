left  <- function(x, n=6L, ...) UseMethod("left")
right <- function(x, n=6L, ...) UseMethod("right")

.leftright <- function(x, n=6L, add.col.nums = TRUE,
                       direction = c("left", "right"), ...)
{
  stopifnot(length(n) == 1L)

  ncx <- ncol(x)

  if (add.col.nums && is.null(colnames(x)))
    colnames(x) <- paste0("[", 1:ncx, ",]")

  if (n < 0L)
    n <- max(ncx + n, 0L)
  else
    n <- min(n, ncx)

  if (direction == "left")
    sel <- seq.int(from=1, length.out = n)
  else  # direction="right"
    sel <- seq.int(to = ncx, length.out = n)

  x[, sel, drop = FALSE]
}

left.data.frame <- function(x, n=6L, add.col.nums=TRUE, ...)
  .leftright(x, n=n, add.col.nums=add.col.nums, direction="left")

right.data.frame <- function(x, n=6L, add.col.nums=TRUE, ...)
  .leftright(x, n=n, add.col.nums=add.col.nums, direction="right")

left.matrix <- left.data.frame
right.matrix <- right.data.frame
