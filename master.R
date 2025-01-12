################################################
              # Packages #
################################################

source("hotspotter.R")
source("plotting.R")


################################################
       # Generating summary of hotspots #
################################################

master <- function(printing = F,normalize="By_Library",export = F,genomeInstability=T){
  breaks.all.files <- collectBreaksAllFiles(datapath="DATA/rdata/")
  
  hotspots <- breakpointHotspotter(breaks.all.files)
  
  summary <- savingAndPrinting(hotspots,hotpath="HOTSPOT_EVENTS/",printing = printing,normalize=normalize,export = export,genomeInstability = genomeInstability)
  
  message("\nI found ",nrow(summary), " hotspots.\n")
  message("\nThe average resolution is ", round(mean(summary$width),digits = -3),".\n")
  
  write.table(summary,"SUMMARY/hotspots-mar18.txt",col.names = T,row.names = F, quote = F,sep="\t")
  
  return(summary)
}


master(printing = T,normalize=F,export = T,genomeInstability=F)

summary = read.table("SUMMARY/hotspots.txt",header=T)
densitySummary = read.table("SUMMARY/densityPvalueSummary.txt",header=T)


################################################
                # Plotting #
################################################

transparentBackground(densityALL,"Density_Pvalues_ALL.png")
transparentBackground(densityChr1,"Density_Pvalues_Chr1.png")
transparentBackground(hotspotsPerChromosome,"hotspotsPerChromosome.png")
transparentBackground(eventsPerHotspot,"eventsPerHotspot.png")
transparentBackground(cfsHotspots,"cfsHotspots.png")
transparentBackground(inversions,"inversions.png")
transparentBackground(inversionWidth,"inversionWidth.png")
