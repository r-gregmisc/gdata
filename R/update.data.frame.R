# # This function replace rows in 'object' by corresponding rows in 'new' that have
# # the same value for 'by'
# update.data.frame <- function(object,
#                               new,
#                               by,
#                               by.object=by,
#                               by.new=by,
#                               append=TRUE,
#                               verbose=TRUE,
#                               ...)
# {
#   retval <- object
#
#   if(length(by.object)>1)
#     stop("'by.object' can specify at most one column")
#
#   if(length(by.new)>1)
#     stop("'by.new' can specify at most one column")
#
#
#   object.by <- object[[by.object]]
#   new.by    <- new   [[by.new   ]]
#
#   matches.object <- match(new.by, object.by)
#   matches.new    <- which(!is.na(matches.object))
#   nomatch.new    <- which(is.na(matches.object))
#   matches.object <- matches.object[!is.na(matches.object)]
#
#   if(length(matches.object)>0)
#     retval[matches.object, ] <- new[matches.new,]
#
#   if(length(nomatch.new) && append)
#     retval <- rbind(retval, new[nomatch.new,])
#
#   if(verbose)
#   {
#     cat("\n")
#     cat("Number of rows in object:", nrow(object),           "\n")
#     cat("Number of rows in new   :", nrow(new),           "\n")
#     cat("\n")
#     cat("Number of rows replaced :", length(matches.object), "\n")
#     cat("Number of rows appended :", length(nomatch.new), "\n")
#     cat("\n")
#     cat("Number of rows in result:", nrow(retval),      "\n")
#     cat("\n")
#   }
#   retval
# }
