include config.mk

# Clean_Data
.PHONY : cleaned
cleaned : $(DATA_CLEANING)

$(DATA_CLEANING): $(DATA_CLEANING) $(USERS) 
	$(LANGUAGE) $< 

# model
.PHONY : model
model :$(MODEL)
	
$(MODEL) : $(MODEL) $(CLEANED_DATA )  
	$(LANGUAGE) $<

# analysis
.PHONY : analyses
analyses : $(ANALYSIS)
	
analyses :  $(ANALYSIS) $(CLEANED_DATA )
	$(LANGUAGE) $<

.PHONY : clean
clean :
	rm -f $(CLEANED_DATA)
