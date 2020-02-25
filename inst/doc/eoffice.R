## ----install,eval = FALSE-----------------------------------------------------
#  # library(devtools)
#  # install_github("guokai8/eoffice")

## ----load, results = 'hide', message = FALSE----------------------------------
library(eoffice)
library(ggplot2)

## ----eval=FALSE---------------------------------------------------------------
#   Please install imageMagick to use the _infigure_ function. On Linux you need to install the ImageMagick++ library: on Debian/Ubuntu this is called libmagick++-dev:
#  sudo apt-get install libmagick++-dev
#  On Fedora or CentOS/RHEL we need ImageMagick-c++-devel:
#  sudo yum install ImageMagick-c++-devel

## ----fig2, fig.width = 6, fig.height = 5, fig.align = "center"----------------
plot(mtcars$mpg, mtcars$disp, col = factor(mtcars$cyl), pch = 20)
topptx(filename = file.path(tempdir(), "mtcars.pptx")) 
##  if you prefer ggplot2 
ggplot(mtcars, aes(mpg, disp, color = factor(cyl))) + geom_point()
topptx(filename = file.path(tempdir(), "mtcars.pptx"))
## or todocx(filename = "mtcars.docx")
p <- ggplot(mtcars, aes(mpg, disp, color = factor(cyl))) + geom_point()
topptx(p, filename = file.path(tempdir(), "mtcars.pptx"), width = 6, height = 4)
## use above method if you want use topptx with ggplot function in a loop
## write out table to office
totable(head(mtcars), filename = file.path(tempdir(), "mtcars.pptx"))
totable(head(mtcars), filename = file.path(tempdir(), "mtcars.pptx"))
## append was supported if you want add figures or tables.
## Now support direct output of common objects produced by R statistical functions
tt <- t.test(wt ~ am, mtcars)
totable(tt, filename = file.path(tempdir(), "mtcars.pptx"))
totable(t.test(wt ~ am, mtcars), filename = file.path(tempdir(), "mtcars.pptx"))
## inpptx and indocx provide function read the tables in pptx or docx
tabs <- inpptx(filename = file.path(tempdir(), "mtcars.pptx"), header = TRUE)
## output different figure formats
p <- ggplot(mtcars, aes(mpg, disp, color = factor(cyl))) + geom_point()
tofigure(p, filename = file.path(tempdir(), "mtcars.pdf"))
tofigure(ggplot(mtcars, aes(mpg, disp, color = factor(cyl))) + geom_point(), filename = file.path(tempdir(), "mtcars.eps"))
## Not support emf and eps formats 
# infigure(file.path(tempdir(), "mtcars.pdf"),exclude_col = c("white","black")) 
## if you use basic plot function or other plot function you need first use convertplot to convert 
## it to ggplot object when you are working on the platform without GUI
## p <- convertplot(plot(1:10))
## tofigure(p, filename = file.path(tempdir(), "mtcars.pdf"))
## topptx(p, filename = file.path(tempdir(), "mtcars.pptx"))
## if you use ggplot like function you don't need to transform the format

