#' Trim extra space around string
#'
#' Remove any extra space around a string
#'
#' @param string the string to be trimmed
#'
#' @return the trimmed substring
#'
#' @examples
#' a <- " foo "
#' trim(a)
#' b <- "\n foo \n "
#' trim(b)
#'
#' @export

trim <- function (string){
    gsub("^\\s+|\\s+$", "", string)
}
