# Define 2 vectors
c_compiler <- c(2.753, 0.232, 0.716)
lex_compiler <- c(3.218, 0.382, 0.838)


g_range <- range(0, lex_compiler, 4)

plot(lex_compiler, type="o", col="red", ylim=g_range, 
   axes=FALSE, ann=FALSE)

# Make x axis using Mon-Fri labels
axis(1, at=1:3, lab=c("Real","User","Sys"))

# Make y axis with horizontal labels that display ticks at 
# every 1 mark. 1*0:g_range[2] is equivalent to c(0,1,8,12).
axis(2, las=1, at=1*0:g_range[2])

# Create box around plot
box()

# Graph c_compiler with red dashed line and square points
lines(c_compiler, type="o", pch=22, lty=2, col="green")

# Create a title with a red, bold/italic font
title(main="C VS LEX", col.main="black", font.main=4)

# Label the x and y axes with dark green text
title(xlab="Statistics", col.lab=rgb(0,0,1))
title(ylab="Time (seconds)", col.lab=rgb(0,0,1))

# Create a legend at (1, g_range[2]) that is slightly smaller 
# (cex) and uses the same line colors and points used by 
# the actual plots 
legend(1, g_range[2], c("lex_compiler","c_compiler"), cex=0.8, 
   col=c("red","green"), pch=21:22, lty=1:2);
