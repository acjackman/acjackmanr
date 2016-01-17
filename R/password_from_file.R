#' Create a password from a file
#'
#' select a random set of words from a text file and combine into a password.
#' Project Gutenberg books, academic papers, and scripts all make great sources for
#' memorable passwords.
#'
#' @param file plaintext file to draw words from
#' @param pwd_length number of words to select for password
#' @param combn_char character to combine password with
#'
#' @export
password_from_file <- function(file, pwd_length=3, combn_char = NA){
    if (is.na(combn_char)){
        comb_char <- sample(c("-","_","$","^","!","?"), 1)
    }

    acj <- readLines(file)
    wrd <- unlist(stringr::str_split(acj, " "))
    lng_wrds <- wrd[stringr::str_length(wrd) > 4] # Don't pick small woards
    sel <- sample(lng_wrds, pwd_length)
    paste(sel,sep=comb_char)
}
