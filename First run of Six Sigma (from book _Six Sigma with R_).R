# this is from the MSA section in the book 'Six Sigma with R',
# starting on page 81.

voltmeter <- factor(rep(1:2, each = 9))
battery <- factor(rep(rep(1:3, each = 3), 2))
run <- factor(rep(1:3, 6))
voltage <- c(1.4727, 1.4206, 1.4754, 1.5083, 1.5739,
               1.4341, 1.5517, 1.5483, 1.4614, 1.3337,
               1.6078, 1.4767, 1.4066, 1.5951, 1.8419,
               1.7087, 1.8259, 1.5444)
batteries <- data.frame(voltmeter, battery,
                          run, voltage)
batteries

#  The residual mean square is the repeatability.
anova(lm(voltage ~ battery + voltmeter +
           battery * voltmeter,
         data = batteries))

#  The appraiser variability (in this case, due to the voltmeter):

anova(lm(voltage ~ battery + voltmeter +
           battery * voltmeter,
         data=batteries))[3][4,1]

# Now use the ss.rr function from the SixSigma package:

# ss.rr(var, part, appr, data, main, sub)

my.rr <- ss.rr(var = voltage, part = battery,
               appr = voltmeter,
               data = batteries,
               main = "Six Sigma Gage R&R Measure",
               sub = "Batteries Project MSA")



