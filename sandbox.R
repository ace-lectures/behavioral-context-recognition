

labels_count <- data.frame(as.list(colSums(labels, na.rm = TRUE)))
transposed <- rownames_to_column(data.frame(t(labels_count)))
names(transposed) <- c("variable", "n")
transposed$variable=factor(transposed$variable,levels=transposed$variable)
ordered <- transposed[order(transposed$n),]
x <- ggplot(data=ordered, mapping=aes(x=variable, y=n)) + 
  geom_bar(stat = "identity") +
  coord_flip()
x
