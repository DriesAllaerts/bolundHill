#To run, execute `gnuplot residual.sh -`
# Preparation to save plot to file
set terminal push               # Store standard terminal for later use
set terminal png size 400,300   # Set terminal to be a png file
set output 'residual.png'       # Name png file

# Read logfile and plot residuals
set logscale y
set title "Residuals"
set ylabel 'Residual'
set xlabel 'Iteration'
plot "< cat log.simpleFoam | grep 'Solving for Ux' | cut -d' ' -f9 | tr -d ','" title 'Ux' with lines,\
"< cat log.simpleFoam | grep 'Solving for Uy' | cut -d' ' -f9 | tr -d ','" title 'Uy' with lines,\
"< cat log.simpleFoam | grep 'Solving for Uz' | cut -d' ' -f9 | tr -d ','" title 'Uz' with lines,\
"< cat log.simpleFoam | grep 'Solving for omega' | cut -d' ' -f9 | tr -d ','" title 'omega' with lines,\
"< cat log.simpleFoam | grep 'Solving for k' | cut -d' ' -f9 | tr -d ','" title 'k' with lines,\
"< cat log.simpleFoam | grep 'Solving for p' | cut -d' ' -f9 | tr -d ','" title 'p' with lines

# Plot to screen
set terminal pop                # Retrieve standard terminal
set output
replot                          # Replot figure

# Pause and repeat entire process
pause 1
reread
