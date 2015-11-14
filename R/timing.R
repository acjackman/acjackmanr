#' Timing Functions
#'
#' Wrapper functions for \code{proc.time()}. Creates variables called
#' \code{st_name} and \code{et_name}, respectivly
#'
#' @param name name of timer
#'
#' @return None
#'
#' @examples
#' st("test")
#' # Long running code here
#' Sys.sleep(2)
#' et("test")
#'
#' @seealso \code{\link{ct}}
#' @rdname timing
#' @export
st <- function(name){
    assign(paste0("st_",name),proc.time(),parent.frame())
}


#' @rdname timing
#' @export
et <- function(name){
    assign(paste0("et_",name),proc.time(),parent.frame())
}

#' Calculate time difference
#'
#' Calculate the time differnce for a timer created by \code{st()}
#' and \code{et()}.
#'
#' @param name name of timer
#' @param units units to return in. One of \code{c("sec","min","hr")}
#'
#' @return user, system, and elapsed time.
#'
#' @examples
#' st("test")
#' Sys.sleep(2)
#' et("test")
#' ct("test")
#'
#' @seealso \code{\link{st}}, \code{\link{et}}
#' @export
ct <- function(name, units="sec"){
    tmp <- eval(parse(text=paste0("et_",name, " - ", "st_",name)))
    switch(units,
        "min" = tmp / 60,
        "hr" = tmp / (60 ^ 2),
        tmp
    )
}
