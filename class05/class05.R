#' ---
#' title: "Class5: Data exploration and visualization in R"
#' author: "Kane Wu"
#' output: github_document
#' ---

x <- rnorm(1000)

# some summary stats
mean(x)
sd(x)
summary(x)
#growth(slope)

# Section 2 Scatterplots
# let's read our input file first

read.table("bimm143_05_rstats/weight_chart.txt")
baby <- read.table("bimm143_05_rstats/weight_chart.txt",
                   header = TRUE)
#plot(read.table("bimm143_05_rstats/weight_chart.txt")
#plot(baby)     
plot(baby$Age, baby$Weight, type = "o", cex=1, pch=15, lwd=2, ylim = c(2,10), xlab="baby age (months)", ylab="baby weight(kg)", main = "Baby Weight with Age")
feat <- read.table("bimm143_05_rstats/feature_counts.txt",
                   sep = "\t", header = TRUE)
mouse <- read.delim("bimm143_05_rstats/feature_counts.txt")
par(mar=c(3,11,2,8))
barplot(mouse$Count,names.arg= mouse$Feature, horiz = TRUE, las=1, beside=TRUE, main = "Number of Feature in the mouse GRCm38 Genome", xlim= c(0,80000), ylab = "", las=1)     

#male/female count
gender <- read.delim("bimm143_05_rstats/male_female_counts.txt", header = TRUE)
gender
par(mar=c(3,3,3,4))
barplot(gender$Count,names.arg = gender$Sample, beside = TRUE, col = c("blue2","red2"), ylab = "Counts", main = "Male/Female Group Counts", ylim = c(0,20))

#up/down expression
genes <- read.delim("bimm143_05_rstats/up_down_expression.txt")
table(genes$State)
par(mar=c(4,4,4,4))
palette(c("blue", "grey", "red"))
plot.default(genes$Condition1,genes$Condition2, col=genes$State, xlab = "Expression Condition1", ylab = "Expression Condition2", main = "Up vs. Down Plot")
palette()
levels(genes$State)

#Expression Methylation
methyl <- read.delim("bimm143_05_rstats/expression_methylation.txt")
dcols <- densCols(methyl$gene.meth,methyl$expression)
plot.default(methyl$gene.meth,methyl$expression, col= dcols, pch= 20)

inds <- methyl$expression > 0
plot.default(methyl$gene.meth[inds], methyl$expression[inds], col=dcols, pch=20)             
dcols.custom <- densCols(methyl$gene.meth[inds],methyl$expression[inds],
                         colramp = colorRampPalette(c("blue2", 
                                                      "green2",
                                                      "red2",
                                                      "yellow")))
plot(methyl$gene.meth[inds], methyl$expression[inds], col=dcols.custom, pch = 20)
