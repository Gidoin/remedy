#' Mover
#'
#' Copy a selected text or the current line
#' 
#' @rdname move
#'
#' @return a clone of the line
#' @export

rightr <- function(){
  a <- rstudioapi::getSourceEditorContext()
  rg <- a$selection[[1]]$range
  pos <- a$selection[[1]]$range[[1]][[1]]
  ncol <- rg$end[[2]] - rg$start[[2]]
  rg$start[[2]] <- rg$start[[2]] + ncol
  rg$end[[2]] <- rg$end[[2]] + ncol
  # If text is selected
  if (nchar(a$selection[[1]]$text) != 0) {
    rstudioapi::insertText(location = rg, text = a$selection[[1]]$text)
    rstudioapi::setCursorPosition(rg)
  } else {
    rstudioapi::insertText(location = rg, text = a$contents[pos])
  }
}

#' @rdname move
#' 
#' @export
#' 
downr <- function(){
  a <- rstudioapi::getSourceEditorContext()
  rg <- a$selection[[1]]$range
  pos <- a$selection[[1]]$range[[1]][[1]]
  ncol <- rg$end[[2]] - rg$start[[2]]
  rg$start[[1]] <- rg$start[[1]] + 1
  rg$end[[1]] <- rg$end[[1]] + 1
  rstudioapi::insertText(location = rg, text = "\n")
  # If text is selected
  if (nchar(a$selection[[1]]$text) != 0) {
    rstudioapi::insertText(location = rg, text = a$selection[[1]]$text)
    rstudioapi::setCursorPosition(rg)
  } else {
    rstudioapi::insertText(location = rg, text = a$contents[pos])
    rstudioapi::setCursorPosition(rg)
  }
}

